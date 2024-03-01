
--
local ownedPets = {
    ["bear"] = {
        awaitingHealthReduction = false,
        name = "Bear",
        id = "bear",
        ownedSkills = {
            teleport = true,
        },
    },
}

local disabledAbilities = {
    attack = false,
}


AddEventHandler("XTRA:playerSpawn", function(user_id, source, first_spawn)
    local source = source
    local user_id = XTRA.getUserId(source)
    if first_spawn then
        TriggerClientEvent('XTRA:buildPetCFG', source, ownedPets, disabledAbilities, petStore)
    end
end)

RegisterServerEvent('XTRA:receivePetCommand')
AddEventHandler("XTRA:receivePetCommand", function(id, M, L, zz)
    local source = source
    local user_id = XTRA.getUserId(source)
    -- check if permid owns this pet
    TriggerClientEvent('XTRA:receivePetCommand', source, M, L, zz)
end)

RegisterServerEvent('XTRA:startPetAttack')
AddEventHandler("XTRA:startPetAttack", function(id, M, Y)
    local source = source
    local user_id = XTRA.getUserId(source)
    -- check if permid owns this pet and that attacks aren't disabled
    TriggerClientEvent('XTRA:sendClientRagdollPet', Y, user_id, XTRA.GetPlayerName(user_id))
    TriggerClientEvent('XTRA:startPetAttack', source, id)
end)

RegisterCommand('pet', function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id == 1 then
        TriggerClientEvent('XTRA:togglePetMenu', source)
    end
end)
