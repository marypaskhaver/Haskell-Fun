module Package (Package (..), pack) where

import ItemForShipment

data Package contents = EmptyPackage | PackedPackage contents

instance Functor Package where
    -- `fmap` is "the one correct way" to open a package, change its contents, and close it
    fmap _someFunction EmptyPackage = EmptyPackage
    fmap someFunction (PackedPackage contents) = PackedPackage $ someFunction contents

pack :: ItemForShipment -> Package ItemForShipment
pack item = PackedPackage item
