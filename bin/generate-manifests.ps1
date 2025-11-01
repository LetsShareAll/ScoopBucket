#!/usr/bin/env pwsh
param(
    [string]$BucketPath = "../bucket",
    [string]$OutputPath = "../MANIFESTS.md"
)

# 错误处理
$ErrorActionPreference = "Stop"

try {
    # 切换到脚本所在目录
    Set-Location $PSScriptRoot

    Write-Host "开始生成 MANIFESTS.md..." -ForegroundColor Cyan
    
    $manifestFiles = Get-ChildItem -Path $BucketPath -Filter "*.json" | Sort-Object Name
    $output = @()
    
    # 头部信息
    $output += "# 🗃️ Scoop Bucket 软件包清单"
    $output += ""
    $output += "> [!IMPORTANT]"
    $output += "> 本文件由 GitHub Actions 自动生成，请勿手动修改！"
    $output += ""
    $output += "| 软件包 | 版本 | 描述 | 许可证 | 主页 | 更新时间 |"
    $output += "|--------|------|------|--------|------|----------|"

    $count = 0
    $successCount = 0
    
    foreach ($file in $manifestFiles) {
        try {
            $content = Get-Content $file.FullName -Raw -Encoding UTF8
            $manifest = $content | ConvertFrom-Json
            
            # 获取软件包名称，优先使用 manifest 中的 name，否则使用文件名
            if ($manifest.name) {
                $name = $manifest.name
            } else {
                $name = $file.BaseName
            }
            
            # 处理可能为空的字段
            $version = if ($manifest.version) { $manifest.version } else { "N/A" }
            $description = if ($manifest.description) { $manifest.description } else { "暂无描述" }
            $license = if ($manifest.license) { $manifest.license } else { "未知" }
            $homepage = if ($manifest.homepage) { $manifest.homepage } else { "#" }
            
            # 获取文件最后修改时间
            $lastModified = (Get-Item $file.FullName).LastWriteTime.ToString("yyyy-MM-dd")
            
            # 创建可点击的链接
            if ($homepage -ne "#") {
                $homepageMarkdown = "[🔗]($homepage)"
            } else {
                $homepageMarkdown = "—"
            }
            
            # 缩短长描述
            if ($description.Length -gt 60) {
                $description = $description.Substring(0, 57) + "..."
            }
            
            # 缩短许可证名称（如果太长）
            if ($license.Length -gt 20) {
                $license = $license.Substring(0, 17) + "..."
            }
            
            # 构建表格行
            $tableRow = "| **{0}** | {1} | {2} | {3} | {4} | {5} |" -f $name, $version, $description, $license, $homepageMarkdown, $lastModified
            $output += $tableRow
            
            $successCount++
            Write-Host "✅ 处理成功: $name" -ForegroundColor Green
        }
        catch {
            Write-Host "❌ 解析失败: $($file.Name) - $($_.Exception.Message)" -ForegroundColor Red
            # 即使解析失败，也添加到表格中（标记为错误）
            $output += "| **$($file.BaseName)** | 错误 | 清单文件解析失败 | — | — | — |"
        }
        $count++
    }

    # 统计信息
    $output += ""
    $output += "---"
    $output += ""
    $output += "## 📊 统计信息"
    $output += ""
    $output += "- **总软件包数**: $count"
    $output += "- **成功解析**: $successCount"
    $output += "- **生成时间**: $(Get-Date -Format 'yyyy年MM月dd日 HH:mm:ss') (UTC)"
    $output += "- **自动更新**: 此文件由 [GitHub Actions](.github/workflows/update-manifests.yml) 自动生成"
    $output += ""
    $output += "## 📄 许可证说明"
    $output += ""
    $output += "本仓库中的软件包清单遵循 [MIT 许可证](LICENSE)。"
    $output += ""
    $output += "各软件包本身的许可证可能不同，请参考相应软件包主页或官方文档获取准确的许可证信息。"

    # 写入文件
    $output | Out-File -FilePath $OutputPath -Encoding UTF8 -Force
    
    Write-Host "🎉 MANIFESTS.md 生成完成！" -ForegroundColor Green
    Write-Host "📦 共处理 $count 个软件包，成功 $successCount 个" -ForegroundColor Cyan
    
    # 显示生成的文件内容预览
    if (Test-Path $OutputPath) {
        $fileInfo = Get-Item $OutputPath
        Write-Host "📄 生成文件: $($fileInfo.FullName)" -ForegroundColor Yellow
        Write-Host "📏 文件大小: $([math]::Round($fileInfo.Length/1KB, 2)) KB" -ForegroundColor Yellow
        
        # 显示前几行内容用于验证
        Write-Host "`n📋 文件预览:" -ForegroundColor Cyan
        Get-Content $OutputPath -Head 12 | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }
    }
}
catch {
    Write-Host "💥 脚本执行失败: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}