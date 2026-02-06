require("codecompanion").setup({
  interactions = {
    chat = {
      adapter = "ollama",
      model = "qwen3-coder:30b"
    },
    inline = {
      adapter = "ollama",
      model = "qwen3-coder:30b"
    },
    cmd = {
      adapter = "ollama",
      model = "qwen3-coder:30b"
    },
    background = {
      adapter = "ollama",
      model = "qwen3-coder:30b"
    },
  },
  opts = {
    log_level = "DEBUG",
  },
})
