module Pod (
    Pod (..), 
    fillWithItem,
    ) where

import ItemForShipment

-- `a` can be anything. A pod, having an empty space inside it, can theoretically store anything.
-- We rely on the program in Main to not put stuff inside Pods that shouldn't go in them.
data Pod a = EmptyPod | PackedPod a

instance Functor Pod where
    -- `fmap` is "the one correct way" to open a pod, change its contents, and close it
    fmap _someFunction EmptyPod = EmptyPod
    fmap someFunction (PackedPod contents) = PackedPod $ someFunction contents

instance Applicative Pod where
    -- In my analogy, pure was an applicative's power to "wrap itself around things"
    pure contents = PackedPod contents
    -- A pod with a function can apply that function to an item within another pod
    (PackedPod someFunction) <*> (PackedPod contents) = PackedPod $ someFunction contents
    (PackedPod _someFunction) <*> EmptyPod = EmptyPod
    EmptyPod <*> (PackedPod _contents) = EmptyPod
    EmptyPod <*> EmptyPod = EmptyPod

fillWithItem :: ItemForShipment -> Pod ItemForShipment
fillWithItem itemForShipment = PackedPod itemForShipment
