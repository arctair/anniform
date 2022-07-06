local stoneChestEntity = table.deepcopy(data.raw["container"]["wooden-chest"])
stoneChestEntity.name = "stone-chest"
stoneChestEntity.inventory_size = 1

local stoneChestItem = table.deepcopy(data.raw["item"]["wooden-chest"])
stoneChestItem.name = "stone-chest"
stoneChestItem.place_result = "stone-chest"

local stoneChestRecipe = table.deepcopy(data.raw["recipe"]["wooden-chest"])
stoneChestRecipe.enabled = true
stoneChestRecipe.name = "stone-chest"
stoneChestRecipe.ingredients = {{"stone", 10}}
stoneChestRecipe.result = "stone-chest"

data:extend{stoneChestEntity, stoneChestItem, stoneChestRecipe}
