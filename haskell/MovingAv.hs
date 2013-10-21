-- Calc Moving Averages

movingAverage :: (Real a, Fractional b)=>Int -> [a] -> [b]
movingAverage n l 
     | n > length l = []
     | otherwise = runSums (sum . take n $l) l (drop n l)
     where n'     = fromIntegral n
           runSums sum _ [] = [(realToFrac sum) / n']
           runSums sum (h:hs) (t:ts) = (realToFrac sum) / n' : runSums (sum-h+t) hs ts

