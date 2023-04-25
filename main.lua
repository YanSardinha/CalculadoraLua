-- comp: lua54.exe main.lua 
-- Estruturas de funçoes
-- Função para adição de dois números
local function add(a, b)
    return a + b
end
-- Função para subtração de dois números
local function subtract(a, b)
    return a - b
end
-- Função para multiplicação de dois números
local function multiply(a, b)
    return a * b
end
-- Função para divisão de dois números
local function divide(a, b)
    -- Verifica se o divisor é zero
    if b == 0 then
        error("Divisao por zero nao e permitida.")
    end
    return a / b
end

-- Função de conversão de unidades de medida
local function convert(value, from_unit, to_unit)
    -- Tabela de conversões
    local conversion_table = {
        ["m"] = {["ft"] = 3.28084},
        ["ft"] = {["m"] = 0.3048},
        ["kg"] = {["lb"] = 2.20462},
        ["lb"] = {["kg"] = 0.453592},
        ["c"] = {["f"] = function(c) return (c * 9/5) + 32 end},
        ["f"] = {["c"] = function(f) return (f - 32) * 5/9 end}
    }
    -- Verifica se existe uma conversão válida entre as unidades de medida
    local conversion = conversion_table[from_unit][to_unit]
    if not conversion then
        -- Lança uma exceção indicando que a conversão não é suportada
        error("Conversao nao suportada: " .. from_unit .. " para " .. to_unit)
    end
    -- Verifica se a conversão é uma função
    if type(conversion) == "function" then
        return conversion(value)
    else
        return value * conversion
    end
end

-- Função principal do programa
local function main()
    while true do
        print("Escolha uma opcao:")
        print("1. Adicao")
        print("2. Subtracao")
        print("3. Multiplicacao")
        print("4. Divisao")
        print("5. Converso de unidades de medida")
        print("0. Sair")
        -- Lê a opção escolhida pelo usuário
        local choice = tonumber(io.read())
        -- Estrutura de controle condicional
        -- Verifica se a opção escolhida é 0 (sair)
        if choice == 0 then
            break
        end
        -- Verifica se a opção escolhida está entre 1 e 4 (operações matemáticas)
        if choice >= 1 and choice <= 4 then
            print("Digite o primeiro numero:")
            local a = tonumber(io.read())
            print("Digite o segundo numero:")
            local b = tonumber(io.read())

            local result
            -- Estrutura de controle condicional
            -- Verifica a opção escolhida e chama a função correspondente
            if choice == 1 then
                result = add(a, b)
            elseif choice == 2 then
                result = subtract(a, b)
            elseif choice == 3 then
                result = multiply(a, b)
            elseif choice == 4 then
                result = divide(a, b)
            end
            -- Exibe o resultado
            print("Resultado: " .. result)
        elseif choice == 5 then
            print("Digite o valor a ser convertido:")
            local value = tonumber(io.read())
            print("Digite a unidade de medida atual (m, ft, kg, lb, c, f):")
            local from_unit = io.read():lower()
            print("Digite a unidade de medida desejada (m, ft, kg, lb, c, f):")
            local to_unit = io.read():lower()

            local result = convert(value, from_unit, to_unit)
            print("Resultado: " .. result .. " " .. to_unit)
        else
            print("Opcao invalida.")
        end
    end
end

-- Inicia o programa
main()