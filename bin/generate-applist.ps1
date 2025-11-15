param(
    [string]$BucketPath = '../bucket',
    [string]$OutputPath = '../AppList.md'
)

try {
    $executionPath = Get-Location
    Set-Location $PSScriptRoot

    $manifestFiles = Get-ChildItem -Path $BucketPath -Filter '*.json'
    $output = @()

    $output += '# App List'
    $output += ''
    $output += '| Package | Version | Description | License | Homepage | Last Updated |'
    $output += '|---------|---------|-------------|---------|----------|--------------|'

    foreach ($file in $manifestFiles) {
        try {
            $content = Get-Content $file.FullName -Raw
            $manifest = $content | ConvertFrom-Json

            $name = $manifest.name
            if (-not $name) { $name = $file.BaseName }

            $version = $manifest.version
            if (-not $version) { $version = 'N/A' }

            $description = $manifest.description
            if (-not $description) { $description = 'No description available' }

            $license = $manifest.license
            if (-not $license) { $license = 'Unknown' }

            $homepage = $manifest.homepage
            if (-not $homepage) { $homepage = '#' }

            $lastModified = (Get-Item $file.FullName).LastWriteTime.ToString('yyyy-MM-dd')

            if ($homepage -ne '#') {
                $homepageMarkdown = "[Link]($homepage)"
            }
            else {
                $homepageMarkdown = '-'
            }

            $output += "| $name | $version | $description | $license | $homepageMarkdown | $lastModified |"
        }
        catch {
            $output += "| $($file.BaseName) | Error | Failed to parse | - | - | - |"
        }
    }

    $output | Out-File -FilePath $OutputPath -Encoding UTF8
    Write-Host "Generation completed: $OutputPath"

    Set-Location $executionPath
}
catch {
    Write-Host "Error: $($_.Exception.Message)"
    exit 1
}
