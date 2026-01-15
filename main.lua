print("DuollisonFixMod loaded!\n")

local function LogLine(msg)
    print("[DuollisonFixMod] ".. msg .. "\n")
end

---@param self RemoteUnrealParam<UBP_UniqueMechanic_Foretell_Component_C>
---@param consumedStacks RemoteUnrealParam<int32>
function ConsumeForetell(self, _, _, _, _, consumedStacks)
    ---@class UBP_UniqueMechanic_Foretell_Component_C
    local foretellComponent = self:get()
    if foretellComponent.CanConsumeForetell then
        LogLine("CanConsumeForetell is true, ignoring..")
        return
    end
    LogLine("CanConsumeForetell is false, patching!")

    ---@class UBP_Buff_EndSliceForetellConsumedCount_C
    local endSliceCount = FindFirstOf("BP_Buff_EndSliceForetellConsumedCount_C")
    if not endSliceCount:IsValid() then
        LogLine("endSliceCount not valid")
        return
    end

    endSliceCount.ForetellConsumedAmount = endSliceCount.ForetellConsumedAmount + consumedStacks:get()

end

-- =========================
-- INIT
-- =========================

local fn_onBattleDependenciesLoaded = "/Game/jRPGTemplate/Blueprints/Components/AC_jRPG_BattleManager.AC_jRPG_BattleManager_C:OnBattleDependenciesFullyLoaded"
local c_foretellComponent = "/Game/Gameplay/Battle/UniqueMechanics/Foretell/BP_UniqueMechanic_Foretell_Component.BP_UniqueMechanic_Foretell_Component_C"
local fn_consumeForetell = c_foretellComponent .. ":ConsumeForetell"

local hooked = false
local preId, postId = -1, -1
preId, postId = RegisterHook("/Script/Engine.PlayerController:ClientRestart", function()
    RegisterHook(fn_onBattleDependenciesLoaded, function()
        LogLine("Battle dependencies loaded!")
        if not hooked then
            local foretellComponent = StaticFindObject(c_foretellComponent)
            if foretellComponent:IsValid() then
                LogLine("foretellComponent found! Registering hook..")
                RegisterHook(fn_consumeForetell, ConsumeForetell)
                hooked = true
            end
        end
    end)
    UnregisterHook("/Script/Engine.PlayerController:ClientRestart", preId, postId)
end)