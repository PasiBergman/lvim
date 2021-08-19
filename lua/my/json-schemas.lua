-- https://www.schemastore.org/json/
local M = {}

M.setup = function()
  local schemas = {
    {
      description = "Package JSON file",
      fileMatch = { "package.json" },
      url = "https://json.schemastore.org/package.json",
    },
    {
      description = "TypeScript compiler configuration file",
      fileMatch = { "tsconfig.json", "tsconfig.*.json" },
      url = "http://json.schemastore.org/tsconfig.json",
    },
    {
      description = "Babel configuration",
      fileMatch = { ".babelrc.json", ".babelrc", "babel.config.json" },
      url = "https://json.schemastore.org/babelrc.json",
    },
    {
      description = "ESLint config",
      fileMatch = { ".eslintrc.json", ".eslintrc" },
      url = "http://json.schemastore.org/eslintrc.json",
    },
    {
      description = "Prettier config",
      fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
      url = "http://json.schemastore.org/prettierrc.json",
    },
    {
      description = "Stylelint config",
      fileMatch = { ".stylelintrc", ".stylelintrc.json", "stylelint.config.json" },
      url = "http://json.schemastore.org/stylelintrc.json",
    },
    {
      description = ".NET appsettings",
      fileMatch = {
        "appsettings.json",
        "appsettings.dev.json",
        "appsettings.dev1.json",
        "appsettings.development.json",
        "appsettings.hyte.json",
        "appsettings.staging.json",
        "appsettings.production.json",
        "appsettings.prod.json",
        "appsettings.local.json",
      },
      url = "https://json.schemastore.org/appsettings.json",
    },
    {
      description = "Azure pipelines v1.174.2",
      fileMatch = { "azure-pipelines.yml" },
      url = "https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/main/service-schema.json",
    },
    {
      description = "Bootstrap-loader config",
      fileMatch = { ".bootstraprc" },
      url = "https://json.schemastore.org/bootstraprc.json",
    },
    {
      description = "Azure Functions function.json file",
      fileMatch = { "functions.json" },
      url = "https://json.schemastore.org/function.json",
    },
    {
      description = "OmniSharp formatting config",
      fileMatch = { "omnisharp.json" },
      url = "https://json.schemastore.org/omnisharp.json",
    },
    {
      description = "OpenAPI schema v3.1",
      fileMatch = { "openapi.json" },
      url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json",
    },
    {
      description = "Swagger 2.0 API schema",
      fileMatch = { "swagger.json", "swagger.yml" },
      url = "https://json.schemastore.org/swagger-2.0.json",
    },
    {
      description = "xUnit runner cofngiguration v2.3",
      filematch = { "xunit.json" },
      url = "https://json.schemastore.org/xunit.runner.schema.json",
    },
    {
      description = "Docker Compose configuration",
      filematch = { "compose.yml" },
      url = "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json",
    },
    {
      description = "Markdownlint config file",
      filematch = { "markdownlint.yml" },
      url = "https://json.schemastore.org/markdownlint.json",
    },
  }

  local function extend(tab1, tab2)
    for _, value in ipairs(tab2) do
      table.insert(tab1, value)
    end
    return tab1
  end

  local extended_schemas = extend(schemas, require("nlspsettings.jsonls").get_default_schemas())

  lvim.lang.json.lsp.setup.settings = {
    json = {
      schemas = extended_schemas,
    },
  }
end

return M
