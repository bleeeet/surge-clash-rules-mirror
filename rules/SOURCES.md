# Upstream sources

这个文件记录当前镜像规则的来源，方便以后检查和刷新。

| Local file | Upstream |
| --- | --- |
| `rules/direct/Unblocking.list` | `https://raw.githubusercontent.com/chenyk1219/surge/release/Unblocking.list` |
| `rules/direct/Direct.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Direct/Direct.list` |
| `rules/block/Hijacking.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Hijacking/Hijacking.list` |
| `rules/block/BlockHttpDNS.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/BlockHttpDNS/BlockHttpDNS.list` |
| `rules/block/Privacy_All_No_Resolve.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Privacy/Privacy_All_No_Resolve.list` |
| `rules/media/Spotify.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/refs/heads/master/rule/Surge/Spotify/Spotify.list` |
| `rules/media/YouTube.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/YouTube/YouTube.list` |
| `rules/media/YouTubeMusic.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/YouTubeMusic/YouTubeMusic.list` |
| `rules/media/Netflix.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Netflix/Netflix.list` |
| `rules/media/TikTok.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/TikTok/TikTok.list` |
| `rules/media/GlobalMedia_All_No_Resolve.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/GlobalMedia/GlobalMedia_All_No_Resolve.list` |
| `rules/services/OneDrive.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/OneDrive/OneDrive.list` |
| `rules/services/Microsoft.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Microsoft/Microsoft.list` |
| `rules/services/Amazon.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Amazon/Amazon.list` |
| `rules/services/AmazonIP.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/AmazonIP/AmazonIP.list` |
| `rules/services/Jetbrains.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Jetbrains/Jetbrains.list` |
| `rules/services/Telegram.list` | `https://raw.githubusercontent.com/Coldvvater/Mononoke/master/Surge/Rules/Telegram.list` |
| `rules/services/Twitter.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Twitter/Twitter.list` |
| `rules/services/AI.list` | `https://raw.githubusercontent.com/Coldvvater/Mononoke/master/Surge/Rules/AI.list` |
| `rules/services/GitHub.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/GitHub/GitHub.list` |
| `rules/services/Cloudflare.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Cloudflare/Cloudflare.list` |
| `rules/proxy/Proxy_All_No_Resolve.list` | `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Proxy/Proxy_All_No_Resolve.list` |

## Custom split rules

这些文件是从现有 AI/GitHub 规则拆分并补充的自维护规则：

| Local file | Basis |
| --- | --- |
| `rules/ai/ChatGPT.list` | OpenAI / ChatGPT common domains, plus entries from `rules/services/AI.list` |
| `rules/ai/Anthropic.list` | Anthropic API and Claude common domains, plus entries from `rules/services/AI.list` |
| `rules/ai/Gemini.list` | Google Gemini / AI Studio / NotebookLM common domains, plus entries from `rules/services/AI.list` |
| `rules/ai/GitHubCopilot.list` | `rules/services/GitHub.list` plus GitHub Copilot allowlist endpoints from GitHub Docs: `https://docs.github.com/copilot/reference/allowlist-reference` |
