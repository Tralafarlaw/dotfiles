local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- default map
local def_map = {
    -- Vim map
    ["n|<F8>"] = map_cr('e $MYVIMRC'):with_noremap(),                           --edit config
    ["n|<F12>"] = map_cr('source $MYVIMRC'):with_noremap(),                     --reload Config
    ["n|<F3>"] = map_cr('set hls!'):with_noremap():with_silent(),               --toggle search highlighting from '/'

    ["n|<F4>"] = map_cr('bdelete'):with_noremap():with_silent(),                --Cerrar Buffer
    ["n|<C-s>"] = map_cu('write'):with_noremap(),                               --Save Current Buffer

    ["n|Y"] = map_cmd('y$'),                                                    --Yank to End of Line
    ["n|D"] = map_cmd('d$'),                                                    --Delete to End of Line

    ["n|n"] = map_cmd('nzzzv'):with_noremap(),                                  --Center the line with the Next Occurrence
    ["n|N"] = map_cmd('Nzzzv'):with_noremap(),                                  --Center the line with the Prev Occurrence

    ["n|J"] = map_cmd('mzJ`z'):with_noremap(),                                  --Append next Line to the end of current

    ["n|<C-h>"] = map_cmd('<C-w>h'):with_noremap(),                             --Mover Buffer de Izquierda
    ["n|<C-l>"] = map_cmd('<C-w>l'):with_noremap(),                             --Mover Buffer de Derecha
    ["n|<C-j>"] = map_cmd('<C-w>j'):with_noremap(),                             --Mover Buffer de Abajo
    ["n|<C-k>"] = map_cmd('<C-w>k'):with_noremap(),                             --Mover Buffer de Arriba

    ["n|<C-S-j>"] = map_cr('vertical resize -5')              ,                   --Reducir Buffer v
    ["n|<C-S-k>"] = map_cr('vertical resize +5')              ,                   --Aumenta Buffer v
    ["n|<C-S-h>"] = map_cr('resize -2')              ,                            --Reducir Buffer
    ["n|<C-S-l>"] = map_cr('resize +2'),                                          --Aumentar Buffer

    ["n|<A-q>"] = map_cmd(':wq<CR>'),                                           --Guardar y Salir
    ["n|<C-q>"] = map_cmd(':bw<CR>'),                                           --Cerrar Buffer pero no vim
    ["n|<C-S-q>"] = map_cmd(':bw!<CR>'),                                        --Cerrar Buffer a la fuerza
  --  ["n|<leader>o"] = map_cr("setlocal spell! spelllang=en_us"),                --
    -- Insert
    ["i|<C-u>"] = map_cmd('<C-G>u<C-U>'):with_noremap(),                        --Undo With Steroids
    ["i|<C-k>"] = map_cmd('<Up>'):with_noremap(),                               --Insert mode Up
    ["i|<C-j>"] = map_cmd('<Down>'):with_noremap(),                             --Insert mode Down
    ["i|<C-h>"] = map_cmd('<Left>'):with_noremap(),                             --Insert mode Left
    ["i|<C-l>"] = map_cmd('<Right>'):with_noremap(),                            --Insert mode Right
    ["i|<C-a>"] = map_cmd('<ESC>^i'):with_noremap(),                            --Ctrl + i in Insert mode
    ["i|<C-s>"] = map_cmd('<Esc>:w<CR>'),                                       --Save in Insert mode
    ["i|<C-q>"] = map_cmd('<Esc>:wq<CR>'),                                      --Quit in Insert Mode
    -- command line
    ["c|<C-b>"] = map_cmd('<Left>'):with_noremap(),                             --Back Option command mode
    ["c|<C-f>"] = map_cmd('<Right>'):with_noremap(),                            --Forward Option command mode
    ["c|<C-a>"] = map_cmd('<Home>'):with_noremap(),                             --Inicio de linea
    ["c|<C-e>"] = map_cmd('<End>'):with_noremap(),                              --Fin de linea
    ["c|<C-d>"] = map_cmd('<Del>'):with_noremap(),                              --delete char selected
    ["c|<C-h>"] = map_cmd('<BS>'):with_noremap(),                               --delete char in front of cursor
    ["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(), --write path to file in command mode
    ["c|w!!"] = map_cmd(
        "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!"),          --sudo :w!
    -- Visual
    ["v|J"] = map_cmd(":m '>+1<cr>gv=gv"),                                      --Move the current selection one line Up
    ["v|K"] = map_cmd(":m '<-2<cr>gv=gv"),                                      --Move the current selection one line Down
    ["v|<"] = map_cmd("<gv"),                                                   --Indent without loose the selection
    ["v|>"] = map_cmd(">gv")                                                    --Undent without loose the selection
}

bind.nvim_load_mapping(def_map)
