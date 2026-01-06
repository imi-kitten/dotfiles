-- deps:
require('render-markdown').setup ({
  file_types = { "markdown", "Avante" },
})
require('avante').setup ({
  -- add any opts here
  -- for example
  provider = "ollama",
  ollama = {
    model = "qwen2.5-coder:14b"
  },
})
