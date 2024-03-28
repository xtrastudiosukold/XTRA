Citizen.CreateThread(
    function()
        RequestIpl("gabz_pillbox_milo_")
        local a = GetInteriorAtCoords(311.2546, -592.4204, 42.32737)
        if IsValidInterior(a) then
            RemoveIpl("rc12b_fixed")
            RemoveIpl("rc12b_destroyed")
            RemoveIpl("rc12b_default")
            RemoveIpl("rc12b_hospitalinterior_lod")
            RemoveIpl("rc12b_hospitalinterior")
            RefreshInterior(a)
        end
    end
)
