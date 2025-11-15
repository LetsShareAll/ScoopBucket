# Scoop Bucket

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/LetsShareAll/ScoopBucket/ci.yml?branch=main&label=CI&logo=github)](https://github.com/LetsShareAll/ScoopBucket/actions)
[![Repo size](https://img.shields.io/github/repo-size/LetsShareAll/ScoopBucket)](https://github.com/LetsShareAll/ScoopBucket)
[![License](https://img.shields.io/github/license/LetsShareAll/ScoopBucket)](LICENSE)

一个为 [Scoop](https://scoop.sh/) 准备的软件包仓库（Bucket），包含了一些实用的软件。

> [!NOTE]
> 此仓库为第三方 Bucket，并非 Scoop 官方维护。

## 📦 包含的软件包

详细的软件包列表请参阅 [AppList.md](AppList.md)。

## 🚀 使用方法

1. **首先，确保你已安装 [Scoop](https://scoop.sh/)。** 如果尚未安装，请打开 PowerShell，并执行：

   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   irm get.scoop.sh | iex
   ```

   > 💡 **提示**
   >
   > 如需高级安装选项，请查看[官方安装程序自述文件](https://github.com/ScoopInstaller/Install#readme)。

2. **添加本仓库作为 Scoop 的 Bucket：**

   ```powershell
   scoop bucket add lssa https://github.com/LetsShareAll/ScoopBucket.git
   ```

   _如果您的仓库名与已有 Bucket 名称不冲突，也可以使用其他名称。_

3. **安装软件包：**

   ```powershell
   scoop install lssa/<软件包名>
   ```

   _例如，要安装 LX Music Desktop：_

   ```powershell
   scoop install lssa/lx-music-desktop
   ```

   _你也可以直接安装，Scoop 会自动在所有已添加的 Bucket 中查找：_

   ```powershell
   scoop install lx-music-desktop
   ```

## 🤝 贡献

我们非常欢迎社区贡献！

### 贡献新的软件包或更新

1. Fork 本仓库。
2. 在 `bucket` 目录下创建或修改软件的清单文件 (`.json`)。请参考 [Scoop 的 Wiki](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifests) 了解清单文件的编写规范。
3. 提交你的更改到你的 Fork。
4. 创建一个 Pull Request (PR) 到本仓库。
5. 请确保你的清单文件格式正确，可以通过仓库内的 `test.ps1` 脚本进行基本验证。

### 提交 Issue

如果你发现软件包有问题，或者有新的软件包建议，欢迎在 [Issues](https://github.com/LetsShareAll/ScoopBucket/issues) 中提出。请在提交前查阅现有的 Issues，避免重复。

在提交 Issue 时，请尽量提供详细信息，例如：

- **对于问题报告：** 操作系统版本、Scoop 版本、出错的命令、完整的错误信息。
- **对于新软件包请求：** 软件名称、官网地址、下载地址（如果知道的话）。

更详细的贡献指南，请参考 [CONTRIBUTING.md](.github/CONTRIBUTING.md)。

## 📄 许可证

本项目采用 [MIT](LICENSE) 许可证。
