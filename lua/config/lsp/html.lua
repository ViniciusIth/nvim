return function(capabilities, on_attach)
    return {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "templ" },
    }
end
