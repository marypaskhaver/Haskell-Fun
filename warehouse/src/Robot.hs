{-# LANGUAGE OverloadedRecordDot #-}

module Robot (
    Robot, 
    repairBot, 
    paintBot
    ) 
    where

import ItemForShipment

-- A robot is a function that intakes an item as input and outputs an item
type Robot = ItemForShipment -> ItemForShipment

-- A robot that can replace a damaged item with an undamaged one
repairBot :: Robot 
repairBot = \item ->
  if item.isDamaged
    then
      item
        { isDamaged = False,
          description = item.description ++ " that has been repaired"
        }
    else item

-- A robot that can paint an item red
paintBot :: Robot 
paintBot = \item ->
    item
        { color = RED,
          description = item.description ++ " that has been painted red"
        }
