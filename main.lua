--- Jogo: Adivinhe o número
-- Modulos importantes
local math = require("math")
local io = require("io")
local os = require("os")


-- Tratamento de versão
local minor = tonumber(_VERSION:match("%d%.(%d)"))

if (minor < 4) then
   math.randomseed(os.time())
end


-- Variaveis Locais
local numero_aleatorio = math.random(1, 100)
local numero_chutado = 0
local chances = 7


-- Função local
local function readNumber()
   local valor = tonumber(io.read()) or ""
   if (type(valor) == "number") then
      return valor
   end
end


print("Jogo: Adivinhe o número")

while (numero_chutado ~= numero_aleatorio) do
   if (chances == 0) then
      print("Game Over: \n\tO número era " .. numero_aleatorio)
      os.exit()
   else
      if (chances == 1) then
         print("\tVocê tem uma chance.")
      else
         print("\tVocê tem " .. chances .. " chances.")
      end

      io.write("Qual é o número na lista de 1 a 100: ")
      numero_chutado = readNumber()
      print(tostring(numero_chutado))
      
      while (type(numero_chutado) ~= "number") do
         io.write("Coloque um número na lista de 1 a 100: ")
         numero_chutado = readNumber()
      end

      if (numero_chutado > numero_aleatorio) then
         print("O número " .. numero_chutado .. " é 'maior' que o número que eu guardo.")
      elseif (numero_chutado < numero_aleatorio) then
         print("O número " .. numero_chutado .. " é 'menor' que o número que eu guardo.")
      end

      chances = chances - 1
   end
end

print("Acertou: \n\tO número era " .. numero_aleatorio)
