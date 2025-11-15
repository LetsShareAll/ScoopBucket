param(
    [string]$BucketPath = '../bucket',
    [string]$OutputPath = '../AppList.md'
)

$ErrorActionPreference = 'Stop'

try {
    $executionPath = Get-Location
    Set-Location $PSScriptRoot

    Write-Host '开始生成 AppList.md...' -ForegroundColor Cyan

    $manifestFiles = Get-ChildItem -Path $BucketPath -Filter '*.json' | Sort-Object Name
    $output = @()

    $output += '# 🗃️ 勺子桶软件包清单'
    $output += ''
    $output += '> [!IMPORTANT]'
    $output += '> 本文件由 GitHub Actions 自动生成，请勿手动修改！'
    $output += ''
    $output += '| 软件包 | 版本 | 描述 | 许可证 | 主页 | 更新时间 |'
    $output += '|--------|------|------|--------|------|----------|'

    $count = 0
    $successCount = 0

    foreach ($file in $manifestFiles) {
        try {
            $content = Get-Content $file.FullName -Raw -Encoding UTF8
            $manifest = $content | ConvertFrom-Json
            $name = $manifest.name
            if (-not $name) { $name = $file.BaseName }
            $version = $manifest.version
            if (-not $version) { $version = 'N/A' }
            $description = $manifest.description
            if (-not $description) { $description = '暂无描述' }
            $license = $manifest.license
            if (-not $license) { $license = '未知' }
            $homepage = $manifest.homepage
            if (-not $homepage) { $homepage = '-' }
            if ($homepage -ne '-') {
                $homepage = "[🔗]($homepage)"
            }
            $lastMofified = (Get-Item $file.FullName).LastWriteTime.ToString('yyyy-MM-dd')

            $output += "| $name | $version | $description | $license | $homepage | $lastMofified |"
        }
        catch {
            Write-Host "❌ 解析失败: $($file.Name) - $($_.Exception.Message)" -ForegroundColor Red

            $output += "| **$($file.BaseName)** | 错误 | 清单文件解析失败 | — | — | — |"
        }
        $count++
    }

    $output += ''
    $output += '---'
    $output += ''
    $output += '## 📊 统计信息'
    $output += ''
    $output += "- **总软件包数**: $count"
    $output += "- **成功解析**: $successCount"
    $output += "- **生成时间**: $(Get-Date -Format 'yyyy年MM月dd日 HH:mm:ss') (UTC)"
    $output += '- **自动更新**: 此文件由 [GitHub Actions](.github/workflows/update_applist.yml) 自动生成'

    $output | Out-File -FilePath $OutputPath -Encoding UTF8 -Force

    Set-Location $executionPath
}
catch {
    Write-Host "💥 脚本执行失败: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
