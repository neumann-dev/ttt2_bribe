-- convars added with default values
CreateConVar("ttt2_bribe_primary_sound", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Sound of the primary attack")

CreateConVar("ttt2_bribe_secondary_sound", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Sound of the secondary attack")

CreateConVar("ttt2_bribe_animation_sound", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Sound of the animation")

CreateConVar("ttt2_bribe_length", "5", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Length of the snuggle struggle")

if CLIENT then
    -- Use string or string.format("%.f",<steamid64>) 
    -- addon dev emblem in scoreboard
    hook.Add("TTT2FinishedLoading", "TTT2RegisterTKTAddonDev", function()
        AddTTT2AddonDev("76561198227669188")
    end)
end