Running HTML, CSS, and JavaScript projects typically involves serving them via a local web server to see the changes in real-time. Here’s how you can do that alongside using NvChad for editing your code.

### Setting Up a Local Server

You can use a simple local server like `live-server`, which automatically reloads your web pages when files change. Here’s how to set it up:

1. **Install Node.js and npm**:
   If you haven’t already, install Node.js and npm.

   ```bash
   sudo apt update
   sudo apt install nodejs npm
   ```

2. **Install live-server**:
   Install `live-server` globally using npm.

   ```bash
   npm install -g live-server
   ```

3. **Serve Your Project**:
   Navigate to your project directory and start the server.

   ```bash
   cd /path/to/your/project
   live-server
   ```

### Integrating with NvChad

You can integrate this workflow within NvChad by setting up keybindings or commands to start the server from within Neovim.

1. **Create a Custom Keybinding**:
   You can add a custom keybinding in your `~/.config/nvim/lua/custom/init.lua` file to run `live-server`.

Example `init.lua` customization:

```lua
local M = {}

M.plugins = {
   user = {
     -- Add your plugins here
     -- Example:
     -- {'author/repo', opts = {key = value}}
   }
}

M.ui = {
   theme = 'gruvbox' -- Set your preferred theme here
}

-- Custom keybindings
vim.api.nvim_set_keymap('n', '<leader>ls', ':!live-server<CR>', { noremap = true, silent = true })

return M
```

This will map `<leader>ls` to start `live-server` in the current project directory.

2. **Open Neovim**:
   Open Neovim and load your project.

   ```bash
   nvim /path/to/your/project
   ```

3. **Start the Server**:
   In Neovim, press the `<leader>` key (usually `\` or `,` by default in NvChad) followed by `ls` to start the `live-server`.

### Viewing Your Project

Once the server is running, open your web browser and navigate to the address provided by `live-server` (usually `http://127.0.0.1:8080`).

Now, you can edit your HTML, CSS, and JavaScript files in Neovim with NvChad, and `live-server` will automatically reload the browser to reflect your changes.

### Additional Tips

- **Use Split Windows**:
  Take advantage of Neovim’s split windows to edit multiple files at once. Use `:vsp filename` to open a file in a vertical split or `:sp filename` for a horizontal split.

- **Terminal Integration**:
  NvChad allows you to open a terminal within Neovim. You can use `:term` to open an integrated terminal and run commands like `live-server` directly inside Neovim.

By setting up these configurations and tools, you can create a productive and efficient workflow for developing HTML, CSS, and JavaScript projects using NvChad.