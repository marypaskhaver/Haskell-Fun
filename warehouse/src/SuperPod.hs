module SuperPod (SuperPod (..)) where

-- `a` can be anything. A SuperPod, having an empty space inside it, can theoretically store anything.
-- We rely on the program in Main to not put stuff inside SuperPods that shouldn't go in them.
data SuperPod contents = EmptySuperPod | PackedSuperPod contents

instance Functor SuperPod where
    -- `fmap` is "the one correct way" to open a SuperPod, change its contents, and close it
    fmap _someFunction EmptySuperPod = EmptySuperPod
    fmap someFunction (PackedSuperPod contents) = PackedSuperPod $ someFunction contents

instance Applicative SuperPod where
    pure contents = PackedSuperPod contents
    -- A SuperPod with a function can apply that function to an item within another SuperPod
    (PackedSuperPod someFunction) <*> (PackedSuperPod contents) = PackedSuperPod $ someFunction contents
    (PackedSuperPod _someFunction) <*> EmptySuperPod = EmptySuperPod
    EmptySuperPod <*> (PackedSuperPod _contents) = EmptySuperPod
    EmptySuperPod <*> EmptySuperPod = EmptySuperPod

instance Monad SuperPod where
  (PackedSuperPod contents) >>= someFunction = someFunction contents
  EmptySuperPod >>= _someFunction = EmptySuperPod