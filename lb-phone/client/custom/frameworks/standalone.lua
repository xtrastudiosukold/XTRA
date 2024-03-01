CreateThread(function()
    if Config.Framework ~= "standalone" then
        return
    end

    while not NetworkIsSessionStarted() do
        Wait(500)
    end

    loaded = true

    function HasPhoneItem(number)
        if not Config.Item.Require then
            return true
        end
        return exports["xtra"]:lbHasPhoneItem(number)
    end

    function HasJob(jobs)
        return exports["xtra"]:lbHasJob(jobs)
    end

    function CreateFrameworkVehicle(vehicleData, coords)
        return exports["xtra"]:lbCreateFrameworkVehicle(vehicleData, coords)
    end

     -- Company app
    function GetCompanyData(cb)
        exports["xtra"]:lbGetCompanyData(cb)
    end

    function DepositMoney(amount, cb)
        cb(false)
    end

    function WithdrawMoney(amount, cb)
        cb(false)
    end

    function HireEmployee(source, cb)
        exports["xtra"]:lbHireEmployee(source, cb)
    end

    function FireEmployee(identifier, cb)
        exports["xtra"]:lbFireEmployee(identifier, cb)
    end

    function SetGrade(identifier, newGrade, cb)
        exports["xtra"]:lbSetGrade(identifier, newGrade, cb)
    end

    function ToggleDuty()
        return exports["xtra"]:lbToggleDuty()
    end
end)