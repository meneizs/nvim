require'lspconfig'.pyright.setup{
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",  -- Ajuste para "strict" se desejar uma análise mais rigorosa
                diagnosticMode = "workspace",  -- Use "openFilesOnly" para analisar apenas arquivos abertos
                autoSearchPaths = true,  -- Habilita a busca automática de pacotes
                useLibraryCodeForTypes = true,  -- Habilita a análise de bibliotecas
            },
        },
    },
}

