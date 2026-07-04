---
name: setup-dotfiles
description: >-
  dotfiles リポジトリのファイルをホームディレクトリにシンボリックリンクとして展開する。
  ~/dotfiles-local が存在する場合は setup-dotfiles-local も自動実行する。
  /setup-dotfiles コマンドで使用する。
user-invocable: true
---

# setup-dotfiles

以下の手順を順番に実行してください。

### 1. シンボリックリンクの作成

`~/dotfiles` 配下のドットファイルを `~` にシンボリックリンクとして展開する。

**対象ファイル**: `~/dotfiles` 配下の全ファイル（再帰的に検索）

**除外対象**:
- `.git/`
- `.gitignore`
- `README.md`
- `CLAUDE.md`（リポジトリ直下のみ。リポジトリ用の Claude への指示書のため展開しない）

**実行方法**:

```bash
DOTFILES_DIR="$HOME/dotfiles"

find "$DOTFILES_DIR" -name .git -prune -o -type f -print0 | while IFS= read -r -d '' file; do
  rel_path="${file#"$DOTFILES_DIR"/}"

  # 除外判定
  case "$rel_path" in
    .git/*|.gitignore|README.md|CLAUDE.md) continue ;;
  esac

  dest="$HOME/$rel_path"
  mkdir -p "$(dirname "$dest")"

  if [ -L "$dest" ]; then
    current_target="$(readlink "$dest")"
    if [ "$current_target" = "$file" ]; then
      echo "OK (already linked): $rel_path"
    else
      ln -sf "$file" "$dest"
      echo "Updated symlink: $rel_path -> $file"
    fi
  elif [ -e "$dest" ]; then
    echo "SKIP (file exists): $dest — 手動で確認してください"
  else
    ln -s "$file" "$dest"
    echo "Created symlink: $rel_path -> $file"
  fi
done
```

各ファイルの結果を表示すること。
既存ファイル（シンボリックリンクでない実ファイル）がある場合は一旦スキップし、リストに記録しておく。

### 2. 既存ファイルの確認

Step 1 でスキップしたファイルがある場合、最後にまとめてユーザーに1件ずつ確認する。
AskUserQuestion ツールを使い、各ファイルについて「上書き（シンボリックリンクに置換）」か「スキップ」かを選択してもらう。
上書きを選択した場合は既存ファイルを削除してシンボリックリンクを作成する。

### 3. dotfiles-local の展開

`~/dotfiles-local` が存在する場合、`setup-dotfiles-local` スキルを実行する。

```bash
if [ -d "$HOME/dotfiles-local" ]; then
  echo "dotfiles-local を検出しました。setup-dotfiles-local を実行します。"
fi
```

`~/dotfiles-local` が存在する場合は、Skill ツールで `/setup-dotfiles-local` を呼び出す。

### 4. シェルの再読み込み

```bash
source ~/.zshrc
```

### 5. 完了レポート

```
setup-dotfiles 完了
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Created:  N 件
 Updated:  N 件
 Skipped:  N 件 (既存ファイルあり)
 Already:  N 件 (リンク済み)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```
