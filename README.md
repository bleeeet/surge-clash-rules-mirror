# Surge rules mirror

这个目录用于把不稳定的第三方 Surge `RULE-SET` 规则镜像到自己的仓库里。

## 已镜像

- `rules/direct/`: 白名单、直连修正规则
- `rules/block/`: 劫持、HTTPDNS、隐私拦截规则
- `rules/services/`: AI、GitHub、Microsoft、Telegram 等服务规则
- `rules/ai/`: ChatGPT、Claude、Gemini、GitHub/Copilot 专用分流规则
- `rules/media/`: YouTube、Netflix、Spotify、TikTok 等媒体规则
- `rules/proxy/`: 常见代理规则
- `config/surge-template.conf`: 给别人直接填写节点信息的精简完整模板，规则默认调用本仓库

## 建议继续使用上游

这些规则变化比较频繁，或者由上游维护更省心，暂时不建议固定到自己的仓库：

- 中国域名、中国公司 IP、Google CN、Amazon CN、Cloudflare CN
- 局域网、私有网、LAN
- Surge 的 GeoIP 数据库
- Apple 全量规则

## 怎么调用

规则默认调用本仓库 Raw 地址：

```text
https://raw.githubusercontent.com/bleeeet/surge-rules/main/
```

朋友使用 [config/surge-template.conf](config/surge-template.conf) 时，只需要填写自己的节点地址、端口、PSK 等信息即可。不要把填好真实节点地址、Snell PSK、ShadowTLS 密码、Surge 控制器密码的完整配置直接上传到公开仓库。

## AI 专用分流

`config/surge-rules-github.tpl.conf` 里已经加了这些独立策略组：

- `ChatGPT`
- `Claude`
- `Gemini`
- `GitHub`
- `Microsoft`
- `Telegram`
- `Apple`
- `YouTube`
- `Netflix`
- `Spotify`
- `AI`

其中 `GitHub` 组同时包含 GitHub 和 GitHub Copilot。`AI` 组作为其他 AI 服务兜底，专用规则会先于总 AI 规则匹配。

## 刷新规则

以后想从上游重新拉取这些镜像规则，可以运行：

```bash
./tools/update-rules.sh
```
