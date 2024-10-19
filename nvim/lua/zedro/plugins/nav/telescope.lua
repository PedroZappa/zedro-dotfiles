return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  event = "VeryLazy",
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    'xiyaowong/telescope-emoji.nvim',
    "nvim-tree/nvim-web-devicons",
    'cljoly/telescope-repo.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    -- { 'rcarriga/nvim-notify',                     branch = "master" },
    { "LinArcX/telescope-ports.nvim" },
    'axkirillov/easypick.nvim',
    'dapc11/telescope-yaml.nvim'
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local open_with_trouble = require("trouble.sources.telescope").open
    local live_grep_arg_actions = require("telescope-live-grep-args.actions")
    local easypick = require("easypick")

    telescope.setup {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.66,
            results_width = 0.9,
          },
          vertical = {
            mirror = true,
          },
          width = 0.8,
          height = 0.8,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          n = {
            ["q"] = actions.close,
            ["-"] = actions.file_split,
            ["|"] = actions.file_vsplit,
            ["<C-k>"] = live_grep_arg_actions.quote_prompt(),
            ["<C-t>"] = open_with_trouble,
          },
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key",
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-t>"] = open_with_trouble,
          }
        }
      },
      pickers = {
        initial_mode = "normal",
        find_files = {
          hidden = false,
          find_command = {
            "rg",
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            "--hidden",
            "--files",
            "--glob",
            "!**/.git/*",
            "-L"
          }
        }
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        emoji = {
          action = function(emoji)
            -- argument emoji is a table.
            -- {name="", value="", cagegory="", description=""}

            vim.fn.setreg("*", emoji.value)
            print([[Press p or "*p to paste this emoji]] .. emoji.value)

            -- insert emoji when picked
            -- vim.api.nvim_put({ emoji.value }, 'c', false, true)
          end,
        },
        repo = {
          list = {
            fd_opts = {
              "--no-ignore-vcs",
            },
            search_dirs = {
              "~/my_projects",
            },
          },
        },
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    }

    local cmd_list = [[
<< EOF
:Lazy
:Telescope find_files
:Mason
:Git blame
:!ls -al
EOF
]]
    easypick.setup({
      pickers = {
        { -- create a "command palette" style picker that executes vim commands
          name = "command_palette",
          command = "cat " .. cmd_list,
          -- pass a pre-configured action that runs the command
          action = easypick.actions.nvim_commandf("%s"),
          -- you can specify any theme you want, but the dropdown looks good for this example =)
          opts = require('telescope.themes').get_dropdown({})
        }
      },
    })

    pcall(require("telescope").load_extension("emoji"))
    pcall(require("telescope").load_extension("repo"))
    pcall(require('telescope').load_extension('fzf'))
    pcall(require("telescope").load_extension("live_grep_args"))
    pcall(require('telescope').load_extension('dap'))
    pcall(require('telescope').load_extension('ports'))
    pcall(require('telescope').load_extension('telescope-yaml'))

    -- Get the text if selected or the text searched. Otherwise return '' (default behavior)
    local function getText()
      local text = ''
      if (string.find("Vv", vim.fn.mode())) then
        -- visual mode
        vim.cmd('noau normal! "vy"')
        text = vim.fn.getreg('v')
        vim.fn.setreg('v', {})

        text = string.gsub(text, "\n", "")
        if #text == 0 then
          text = ''
        end
      elseif (vim.v.hlsearch == 1) then
        -- Normal mode or any other
        text = vim.fn.getreg("/")
        text = string.gsub(text, '\\<', '\\b')
        text = string.gsub(text, '\\>', '\\b')
      end

      return text
    end

    local builtin    = require('telescope.builtin')
    local lga        = require('telescope').extensions.live_grep_args.live_grep_arg

    local changeText = function(func)
      return function()
        func({ default_text = getText() })
      end
    end

    -- Builtin keymaps
    vim.keymap.set('n', '<leader>tc', ":Telescope commands<CR>", { desc = "Search [T]elescope commands" })
    vim.keymap.set('n', '<leader>ep', ":Easypick<CR>", { desc = "Search [T]elescope [E]asypick pickers" })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
    vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = "Grep string" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[F]ind [B]uffers" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "[F]ind [H]elp tags" })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
    vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = '[S]earch [M]anpages' })
    vim.keymap.set('n', '<leader>fe', ":Telescope emoji<CR>", { desc = "Emoji" })
    vim.keymap.set('n', '<leader>fr', ":Telescope repo list<CR>", { desc = "Repo" })
    vim.keymap.set('n', '<leader>fn', ":Telescope notify<CR>", { desc = "Notifications in Telescope" })
    vim.keymap.set("n", "<leader>fcm", ":Telescope git_commits<CR>", { desc = "Git commits" })
    vim.keymap.set("n", "<leader>gt", ":Telescope git_status<CR>", { desc = "Git status" })
    -- LSP bindings
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = "[G]o to [D]efinition" })
    vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = "[G]o to [R]eferences" })
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = "[G]o to [I]mplementations" })
    vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
    vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "[R]e[n]ame variable" })
    -- DAP bindings
    vim.keymap.set('n', '<leader>dc', telescope.extensions.dap.commands, { desc = "[D]AP : [c]ommands" })
    vim.keymap.set('n', '<leader>dC', telescope.extensions.dap.configurations, { desc = "[D]AP : [C]onfigurations" })
    vim.keymap.set('n', '<leader>db', telescope.extensions.dap.list_breakpoints, { desc = "[D]AP : List [B]reakpoints" })
    vim.keymap.set('n', '<leader>dv', telescope.extensions.dap.variables, { desc = "[D]AP : [V]ariables" })
    vim.keymap.set('n', '<leader>df', telescope.extensions.dap.frames, { desc = "[D]AP : [F]rames" })
    -- Search grepped text
    vim.keymap.set({ 'n', 'v' }, '<leader>sg', changeText(lga), { desc = '[S]earch by [G]rep' })
    vim.keymap.set({ 'n', 'v' }, '<C-g>', changeText(lga), { desc = '[S]earch by [G]rep' })
    vim.keymap.set({ 'n', 'v' }, '<C-f>', changeText(builtin.current_buffer_fuzzy_find),
      { desc = '[/] Fuzzily search in current buffer]' })
    vim.keymap.set({ 'n', 'v' }, '<leader>/', changeText(builtin.current_buffer_fuzzy_find),
      { desc = '[/] Fuzzily search in current buffer]' })
  end,
}
