local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then
  return
end







local luasnip = require "luasnip"
local lspkind = require("lspkind")

-- nvim-cmp setup
local cmp = require "cmp"
cmp.setup {	
  formatting = {
    format = lspkind.cmp_format({
      with_text = true, -- do not show text alongside icons
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      before =  function (entry, vim_item)
        -- Source 显示提示来源
        vim_item.menu = "["..string.upper(entry.source.name).."]"
        return vim_item   end})
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  --mapping = cmp.mapping.preset.insert(require('keybindings').cmp(cmp)),
  mapping=cmp.mapping.preset.insert({
    -- 上一个
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- 出现补全
    ["<C-<space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- 取消
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
	 ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    -- 如果窗口内容太多，可以滚动
	 ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    -- super Tab
        ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
        ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
    -- end of super Tab
	}),
  sources = {
    {name = "nvim_lsp"},
    {name = "luasnip"}, 
		{name = "nvim_lua"},
    {
      name = "buffer",
	  keyword_length = 5
    },
	{name = "path"},
	{name = "cmp_tabnine"},
  },
	completion = {
      completeopt = 'menu,menuone,noinsert,preview',
    },
}
cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
-- Setup lspconfig.
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
 --Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['pyright'].setup {
	--capabilities = capabilities
--}
--require('lspconfig')['jsonls'].setup {
	--capabilities = capabilities
--}
--require('lspconfig')['bashls'].setup {
	--capabilities = capabilities
--}






