#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

download() {
  local url="$1"
  local path="$2"
  mkdir -p "$(dirname "$ROOT_DIR/$path")"
  curl -fsSL "$url" -o "$ROOT_DIR/$path"
  printf 'updated %s\n' "$path"
}

download 'https://raw.githubusercontent.com/chenyk1219/surge/release/Unblocking.list' 'rules/direct/Unblocking.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Direct/Direct.list' 'rules/direct/Direct.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Hijacking/Hijacking.list' 'rules/block/Hijacking.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/BlockHttpDNS/BlockHttpDNS.list' 'rules/block/BlockHttpDNS.list'
# Privacy_All_No_Resolve is intentionally disabled: it is very large and can slow down some sites/apps.
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/refs/heads/master/rule/Surge/Spotify/Spotify.list' 'rules/media/Spotify.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/YouTube/YouTube.list' 'rules/media/YouTube.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/YouTubeMusic/YouTubeMusic.list' 'rules/media/YouTubeMusic.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Netflix/Netflix.list' 'rules/media/Netflix.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/TikTok/TikTok.list' 'rules/media/TikTok.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/GlobalMedia/GlobalMedia_All_No_Resolve.list' 'rules/media/GlobalMedia_All_No_Resolve.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/OneDrive/OneDrive.list' 'rules/services/OneDrive.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Microsoft/Microsoft.list' 'rules/services/Microsoft.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Amazon/Amazon.list' 'rules/services/Amazon.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/AmazonIP/AmazonIP.list' 'rules/services/AmazonIP.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Jetbrains/Jetbrains.list' 'rules/services/Jetbrains.list'
download 'https://raw.githubusercontent.com/Coldvvater/Mononoke/master/Surge/Rules/Telegram.list' 'rules/services/Telegram.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Twitter/Twitter.list' 'rules/services/Twitter.list'
download 'https://raw.githubusercontent.com/Coldvvater/Mononoke/master/Surge/Rules/AI.list' 'rules/services/AI.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/GitHub/GitHub.list' 'rules/services/GitHub.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Cloudflare/Cloudflare.list' 'rules/services/Cloudflare.list'
download 'https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Proxy/Proxy_All_No_Resolve.list' 'rules/proxy/Proxy_All_No_Resolve.list'
