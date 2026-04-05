return {
  cmd = { 'ols' },
  filetypes = { 'odin' },
  root_markers = { 'ols.json', '*.odin' },
  settings = {
    enable_rename = true,
    enable_references = true,
    checker_args = "-strict-style",
  },
}
