local stoneChestEntity = table.deepcopy(data.raw["container"]["wooden-chest"])
stoneChestEntity.name = "stone-chest"
stoneChestEntity.inventory_size = 1
stoneChestEntity.minable.result = "stone-chest"
stoneChestEntity.minable.mining_particle = "stone-particle"

local stoneChestItem = table.deepcopy(data.raw["item"]["wooden-chest"])
stoneChestItem.name = "stone-chest"
stoneChestItem.place_result = "stone-chest"

local stoneChestRecipe = table.deepcopy(data.raw["recipe"]["wooden-chest"])
stoneChestRecipe.enabled = true
stoneChestRecipe.name = "stone-chest"
stoneChestRecipe.ingredients = { { "stone", 10 } }
stoneChestRecipe.result = "stone-chest"

data:extend { stoneChestEntity, stoneChestItem, stoneChestRecipe }

local annihilationNodeEntity = table.deepcopy(data.raw["container"]["stone-chest"])
annihilationNodeEntity.name = "stone-annihilation-node"
annihilationNodeEntity.minable.result = "stone-annihilation-node"
annihilationNodeEntity.icon = "__anniform__/graphics/icons/stone-annihilation-node.png"
annihilationNodeEntity.picture.layers[1].filename = "__anniform__/graphics/entity/stone-annihilation-node.png"
annihilationNodeEntity.picture.layers[1].hr_version = nil

local annihilationNodeItem = table.deepcopy(data.raw["item"]["stone-chest"])
annihilationNodeItem.name = "stone-annihilation-node"
annihilationNodeItem.place_result = "stone-annihilation-node"
annihilationNodeItem.icon = "__anniform__/graphics/icons/stone-annihilation-node.png"

local annihilationNodeRecipe = table.deepcopy(data.raw["recipe"]["stone-chest"])
annihilationNodeRecipe.enabled = true
annihilationNodeRecipe.name = "stone-annihilation-node"
annihilationNodeRecipe.result = "stone-annihilation-node"

data:extend { annihilationNodeEntity, annihilationNodeItem, annihilationNodeRecipe }

local formationNodeEntity = table.deepcopy(data.raw["container"]["stone-chest"])
formationNodeEntity.name = "stone-formation-node"
formationNodeEntity.minable.result = "stone-formation-node"
formationNodeEntity.icon = "__anniform__/graphics/icons/stone-formation-node.png"
formationNodeEntity.picture.layers[1].filename = "__anniform__/graphics/entity/stone-formation-node.png"
formationNodeEntity.picture.layers[1].hr_version = nil

local formationNodeItem = table.deepcopy(data.raw["item"]["stone-chest"])
formationNodeItem.name = "stone-formation-node"
formationNodeItem.place_result = "stone-formation-node"
formationNodeItem.icon = "__anniform__/graphics/icons/stone-formation-node.png"

local formationNodeRecipe = table.deepcopy(data.raw["recipe"]["stone-chest"])
formationNodeRecipe.enabled = true
formationNodeRecipe.name = "stone-formation-node"
formationNodeRecipe.result = "stone-formation-node"

data:extend { formationNodeEntity, formationNodeItem, formationNodeRecipe }

local transportNodeEntity = table.deepcopy(data.raw["container"]["stone-chest"])
transportNodeEntity.name = "stone-transport-node"
transportNodeEntity.minable.result = "stone-transport-node"
transportNodeEntity.icon = "__anniform__/graphics/icons/stone-transport-node.png"
transportNodeEntity.picture.layers[1].filename = "__anniform__/graphics/entity/stone-transport-node.png"
transportNodeEntity.picture.layers[1].hr_version = nil

local transportNodeItem = table.deepcopy(data.raw["item"]["stone-chest"])
transportNodeItem.name = "stone-transport-node"
transportNodeItem.place_result = "stone-transport-node"
transportNodeItem.icon = "__anniform__/graphics/icons/stone-transport-node.png"

local transportNodeRecipe = table.deepcopy(data.raw["recipe"]["stone-chest"])
transportNodeRecipe.enabled = true
transportNodeRecipe.name = "stone-transport-node"
transportNodeRecipe.result = "stone-transport-node"

data:extend { transportNodeEntity, transportNodeItem, transportNodeRecipe }
