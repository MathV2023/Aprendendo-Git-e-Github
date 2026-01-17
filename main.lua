--- Jogo: Adivinhe o número
-- Modulos importantes
local math = require("math")


-- Variaveis Locais
local numero_aleatorio = math.random(1, 100)
local numero_chutado = 0
local numero_chaces = 7
local is_perdeu = false


print("Jogo: Adivinhe o numero\n\t Voce tem " .. numero_chaces .. " chances de acerto.")
io.write("Qual e o numero na lista de 1 a 100: ");
numero_chutado = io.read("*n")

while (numero_chutado ~= numero_aleatorio) do
   numero_chaces = numero_chaces - 1
   print("Errou")
   print("Voce tem " .. numero_chaces .. " chances de acerto.")
   io.write("Qual e o numero na lista de 1 a 100: ");
   numero_chutado = io.read("*n")

   if (numero_chaces == 0) then
      is_perdeu = true
      break
   end
end

if (is_perdeu) then
   print("Game Over: \n\tO numero era " .. numero_aleatorio)
elseif (numero_chutado == numero_aleatorio) then
   print("Vitoria: \n\tO numero era " .. numero_aleatorio)
end