require("kiri")
require("telescope").setup{
  defaults = {
    file_ignore_patterns ={
      "node_modules",
      "venv",
      ".git",
      ".vscode"
    }
  }
}
