local mod = ...

-- Aethercourt monument-wide building parts
mod:dofile("scripts/building_parts.lua")

-- Register the monument building
mod:registerAsset({
    DataType = "BUILDING",
    Id = "LOD_MONUMENT",
    Name = "LOD_MONUMENT_NAME",
    Description = "LOD_MONUMENT_DESC",
    BuildingType = BUILDING_TYPE.ADMINISTRATION,
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        -- Single LOD_X without suffix names
        "EXPERIMENT_10_PART",
        "EXPERIMENT_11_PART",
        "EXPERIMENT_12_PART",
        "EXPERIMENT_13_PART",
        "EXPERIMENT_14_PART",
        "EXPERIMENT_15_PART",
        "EXPERIMENT_16_PART",
        "EXPERIMENT_17_PART",
        "EXPERIMENT_18_PART",

        -- MULTIPLE LOD_X WITHOUT SUFFIX NAMES
        "EXPERIMENT_20_PART",
        "EXPERIMENT_21_PART",
        "EXPERIMENT_22_PART",
        "EXPERIMENT_23_PART",
        "EXPERIMENT_24_PART",
        "EXPERIMENT_25_PART",
        "EXPERIMENT_26_PART",
        "EXPERIMENT_27_PART",
        "EXPERIMENT_28_PART",

        -- SINGLE LOD_X WITH SUFFIX NAMES
        "EXPERIMENT_30_PART",
        "EXPERIMENT_31_PART",
        "EXPERIMENT_32_PART",
        "EXPERIMENT_33_PART",
        "EXPERIMENT_34_PART",
        "EXPERIMENT_35_PART",
        "EXPERIMENT_36_PART",
        "EXPERIMENT_37_PART",
        "EXPERIMENT_38_PART",

        -- MULTIPLE  LOD_X WITH SUFFIX NAMES
        "EXPERIMENT_40_PART",
        "EXPERIMENT_41_PART",
        "EXPERIMENT_42_PART",
        "EXPERIMENT_43_PART",
        "EXPERIMENT_44_PART",
        "EXPERIMENT_45_PART",
        "EXPERIMENT_46_PART",
        "EXPERIMENT_47_PART",
        "EXPERIMENT_48_PART",

        -- Extra LOD tests
        "EXPERIMENT_50_PART",
        "EXPERIMENT_51_PART",
        "EXPERIMENT_52_PART",
        "EXPERIMENT_53_PART",
        "EXPERIMENT_54_PART",
        "EXPERIMENT_55_PART",
        "EXPERIMENT_56_PART",
        "EXPERIMENT_57_PART"
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
                    "LOD_MONUMENT"
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
