filterDupes :: [String] -> [String]
filterDupes (a:b:xs)
          | a /= b = a : filterDupes (b:xs)
          | otherwise = filterDupes (a:xs)
filterDupes (a:[]) = [a]
filterDupes ([]) = []