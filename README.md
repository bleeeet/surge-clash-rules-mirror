# 🚀 Surge/Clash Rules Mirror

[English](#english) | [中文](#中文)

## English

Surge/Clash Rules Mirror is a reusable rule mirror and configuration template collection for Surge, Clash, and Stash.

This repository focuses on practical policy groups for AI services, developer tools, streaming platforms, common services, direct rules, and blocking rules. Templates use this repository's GitHub Raw URLs by default and can be used as a clean starting point for personal configurations.

```text
https://raw.githubusercontent.com/bleeeet/surge-clash-rules-mirror/main/
```

### ✨ Features

- 🧠 Dedicated AI groups: ChatGPT, Claude, Gemini, GitHub Copilot
- 🛡️ Strict AI routing: AI groups avoid DIRECT options to reduce accidental domestic egress
- 🇨🇳 China services DIRECT list for Tencent, Alibaba, Alipay, Aliyun, and Nutstore/Jianguoyun
- 🧑‍💻 Developer service groups: GitHub, Microsoft, OneDrive, JetBrains
- 🎬 Streaming groups: YouTube, Netflix, Spotify, TikTok
- 🧩 Templates for Surge, Clash, and Stash
- 🔄 Mirrored custom rules plus active upstream rule providers
- 📝 Placeholder-based templates for easy node configuration

### 🧭 Templates

| Use case | Template |
| --- | --- |
| Surge with one Snell node | [`config/surge-template.conf`](config/surge-template.conf) |
| Surge with multiple Snell / ShadowTLS nodes | [`config/surge-template-multi-node.conf`](config/surge-template-multi-node.conf) |
| Clash / Stash with one node | [`config/clash-template.yaml`](config/clash-template.yaml) |
| Clash / Stash with multiple nodes | [`config/clash-template-multi-node.yaml`](config/clash-template-multi-node.yaml) |
| Existing Surge profile, only need groups and rules | [`config/surge-rules-github.tpl.conf`](config/surge-rules-github.tpl.conf) |

### ⚡ Usage

#### Surge

Start with [`config/surge-template.conf`](config/surge-template.conf) for a single node.

Fill in:

```text
YOUR_SERVER_IP_OR_DOMAIN
YOUR_SNELL_PORT
YOUR_SNELL_PSK
```

For multiple nodes, use [`config/surge-template-multi-node.conf`](config/surge-template-multi-node.conf). Add nodes under `[Proxy]`, then add the node names to `🔰 节点选择` and `♻️ 自动选择`.

#### Clash / Stash

Use [`config/clash-template.yaml`](config/clash-template.yaml) for a single node, or [`config/clash-template-multi-node.yaml`](config/clash-template-multi-node.yaml) for multiple nodes.

Included protocol examples:

- VLESS / Reality
- Shadowsocks
- Trojan
- VMess

Keep the protocol example you need and fill in server, port, password, UUID, Reality, or TLS fields.

### 🧠 Policy Groups

| Group | Purpose |
| --- | --- |
| `ChatGPT` | OpenAI / ChatGPT / Sora |
| `Claude` | Anthropic / Claude |
| `Gemini` | Google Gemini / AI Studio / NotebookLM |
| `GitHub` | GitHub / GitHub Copilot |
| `Microsoft` | Microsoft / OneDrive |
| `Telegram` | Telegram |
| `Apple` | Apple services |
| `YouTube` | YouTube / YouTube Music |
| `Netflix` | Netflix |
| `Spotify` | Spotify |
| `AI` | Fallback for other AI services |

Dedicated rules are matched first. The `AI` group catches other AI services that are not split into separate groups.

For domestic China usage, keep `rules/direct/ChinaServices.list` before proxy and AI rules. This keeps common Tencent, Alibaba, Alipay, Aliyun, and Nutstore/Jianguoyun traffic on DIRECT while Claude, ChatGPT, Gemini, GitHub Copilot, YouTube, X/Twitter, GitHub, and other proxy rules still use proxy groups.

### 📁 Structure

| Path | Content |
| --- | --- |
| `config/` | Surge, Clash, and Stash templates |
| `rules/ai/` | AI and developer-tool focused rules |
| `rules/services/` | Microsoft, Telegram, Twitter, JetBrains, and more |
| `rules/media/` | YouTube, Netflix, Spotify, TikTok, GlobalMedia |
| `rules/direct/` | Direct and allowlist rules |
| `rules/block/` | Hijacking, HTTPDNS, and privacy blocking rules |
| `rules/proxy/` | Common proxy rules |
| `tools/` | Rule update script |

### 🧱 Rule Sources and References

| Source / reference | Usage |
| --- | --- |
| [blackmatrix7/ios_rule_script](https://github.com/blackmatrix7/ios_rule_script) | Detailed Surge / Clash service rules |
| [Loyalsoldier/clash-rules](https://github.com/Loyalsoldier/clash-rules) | Clash / Stash base rules |
| [MetaCubeX/meta-rules-dat](https://github.com/MetaCubeX/meta-rules-dat) | Mihomo / Clash Meta ecosystem reference |
| [xiaolai/anthropic-claude-surge-rules-set](https://github.com/xiaolai/anthropic-claude-surge-rules-set) | External reference for Claude Code, Claude Desktop, MCP, and Anthropic IP coverage; not used as a remote dependency |
| [Local curated split rules](rules/ai/) | Dedicated ChatGPT, Claude, Gemini, GitHub/Copilot rules maintained in `rules/ai/` |

These sources are selected because they are actively maintained, widely used by the community, and cover different parts of the proxy rules ecosystem well. This repository does not try to replace them; it mirrors, splits, and combines practical pieces into a comfortable everyday setup for Surge, Clash, and Stash.

High-frequency base rules such as China domains, China IP, LAN, GeoIP, and Apple global rules prefer client built-ins or active upstream sources.

### 🙏 Thanks

Thanks to @blackmatrix7, @Loyalsoldier, @MetaCubeX, @chenyk1219, @Coldvvater, and @xiaolai for publishing and maintaining useful rule sources and references through their public projects. This repository uses or references their public work where noted above.

### 🔄 Update

Refresh mirrored rules from upstream:

```bash
./tools/update-rules.sh
```

Commit and push after updating.

---

<details>
<summary id="中文">中文说明</summary>

## 中文

Surge/Clash Rules Mirror 是一个面向 Surge、Clash、Stash 的规则镜像与配置模板仓库。

仓库重点整理 AI 服务、开发工具、流媒体、常用服务、直连规则和拦截规则。模板默认使用本仓库的 GitHub Raw 地址，可以作为个人配置的起点。

```text
https://raw.githubusercontent.com/bleeeet/surge-clash-rules-mirror/main/
```

### ✨ 特性

- 🧠 AI 服务独立分流：ChatGPT、Claude、Gemini、GitHub Copilot
- 🛡️ AI 严格代理：AI 分组不提供 DIRECT 选项，降低误切国内出口的风险
- 🇨🇳 国内常用服务直连：腾讯、阿里、支付宝、阿里云、坚果云等走本地直连表
- 🧑‍💻 开发服务独立分流：GitHub、Microsoft、OneDrive、JetBrains
- 🎬 流媒体独立分流：YouTube、Netflix、Spotify、TikTok
- 🧩 同时提供 Surge、Clash、Stash 模板
- 🔄 自维护规则结合活跃上游规则源
- 📝 模板使用占位符，方便填写自己的节点信息

### 🧭 模板选择

| 场景 | 模板 |
| --- | --- |
| Surge 单个 Snell 节点 | [`config/surge-template.conf`](config/surge-template.conf) |
| Surge 多个 Snell / ShadowTLS 节点 | [`config/surge-template-multi-node.conf`](config/surge-template-multi-node.conf) |
| Clash / Stash 单节点 | [`config/clash-template.yaml`](config/clash-template.yaml) |
| Clash / Stash 多节点 | [`config/clash-template-multi-node.yaml`](config/clash-template-multi-node.yaml) |
| 已有 Surge 配置，只需要复制分组和规则 | [`config/surge-rules-github.tpl.conf`](config/surge-rules-github.tpl.conf) |

### ⚡ 使用方式

Surge 单节点使用 [`config/surge-template.conf`](config/surge-template.conf)，多节点使用 [`config/surge-template-multi-node.conf`](config/surge-template-multi-node.conf)。

Clash / Stash 单节点使用 [`config/clash-template.yaml`](config/clash-template.yaml)，多节点使用 [`config/clash-template-multi-node.yaml`](config/clash-template-multi-node.yaml)。

Clash / Stash 模板包含这些常见协议示例：

- VLESS / Reality
- Shadowsocks
- Trojan
- VMess

### 🧠 策略组

| 分组 | 用途 |
| --- | --- |
| `ChatGPT` | OpenAI / ChatGPT / Sora |
| `Claude` | Anthropic / Claude |
| `Gemini` | Google Gemini / AI Studio / NotebookLM |
| `GitHub` | GitHub / GitHub Copilot |
| `Microsoft` | Microsoft / OneDrive |
| `Telegram` | Telegram |
| `Apple` | Apple 服务 |
| `YouTube` | YouTube / YouTube Music |
| `Netflix` | Netflix |
| `Spotify` | Spotify |
| `AI` | 其他 AI 服务兜底 |

国内使用时，建议保留 `rules/direct/ChinaServices.list` 在代理和 AI 规则之前。这样腾讯、阿里、支付宝、阿里云、坚果云等常用国内服务优先直连，而 Claude、ChatGPT、Gemini、GitHub Copilot、YouTube、X/Twitter、GitHub 等仍然走代理分组。

### 🧱 规则来源与参考

| 来源 / 参考 | 用途 |
| --- | --- |
| [blackmatrix7/ios_rule_script](https://github.com/blackmatrix7/ios_rule_script) | 细分服务规则 |
| [Loyalsoldier/clash-rules](https://github.com/Loyalsoldier/clash-rules) | Clash / Stash 基础规则 |
| [MetaCubeX/meta-rules-dat](https://github.com/MetaCubeX/meta-rules-dat) | Mihomo / Clash Meta 生态参考 |
| [xiaolai/anthropic-claude-surge-rules-set](https://github.com/xiaolai/anthropic-claude-surge-rules-set) | Claude Code、Claude Desktop、MCP 和 Anthropic IP 覆盖的外部参考；不作为远程规则依赖 |
| [本地整理的拆分规则](rules/ai/) | `rules/ai/` 里维护 ChatGPT、Claude、Gemini、GitHub/Copilot 专用规则 |

选择这些来源，是因为它们维护活跃、覆盖面互补，也是在社区里被大量使用和验证过的规则来源。本仓库不是替代它们，而是把这些来源里实用的部分镜像、拆分、归纳和组合成一套日常用起来更顺手的 Surge、Clash、Stash 配置。

### 🙏 致谢

感谢 @blackmatrix7、@Loyalsoldier、@MetaCubeX、@chenyk1219、@Coldvvater、@xiaolai 通过公开项目发布并维护这些有价值的规则源与参考内容。本仓库仅在上文标注范围内使用或参考这些公开内容。

</details>
