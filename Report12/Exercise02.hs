pesoMaximo :: Double
pesoMaximo = 10.0

data Encomenda = Encomenda
  { destinatario :: String
  , peso :: Double
  , frete :: Double
  }

descrever :: Encomenda -> String
descrever encomenda =
  "Destinatario: " ++ destinatario encomenda
  ++ " | Peso: " ++ show (peso encomenda) ++ " kg"
  ++ " | Frete: R$ " ++ show (frete encomenda)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas =
  filter (\e -> peso e <= pesoMaximo) encomendas

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas =
  sum (map frete encomendas)

main :: IO ()
main = do
  let encomendas =
        [ Encomenda "Tombo" 5.0 12.0
        , Encomenda "Osono" 8.0 15.0
        , Encomenda "Ursula" 12.0 20.0
        , Encomenda "Fio" 15.0 25.0
        ]

  let encomendasPossiveis = cabemNaVassoura encomendas

  putStrLn "--- Todas as encomendas ---"
  mapM_ putStrLn (map descrever encomendas)

  putStrLn "--- Encomendas que cabem na vassoura ---"
  mapM_ putStrLn (map descrever encomendasPossiveis)

  putStrLn "--- Total de fretes ---"
  print (totalDeFretes encomendasPossiveis)

-- pesoMaximo = 15.0
