-- Defining the path of lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- --- If lazy isn't installed, install it. ---

-- If lazy.nvim is not in lazypath
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    
    -- Print the installation message
    vim.api.nvim_echo({
        { "Installing lazy.nvim...\n", "MoreMsg" },
    }, true, {})

    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    
    local progress = 0
    
    -- Run git clone
    local job_id = vim.fn.jobstart({
        "git",
        "clone",
        "--progress",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    }, {

    on_stderr = function(_, data)
        local output = table.concat(data, "")
        
        -- Extract the percentage of progress.
        local percentage = output:match("objects:%s*(%d+)%%")
        
        --  Convert String to Number
        if percentage then
            progress = tonumber(percentage)
            print("Downloading:", progress .. "%")
        end
    end,

        on_exit = function(_, exit_code)
            print("Exit code:", exit_code)
        end,
    })

    print("Job ID:", job_id)
end

-- Add lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup("plugins")
