return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies =  {
            'nvim-lua/plenary.nvim',
        },
        opts = {
            pickers = {
                marks = {
                    mark_type = "global"
                }
            }
        }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }
}
