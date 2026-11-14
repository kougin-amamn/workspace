# workspace

smartools と toolbox-pro を作るための、GitHub Codespaces の作業場所です。

## 使い方

1. このリポジトリの画面で「Code → Codespaces → Create codespace on main」を押す。
2. 準備が自動で進みます(数分)。中身は `.devcontainer/setup.sh` です。
   - Claude Code を入れる
   - rtk を入れて、Claude Code につなぐ(コマンドの出力を短くして、読む量を減らす)
   - smartools と toolbox-pro を取ってくる
3. 準備が終わったら、ターミナルで次の2つを1回ずつ動かす。
   - `gh auth login`: smartools と toolbox-pro に push するため
   - `claude`: Claude のアカウントでログインするため
4. `cd smartools` などで移って、`claude` で作業する。`rtk gain` で、減らせた量を見られます。

## 気をつける事

- 使わない時は Codespace が自動で止まります。止まっている間は、無料の時間は減りません。
- 長く放っておいた Codespace は自動で消されることがあります。作業はこまめに push してください。
