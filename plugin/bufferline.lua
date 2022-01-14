require('bufferline').setup {
    options = {
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          return "("..count..")"
        end,
        show_buffer_close_icon = false,
        show_close_icon = false,
        separator_style = "thick",
    }
}
