data Cafe = Cafe String Double Int

descrever :: Cafe -> String
descrever (Cafe nome preco _) =
  nome ++ " - R$ " ++ show preco

forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise = "Suave"

precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido pediuLeite (Cafe _ preco _) =
  if pediuLeite
    then preco + 2.0
    else preco

main :: IO ()
main = do
  let cafe1 = Cafe "Cafe Expresso" 8.0 9
  let cafe2 = Cafe "Cafe Latte" 10.0 6
  let cafe3 = Cafe "Cafe Suave" 7.0 3

  putStrLn "--- Cafes do dia ---"

  putStrLn (descrever cafe1)
  putStrLn (forca cafe1)

  putStrLn (descrever cafe2)
  putStrLn (forca cafe2)

  putStrLn (descrever cafe3)
  putStrLn (forca cafe3)

  putStrLn "--- Preco com e sem leite ---"
  print (precoDoPedido True cafe1)
  print (precoDoPedido False cafe1)
