local webhooks = {
    -- general
    ['join'] = 'https://discord.com/api/webhooks/1210376654979989504/orHVArJJjMSwSr2yavc5EFA6T4V1TMSFhDlIYyynpL2QkS9wS16Luei2wAHNrAtIzh5i',
    ['leave'] = 'https://discord.com/api/webhooks/1210376742213255188/PfBveHGlYDSvIR31QKHQaALNS1BRP3j3vaoPXveSpTbKhrJ2F4Rcc_IDfeegZRG7zeqS',
    ['steam'] = 'https://discord.com/api/webhooks/1210376840426815638/sh_X5Oj45QBS0HraQ3pjh0ZEEaXW0-o_yfOc468WYhj_lvpmeRj24XoHG0U6PdNHwtuV',
    -- Temp
    ["store-rob"] = "https://discord.com/api/webhooks/1210376971956129875/ooKMPdJkZaXwgQ97KCsMfjpbv3-kIi4fm4qj0Chr37q6p_izByFKPCdnMcewITNwEWKq",
    
    -- civ
    ['give-cash'] = 'https://discord.com/api/webhooks/1210377064973340682/snH5vzL87aLX4-1fXk1835DWIkMIgz251AST7e4pyZsH6zDFU1VchUbK-N9pefx6wiEh', 
    ['bank-transfer'] = 'https://discord.com/api/webhooks/1210377155762987058/iw5GU2h45l3iqWmZvSYP3o0jRGn_6s47CVPTgjmsMiOjDS_AGiLnl9XwO6K3KnFqdb_i', 
    ['search-player'] = 'https://discord.com/api/webhooks/1210377279629295626/LoCyloJOJl0nFOKtJ83pMtmkhx3DGY8aTgU322jYDr9q-10Hhw27EgVE3PEINe6sjbU9', 
    ['gang'] = 'https://discord.com/api/webhooks/1210377422885752832/953EkK6IUzSt-8Tu42sStKhTWZU_YD999pOBErLSM1npB0OIHB5ShVgbaqIpkzDlbdyj',
    -- chat
    ['ooc'] = 'https://discord.com/api/webhooks/1210377512048263209/_f1tigYZByk46oozD0MPb35TalTgkUAZZ2QLrsNb6n-qi0Nh4j_yKo47n7A8ZlyttZRI', 
    ['kit-redeem'] = 'https://discord.com/api/webhooks/1196944175443234897/SBaURayd4Jt6I0mLj6sNFI8YcnorcvAw3Ij0Pj8cpuiR793RIZce28Hb3fgo9aw0-pFC', 

    ['global'] = 'https://discord.com/api/webhooks/1210377606051012649/NJ4JI6ojfjeCOgiIFskUY4k3koqB6ESvD227G-PWB5eOXfO2j8S0fBlBMrliAKfFAo6I', 
    ['staff'] = 'https://discord.com/api/webhooks/1210377771000401950/5bDV0GAG2vmRJYf_2Pt9VweBPxpq8BJcsGlcU2MjIf1rzuvHQ0iBOZagUiehsCrMwhSE',
    ['gang'] = 'https://discord.com/api/webhooks/1210377771000401950/5bDV0GAG2vmRJYf_2Pt9VweBPxpq8BJcsGlcU2MjIf1rzuvHQ0iBOZagUiehsCrMwhSE',
    ['anon'] = 'https://discord.com/api/webhooks/1210377889862647879/_Sia466zHsivroWtbR_BcXme6tM2Uy04wAtBLSVDRPqLymso_0FWd0HW7swVpqLaIn39', 
    ['announce'] = 'https://discord.com/api/webhooks/1210378009362563112/LBE0Z7a42ybeDzukPlDA6wLDQd5cSUkC0GfjwW7v87ajI9hwqo9tKtRyjCv9_5-OSSCL',
    -- admin menu
    ['kick-player'] = 'https://discord.com/api/webhooks/1210378112072949770/qM_h7_TR0hWE8-knKFjNBosj-pAf72rSpu8EkYp6gaMQ1huZnoEY1KjtqG-YXZKU2Y6e', 
    ['ban-player'] = 'https://discord.com/api/webhooks/1210378213159604245/XEhDZvZX8nkNfrLmgmw8Z3vsCkyyfs23UO2S_6_-rORAsb1LE2Xm_HEFBekywGZDe9qd', 
    ['spectate'] = 'https://discord.com/api/webhooks/1210378309683118130/HrFI1w9oasJiLYB_WonxUrtjsGZ0XbBjw1KsKISOcK9yR4tU9yTo6PFHw7QTRre_Nwcn', 
    ['revive'] = 'https://discord.com/api/webhooks/1210378405896396840/X0b3jWGwQvX0tfYBlLdy-auIzIkykKbcDK-C5m2kxOBy6CS3aEfwlg25Z9VbmpFPJ0QW', -- done till here
    ['tp-player-to-me'] = 'https://discord.com/api/webhooks/1222701686972481640/vf_35x9wJ--M87VJcuvyI4hMiYNHN5hdC3ZHaJeazZkIgjO1jz_7W-gkUG2CloltvhEK', --
    ['tp-to-player'] = 'https://discord.com/api/webhooks/1222701904463790161/dG1FWcaBddpcoSw5s0TmvnG0IIzR7L2UFaqGpxKLIFR0p3O8keNgRwX8yv9qizavulda', --
    ['tp-to-admin-zone'] = 'https://discord.com/api/webhooks/1222701992594641078/FogfL9ftim041s2ZY5u-0WH1m7FHFiaEUxxecp5Ns6dGrUfim0OgR9i8Ca9rL2vJsy2I', --
    ['tp-back-from-admin-zone'] = 'https://discord.com/api/webhooks/1222701992594641078/FogfL9ftim041s2ZY5u-0WH1m7FHFiaEUxxecp5Ns6dGrUfim0OgR9i8Ca9rL2vJsy2I', 
    ['tp-to-legion'] = 'https://discord.com/api/webhooks/1222702465883967498/jEz3Aq-47ZIbp-CWmtrgBc0ab-WQS1Ikb2MsisE3yz34M_Cc6UzU2UXFzkj9WJYQcdzh', 
    ['freeze'] = 'https://discord.com/api/webhooks/1222703154315923518/o5Lkd8tHjcoAVIkGNpHT70-kLIZvlszH-pQ_YvUfOkUx5_hOeSa4o5Wyd_CqGx6Rdm6K', 
    ['slap'] = 'https://discord.com/api/webhooks/1222703217935257641/PC7oUzHO0CefUo_ez9xaDmln_LCtGtQT2ri105Paa_aVjGyOMJBudQVZy25Mx51H7Xj3', 
    ['force-clock-off'] = 'https://discord.com/api/webhooks/1222703297027117206/OHLQ6swwzlVL7lukgGswQRX_JLTGRmwKyfQ_Dbhkwemjv3deiOqdfK3DJxSzzeylsP-d', 
    ['screenshot'] = 'https://discord.com/api/webhooks/1222703368682606674/G88IvmUqPYxslibc4rtrmcYqDawmmHEZA8ppsumG7dKh_H2XAsVWM5AaUur9RSHP7N7M', 
    ['video'] = 'https://discord.com/api/webhooks/1222703464816185374/pNsNjQ21NgrBswanNPzo83OteWDj9hBOt6DctTav8VqUwJ9gGYNDizg5B6NZjNVPAFBk', 
    ['group'] = 'https://discord.com/api/webhooks/1222703547557347448/5sXbyAEjd89h-pWRvDiniXBtt8pwEy-o6AsrXKXip5iwbhnDWT8wXdSwwasSe91iy0FP', 
    ['unban-player'] = 'https://discord.com/api/webhooks/1222703622513492050/-aNjY0YspkpXhvYlT92CnGMiMi0MoOqFkKX8GrLrN22ovZ2T6-LGjAIzZlRhLR2ZKOui', 
    ['remove-warning'] = 'https://discord.com/api/webhooks/1222703791237890140/rfIn_g6YHGvN0d6DPS8Bp2ts1U88No-ROHwK3yfop8IxTr3ZC-0IV42UltyKotXdFh7u', 
    ['add-car'] = 'https://discord.com/api/webhooks/1222703850603941919/O351ke0TZ9670EaiItMP7WuQYiZ9i398PvyBZG3TraVbk4bFbZQz_-Ww4HgLdgygHrww', 
    ['manage-balance'] = 'https://discord.com/api/webhooks/1222703918891667496/IJa24_yOHuMhlmvPpbMDGEOLvhO0s6zXNhENM7nFTi6fjgnknzoIBBl4OqQkTw1Onmqe', 
    ['ticket-logs'] = 'https://discord.com/api/webhooks/1222703983815037040/7BhXBskDfFmVzAtxYqFhMXTzDCKbBXLwRlSaWauZf3mYqeSjL48OyjsVDUR174bIFbq7',
    ['com-pot'] = 'https://discord.com/api/webhooks/1222704065088323585/HY_hDRdIHQBMQxkrnGzh1yIxqo6UmRfKA4O0kZm9jcBTaVbSwsWKashhpBVJPo2Do5JL',
    ['staffdm'] = 'https://discord.com/api/webhooks/1222704114064949299/6sPxN7HHTlT7CN5UmaScHbKeNdl7_CHrm0Are9su2ZMhYKjdM0bADKHnG2LSkwn8AHuV',
    -- vehicles
    ['crush-vehicle'] = 'https://discord.com/api/webhooks/1222704297586855946/ycnNMAIMcfV9svN5dxNXgt36abum_1smP04Ph0N8Mf_k9N1aXsdMwSiFpI-spfi16Mg9', 
    ['rent-vehicle'] = 'https://discord.com/api/webhooks/1222704361738600519/1jF236OIgjbjt7MusSZ1OCLOFKiw7LDs4OyCw2MmQJFVjLDELy3yumbTpq2V0vEtX9at', 
    ['sell-vehicle'] = 'https://discord.com/api/webhooks/1222704490365583513/xtvXtvLR-FhlJ0O-rmowxNZoHvs02ASci49eu1YrG74ULVZFNMzUIsMrSyGH1M2Y-_bd',
    ['spawn-vehicle'] = 'https://discord.com/api/webhooks/1222704550952173688/0sSQ_yccNqCt5ZgTL1QjPrL_lS8TFckAvTOyrDgelr4-fQfq9rQXGB3MdgsjGQ0e_gh5',
    -- mpd
    ['pd-clock'] = 'https://discord.com/api/webhooks/1222704722113204387/BpCcXRJUa7RYJxOBgr_y1Uin7PYrglUjZK2UKYI1p6N8bVVdwuQBktR-AG8DsEn47KhC',
    ['pd-afk'] = 'https://discord.com/api/webhooks/1222705626447216740/tDeQngscUIUYAd0bixZ7ryJ0aIFHHJJKMycbNHTZLnzIcuv1YaRDpZrBPX-rnzoJWv91',
    ['pd-armoury'] = 'https://discord.com/api/webhooks/1222705687830859806/rlKHZW68FwgByARUpea1SzT4TD8rWZMMcs2o7ibMq0k2av3Td1YPv1u45pp--45yv9L6',
    ['fine-player'] = 'https://discord.com/api/webhooks/1222705745187962901/hHGqZJwV65VZuGMTmIvDT5EhDCSgrjM5HKMM1Mj0C91LgI1aoSlXaKO07w5BIoecroKP',
    ['jail-player'] = 'https://discord.com/api/webhooks/1222705824468832417/ogM9IcwRBUwSCG-UuaccTgIIy0sexeVW_9aWVzJeAYxw6ghBEEQDqDE3KX6kljIWDlFg',
    ['pd-panic'] = 'https://discord.com/api/webhooks/1222705993394425979/SmHPeTBFkWzyDUbxpTkbbFsWeCw-sM8M0ZH1dk2UmTQmenUyP7_Rk0EvE7TPUyrSSUll',
    ['seize-boot'] = 'https://discord.com/api/webhooks/1222706109098365020/vofmCoibM__AB32oay-QN7yhXdhvbIffJZRPnJWBmjbMxeeT2dNHPZQ60OrKcrHIx7FB',
    ['impound'] = 'https://discord.com/api/webhooks/1222706210159988788/7Dh2TSYM_7PFIBtlq343-y1AbiXeTvjNZVm7_p4JwoN2ZsLFHeGgcAyUl_mqGPD8OXph',
    ['police-k9'] = 'https://discord.com/api/webhooks/1222706275972939826/l-rNIUxobCVWr6BYxcFtb3nlC6p2l_B3tAwDVeJMTR53Uc4GQ44e2EGv1p467IElHpiF',
    -- nhs
    ['nhs-clock'] = 'https://discord.com/api/webhooks/1195973023870758973/P4gAk921r30bIX887QxZVvAUDEuBcX-Y13u6_d-832janT7I1IgnkMQGO_nAY8i55aRu',
    ['nhs-panic'] = 'https://discord.com/api/webhooks/1222706567971864690/dksoF8bmyBOFQoqWJ8IxhYP7lbvfXh7YW6sIkEPg6LMqheXG4AZaAB5A2THUdYKz74uL',
    ['nhs-afk'] = 'https://discord.com/api/webhooks/1222706616323936349/L6ZCMF-FM_qZUpS7D9oHyd5hHsgUlr_a2q2nXoH8X3Gz9pTbTYqzVdHxxGz6Ls00WW6R',
    ['cpr'] = 'https://discord.com/api/webhooks/1222706690911113237/9atTautjJ1zo_BccsYQpbqbu9xvnbgRU3UGboejmWtQW7IiQQDDEin-b0TCNxfillEws',
    -- licenses
    ['purchases'] = 'https://discord.com/api/webhooks/1222706799308832788/pbUaWcLSixslPs-KG0RsqB7Jqm88DdM8feQGpp7TML9MONAl8Qjk7bwKyAqOlaExIzze', 
    ['sell-to-nearest-player'] = 'https://discord.com/api/webhooks/1222706888605564958/YvCxj5guEhoJzFh-5UI6-ZKkGEHqcAKnWxJ_qkSNFJluBus4P49J-f7x9WNWVEoYI-YH', 
    -- casino
    ['blackjack-bet'] = 'https://discord.com/api/webhooks/1222706998110584995/CXtShCfCOmJ8FgITG63nkImm0r_A1YRVNDKNPBYl29BcH5YW_QMDKrPfi6gqCAHcBPTf',  
    ['coinflip-bet'] = 'https://discord.com/api/webhooks/1222707058600710154/tsqvHY5F4x-lJ3BssIGkskyn_CPOzuhBpktMWIzeMj0i5TMypk_JHjSw9GUXkeBCBnim',  
    ['purchase-chips'] = 'https://discord.com/api/webhooks/1222707163110309958/RNA3Gu0IH5nOkFa2lbcG9NaLt-4dhJ8VS9AiJCuNO-PxrFI257HOCU0MPVHXg9qCjgIg',  
    ['sell-chips'] = 'https://discord.com/api/webhooks/1222707231972397116/v9hso6Wa-feYOpVGZVV8rFxXbaaBMy6S3RcB8cuV8HqHTG-i5TCfFuvfBuy4IMzkp8fR',  
    ['purchase-highrollers'] = 'https://discord.com/api/webhooks/1222707299962060820/oC9HjwiwFeAjqmqYtknp0TKpRW20MrSxPwpqO35abmdJHC-_TOv5kQcTNjb9LKX07dZW',  
    -- weapon shops
    ['weapon-shops'] = 'https://discord.com/api/webhooks/1222707805014851687/QzGlxaflE2hTyKE8Ve69NcR0tHQEjzS8LwwpCPj3VXu1mot41IUhOxTa9eeDM_fjqNnU',  
    -- housing (no logs atm)
    [''] = '',
    -- anticheat
    ['anticheat'] = 'https://discord.com/api/webhooks/1222707988377108530/W0g4kZIJYyAZdUPxaDCRLehL26xrvdjEPXGOhdkEIqcXdQK51xt2HgvEpQuHwCzxl8h8',
    ["anticheat-log"] = 'https://discord.com/api/webhooks/1222707988377108530/W0g4kZIJYyAZdUPxaDCRLehL26xrvdjEPXGOhdkEIqcXdQK51xt2HgvEpQuHwCzxl8h8',
    ['tp-to-wp'] = 'https://discord.com/api/webhooks/1222707988377108530/W0g4kZIJYyAZdUPxaDCRLehL26xrvdjEPXGOhdkEIqcXdQK51xt2HgvEpQuHwCzxl8h8', 
    ['ban-evaders'] = 'https://discord.com/api/webhooks/1222708129326825633/hYnL_Vl3ydQdFHfHoKma3Z0IwGE88wIZp-Uu9UjeZpAXb01PIHOqv6aQHEFjnFviitNe',
    ['multi-account'] = 'https://discord.com/api/webhooks/1222708129326825633/hYnL_Vl3ydQdFHfHoKma3Z0IwGE88wIZp-Uu9UjeZpAXb01PIHOqv6aQHEFjnFviitNe', 
    -- dono
    ['donation'] = 'https://discord.com/api/webhooks/1222708355630633060/ZYU_ribJOUH-te7n8oJ2oY2IyvN-TLpsGFrXWW2nu7osUzaN4v_ZSGtrYJhz69GxLPRH', 
    -- general
    ['banned-player'] = 'https://discord.com/api/webhooks/1222708442872152174/MmkOv2LM3BFjbd47WEDMPoF1IX7i0aq6qJ2-xl25AXruRBiW8ZVpVAdmIUlXKXhRLxKj',
    ['tutorial'] = 'https://discord.com/api/webhooks/1222708513847906416/sWcMDrRQhm_HhUDAVE0LcH-0mZTFbY3w9-kIgxdFpJKOQoHc7Ed5LV3MRnnM6ZTUicVp', 
    ['killvideo'] = "https://discord.com/api/webhooks/1222708613747966022/6jTc7lnPoieChQFNTaDlXGPPiyRMDE7YcfO_AS4uQ0XnDhvkLIMj5E0yllFS5yTEJLGm",
    ['feedback'] = 'https://discord.com/api/webhooks/1222708692030591006/vorewUAhClnbvWBPQveqrIgbe0ndO2Qd7WDsTIvemUXyVFRVgkKe645USV_kaHrfKD3M',
    ['kills'] = 'https://discord.com/api/webhooks/1222708759567007775/aAJRcST60HYWxrX6V8JsQCbTMVLGw70qco_VSuAbPnSXCS9-MQabuMOtC9ASsP2Xcql3',
    ['damage'] = 'https://discord.com/api/webhooks/1222708840311816274/HxDj32hs375tFp3ynwNKN1LZxfTuoPRVDoat_mc3pR_zs5v53vKyXjtdzx9cUi_9-cZi',
    -- store
    ['store-sell'] = 'https://discord.com/api/webhooks/1222709020662694069/snUgOsa3qS9mdyAm5-XFzKrdKko3G2uSSigicm9F3Q3ButK5byWjk7AzrPOxrFJCPC1A', 
    ['store-redeem'] = 'https://discord.com/api/webhooks/1222709078607007744/N5wC0Ga5N4o9v-JTAuyffr_3f3JbPbioXZjUUmoUFCpDY7tquXGItm23dMkhqaht-SLw',
    ['store-unban'] = 'https://discord.com/api/webhooks/1222709145841700964/2begfXAYyX8-TKmnBG6YG1U2XC91BwCrUGHqrJSj1_4TBoC7F4oK-OLZZBO1cDeFV9Ku',
    ['tebex'] = 'https://discord.com/api/webhooks/1222709210220073021/0iCnPbJKcBkk6NV6f9xw-PhdgmRDkn6Ai8dDGjqiHg8zafN3J24r0NNgz9OJ1MwqNe9J',
    ['trigger-bot'] = 'https://discord.com/api/webhooks/1222709455330869278/s-JKQtTWUAsiq65e8ZyXcAuskNuZBfmxGOSqvUl33Mi_7Trbp_bZgv_YQp-KwSwX2hWU',
    ['headshot'] = 'https://discord.com/api/webhooks/1222709506006319124/DCBVFVTKhO5syZ83dFkauaIxKuvzUknvhsuySRizSm1APhYl4P8HFB8BXI9nFH5gUUlI',
}

local webhookQueue = {}
Citizen.CreateThread(function()
    while true do
        if next(webhookQueue) then
            for k,v in pairs(webhookQueue) do
                Citizen.Wait(100)
                if webhooks[v.webhook] ~= nil then
                    PerformHttpRequest(webhooks[v.webhook], function(err, text, headers) 
                    end, "POST", json.encode({username = "XTRA Logs", avatar_url = 'https://imgur.com/a/D2w4Ki7', embeds = {
                        {
                            ["color"] = 0x57F288,
                            ["title"] = v.name,
                            ["description"] = v.message,
                            ["footer"] = {
                                ["text"] = "XTRA - "..v.time,
                                ["icon_url"] = "",
                            }
                    }
                    }}), { ["Content-Type"] = "application/json" })
                end
                webhookQueue[k] = nil
            end
        end
        Citizen.Wait(0)
    end
end)
local webhookID = 1
function XTRA.sendWebhook(webhook, name, message)
    webhookID = webhookID + 1
    webhookQueue[webhookID] = {webhook = webhook, name = name, message = message, time = os.date("%c")}
end

function XTRA.getWebhook(webhook)
    if webhooks[webhook] ~= nil then
        return webhooks[webhook]
    end
end