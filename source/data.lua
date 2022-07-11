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

local annihilationChestEntity = table.deepcopy(data.raw["container"]["stone-chest"])
annihilationChestEntity.name = "annihilation-chest"
annihilationChestEntity.minable.result = "annihilation-chest"
annihilationChestEntity.icon = "__anniform__/graphics/icons/annihilation-chest.png"
annihilationChestEntity.picture.layers[1].filename = "__anniform__/graphics/entity/annihilation-chest.png"
annihilationChestEntity.picture.layers[1].hr_version.filename = "__anniform__/graphics/entity/hr-annihilation-chest.png"
annihilationChestEntity.picture.layers[2].filename = "__anniform__/graphics/entity/transport-chest-shadow.png"
annihilationChestEntity.picture.layers[2].hr_version.filename = "__anniform__/graphics/entity/hr-transport-chest-shadow.png"

local annihilationChestItem = table.deepcopy(data.raw["item"]["stone-chest"])
annihilationChestItem.name = "annihilation-chest"
annihilationChestItem.place_result = "annihilation-chest"
annihilationChestItem.icon = "__anniform__/graphics/icons/annihilation-chest.png"
annihilationChestItem.icon_mipmaps = 1

local annihilationChestRecipe = table.deepcopy(data.raw["recipe"]["stone-chest"])
annihilationChestRecipe.enabled = true
annihilationChestRecipe.name = "annihilation-chest"
annihilationChestRecipe.result = "annihilation-chest"

data:extend { annihilationChestEntity, annihilationChestItem, annihilationChestRecipe }

local formationChestEntity = table.deepcopy(data.raw["container"]["stone-chest"])
formationChestEntity.name = "formation-chest"
formationChestEntity.minable.result = "formation-chest"
formationChestEntity.icon = "__anniform__/graphics/icons/formation-chest.png"
formationChestEntity.icon_mipmaps = 1
formationChestEntity.picture.layers[1].filename = "__anniform__/graphics/entity/formation-chest.png"
formationChestEntity.picture.layers[1].hr_version.filename = "__anniform__/graphics/entity/hr-formation-chest.png"
formationChestEntity.picture.layers[2].filename = "__anniform__/graphics/entity/transport-chest-shadow.png"
formationChestEntity.picture.layers[2].hr_version.filename = "__anniform__/graphics/entity/hr-transport-chest-shadow.png"

local formationChestItem = table.deepcopy(data.raw["item"]["stone-chest"])
formationChestItem.name = "formation-chest"
formationChestItem.place_result = "formation-chest"
formationChestItem.icon = "__anniform__/graphics/icons/formation-chest.png"

local formationChestRecipe = table.deepcopy(data.raw["recipe"]["stone-chest"])
formationChestRecipe.enabled = true
formationChestRecipe.name = "formation-chest"
formationChestRecipe.result = "formation-chest"

data:extend { formationChestEntity, formationChestItem, formationChestRecipe }

local transportChestEntity = table.deepcopy(data.raw["container"]["stone-chest"])
transportChestEntity.name = "transport-chest"
transportChestEntity.minable.result = "transport-chest"
transportChestEntity.icon = "__anniform__/graphics/icons/transport-chest.png"
transportChestEntity.icon_mipmaps = 1
transportChestEntity.picture.layers[1].filename = "__anniform__/graphics/entity/transport-chest.png"
transportChestEntity.picture.layers[1].hr_version.filename = "__anniform__/graphics/entity/hr-transport-chest.png"
transportChestEntity.picture.layers[2].filename = "__anniform__/graphics/entity/transport-chest-shadow.png"
transportChestEntity.picture.layers[2].hr_version.filename = "__anniform__/graphics/entity/hr-transport-chest-shadow.png"

local transportChestItem = table.deepcopy(data.raw["item"]["stone-chest"])
transportChestItem.name = "transport-chest"
transportChestItem.place_result = "transport-chest"
transportChestItem.icon = "__anniform__/graphics/icons/transport-chest.png"

local transportChestRecipe = table.deepcopy(data.raw["recipe"]["stone-chest"])
transportChestRecipe.enabled = true
transportChestRecipe.name = "transport-chest"
transportChestRecipe.result = "transport-chest"

data:extend { transportChestEntity, transportChestItem, transportChestRecipe }
