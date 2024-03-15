-- Config Ref
-- https://github.com/kylechui/nvim-surround/blob/main/lua/nvim-surround/config.lua
return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
}

