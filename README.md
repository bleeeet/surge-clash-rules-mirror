# 🚀 Surge/Clash Rules Mirror

[English](#english) | [中文](#中文)

## English

Surge/Clash Rules Mirror is a reusable rule mirror and configuration template collection for Surge, Clash, Mihomo, Stash, Loon, and Quantumult X.

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
- 🧩 Templates for Surge, Clash/Mihomo, Stash, Loon, and Quantumult X
- 🔄 Mirrored custom rules plus active upstream rule providers
- 📝 Placeholder-based templates for easy node configuration

### 🧭 Templates

| Use case | Template |
| --- | --- |
| Surge with one Snell node | [`config/surge-template.conf`](config/surge-template.conf) |
| Surge with multiple Snell / ShadowTLS nodes | [`config/surge-template-multi-node.conf`](config/surge-template-multi-node.conf) |
| Existing Surge profile, only need groups and rules | [`config/surge-rules-github.tpl.conf`](config/surge-rules-github.tpl.conf) |
| Clash / Mihomo / Stash with one node | [`config/clash-template.yaml`](config/clash-template.yaml) |
| Clash / Mihomo / Stash with multiple nodes | [`config/clash-template-multi-node.yaml`](config/clash-template-multi-node.yaml) |
| Loon rules-only snippet | [`config/loon-rules.conf`](config/loon-rules.conf) |
| Quantumult X rules-only snippet | [`config/quantumultx-rules.conf`](config/quantumultx-rules.conf) |

### ⚡ Usage

#### Surge

Use one of two modes:

- Full profile: start with [`config/surge-template.conf`](config/surge-template.conf) for a single node.
- Rules-only: if you already have nodes and core policy groups in Surge, copy [`config/surge-rules-github.tpl.conf`](config/surge-rules-github.tpl.conf) into your existing profile.

Fill in:

```text
YOUR_SERVER_IP_OR_DOMAIN
YOUR_SNELL_PORT
YOUR_SNELL_PSK
```

For multiple nodes, use [`config/surge-template-multi-node.conf`](config/surge-template-multi-node.conf). Add nodes under `[Proxy]`, then add the node names to `🔰 节点选择` and `♻️ 自动选择`.

#### Clash / Mihomo / Stash

Use [`config/clash-template.yaml`](config/clash-template.yaml) for a single node, or [`config/clash-template-multi-node.yaml`](config/clash-template-multi-node.yaml) for multiple nodes. These templates use the Clash Meta / Mihomo style rule provider layout and are intended for Mihomo-compatible clients such as Stash.

Included protocol examples:

- VLESS / Reality
- Shadowsocks
- Trojan
- VMess

Keep the protocol example you need and fill in server, port, password, UUID, Reality, or TLS fields.

#### Loon / Quantumult X

Loon and Quantumult X do not use Clash YAML directly, so this repository provides rules-only snippets:

- [`config/loon-rules.conf`](config/loon-rules.conf)
- [`config/quantumultx-rules.conf`](config/quantumultx-rules.conf)

Add your own nodes and policy groups in the app first, then copy or import the snippet. These snippets are meant for the same "rules-only" scenario: you keep your existing node setup, and only import this repository's rule ordering. AI policies should point to proxy nodes only.

### 🧠 Policy Groups

#### Core Groups

| Group | Purpose |
| --- | --- |
| `🔰 节点选择` / `Manual Select` | Main proxy selector. Put your available proxy nodes here. |
| `♻️ 自动选择` / `Auto Select` | URL-test group that automatically picks a responsive proxy node. |
| `🎯 全球直连` / `Direct` | DIRECT policy. In this setup it mainly means domestic China, LAN, Apple direct-first, and explicitly whitelisted services. |
| `⛔️ 禁止访问` / `Reject` | Reject policy for hijacking, HTTPDNS, privacy, and blocking rules. |
| `🐟 漏网之鱼` / `Final` | Final fallback used by Clash/Mihomo/Stash templates when no earlier rule matches. |

`🎯 全球直连` does not mean "global traffic goes direct." It is the DIRECT lane: China services, China domains/IPs, LAN, and selected low-risk direct rules go here. Foreign services, AI, YouTube, X/Twitter, GitHub, and uncategorized proxy rules still go through proxy groups.

#### Service Groups

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

Rules-only files are useful when you already have a working client profile and do not want this repository to manage your nodes. In that case, keep your existing nodes, create matching policy groups, then import only the rule snippet for your client.

### 📁 Structure

| Path | Content |
| --- | --- |
| `config/` | Surge, Clash/Mihomo/Stash templates plus Loon and Quantumult X rule snippets |
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
| [KOP-XIAO/QuantumultX](https://github.com/KOP-XIAO/QuantumultX) | Quantumult X resource parser reference used by the rules-only snippet |
| [Local curated split rules](rules/ai/) | Dedicated ChatGPT, Claude, Gemini, GitHub/Copilot rules maintained in `rules/ai/` |

These sources are selected because they are actively maintained, widely used by the community, and cover different parts of the proxy rules ecosystem well. This repository does not try to replace them; it mirrors, splits, and combines practical pieces into a comfortable everyday setup for Surge, Clash/Mihomo, Stash, Loon, and Quantumult X.

High-frequency base rules such as China domains, China IP, LAN, GeoIP, and Apple global rules prefer client built-ins or active upstream sources.

### 🙏 Thanks

Thanks to @blackmatrix7, @Loyalsoldier, @MetaCubeX, @chenyk1219, @Coldvvater, @xiaolai, and @KOP-XIAO for publishing and maintaining useful rule sources and references through their public projects. This repository uses or references their public work where noted above.

### 🔄 Update

Refresh mirrored rules from upstream:

```bash
./tools/update-rules.sh
```

Commit and push after updating.

### 📄 License

This repository's original templates, scripts, documentation, and locally curated additions are released under the [MIT License](LICENSE). Mirrored or referenced upstream rule lists remain governed by their own upstream licenses and terms.

---

<details>
<summary id="中文">中文说明</summary>

## 中文

Surge/Clash Rules Mirror 是一个面向 Surge、Clash、Mihomo、Stash、Loon、Quantumult X 的规则镜像与配置模板仓库。

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
- 🧩 同时提供 Surge、Clash/Mihomo、Stash、Loon、Quantumult X 模板或规则片段
- 🔄 自维护规则结合活跃上游规则源
- 📝 模板使用占位符，方便填写自己的节点信息

### 🧭 模板选择

| 场景 | 模板 |
| --- | --- |
| Surge 单个 Snell 节点 | [`config/surge-template.conf`](config/surge-template.conf) |
| Surge 多个 Snell / ShadowTLS 节点 | [`config/surge-template-multi-node.conf`](config/surge-template-multi-node.conf) |
| 已有 Surge 配置，只需要复制分组和规则 | [`config/surge-rules-github.tpl.conf`](config/surge-rules-github.tpl.conf) |
| Clash / Mihomo / Stash 单节点 | [`config/clash-template.yaml`](config/clash-template.yaml) |
| Clash / Mihomo / Stash 多节点 | [`config/clash-template-multi-node.yaml`](config/clash-template-multi-node.yaml) |
| Loon 规则片段 | [`config/loon-rules.conf`](config/loon-rules.conf) |
| Quantumult X 规则片段 | [`config/quantumultx-rules.conf`](config/quantumultx-rules.conf) |

### ⚡ 使用方式

Surge 有两种用法：

- 完整配置：单节点使用 [`config/surge-template.conf`](config/surge-template.conf)，多节点使用 [`config/surge-template-multi-node.conf`](config/surge-template-multi-node.conf)。
- 只导入规则：如果你已经在 Surge 里配好了节点和基础策略组，可以把 [`config/surge-rules-github.tpl.conf`](config/surge-rules-github.tpl.conf) 复制进现有配置。

Clash / Mihomo / Stash 单节点使用 [`config/clash-template.yaml`](config/clash-template.yaml)，多节点使用 [`config/clash-template-multi-node.yaml`](config/clash-template-multi-node.yaml)。这两份模板使用 Clash Meta / Mihomo 风格的 rule provider 结构，适合 Mihomo 兼容客户端和 Stash。

Clash / Mihomo / Stash 模板包含这些常见协议示例：

- VLESS / Reality
- Shadowsocks
- Trojan
- VMess

Loon 和 Quantumult X 不能直接使用 Clash YAML，所以仓库提供的是规则片段：

- [`config/loon-rules.conf`](config/loon-rules.conf)
- [`config/quantumultx-rules.conf`](config/quantumultx-rules.conf)

先在客户端里配置自己的节点和策略组，再复制或导入对应规则片段。这些片段适合“只导入规则”的场景：保留你现有的节点配置，只使用本仓库整理好的规则顺序。AI 相关策略组建议只放代理节点。

### 🧠 策略组

#### 基础策略组

| 分组 | 用途 |
| --- | --- |
| `🔰 节点选择` / `Manual Select` | 主代理选择组，把可用代理节点放在这里。 |
| `♻️ 自动选择` / `Auto Select` | 自动测速组，根据连通性测试选择可用代理节点。 |
| `🎯 全球直连` / `Direct` | DIRECT 直连策略。在这套配置里主要用于国内环境、局域网、Apple 优先直连和明确白名单服务。 |
| `⛔️ 禁止访问` / `Reject` | 拦截策略，用于防劫持、HTTPDNS、隐私和屏蔽规则。 |
| `🐟 漏网之鱼` / `Final` | Clash/Mihomo/Stash 模板里的最终兜底组，前面都没匹配到时进入这里。 |

`🎯 全球直连` 不是让所有全球流量都直连，而是这套配置里的 DIRECT 通道：国内常用服务、中国域名/IP、局域网和部分明确安全的直连规则走这里。国外服务、AI、YouTube、X/Twitter、GitHub 和通用代理规则仍然走代理策略组。

#### 服务策略组

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

只导入规则的文件适合已经有可用客户端配置的人：继续使用你自己的节点和策略组，只把本仓库整理好的规则片段导入进去。

### 🧱 规则来源与参考

| 来源 / 参考 | 用途 |
| --- | --- |
| [blackmatrix7/ios_rule_script](https://github.com/blackmatrix7/ios_rule_script) | 细分服务规则 |
| [Loyalsoldier/clash-rules](https://github.com/Loyalsoldier/clash-rules) | Clash / Stash 基础规则 |
| [MetaCubeX/meta-rules-dat](https://github.com/MetaCubeX/meta-rules-dat) | Mihomo / Clash Meta 生态参考 |
| [xiaolai/anthropic-claude-surge-rules-set](https://github.com/xiaolai/anthropic-claude-surge-rules-set) | Claude Code、Claude Desktop、MCP 和 Anthropic IP 覆盖的外部参考；不作为远程规则依赖 |
| [KOP-XIAO/QuantumultX](https://github.com/KOP-XIAO/QuantumultX) | Quantumult X 规则片段使用的资源解析器参考 |
| [本地整理的拆分规则](rules/ai/) | `rules/ai/` 里维护 ChatGPT、Claude、Gemini、GitHub/Copilot 专用规则 |

选择这些来源，是因为它们维护活跃、覆盖面互补，也是在社区里被大量使用和验证过的规则来源。本仓库不是替代它们，而是把这些来源里实用的部分镜像、拆分、归纳和组合成一套日常用起来更顺手的 Surge、Clash/Mihomo、Stash、Loon、Quantumult X 配置。

### 🙏 致谢

感谢 @blackmatrix7、@Loyalsoldier、@MetaCubeX、@chenyk1219、@Coldvvater、@xiaolai、@KOP-XIAO 通过公开项目发布并维护这些有价值的规则源与参考内容。本仓库仅在上文标注范围内使用或参考这些公开内容。

### 📄 License

本仓库原创的模板、脚本、文档和本地整理补充内容使用 [MIT License](LICENSE)。镜像或引用的上游规则列表仍遵循各自上游项目的许可与使用条款。

</details>
