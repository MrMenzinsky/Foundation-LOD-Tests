local mod = ...

local filename = "placeholder_props.fbx"

mod:registerAssetProcessor("models/" .. filename, {
    DataType = "BUILDING_ASSET_PROCESSOR"
})

local templateBlocks = {
        -- Single LOD_X without suffix names
        "Experiment_10_Part",
        "Experiment_11_Part",
        "Experiment_12_Part",
        "Experiment_13_Part",
        "Experiment_14_Part",
        "Experiment_15_Part",
        "Experiment_16_Part",
        "Experiment_17_Part",
        "Experiment_18_Part",

        -- Multiple LOD_X without suffix names
        "Experiment_20_Part",
        "Experiment_21_Part",
        "Experiment_22_Part",
        "Experiment_23_Part",
        "Experiment_24_Part",
        "Experiment_25_Part",
        "Experiment_26_Part",
        "Experiment_27_Part",
        "Experiment_28_Part",

        -- Single LOD_X with suffix names
        "Experiment_30_Part",
        "Experiment_31_Part",
        "Experiment_32_Part",
        "Experiment_33_Part",
        "Experiment_34_Part",
        "Experiment_35_Part",
        "Experiment_36_Part",
        "Experiment_37_Part",
        "Experiment_38_Part",

        -- Multiple  LOD_X with suffix names
        "Experiment_40_Part",
        "Experiment_41_Part",
        "Experiment_42_Part",
        "Experiment_43_Part",
        "Experiment_44_Part",
        "Experiment_45_Part",
        "Experiment_46_Part",
        "Experiment_47_Part",
        "Experiment_48_Part"
}

for _, templateBlock in ipairs(templateBlocks) do
    local prefab = "PREFAB_" .. string.upper(templateBlock)
    mod:registerAssetId("models/" .. filename .. "/Prefab/" .. templateBlock, prefab)

    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = string.upper(templateBlock),
        Name = string.upper(templateBlock) .. "_NAME",
        Description = string.upper(templateBlock) .. "_DESC",
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = prefab
        }
    })
end

local materials = {
    "Red",
    "Orange",
    "Blue",
    "Cyan",
    "Green"
}

for _, material in ipairs(materials) do
    mod:registerAssetId("models/" .. filename .. "/Materials/" .. material, string.upper(material))
end
