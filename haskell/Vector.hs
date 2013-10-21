data Person = Person  {firstName :: String
                      , lastName :: String
                      , age :: Int
                      } deriving (Eq,Show,Read)

mikereasd = Person {firstName = "Michael", lastName = "Diamond", age = 43}
adRock= Person {firstName= "Adam", lastName= "Horovitz", age=41}
mca   = Person {firstName= "Adam", lastName= "Yauch", age=44}

mysteryDude = "Person { firstName = \"Michael\"" ++ ", lastName =\"Diamond\"" ++ ", age = 43}"


data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

singleton :: a-> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
        | x == a = (Node a left right)
        | x < a  = Node a (treeInsert x left) right
        | x > a  = Node a left (treeInsert x right)


data TrafficLight = Red | Amber | Green

instance Eq TrafficLight where
  Red   == Red   = True
  Amber == Amber = True
  Green == Green = True
  _ == _ = False

instance Show TrafficLight where
  show Red   = "Red Traffic light"
  show Amber = "Amber Traffic light"
  show Green = "Green Traffic light"

class YesNo a where
  yesno :: a -> Bool

instance YesNo Int where
  yesno 0 = False
  yesno _ = True

instance YesNo [a] where
  yesno [] = False
  yesno _  = True


instance YesNo Bool where
   yesno = id

instance YesNo (Maybe a) where
  yesno (Just _) = True
  yesno Nothing  = False

instance YesNo (Tree a) where
  yesno EmptyTree = False
  yesno _ = True

instance YesNo TrafficLight where
  yesno Red = False
  yesno _   = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult =
  if yesno yesnoVal
    then yesResult
    else noResult

