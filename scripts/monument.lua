local mod = ...

-- Aethercourt monument-wide building parts
mod:dofile("scripts/building_parts.lua")

-- Register the monument building
mod:registerAsset({
    DataType = "BUILDING",
    Id = "MONUMENT",
    Name = "MONUMENT_NAME",
    Description = "MONUMENT_DESC",
    BuildingType = BUILDING_TYPE.ADMINISTRATION,
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        -- Single LOD_X without suffix names
        "Experiment_10_PART",
        "Experiment_11_PART",
        "Experiment_12_PART",
        "Experiment_13_PART",
        "Experiment_14_PART",
        "Experiment_15_PART",
        "Experiment_16_PART",
        "Experiment_17_PART",
        "Experiment_18_PART",

        -- Multiple LOD_X without suffix names
        "Experiment_20_PART",
        "Experiment_21_PART",
        "Experiment_22_PART",
        "Experiment_23_PART",
        "Experiment_24_PART",
        "Experiment_25_PART",
        "Experiment_26_PART",
        "Experiment_27_PART",
        "Experiment_28_PART",

        -- Single LOD_X with suffix names
        "Experiment_30_PART",
        "Experiment_31_PART",
        "Experiment_32_PART",
        "Experiment_33_PART",
        "Experiment_34_PART",
        "Experiment_35_PART",
        "Experiment_36_PART",
        "Experiment_37_PART",
        "Experiment_38_PART",

        -- Multiple  LOD_X with suffix names
        "Experiment_40_PART",
        "Experiment_41_PART",
        "Experiment_42_PART",
        "Experiment_43_PART",
        "Experiment_44_PART",
        "Experiment_45_PART",
        "Experiment_46_PART",
        "Experiment_47_PART",
        "Experiment_48_PART"
    }
})

-- Create an event asset
mod:registerAsset({
    DataType = "EVENT",
    Id = "EVENT_MONUMENT_UNLOCK",
    DaysToFirst = 1,
    ConditionList = {
        {
            DataType = "GAME_CONDITION_BUILDING_BUILT",
            AssetBuilding = "BUILDING_VILLAGE_CENTRE"
        }
    },
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AssetBuildingList = {
                    "MONUMENT"
                }
            }
        }
    }
})

-- Register the event
mod:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        "EVENT_MONUMENT_UNLOCK"
    }
})
