
-- EXERCICIO 3: O Caderno de Esbocos

data Esboco = Esboco
  { titulo :: String
  , tecnica :: String
  , horas :: Int
  }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente [] = "O caderno esta vazio."
esbocoMaisRecente (e:_) =
  "Titulo: " ++ titulo e ++ " | Tecnica: " ++ tecnica e

contarEsbocos :: [Esboco] -> Int
contarEsbocos [] = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando [] = 0
horasDesenhando (e:resto) =
  horas e + horasDesenhando resto

main :: IO ()
main = do
  let caderno =
        [ Esboco "Dragao" "Nanquim" 3
        , Esboco "Castelo" "Grafite" 2
        , Esboco "Floresta" "Carvao" 4
        ]

  putStrLn "--- Caderno original ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Quantidade de esbocos: " ++ show (contarEsbocos caderno))
  putStrLn ("Horas desenhando: " ++ show (horasDesenhando caderno))

  putStrLn "--- Caderno vazio ---"
  putStrLn (esbocoMaisRecente [])

  let novoCaderno = Esboco "Fantasma" "Aquarela" 5 : caderno

  putStrLn "--- Novo caderno ---"
  putStrLn (esbocoMaisRecente novoCaderno)
  putStrLn ("Quantidade de esbocos: " ++ show (contarEsbocos novoCaderno))

  putStrLn "--- Caderno original novamente ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Quantidade de esbocos: " ++ show (contarEsbocos caderno))

  -- print (titulo (head []))
