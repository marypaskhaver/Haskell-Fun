{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE ScopedTypeVariables #-}


module Main (main) where

import ItemForShipment
import Package
import Pod
import Robot

examineItem :: ItemForShipment -> String
examineItem item = do
    "Examining item. It's a "
      ++ show item.color ++ " " ++ item.description
      ++ ". It's " ++ if item.isDamaged then "damaged." else "undamaged."

examinePackage :: Package ItemForShipment -> String 
examinePackage (PackedPackage item) = "Examining a package. Inside: " ++ examineItem item 
examinePackage EmptyPackage = "This package is empty."

examinePodWithItem :: Pod ItemForShipment -> String
examinePodWithItem (PackedPod item) = "Examining a pod. Inside: " ++ examineItem item 
examinePodWithItem EmptyPod = "This pod does not contain an item."

examinePodWithRobot :: Pod Robot -> String 
examinePodWithRobot (PackedPod _robot) = "Examining a pod. Inside: It's a robot." 
examinePodWithRobot EmptyPod = "This pod does not contain a robot."

main :: IO ()
main = do
  putStrLn "Hi. I'm Jeff. Let me take you on a tour of the warehouse.\n"

  -- Applying a function (robot) to a value (item) outside of a functor, applicative, or monad
  putStrLn $ examineItem toothbrush
  putStrLn $ "I direct RepairBot to the " ++ toothbrush.description ++ "."
  let whatRepairBotReturned = repairBot toothbrush
  putStrLn $ "Again: " ++ examineItem whatRepairBotReturned ++ "\n"
  
  -- Applying a function (robot) to a value (item) inside a functor (package)
  let packageWithBook :: Package ItemForShipment = pack book
  putStrLn $ examinePackage packageWithBook
  putStrLn $ "I direct RepairBot to the package with the " ++ book.description ++ "."
  let whatRepairBotReturned2 = fmap repairBot packageWithBook 
  -- This is the same book as before because its description hasn't changed
  putStrLn $ "Again: " ++ examinePackage whatRepairBotReturned2 ++ "\n"

  -- Applying a function (robot) inside an applicative (pod) to a value (item) inside the same type of applicative
  -- pure = This pod "wrapped itself around" the given contents
  let podWithToothbrush :: Pod ItemForShipment = pure toothbrush
  putStrLn $ examinePodWithItem podWithToothbrush
  let podWithPaintBot :: Pod Robot = pure paintBot
  putStrLn $ examinePodWithRobot podWithPaintBot
  putStrLn $ "I direct PaintBot to the pod with the " ++ toothbrush.description ++ "."
  let whatPaintBotReturned = podWithPaintBot <*> podWithToothbrush
  putStrLn $ examinePodWithItem whatPaintBotReturned
  
  -- Applying a function (containment robot) to a value (item) inside a monad (SuperPod) would be harder
  -- to implement here. We'd need to ensure a SuperPod could run in the IO context and IMO, that's beyond
  -- the scope of the article for which this example was written.

  putStrLn "\nThis concludes our tour of the warehouse."
