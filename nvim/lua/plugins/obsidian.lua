return {
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        event = {
            -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
            "BufReadPre " .. vim.fn.expand "~" .. "/documents/obsidian-vault/**.md",
            "BufNewFile " .. vim.fn.expand "~" .. "/documents/obsidian-vault/**.md",
        },
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = "~/documents/obsidian-vault",

                },
            },
            notes_subdir = "notes",
            daily_notes = {
                folder = "calendar/daily",
            },
            completion = {
                nvim_cmp = true,
                new_notes_location = "current_dir",
                use_path_only = true,
            },
            open_notes_in = "vsplit",
            follow_url_func = function(url)
                vim.fn.jobstart({"xdg-open", url})
            end,
            ui = {
                enable = true,
                checkboxes = {
                    [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    ["x"] = { char = "", hl_group = "ObsidianDone" },
                    [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                    ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                },
                external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                reference_text = { hl_group = "ObsidianRefText" },
                highlight_text = { hl_group = "ObsidianHighlightText" },
                tags = { hl_group = "ObsidianTag" },
                hl_groups = {
                    ObsidianTodo = { bold = true, fg = "#f78c6c" },
                    ObsidianDone = { bold = true, fg = "#89ddff" },
                    ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                    ObsidianTilde = { bold = true, fg = "#ff5370" },
                    ObsidianRefText = { underline = true, fg = "#c792ea" },
                    ObsidianExtLinkIcon = { fg = "#c792ea" },
                    ObsidianTag = { italic = true, fg = "#89ddff" },
                    ObsidianHighlightText = { bg = "#75662e" },
                },
            },
        }
    }
}
