#!/usr/bin/env bash
# Codespace を作った時に1回だけ動く準備。Claude Code と rtk を入れ、smartools と toolbox-pro を取ってくる。
# どこかで失敗しても、残りの準備は続ける(最後に結果をまとめて出す)
set -u
results=()
step() {
  local name="$1"
  shift
  if "$@"; then results+=("OK  $name"); else results+=("NG  $name"); fi
}

# Claude Code(Node.js 22 以上が必要。sudo は使わない)
step "Claude Code を入れる" npm install -g @anthropic-ai/claude-code

# rtk(コマンドの出力を短くして、Claude が読む量を減らす)。~/.local/bin に入る
export PATH="$HOME/.local/bin:$PATH"
step "rtk を入れる" bash -c 'curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/refs/heads/master/install.sh | sh'
# Claude Code につなぐ(質問せずに設定する)
step "rtk を Claude Code につなぐ" rtk init -g --auto-patch

# 作業するリポジトリ(公開なので、取ってくるだけならログイン不要。push には gh auth login が要る)
cd /workspaces || cd "$HOME"
for repo in smartools toolbox-pro; do
  [ -d "$repo" ] || step "$repo を取ってくる" git clone "https://github.com/kougin-amamn/$repo"
done

echo
echo "===== 準備の結果 ====="
printf '%s\n' "${results[@]}"
echo "次に: ターミナルで 'gh auth login'(push のため)と 'claude'(ログイン)を一度ずつ動かしてください"
