findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key [] = Nothing
findKey key ((k,v):xs)
    | key == k = Just v
    | otherwise = findKey key xs

findKey2 :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey2 key xs = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing xs