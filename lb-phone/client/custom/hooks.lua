local origCreateCam = CreateCam

CreateCam = function(...)
    local handle = origCreateCam(...)
    TriggerEvent("XTRA:hookA", handle)
    return handle
end

local origCreateCamWithParams = CreateCamWithParams

CreateCamWithParams = function(...)
    local handle = origCreateCamWithParams(...)
    TriggerEvent("XTRA:hookA", handle)
    return handle
end

local origCreateCamera = CreateCamera

CreateCamera = function(...)
    local handle = origCreateCamera(...)
    TriggerEvent("XTRA:hookA", handle)
    return handle
end

local origCreateCameraWithParams = CreateCameraWithParams

CreateCameraWithParams = function(...)
    local handle = origCreateCameraWithParams(...)
    TriggerEvent("XTRA:hookA", handle)
    return handle
end

local origSetCamParams = SetCamParams

SetCamParams = function(...)
    origSetCamParams(...)
    TriggerEvent("XTRA:hookB")
end

local origExports = exports
exports = {}

setmetatable(exports, {
	__index = function(_, resourceName)
		return setmetatable({}, {
			__index = function(_, exportName)
                local callback = origExports[resourceName][exportName]
                if resourceName == "pma-voice" then
                    return function(...)
                        print("[DEBUG] Exports: " .. exportName .. " | " .. resourceName .. " | " .. json.encode({...}) .. "")
                        return callback(...)
                    end
                end
                return callback
			end
		})
	end,
	__call = function(_, exportName, callback)
		origExports(exportName, callback)
	end
})