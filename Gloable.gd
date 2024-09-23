extends Node

#size of the bag
var bagSize = 1
#flowers in bag
var bagUsed = 0

#number of flowers in the garden
var numFlowers = 0

#number of flowers in the inventory
var yellowInInventory = 0
var blueInInventory = 0
var redInInventory = 0

#number of flowers in the shop, used for the shopper animation
var flowersInShop = 0

#blue = $7, red = $6, yellow = $3
var bluePrice = 7
var redPrice = 6
var yellowPrice = 3
var totalSold = 0
var wallet = 0
var defaultBluePrice = 7
var defaultRedPrice = 6
var defaultYellowPrice = 3
var fertalizerBluePrice = 11
var fertalizerRedPrice = 9
var fertalizerYellowPrice = 5



#power ups varbles
var hasFertalizer = false
var hasTractor = false
var hasWateringCan = false
var hasPitchFork = false
var hasSeeds = false
#turns on the progress bar
var doPowerupProgressBar = false

#time the the pup is active for
var pupTime = 10

#other varables
var speed = 500.0
var defaultSpeed = 500.0
var tractorSpeed = 300.0
var spawnRate = 4
var defaultSpawnRate = 2.5
var wateringCanSpawnRate = 0.5
var maxNumFlowers = 5
var defaultMaxNumFlowers = 10
var pitchForkMaxNumFlowers = 4

#for seeds powerup
var yellowFlower = preload("res://yellow flower.tscn")
var redFlower = preload("res://red flower.tscn")
var blueFlower = preload("res://flower.tscn")

var flowersNormal = [blueFlower, redFlower, redFlower, yellowFlower, yellowFlower, yellowFlower, yellowFlower, yellowFlower, yellowFlower, yellowFlower]
var flowersSeeds = [blueFlower, redFlower, redFlower, redFlower, yellowFlower, yellowFlower, yellowFlower, yellowFlower, yellowFlower]
var flowersUsed = flowersNormal
var flowersUsedStr = "flowersNormal"

#tells the shopper animation to go
var goShopping = false

#prices for the shop
var shopBagPrice = 100
var shopClockPrice = 100
var shopTractorPrice = 100
var shopFertalizerPrice = 100
var shopSeedsPrice = 100
var shopPitchForkPrice = 100
var shopWateringCanPrice = 100
var shopGMOSeedsPrice = 100
var shopToolsPrice = 100
var shopCompostPrice = 100
var diceTractorPrice = 200
var diceFertalizerPrice = 200
var diceSeedsPrice = 200
var dicePitchForkPrice = 200
var diceWateringCanPrice = 200

#animation for shop
var lastAniShop = ""

#nest power up for dice
var dice = []

#the power up the is going to be shown next
var powerUp = ""

#tells wether there is a powerup on screen
var onScreenPup = false

#is for the power up tells wether the player is in the pick up box
var powerUpRange = false

var movementMode = 1

