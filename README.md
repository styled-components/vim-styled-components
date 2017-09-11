# vim-styled-components

Vim bundle for [styled-components](https://styled-components.com), [diet-cola](https://github.com/jxnblk/diet-cola) and experimental [glamor/styled](https://github.com/threepointone/glamor/blob/master/docs/styled.md) based javascript files.

This plugin checks, whether the current buffer contains an `import` or a `require` from `styled-components`, `diet-cola` or `glamor/styled` and injects CSS rules into JS template strings.

Note however, that this plugin does not provide its own CSS rules. You should have an up to date vim runtime (for CSS2 rules) and - as long as CSS3 rules are not included - an additional plugin for CSS3 rules. (I recommend [hail2u/vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax) but feel free to use whatever you like.)

**Note:** This plugin won't change the syntax if you start with an empty buffer and then add styled-components code, you will need to close the buffer and re-open it so that the styles apply.

A quick way to do that is with this command: `:edit!` which will do exactly that. You can map that to a shortcut if you wish.

## Table of Contents

- [Installation](#installation)
- [Contributing](#contributing)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Installation

See the documentation for the specific vim package manager for details on how to install packages for vim.

### Install via [Vundle](https://github.com/VundleVim/Vundle.Vim)

Add to vimrc:

    Plugin 'styled-components/vim-styled-components'

Install via:

    :so ~/.vimrc
    :PluginInstall

### Install via [vim-plug](https://github.com/junegunn/vim-plug)

Add to vimrc:

    Plug 'styled-components/vim-styled-components'

Install via:

    :so ~/.vimrc
    :PlugInstall

### Install via [pathogen](https://github.com/tpope/vim-pathogen)

Run:

    git clone https://github.com/styled-components/vim-styled-components/ ~/.vim/bundle/vim-styled-components

## Contributing

Contributions are very welcome. 🙇

Browse existing issues or create a new one [here](https://github.com/styled-components/vim-styled-components/issues).

Submit pull requests [here](https://github.com/styled-components/vim-styled-components/pulls). This project uses the [git flow model](http://nvie.com/posts/a-successful-git-branching-model/) for development. Please base your feature branch on the develop branch and follow the code style convention used in the already existing files.

## Acknowledgements

A huge thanks goes to Bram Moolenaar for authoring/maintaining [Vim](http://www.vim.org/).

Lots of love to [Glen Maddern](https://twitter.com/glenmaddern) and [Max Stoiber](https://twitter.com/mxstbr) for creating [styled-components](https://styled-components.com).

And of course [sylvainbannier](https://github.com/sylvainbannier) for the initial workaround [here](https://github.com/styled-components/styled-components/issues/257#issue-191586611).

## License

Copyright (c) 2016 Karl Fleischmann.
Distributed under the same terms as Vim itself. See `:help license`.
