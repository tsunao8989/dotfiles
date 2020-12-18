# セットアップ方法

## git clone
```bash
git clone https://github.com/tsunao8989/dotfiles.git
```

## シンボリックリンクを設定
```bash
ln -sf dotfiles/.zsh/.zshenv ~
ln -sf dotfiles/.zsh/.zshrc ~
ln -sf dotfiles/.vim/.vimrc ~
```

## oh-my-zsh のインストール
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## dein.vim のインストール
```bash
cd ~ && curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
mkidr -p .vim/dein
sh ./installer.sh ~/.vim/dein/
```

## 参考にさせてもらったサイト
[【詳解】モテたいVimmer必見　快適にコーディングするためのvimrc解説](https://qiita.com/ahiruman5/items/4f3c845500c172a02935)
[dein.vimでプラグイン管理のはじめ方](https://qiita.com/sugamondo/items/fcaf210ca86d65bcaca8)
