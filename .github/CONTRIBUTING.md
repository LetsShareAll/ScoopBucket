---
name: "贡献指南"
about: "我们所有的开发工作都在 [GitHub](https://github.com/ScoopInstaller/) 上进行。如果您不熟悉 GitHub 或拉取请求，[这里有一份优秀的入门指南](https://guides.github.com/activities/hello-world/)。"
title: "贡献指南"
source: "https://github.com/creativecommons/creativecommons.github.io-source/blob/master/content/contributing-code/contents.lr"
---

> [!NOTE]
> 此文档译自 [ScoopInstaller/.github](https://raw.githubusercontent.com/ScoopInstaller/.github/refs/heads/main/.github/CONTRIBUTING.md)。

## 寻找一个议题

这里列出了[我们当前所有的代码库](https://github.com/orgs/ScoopInstaller/repositories)。我们使用 GitHub 议题来跟踪与每个代码库相关的工作。在那里您可以找到需要处理的工作。

我们广泛使用议题标签来指定各个议题的优先级、状态和对初学者是否友好。

<!--
我们在所有项目中都使用一套标准标签，[文档在此](/contributing-code/repo-labels/)。以下是一些与寻找合适议题最相关的标签：

- **可供社区贡献的议题：**
  - 以下标签标记了开放给社区贡献的议题：
    - <span class="gh-label friendliness">help-wanted</span> : 对社区参与开放，但不一定对初学者友好
    - <span class="gh-label friendliness">good first issue</span> : 对社区参与开放且对新贡献者友好
  - 您无需获得我们的许可即可处理这些议题。
  - 即使这不是您的第一个议题，您也可以处理标记为 <span class="gh-label friendliness">good first issue</span> 的议题。
* **不开放给社区贡献的议题：**
  - 以下标签标记了*不*开放给社区贡献的议题：
    - <span class="gh-label friendliness">🔒 staff only</span> : 需要基础设施访问权限或机构知识，向社区提供这些是不切实际的
  - 请不要处理这些议题。
- **尚未准备好进行处理的议题：**
  - 以下标签标记了*不*开放给社区贡献的议题：
    - <span class="gh-label status-neutral">🚧 status: blocked</span>: 被其他需要优先完成的工作所阻碍
    - <span class="gh-label status-dark">🧹 status: ticket work required </span>: 在准备好被接手之前需要额外的工作
    - <span class="gh-label status-darker">🚦 status: awaiting triage</span>: 尚未由维护者进行分类
  - 请不要处理这些议题。
- **没有上述任何标签的议题：**
  - 这些议题*可能*（也可能不）开放贡献。
  - 请添加评论，请求一位维护者对该议题进行分类并酌情添加标签。

您可以使用我们的 [议题查找工具](/contributing-code/issue-finder/) 来找到一个与您的技能以及对我们的软件和社区的熟悉程度相匹配的好议题。
-->

GitHub 上一些有用的已保存搜索，可帮助您找到议题：

- [标记为 <span class="gh-label friendliness">good first issue</span> 的议题](https://github.com/search?q=org%3AScoopInstaller+is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22+-linked%3Apr)
- [标记为 <span class="gh-label friendliness">help-wanted</span> 的议题](https://github.com/search?q=org%3AScoopInstaller+is%3Aissue+is%3Aopen+label%3A%22help-wanted%22+-linked%3Apr)
- [标记为 <span class="gh-label friendliness">help-wanted</span> 的拉取请求](https://github.com/search?q=org%3AScoopInstaller+is%3Apr+is%3Aopen+label%3A%22help-wanted%22)

检查议题的评论/标签，看看是否已有其他人表示他们正在处理它。如果有人已经在处理并且在过去 7 天内有活动，您可能需要找另一个议题来处理。

## 贡献流程

一旦您找到了想要处理的议题，请按照以下步骤进行贡献。首先，提出一个新的议题。

## 提出新议题

如果您想处理某个尚无 GitHub 议题的事项，包括提交新软件包，请遵循以下步骤：

1. 在与相关代码库关联的项目中创建一个新的 GitHub 议题，并在那里提出您的更改。请务必包含实现细节和提出更改的理由。
   - 我们非常不愿意接受没有先创建相关议题的随机拉取请求。
2. 等待项目维护者评估您的议题，并决定我们是否接受针对该议题的拉取请求。
3. 一旦项目维护者批准了该议题，您就可以开始编写代码，如上文 **贡献流程** 部分所述。

如有疑问，请在相关代码库的"讨论"选项卡中提问。

### 对于 Scoop 核心：

1. 在议题下评论并说明您正在处理该议题。这是为了避免与也在处理该议题的其他人发生冲突。
2. 复刻代码库并从 `develop` 分支创建一个具有适当名称的新分支。
3. 编写您的代码并运行测试以检查是否存在回归问题。
4. 更新测试（如果需要）并更新文档。
5. 提交您的拉取请求。对于 PR 标题，请遵循 [约定式提交](https://www.conventionalcommits.org/en/v1.0.0-beta.2/#commit-message-with-scope)。
6. 等待代码审查，并尽快处理提出的任何问题。

### 对于 Scoop 软件桶：

1. 在议题下评论并说明您正在处理该议题。这是为了避免与也在处理该议题的其他人发生冲突。
2. 复刻代码库并从默认分支（通常是 `master`）创建一个具有适当名称的新分支。
3. 编写您的代码。遵循以下编写清单的指南：
   - 阅读关于应用程序清单如何工作的 Wiki - [应用程序清单](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifests) - 以及如何创建一个 - [创建应用程序清单](https://github.com/ScoopInstaller/Scoop/wiki/Creating-an-app-manifest)。
   - 在 JSON 文件中遵循以下字段顺序（存在的字段）。或者使用[模板](https://github.com/ScoopInstaller/BucketTemplate/blob/master/bucket/app-name.json.template)作为起始文件。
     - `version`
     - `description`
     - `homepage`
     - `license`
     - `notes`
     - `depends`
     - `suggest`
     - `architecture`
       - `url`
       - `hash`
     - `extract_dir`
     - `extract_to`
     - `pre_install`
     - `installer`
     - `post_install`
     - `env_add_path`
     - `env_set`
     - `bin`
     - `shortcuts`
     - `persist`
     - `pre_uninstall`
     - `uninstaller`
     - `post_uninstall`
     - `checkver`
     - `autoupdate`
   - 使用 4 个空格的制表符宽度。
   - license 属性应为有效的 [SPDX 标识符](https://spdx.org/licenses)。
   - 高度推荐使用便携式配置（通过使用 `persist`）。
   - 如果程序文件是 CLI 应用程序，则无需将其添加到 `shortcuts` 中。
   - 如果程序文件是 GUI 应用程序*并且*它不接受任何命令行参数，则无需将其添加到 `bin` 中。
   - 如果数组仅包含一个项目，则将其写为字符串。
   - 如果应用程序*仅*提供 32 位下载，则不需要 `architecture` 字段。在所有其他情况下，`architecture` 字段是必需的。
4. 通过安装、卸载、检查功能、持久化等测试您的清单。
5. 确认清单可以自动更新 - 参见 [应用程序清单自动更新](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifest-Autoupdate)。
6. 提交您的拉取请求。标题应遵循以下规则：
   - 如果是新清单，使用 `<app name>: Add version <version>`。
   - 如果是对现有清单的更新，使用 `<app name>@<version>: <small description>`。
   - 如果是与维护相关的事项，使用 `(chore): <small description>`。
7. 在提交 PR 后，添加一条以 "/verify" 开头的评论 - 这将启动自动清单验证器。
8. 等待代码审查，并尽快处理提出的任何问题。

**关于协作的说明：** 我们鼓励人们尽可能多地进行协作。我们特别感谢贡献者相互审查拉取请求，只要您在这样做时保持[友善和建设性](https://medium.com/@otarutunde/comments-during-code-reviews-2cb7791e1ac7)。
