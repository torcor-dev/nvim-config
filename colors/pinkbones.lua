local colors_name = "pinkbones"
vim.g.colors_name = colors_name -- Required when defining a colorscheme

local lush = require "lush"
local hsluv = lush.hsluv -- Human-friendly hsl
local util = require "zenbones.util"

local bg = vim.opt.background:get()

-- Define a palette. Use `palette_extend` to fill unspecified colors
local palette = util.palette_extend({
		bg = hsluv "#250014",
		--bg = hsluv "#250D1A",
		fg = hsluv "#EA93D0", -- self, functions
		rose = hsluv "#C45E9E", -- definitions / error
		leaf = hsluv "#FF8AB3",
		wood = hsluv "#D17FC8", -- warning
		water = hsluv "#FF65A8", --class instance
		blossom = hsluv "#E794D0",
		sky = hsluv "#FF74FD",
	}, bg)

-- Generate the lush specs using the generator util
local generator = require "zenbones.specs"
local base_specs = generator.generate(palette, bg, generator.get_global_config(colors_name, bg))

-- Optionally extend specs using Lush
local specs = lush.extends({ base_specs }).with(function()
	return {
        DiagnosticVirtualTextHint {base_specs.DiagnosticVirtualTextHint, bg = palette.bg },
        DiagnosticVirtualTextError {base_specs.DiagnosticVirtualTextError, bg = palette.bg },
        DiagnosticVirtualTextWarn {base_specs.DiagnosticVirtualTextWarn, bg = palette.bg },
        DiagnosticVirtualTextInfo {base_specs.DiagnosticVirtualTextInfo, bg = palette.bg },
        Delimiter { base_specs.Delimiter, fg = palette.rose },
		Statement { base_specs.Statement, fg = palette.rose },
		Special { fg = palette.water },
		Type { fg = palette.sky, },
        String { fg = palette.leaf } ,
        MatchParen {gui='bold,underline'},
        --Search { bg = "#8c2eea", fg = palette.rose, },
        --Cursor {gui='bold'},
        --lCursor {gui='bold'},
        --TermCursor {gui='bold'},
        --TermCursorNC {gui='bold'},
	}
end)

-- Pass the specs to lush to apply
lush(specs)

-- Optionally set term colors
require("zenbones.term").apply_colors(palette)
