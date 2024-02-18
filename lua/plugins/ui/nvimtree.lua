local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function edit_or_open()
        local node = api.tree.get_node_under_cursor()

        if node.nodes ~= nil then
            -- expand or collapse folder
            api.node.open.edit()
        else
            -- open file
            api.node.open.edit()
            -- Close the tree if file was opened
            api.tree.close()
        end
    end

    -- open as vsplit on current node
    local function vsplit_preview()
        local node = api.tree.get_node_under_cursor()

        if node.nodes ~= nil then
            -- expand or collapse folder
            api.node.open.edit()
        else
            -- open file as vsplit
            api.node.open.vertical()
        end

        -- Finally refocus on tree if it was lost
        api.tree.focus()
    end


    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set("n", "I", api.tree.toggle_hidden_filter, opts "Toggle hidden filter")
    vim.keymap.set("n", "G", api.tree.toggle_gitignore_filter, opts "Toggle ignore filter")
    vim.keymap.set("n", "D", api.fs.remove, opts "Delete file or directory")
    vim.keymap.set("n", "d", api.fs.create, opts "Create file or directory")
    vim.keymap.set("n", "r", api.fs.rename_full, opts "Rename file")

    vim.keymap.set("n", "l", edit_or_open, opts "Edit Or Open")
    vim.keymap.set("n", "L", vsplit_preview, opts "Vsplit Preview")
    vim.keymap.set("n", "o", api.node.run.system, opts "Open in default app")
    vim.keymap.set("n", "h", api.tree.close, opts "Close")
    vim.keymap.set("n", "C", api.tree.collapse_all, opts "Collapse All")
end

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
            on_attach = my_on_attach,
        }
    end,
}
