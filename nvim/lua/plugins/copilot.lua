return {
    {
        "zbirenbaum/copilot-cmp",
        events = "InsertEnter",
        opts = {},
        dependencies = {
            {
                "zbirenbaum/copilot.lua",
                opts = {
                    suggestion = { enabled = false },
                    panel = { enabled = false },
                }
            }
        }
    }
}
