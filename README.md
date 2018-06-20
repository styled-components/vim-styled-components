# vim-styled-components

Vim bundle for [styled-components](https://styled-components.com), [diet-cola](https://github.com/jxnblk/diet-cola), [emotion](https://github.com/emotion-js/emotion) and experimental [glamor/styled](https://github.com/threepointone/glamor/blob/master/docs/styled.md) content in javascript files.

After massive issues with the syntax highlighting of the previous version, this newly implemented plugin now only highlights CSS in javascript template strings, if the current APIs of the supported libraries are present. Thus there is no more bleeding of keywords into non-CSS sections of the file.

Note however, that this plugin does not provide (all existing) CSS rules. You should have an up to date vim runtime (for CSS2 rules) and - as long as CSS3 rules are not included - an additional plugin for CSS3 rules. (I recommend [hail2u/vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax) but feel free to use whatever you like.)

## Table of Contents

- [Installation](#installation)
- [Caveats](#caveats)
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

    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Install via:

    :so ~/.vimrc
    :PlugInstall

### Install via [pathogen](https://github.com/tpope/vim-pathogen)

Run:

    git clone https://github.com/styled-components/vim-styled-components/ ~/.vim/bundle/vim-styled-components

## Caveats

As only the official APIs are supported and they are necessary to indicate highlighting sections in your javascript file, renaming of the appropriate functions or externally defining the CSS rules in template strings will lead to missing highlighting. This means the following will not be correctly highlighted:

```javascript
import styled as unstyled from 'styled-components';

unstyled`
  background-color: papayawhip;
  color: palevioletred;
`;
```

Neither will this:

```javascript
import dc from 'diet-cola';

const mainStyles = `
  background-color: papayawhip;
  color: palevioletred;
`;

const Button = styled('h1')(mainStyles);
```

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
