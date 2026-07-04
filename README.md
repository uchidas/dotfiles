# dotfiles

## Setup

### Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) がインストールされていること

### Initial Setup

1. dotfiles を clone する

```bash
git clone git@github.com:uchidas/dotfiles.git ~/dotfiles
```

2. setup-dotfiles スキルの `SKILL.md` を `~/.claude/skills/setup-dotfiles/` にシンボリックリンクする（初回のみ）

```bash
mkdir -p ~/.claude/skills/setup-dotfiles
ln -s ~/dotfiles/.claude/skills/setup-dotfiles/SKILL.md ~/.claude/skills/setup-dotfiles/SKILL.md
```

3. Claude Code を起動し、スキルを実行する

```bash
claude
```

```
/setup-dotfiles
```

これにより、dotfiles 配下のファイルがシンボリックリンクとして展開され、シェルの再読み込みも行われます。
`~/dotfiles-local` が存在する場合は、自動的に `setup-dotfiles-local` も実行されます。

### Re-run

2回目以降は Claude Code 上で `/setup-dotfiles` を実行するだけで OK です。
既存のシンボリックリンクはスキップされ、新規ファイルのみ追加されます。

## 構成

| パス | 用途 |
|---|---|
| `.gitconfig` | Git 設定（`.gitconfig.local` を include） |
| `.gitignore_global` | グローバル gitignore |
| `.vimrc` | Vim 設定 |
| `.zshrc` | Zsh 設定（`.zshrc.local` を source） |
| `.claude/skills/setup-dotfiles/` | dotfiles 展開スキル |
