# セットアップ方法

## git clone
```bash
git clone https://github.com/tsunao8989/dotfiles.git
```

## シンボリックリンクを設定
```bash
ln -sf dotfiles/.zsh/.zshenv .
ln -sf dotfiles/.zsh/.zshrc .
ln -sf dotfiles/.vim/.vimrc .
```

## oh-my-zsh のインストール
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## 参考にさせてもらったサイト
[【詳解】モテたいVimmer必見　快適にコーディングするためのvimrc解説](https://qiita.com/ahiruman5/items/4f3c845500c172a02935)
