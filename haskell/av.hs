-- Greg's first attempt - it works - but it is very inefficient!

average :: (Fractional a) => [a] -> a
average xs = (foldl (\tot x -> tot + x) 0 xs) / (foldl (\cnt x -> cnt +1) 0 xs)

singleMovingAverage :: (Fractional a)=> Int -> [a]-> a
singleMovingAverage count xs  
    | (length xs) < count = 0.0
    | otherwise = average $take count xs

movingAverage :: (Fractional a)=> Int->[a]->[a]
movingAverage count [] = []
movingAverage count (x:xs) 
        | length (x:xs) >= count = singleMovingAverage count (x:xs) : movingAverage count xs
        | otherwise =[]

    
-- This is a much better approach - found on the net - but I did need to understand it and fix a bug!

fmovingAverage :: (RealFloat a)=>Int -> [a] -> [a]
fmovingAverage n l = runSums (sum . take n $l) l (drop n l)
     where n'     = fromIntegral n
           runSums sum (h:hs) (t:ts) = sum / n' : runSums (sum-h+t) hs ts
           runSums _  [] _ = []
           runSums sum  _  _ = [sum / n']


