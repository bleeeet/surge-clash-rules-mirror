# 🚀 Surge / Clash Rules Mirror

面向 Surge、Clash、Stash 的规则镜像与配置模板仓库。

这个仓库把常用分流规则整理成一套可复用配置，重点覆盖 AI、开发工具、流媒体、常用服务和基础直连/拦截规则。模板默认使用本仓库的 GitHub Raw 地址，可直接作为个人配置的起点。

```text
https://raw.githubusercontent.com/bleeeet/surge-rules/main/
```

## ✨ 特性

- 🧠 AI 服务独立分流：ChatGPT、Claude、Gemini、GitHub Copilot
- 🧑‍💻 开发服务独立分流：GitHub、Microsoft、OneDrive、JetBrains
- 🎬 流媒体独立分流：YouTube、Netflix、Spotify、TikTok
- 🧩 同时提供 Surge、Clash、Stash 模板
- 🔄 常用规则镜像到本仓库，基础规则结合活跃上游维护
- 📝 模板使用占位符，便于按自己的节点信息填写

## 🧭 模板选择

| 场景 | 模板 |
| --- | --- |
| Surge 单个 Snell 节点 | [`config/surge-template.conf`](config/surge-template.conf) |
| Surge 多个 Snell / ShadowTLS 节点 | [`config/surge-template-multi-node.conf`](config/surge-template-multi-node.conf) |
| Clash / Stash，协议不固定 | [`config/clash-template.yaml`](config/clash-template.yaml) |
| 已有 Surge 配置，只需要复制分组和规则 | [`config/surge-rules-github.tpl.conf`](config/surge-rules-github.tpl.conf) |

## ⚡ 使用方式

### Surge

单节点配置从 [`config/surge-template.conf`](config/surge-template.conf) 开始。

主要填写：

```text
YOUR_SERVER_IP_OR_DOMAIN
YOUR_SNELL_PORT
YOUR_SNELL_PSK
```

多节点配置使用 [`config/surge-template-multi-node.conf`](config/surge-template-multi-node.conf)。新增节点时，在 `[Proxy]` 中添加节点，并把节点名加入 `🔰 节点选择` 和 `♻️ 自动选择` 两个策略组。

### Clash / Stash

使用 [`config/clash-template.yaml`](config/clash-template.yaml)。

模板内包含常见协议示例：

- VLESS / Reality
- Shadowsocks
- Trojan
- VMess

根据实际节点协议保留对应示例，并填写服务器、端口、密码、UUID、Reality 参数等字段。

## 🧠 策略组

模板内置以下分组：

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

专用规则会优先匹配，未拆分的 AI 服务由 `AI` 分组兜底。

## 📁 目录结构

| 路径 | 内容 |
| --- | --- |
| `config/` | Surge、Clash、Stash 配置模板 |
| `rules/ai/` | AI 与开发工具专用规则 |
| `rules/services/` | Microsoft、Telegram、Twitter、JetBrains 等服务规则 |
| `rules/media/` | YouTube、Netflix、Spotify、TikTok、GlobalMedia |
| `rules/direct/` | 直连和白名单规则 |
| `rules/block/` | 防劫持、HTTPDNS、隐私拦截规则 |
| `rules/proxy/` | 常见代理规则 |
| `tools/` | 规则更新脚本 |

## 🧱 规则来源

| 来源 | 用途 |
| --- | --- |
| `blackmatrix7/ios_rule_script` | Surge 细分服务规则 |
| `Loyalsoldier/clash-rules` | Clash / Stash 基础规则 |
| `MetaCubeX/meta-rules-dat` | Mihomo / Clash Meta 生态参考 |
| 本仓库 | ChatGPT、Claude、Gemini、GitHub/Copilot 等专用分流 |

中国域名、中国 IP、局域网、GeoIP、Apple 全量规则等高频基础规则，优先使用客户端内置能力或活跃上游。

## 🔄 更新规则

从上游刷新镜像规则：

```bash
./tools/update-rules.sh
```

更新后提交并推送即可。
