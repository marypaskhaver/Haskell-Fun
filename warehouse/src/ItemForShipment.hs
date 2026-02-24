{-# OPTIONS_GHC -fno-warn-unused-binds #-}

module ItemForShipment
  ( Color (RED),
    ItemForShipment (..),
    book,
    pencil,
    toothbrush,
  )
where

data Color = RED | ORANGE | YELLOW | GREEN | BLUE | INDIGO | VIOLET 
instance Show Color where 
  show RED = "red"
  show ORANGE = "orange"
  show YELLOW = "yellow"
  show GREEN = "green"
  show BLUE = "blue"
  show INDIGO = "indigo"
  show VIOLET = "violet"

data Dimensions = Dimensions
  { lengthInches :: Double,
    widthInches :: Double,
    heightInches :: Double
  }

data ItemForShipment = ItemForShipment
  { description :: String,
    color :: Color,
    dimensionsInIn :: Dimensions,
    weightInOz :: Double,
    isDamaged :: Bool
  }

-- Some items
toothbrush :: ItemForShipment
toothbrush =
  ItemForShipment
    { description = "fancy toothbrush",
      color = GREEN,
      dimensionsInIn =
        Dimensions
          { lengthInches = 6,
            widthInches = 0.5,
            heightInches = 0.3
          },
      weightInOz = 0.2,
      isDamaged = True
    }

book :: ItemForShipment
book =
  ItemForShipment
    { description = "paperback book",
      color = VIOLET,
      dimensionsInIn =
        Dimensions
          { lengthInches = 8,
            widthInches = 5.25,
            heightInches = 0.9
          },
      weightInOz = 10.55,
      isDamaged = False
    }

pencil :: ItemForShipment
pencil =
  ItemForShipment
    { description = "pencil",
      color = YELLOW,
      dimensionsInIn =
        Dimensions
          { lengthInches = 7.3,
            widthInches = 0.3,
            heightInches = 0.3
          },
      weightInOz = 1.49,
      isDamaged = True
    }