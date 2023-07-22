local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

require("base46").load_highlight "lsp"
require "nvchad_ui.lsp"

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

lspconfig.lua_ls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
lspconfig.clangd.setup { 
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}
lspconfig.pylsp.setup { }
lspconfig.jedi_language_server.setup { }
lspconfig.marksman.setup { }
lspconfig.lemminx.setup { }
lspconfig.jsonls.setup { }
lspconfig.groovyls.setup { }
lspconfig.gradle_ls.setup { }
lspconfig.jdtls.setup { 
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  cmd = { 
    "jdtls", 
    "-configuration",  "/home/mxlei/.cache/jdtls/config", 
    "-data", "/home/mxlei/.cache/jdtls/workspace" 
  },
  filetypes = { "java" },
  init_options = {
    jvm_args = {},
    workspace = '/home/mxlei/.cache/jdtls/workspace'
  },
  single_file_support = true
}
lspconfig.kotlin_language_server.setup { 
  on_attach = M.on_attach,
  capabilities = M.capabilities
}
-- lspconfig.vim_language_server.setup { }
-- lspconfig.sql_language_server.setup { }
-- lspconfig.docker_langserver.setup { }
-- lspconfig.docker_compose_langserver.setup { }
-- lspconfig.cmake_language_server.setup { }
-- lspconfig.vscode_json_language_server.setup { }
lspconfig.bashls.setup { }
lspconfig.cmake.setup { 
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}
lspconfig.html.setup { }
lspconfig.cssls.setup { }
lspconfig.yamlls.setup { }
lspconfig.tsserver.setup { }
lspconfig.dartls.setup { }
lspconfig.dockerls.setup { }
lspconfig.docker_compose_language_service.setup { }
lspconfig.bashls.setup { }
lspconfig.rust_analyzer.setup { }
return M
