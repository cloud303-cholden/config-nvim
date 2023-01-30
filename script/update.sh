#!/bin/bash

echo $(nvim -v | awk 'NR==1')

pkg='nvim-linux64.deb'

curl -sLo $pkg https://github.com/neovim/neovim/releases/download/nightly/$pkg

sudo apt install -y ./$pkg

rm $pkg

echo $(nvim -v | awk 'NR==1')
