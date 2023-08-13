if SERVER then
    AddCSLuaFile()
    resource.AddFile("materials/vgui/ttt/weapon_bribe.vmt")
end

SWEP.Base = "weapon_tttbase"
SWEP.Kind = WEAPON_EQUIP1
SWEP.InLoadoutFor = nil
SWEP.CanBuy = {ROLE_TRAITOR}
SWEP.LimitedStock = true
SWEP.Icon = "vgui/ttt/weapon_bribe"
SWEP.EquipMenuData = {
    type = "item_weapon",
    name = "ttt2_bribe_name",
    desc = "ttt2_bribe_desc"
}

SWEP.Author = "TKT"
SWEP.PrintName = "Bribe"
SWEP.Contact = "Steam"
SWEP.Instructions = "Left click to bribe someone to play for your team."
SWEP.Purpose = "Right click to throw the bribe money away."
SWEP.ViewModelFOV = 82
SWEP.ViewModelFlip = true
SWEP.NoSights = false
SWEP.AllowDrop = true 
SWEP.Spawnable = false
SWEP.AdminOnly = false
SWEP.AdminSpawnable = false
SWEP.AutoSpawnable = false

SWEP.Primary.Recoil = 100
SWEP.Primary.Damage = 0
SWEP.Primary.NumShots = -1
SWEP.Primary.Delay = 3
SWEP.Primary.Distance = 105
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.ViewModel = Model("models/weapons/v_hands.mdl")

function SWEP:Initialize()
    if CLIENT then
        self:AddHUDHelp("ttt2_bribe_help1", "ttt2_bribe_help2", true)
    end
end

function SWEP:Equip()
    if (not IsValid(self.Briber)) then
        self.Briber = self.Owner;
    end
end

function SWEP:PrimaryAttack()
    if CLIENT then
        return
    end

    if (self.Owner ~= self.Briber) then
        self.Owner:ChatPrint("Victim is not able to bribe someone!")
    end

    if GetRoundState() ~= ROUND_ACTIVE then
        self.Owner:ChatPrint("Round is not active, you can't use this weapon!")
        return
    end

    local victim = Entity( 1 ):GetEyeTrace().Entity
    
    if (not IsValid(victim)) then
        return
    end

    if (not (self.Owner:GetPos():DistToSqr(victim:GetPos()) < (self.Primary.Distance * self.Primary.Distance))) then
        return
    end

    print("Victim is in range!")
end
    
function SWEP:SecondaryAttack()
    if SERVER and self.AllowDrop then
        self.Owner:DropWeapon(self)
	end
end