primes = sieve [2..]
    where sieve (x:xs) = x : filter (not . (== 0) . (`mod` x)) (sieve xs)
