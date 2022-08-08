local sqls_opts = {
  settings = {
    sqls = {
      connections = {},
      --[[
        {
          driver = "mysql",
          dataSourceName = "root:root@tcp(127.0.0.1:13306)/world",
        },
        {
          driver = "postgresql",
          dataSourceName = "host=127.0.0.1 port=15432 user=postgres password=mysecretpassword1234 dbname=dvdrental sslmode=disable",
        },
        --]]
    },
  },
}
--
-- Disable temporarily
--
-- require("lvim.lsp.manager").setup("sqls", sqls_opts)
