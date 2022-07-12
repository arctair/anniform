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

local annihilationChestEntity = table.deepcopy(stoneChestEntity)
annihilationChestEntity.name = "annihilation-chest"
annihilationChestEntity.minable.result = "annihilation-chest"
annihilationChestEntity.icon = "__anniform__/graphics/icons/annihilation-chest.png"
annihilationChestEntity.picture.layers[1].filename = "__anniform__/graphics/entity/annihilation-chest.png"
annihilationChestEntity.picture.layers[1].hr_version.filename = "__anniform__/graphics/entity/hr-annihilation-chest.png"
annihilationChestEntity.picture.layers[2].filename = "__anniform__/graphics/entity/transport-chest-shadow.png"
annihilationChestEntity.picture.layers[2].hr_version.filename = "__anniform__/graphics/entity/hr-transport-chest-shadow.png"

local annihilationChestItem = table.deepcopy(stoneChestItem)
annihilationChestItem.name = "annihilation-chest"
annihilationChestItem.place_result = "annihilation-chest"
annihilationChestItem.icon = "__anniform__/graphics/icons/annihilation-chest.png"
annihilationChestItem.icon_mipmaps = 1

local annihilationChestRecipe = table.deepcopy(stoneChestRecipe)
annihilationChestRecipe.enabled = true
annihilationChestRecipe.name = "annihilation-chest"
annihilationChestRecipe.result = "annihilation-chest"

data:extend { annihilationChestEntity, annihilationChestItem, annihilationChestRecipe }

local formationChestEntity = table.deepcopy(stoneChestEntity)
formationChestEntity.name = "formation-chest"
formationChestEntity.minable.result = "formation-chest"
formationChestEntity.icon = "__anniform__/graphics/icons/formation-chest.png"
formationChestEntity.icon_mipmaps = 1
formationChestEntity.picture.layers[1].filename = "__anniform__/graphics/entity/formation-chest.png"
formationChestEntity.picture.layers[1].hr_version.filename = "__anniform__/graphics/entity/hr-formation-chest.png"
formationChestEntity.picture.layers[2].filename = "__anniform__/graphics/entity/transport-chest-shadow.png"
formationChestEntity.picture.layers[2].hr_version.filename = "__anniform__/graphics/entity/hr-transport-chest-shadow.png"

local formationChestItem = table.deepcopy(stoneChestItem)
formationChestItem.name = "formation-chest"
formationChestItem.place_result = "formation-chest"
formationChestItem.icon = "__anniform__/graphics/icons/formation-chest.png"

local formationChestRecipe = table.deepcopy(stoneChestRecipe)
formationChestRecipe.enabled = true
formationChestRecipe.name = "formation-chest"
formationChestRecipe.result = "formation-chest"

data:extend { formationChestEntity, formationChestItem, formationChestRecipe }

local transportGasFluid = {
    base_color = {
        b = 0.22,
        g = 0.81,
        r = 0.92,
    },
    default_temperature = 25,
    flow_color = {
        b = 0.22,
        g = 0.81,
        r = 0.92,
    },
    heat_capacity = "0.1KJ",
    icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
    icon_mipmaps = 4,
    icon_size = 64,
    name = "transport-gas",
    order = "a[fluid]-f[transport-gas]",
    type = "fluid"
}

local transportGasRecipe = {
    category = "chemistry",
    energy_required = 13.33,
    ingredients = {
        {
            amount = 1,
            name = "transport-belt",
            type = "item"
        },
        {
            amount = 50,
            name = "sulfuric-acid",
            type = "fluid"
        }
    },
    name = "transport-gas",
    results = { { amount = 200, name = "transport-gas", type = "fluid" } },
    subgroup = "fluid-recipes",
    type = "recipe"
}

data:extend { transportGasFluid, transportGasRecipe }

local transportEngineEntity = table.deepcopy(data.raw["storage-tank"]["storage-tank"])
transportEngineEntity.name = "transport-engine"
transportEngineEntity.minable.result = "transport-engine"

local transportEngineItem = table.deepcopy(data.raw["item"]["storage-tank"])
transportEngineItem.name = "transport-engine"
transportEngineItem.place_result = "transport-engine"

local transportEngineRecipe = table.deepcopy(data.raw["recipe"]["storage-tank"])
transportEngineRecipe.enabled = true
transportEngineRecipe.name = "transport-engine"
transportEngineRecipe.result = "transport-engine"

data:extend { transportEngineEntity, transportEngineItem, transportEngineRecipe }
