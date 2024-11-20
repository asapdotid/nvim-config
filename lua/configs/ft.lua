vim.filetype.add {
  -- Detect and assign filetype based on the extension of the filename
  extension = {
    env = "dotenv",
    conf = "conf",
    log = "log",
    zbash = "bash",
    bash = "bash",
    tpl = "bash",
    php = "php",
    jsonc = "jsonc",
  },
  -- Detect and apply filetypes based on the entire filename
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
    [".zshrc"] = "bash",
    [".zshenv"] = "bash",
    [".tpl"] = "bash",
    ["hcl"] = "terraform",
    ["tsconfig.json"] = "jsonc",
    ["jsconfig.json"] = "jsonc",
    [".eslintrc"] = "jsonc",
    [".babelrc"] = "jsonc",
    ["*.jsonc"] = "jsonc",
    ["*.cjson"] = "jsonc",
    [".jbashintrc"] = "jsonc",
    [".jslintrc"] = "jsonc",
  },
  -- Detect and apply filetypes based on certain patterns of the filenames
  pattern = {
    ["%.env%.(%a+)"] = function(path, bunfr, ext)
      -- vim.print(ext)
      if vim.tbl_contains({ "local", "example", "dev", "staging", "prod" }, ext) then
        return "dotenv"
      end
    end,
    ["configs.json%.(%a+)"] = function(path, bunfr, ext)
      -- vim.print(ext)
      if vim.tbl_contains({ "local", "example", "dev", "staging", "prod" }, ext) then
        return "json"
      end
    end,
    [".*%.blade%.php"] = "blade",
  },
}
