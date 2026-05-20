# 🚀 Surge / Clash Rules Mirror

这是一个自用的代理规则镜像仓库，也可以给朋友当作快速配置模板使用。

目标很简单：

- 📦 把常用第三方规则文件镜像到自己的 GitHub，减少上游链接失效影响
- 🧠 单独拆出 ChatGPT、Claude、Gemini、GitHub Copilot 等 AI / 开发工具分流
- 🧩 提供 Surge、Clash、Stash 可直接改的模板
- 🔐 模板只保留占位符，不包含真实节点密钥

默认规则地址：

```text
https://raw.githubusercontent.com/bleeeet/surge-rules/main/
```

## 🧭 选哪个模板？

| 场景 | 文件 |
| --- | --- |
| Surge，只有一个 Snell 节点 | [`config/surge-template.conf`](config/surge-template.conf) |
| Surge，有多个 Snell / ShadowTLS 节点 | [`config/surge-template-multi-node.conf`](config/surge-template-multi-node.conf) |
| Clash / Stash，节点协议不固定 | [`config/clash-template.yaml`](config/clash-template.yaml) |
| 已经有自己的 Surge 配置，只想复制分组和规则 | [`config/surge-rules-github.tpl.conf`](config/surge-rules-github.tpl.conf) |

## ⚡ 快速使用

### Surge 单节点

打开 [`config/surge-template.conf`](config/surge-template.conf)，主要填写：

```text
YOUR_SERVER_IP_OR_DOMAIN
YOUR_SNELL_PORT
YOUR_SNELL_PSK
```

如果没有 ShadowTLS，保持 ShadowTLS 那一行注释即可。

### Surge 多节点

打开 [`config/surge-template-multi-node.conf`](config/surge-template-multi-node.conf)：

1. 在 `[Proxy]` 里复制一个节点示例
2. 改节点名、服务器、端口、PSK
3. 把节点名加入 `🔰 节点选择` 和 `♻️ 自动选择`

### Clash / Stash

打开 [`config/clash-template.yaml`](config/clash-template.yaml)，按自己的协议保留对应示例：

- VLESS / Reality
- Shadowsocks
- Trojan
- VMess

不用的协议示例可以保持注释或删除。

## 🧠 已拆分的策略组

这些服务已经单独分流，方便在客户端里分别指定节点：

- 🤖 `ChatGPT`
- 🧠 `Claude`
- 💎 `Gemini`
- 🧑‍💻 `GitHub`，包含 GitHub Copilot
- Ⓜ️ `Microsoft`，包含 OneDrive
- ✈️ `Telegram`
- 🍎 `Apple`
- ▶️ `YouTube`
- 🎬 `Netflix`
- 🎵 `Spotify`
- 🧩 `AI`，其他 AI 服务兜底

规则顺序里，专用 AI 规则会先匹配，最后再走总 `AI` 兜底。

## 📁 规则目录

| 目录 | 内容 |
| --- | --- |
| `rules/ai/` | ChatGPT、Claude、Gemini、GitHub/Copilot |
| `rules/services/` | Microsoft、OneDrive、Telegram、Twitter、JetBrains 等 |
| `rules/media/` | YouTube、Netflix、Spotify、TikTok、GlobalMedia |
| `rules/direct/` | 白名单、直连修正 |
| `rules/block/` | 防劫持、HTTPDNS、隐私拦截 |
| `rules/proxy/` | 常见代理规则 |

## 🌏 继续使用上游的规则

这些规则变化比较频繁，暂时保留上游链接更省心：

- 🇨🇳 中国域名、中国 IP、Google CN、Amazon CN、Cloudflare CN
- 🏠 局域网、私有网、LAN、private
- 🗺️ Surge GeoIP 数据库
- 🍎 Apple 全量规则

## 🧱 规则来源选择

这个仓库会混合使用几类规则源：

| 来源 | 用途 |
| --- | --- |
| `blackmatrix7/ios_rule_script` | Surge 细分服务规则，比如 YouTube、Netflix、Microsoft、Privacy |
| `Loyalsoldier/clash-rules` | Clash / Stash 基础规则，比如 direct、proxy、reject、private、cncidr |
| `MetaCubeX/meta-rules-dat` | 更适合 Mihomo / Clash Meta 体系，后续需要 `.mrs` 或 geosite/geoip 时再接入 |
| 本仓库自维护 | ChatGPT、Claude、Gemini、GitHub/Copilot 这类专用分流 |

`ACL4SSR` 属于老牌可用规则源，但新模板里会尽量减少依赖，优先使用维护更活跃、社区使用更广的规则源。

## 🔄 更新规则

想从上游重新拉取镜像规则时，在仓库目录运行：

```bash
./tools/update-rules.sh
```

更新后再提交并推送即可。

## 🔐 安全提醒

不要把填好真实信息的配置文件上传到公开仓库。

尤其不要公开：

- 服务器 IP / 域名
- Snell PSK
- ShadowTLS 密码
- Clash / Stash 的 UUID、Reality public-key、short-id
- Trojan / Shadowsocks 密码
- Surge 控制器密码

这个仓库里的模板只放占位符，可以公开分享。
