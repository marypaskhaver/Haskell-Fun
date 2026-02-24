module ContainmentRobot (destroyBot, duplicateBot) where 

import ItemForShipment
import SuperPod

duplicateBot :: ItemForShipment -> SuperPod ItemForShipment
duplicateBot item = PackedSuperPod item

destroyBot :: ItemForShipment -> SuperPod ItemForShipment
destroyBot _item = EmptySuperPod