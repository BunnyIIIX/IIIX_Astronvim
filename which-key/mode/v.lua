return {
    ["<leader>"] = {
        ["/"] = "Comment",

        h = {
            name = "Hop",
            c = { "<cmd>HopChar1<cr>", "Character" },
            C = { "<cmd>HopChar2<cr>", "2 Characters" },
            l = { "<cmd>HopLine<cr>", "Line" },
            p = { "<cmd>HopPattern<cr>", "Pattern" },
            w = { "<cmd>HopWord<cr>", "Word" },
        },
    }
}
