local global = require 'core.global'
local vim = vim

-- Create cache dir and subs dir
local createDir = function()
    local data_dir = {
        global.cache_dir .. 'backup', global.cache_dir .. 'session',
        global.cache_dir .. 'swap', global.cache_dir .. 'tags',
        global.cache_dir .. 'undo'
    }
    -- There only check once that If cache_dir exists
    -- Then I don't want to check subs dir exists
    if vim.fn.isdirectory(global.cache_dir) == 0 then
        os.execute("mkdir -p " .. global.cache_dir)
        for _, v in pairs(data_dir) do
            if vim.fn.isdirectory(v) == 0 then
                os.execute("mkdir -p " .. v)
            end
        end
    end
end

local disable_distribution_plugins = function()
    vim.g.loaded_gzip = 1
    vim.g.loaded_tar = 1
    vim.g.loaded_tarPlugin = 1
    vim.g.loaded_zip = 1
    vim.g.loaded_zipPlugin = 1
    vim.g.loaded_getscript = 1
    vim.g.loaded_getscriptPlugin = 1
    vim.g.loaded_vimball = 1
    vim.g.loaded_vimballPlugin = 1
    vim.g.loaded_matchit = 1
    vim.g.loaded_matchparen = 1
    vim.g.loaded_2html_plugin = 1
    vim.g.loaded_logiPat = 1
    vim.g.loaded_rrhelper = 1
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.g.loaded_netrwSettings = 1
    vim.g.loaded_netrwFileHandlers = 1
    vim.g.did_load_filetypes = 1
end

local leader_map = function()
    vim.g.mapleader = " "
   -- vim.api.nvim_set_keymap('n', ' ', '', {noremap = true})
   -- vim.api.nvim_set_keymap('x', ' ', '', {noremap = true})
end

local neovide_config = function()
    vim.cmd [[set guifont=MonoLisa,JetBrainsMono\ Nerd\ Font,BlexMono\ Nerd\ Font\ Mono,JetBrainsMono\ NL,FreeMono,Hack,FiraCode\ Nerd\ Font\ Mono,Material\ Icons:h20"]]
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_no_idle = true
    vim.g.neovide_cursor_animation_length = 0.03
    vim.g.neovide_cursor_trail_length = 0.05
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_vfx_opacity = 200.0
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
    vim.g.neovide_cursor_vfx_particle_speed = 20.0
    vim.g.neovide_cursor_vfx_particle_density = 5.0
end

local dashboard_config = function()
    vim.g.dashboard_footer_icon = ' '
    vim.g.dashboard_default_executive = 'telescope'

    vim.g.dashboard_custom_header = {
        [[─────▒▒▒▒────────                         ]],
        [[───▒▒▒░░▒▒▒─────  ──▓▓▓▓▓▓▓▓              ]],
        [[──▒▒─────▒▒▒────▒▒▓▓▓▓▓░░░░░▓▓──▓▓▓▓      ]],
        [[─▒───▒▒────▒▒─▓▓▒░░░░░░░░░█▓▒▓▓▓▓░░▓▓▓    ]],
        [[▒▒──▒─▒▒───▓▒▒░░▒░░░░░████▓▓▒▒▓░░░░░░▓▓   ]],
        [[░▒▒───▒──▓▓▓░▒░░░░░░█████▓▓▒▒▒▒▓▓▓▓▓░░▓▓  ]],
        [[──▒▒▒▒──▓▓░░░░░░███████▓▓▓▒▒▒▒▒▓───▓▓░▓▓  ]],
        [[──────▓▓░░░░░░███████▓▓▓▒▒▒▒▒▒▒▓───▓░░▓▓  ]],
        [[─────▓▓░░░░░███████▓▓▓▒▒▒▒▒▒▒▒▒▓▓▓▓░░▓▓   ]],
        [[────▓▓░░░░██████▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▓░░░░▓▓    ]],
        [[────▓▓▓░████▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓      ]],
        [[─────▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓          ]],
        [[─────▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓          ]],
        [[──────▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓           ]],
        [[───────▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓            ]],
        [[─────────▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓              ]],
        [[───────────▓▓▓▓▓▓▒▒▒▒▒▓▓▓▓                ]],
        [[────────────────▓▓▓▓▓▓▓                   ]]
    }

    vim.g.dashboard_custom_section = {
        change_colorscheme = {
            description = {' Scheme change              Space s c '},
            command = 'DashboardChangeColorscheme'
        },
        find_frecency = {
            description = {' File frecency              Space f r '},
            command = 'Telescope frecency'
        },
        find_history = {
            description = {' File history               Space f e '},
            command = 'DashboardFindHistory'
        },
        find_project = {
            description = {' Project find               Space f p '},
            command = 'Telescope project'
        },
        find_file = {
            description = {' File find                  Space f f '},
            command = 'DashboardFindFile'
        },
        file_new = {
            description = {' File new                   Space f n '},
            command = 'DashboardNewFile'
        },
        find_word = {
            description = {' Word find                  Space f w '},
            command = 'DashboardFindWord'
        }
    }
end

local load_core = function()
    local pack = require('core.pack')
    createDir()
    disable_distribution_plugins()
    leader_map()

    pack.ensure_plugins()
    neovide_config()
    dashboard_config()

    require('core.options')
    require('core.mapping')
    require('keymap')
    require('core.event')
    pack.load_compile()

    vim.cmd [[colorscheme enfocado]]
end

load_core()
