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
    ['tp-player-to-me'] = 'https://discord.com/api/webhooks/1133596059239723018/fU_kiUmB9Igyk6wiSxkNnmRYUh_a-fCM6CMH6D1qfQECrg9J28nYskFr0uqDNg2BP-lN', 
    ['tp-to-player'] = 'https://discord.com/api/webhooks/1133596083629592696/_NIqyF2e8gg_Zjc6jKdz_QOx19Wuwavw_Rgu3XnvYUML2jRsygIHVphqCP3vImv-5aBA', 
    ['tp-to-admin-zone'] = 'https://discord.com/api/webhooks/1133596147370438697/iI_olHXRBkNF_3SB5-yRmgQMYvlIgA5ZMwHSsya9bL_QrZuPRBJOFzJ83L9T5F7-kHp6', 
    ['tp-back-from-admin-zone'] = 'https://discord.com/api/webhooks/1133596178412486698/AaY8yGDcQavhqx98_583XUtq3CgXx3GNkULbqtl4W4McIFSxXaquC95j74v3EDgMbeaH', 
    ['tp-to-legion'] = 'https://discord.com/api/webhooks/1133596208091377764/UiUglfezojubLXvXOSsN9sekN-TVMa9oUKjpIvxHrK3h0YZVvUFt4mebYNsMIRErbxhj', 
    ['freeze'] = 'https://discord.com/api/webhooks/1133596238193901628/3bmVsgHXA4YeTnFUgwmG3j05YEM208mG2tCCUKGQTuyRBPLbc5BvrPY6GMz-ARC0W-oa', 
    ['slap'] = 'https://discord.com/api/webhooks/1133596427109539860/41yN2QU3VeUEzL1UGTOSb0yk6CWkwrHvsF0PBfTaMXxxsTpAXRgMkv-DiSjGoD9QDqFh', 
    ['force-clock-off'] = 'https://discord.com/api/webhooks/1133596392468783214/KZwTHuWjSLW8iylFApfsa57-9Cq_ccP9IaTVigf6X6EkqYOfeITEdUNhwOF8bFHO_UiO', 
    ['screenshot'] = 'https://discord.com/api/webhooks/1133596457551794206/c6p4kBy4kwWxbldg9Azyr1wKM4x4imJYSGnCxlGwudEF1zK7e7HN7BI2XVjt31d4TIZB', 
    ['video'] = 'https://discordapp.com/api/webhooks/1218933090010009611/njHD5fCgzqFkQMHptCzFqKGhgbxVmd4UKL17ap5hor8QB3mwsq-c1nThNujSBVCQwSyO', 
    ['group'] = 'https://discord.com/api/webhooks/1133596519942070292/vfSK27_ivaM8GxpINV4NBD6ec0-iUUMLSid4KApAKimWXA2Rv_vO6-fDYH8B6_1e2Dd7', 
    ['unban-player'] = 'https://discord.com/api/webhooks/1133596801455378584/q8oVjd1lvgx8ICpKKmWvt9jR5VsvfFH8abEXYcTRtNdyP7j8VpTwNRashkW_ojKjMIMn', 
    ['remove-warning'] = 'https://discord.com/api/webhooks/1133740365262897232/YFmVXS3QJyoKkLpLUr-50DugA-VsO7_audLXItlUculVfbZPZVXKlOXHae3geXVnwFW1', 
    ['add-car'] = 'https://discord.com/api/webhooks/1133740420782882816/7IyH85wJpha1duY4QuvRbN5vKnFd0-rJFjaB387Dfq3G8TRahepFSapRc8GLr1RpTmqq', 
    ['manage-balance'] = 'https://discord.com/api/webhooks/1133740484834107524/6a1nc4_gQeGvnAB-za9pWXJIYukmWV5GHMM6c-ghXBMvpPFUlziROG0NQl0LYNmCV7na', 
    ['ticket-logs'] = 'https://discord.com/api/webhooks/1133740532301049938/HZ9K0EwpjbgLDq4kNTMDQ0w119VhGxeiMyumT-tYkOejSaQpGGxfJhivljGxFFguyupW',
    ['com-pot'] = 'https://discord.com/api/webhooks/1133740578899759145/LaZ__51ZeRFTfK1LxTcoKJuEoSYSUsLF57BlkoXnhUdy_6mSDs_x8cdpMxL6uIr3dQAw',
    ['staffdm'] = 'https://discord.com/api/webhooks/1159951315644977203/AtsqvY_abEnLYb54KzqZTd2kA7GNQG74X55spMtFL-YSqHGQ-Dvpuxh4nc8CzzY7aq03',
    -- vehicles
    ['crush-vehicle'] = 'https://discord.com/api/webhooks/1133740637875867751/zEuxBuNFlmOdtPqd-xYN0tLOdbug5V-CpovTBBuSb5LN23xXJ-wnOxK3xb5nkLd3tkdi', 
    ['rent-vehicle'] = 'https://discord.com/api/webhooks/1133740685862907904/3HCydu3cPI4VjX62kCUj_angM7R3C4Z8MO9uII3eIt4uCNIRbHjX6UcCeFH37bEsOt7J', 
    ['sell-vehicle'] = 'https://discord.com/api/webhooks/1133740743396176003/SVC5_yzxMKyBq80nsxmWoqvK9samWCEcrOz0hOPO9Ce0t0ZbVu9KK7wFLnuBEEJWeZ0h',
    ['spawn-vehicle'] = 'https://discord.com/api/webhooks/1172913659635302470/E4w5GMvOfU3Aa0C8qAms53CzlOcvA_BVt0HqmLZzT9KW4yjXBS5QpJfNACaa-6_LlMKj',
    -- mpd
    ['pd-clock'] = 'https://discord.com/api/webhooks/1130163973258477640/2uB_me4pHUo98i_4sPA9lE65qGsIRENqDa2zVHfQiXEEpc4aJXhSX7Uk3dsEn5VrOGnZ',
    ['pd-afk'] = 'https://discord.com/api/webhooks/1130163923128156160/qwncXuQOHS9q2OJUbcpXYqo_AiSOVUUN8blKQhMwGW6BL_zDHRMPyOig_tf6cIn70S0J',
    ['pd-armoury'] = 'https://discord.com/api/webhooks/1130163824268411001/rJmx-PXs6uUnlfxkZV4Lc93rWKqn0z19kopQiARcYedLV30Gl5BnLXDWtfVukopSO_DT',
    ['fine-player'] = 'https://discord.com/api/webhooks/1130163740466225182/Cte7utuPfFBBIiIJaM2-IPbhojx56h84fP6ekzxHmCyWt33cRtPlUlF5T_HMTGetozSY',
    ['jail-player'] = 'https://discord.com/api/webhooks/1130163740466225182/Cte7utuPfFBBIiIJaM2-IPbhojx56h84fP6ekzxHmCyWt33cRtPlUlF5T_HMTGetozSY',
    ['pd-panic'] = 'https://discord.com/api/webhooks/1130164190439555102/Q6yT37dMDiZm7YmiqaAyRDKwppNgtt2ydlBPjZyLqjPYKiTEkdYuXf4OQk5kHNphlQ9h',
    ['seize-boot'] = 'https://discord.com/api/webhooks/1130163868853878824/Jf6LgQPNIWhaSLdPT1Jlz9MdHLvUXQth7663EAaXjVuV5NyBG6NVvVGgAZwkq4UrOX7U',
    ['impound'] = 'https://discord.com/api/webhooks/1130164141919830066/NaGBup_ZJEEz9DOGSSYJxRtBBGLTQ0_liWQyW7YUslUXPVWZKEXuRKh6fLd5e-OH-uwS',
    ['police-k9'] = 'https://discord.com/api/webhooks/1127973898479222876/KshzXMCksQJdfZxKMCgSodzHR19-J18RrDUfnKpen-NZsMyLzNjw2KtaMwjo8LVBSVCX',
    -- nhs
    ['nhs-clock'] = 'https://discord.com/api/webhooks/1127973941332410460/oCBhmr1hf7q-TSmJRvgFDmmZBSr0Cshi4EhEbCgKo8WYl7ZRa1VULwnZ4H1sEKsvFLwb',
    ['nhs-panic'] = 'https://discord.com/api/webhooks/1127973980536573963/UbzslTqEHhlVpnBaGPZiHc2Wjo_pTKW1pisrtVY8lp8qTk8dRPmjBwfdiE7VxJ76oP8N',
    ['nhs-afk'] = 'https://discord.com/api/webhooks/1127974023855362129/ztilmwOGrwYCuoVvLFDxSDLYej_mfYBLtbxGFaZFBTKFrMuplDa0iTGDBLAcGq4qi7mp',
    ['cpr'] = 'https://discord.com/api/webhooks/1127974068604375251/HaLR8qdmaKyEHpvHJ2CM6ql5wJMJ4eWO-I0J9w7_9jC8Je9lysQPR-upIX2I5FhTa7kF',
    -- licenses
    ['purchases'] = 'https://discord.com/api/webhooks/1133740827705888900/hQp7lyPgXMjqtWeMO6yb9bDdHLHRQuOndgOHMLEGS8l6nFwbgsiDixq6pj-wlLUtKkZp', 
    ['sell-to-nearest-player'] = 'https://discord.com/api/webhooks/1133740885046198293/CdBkFHUZFfiyHlrlfoszswJeGxtra_q0U5CXhHvMoOV_nKrvRdP6Mv83Y4QD78z6KabyOF', 
    -- casino
    ['blackjack-bet'] = 'https://discord.com/api/webhooks/1133740941409255454/pHf6ZFq0GVhcR2odyg8FPryklgV67dWZEci6KgoMl54PWETROcFpGiv1pcvhuA4lPlLH',  
    ['coinflip-bet'] = 'https://discord.com/api/webhooks/1173381245644845206/kBc9OV6tFhqhWSsyb5cQlsZp1McjcjpoMPk88bOMtB9WIlnc26-_8-h2e7CZzlzsIHMF',  
    ['purchase-chips'] = 'https://discord.com/api/webhooks/1133741069926940762/VyqwTA4zVmmHstFbYK6BaqWp6CUvTHEhBigKGNbYFu6AwB6Qqjy3mLKA0OfPzPg8Kq7b',  
    ['sell-chips'] = 'https://discord.com/api/webhooks/1133741123513356389/Lash4IhzDZV2vNMBg6F6H26B6j6EPx7aw9sRIKZ5LvyF_eU1QlHsPeknfwbH9DxwpzQU',  
    ['purchase-highrollers'] = 'https://discord.com/api/webhooks/1133741189691093082/Ib2CtthXqKseNhMuvvPw5lbEAiCk1vjWJtbkBbcurC66NdrD-9PEec84Jw37Lb2LOyem',  
    -- weapon shops
    ['weapon-shops'] = 'https://discord.com/api/webhooks/1133741299481182238/5rGrQnanz3nAkLaNhqNLjg8XY0lAdZhus8G_JMgYYwTBYY4Oc10PtDCYP0G2hoiyzHxz',  
    -- housing (no logs atm)
    [''] = '',
    -- anticheat
    ['anticheat'] = 'https://discord.com/api/webhooks/1208417067351539833/9cygLESZfX4HII0kVlMLP1zXg6X2OEUC-IZinxHYSrWjEaPbyEk8RKiKPOj-bX_pZc9W',
    ["anticheat-log"] = 'https://discord.com/api/webhooks/1208417067351539833/9cygLESZfX4HII0kVlMLP1zXg6X2OEUC-IZinxHYSrWjEaPbyEk8RKiKPOj-bX_pZc9W',
    ['tp-to-wp'] = 'https://discord.com/api/webhooks/1208417067351539833/9cygLESZfX4HII0kVlMLP1zXg6X2OEUC-IZinxHYSrWjEaPbyEk8RKiKPOj-bX_pZc9W', 
    ['ban-evaders'] = 'https://discord.com/api/webhooks/1208417202513117225/xrpHyfAnTaAc_vuPsZHWdIAev4IcEq4A5WavLWGG9eYbqCFDoZMLJxHK6GdK5Waxzs9f',
    ['multi-account'] = 'https://discord.com/api/webhooks/1208417202513117225/xrpHyfAnTaAc_vuPsZHWdIAev4IcEq4A5WavLWGG9eYbqCFDoZMLJxHK6GdK5Waxzs9f', 
    -- dono
    ['donation'] = 'https://discord.com/api/webhooks/1133741350341333073/nG_BMu7wKhzPnYRBl02roqfjwjbmxOlGhEKxdcGG52kDNzP6fxfuzzb1cHwxZBVEdfKy', 
    -- general
    ['banned-player'] = 'https://discord.com/api/webhooks/1210378213159604245/XEhDZvZX8nkNfrLmgmw8Z3vsCkyyfs23UO2S_6_-rORAsb1LE2Xm_HEFBekywGZDe9qd',
    ['tutorial'] = 'https://discord.com/api/webhooks/1133741580407287828/wSZzMaONO9W0z84tv9Lpn_9OQmX5OT5f45ryi5RjnFJrl18MP9Bctz0MUCr__EvLBmGT', 
    ['killvideo'] = "https://discordapp.com/api/webhooks/1218932854898298931/GQ30yNvfvYh8wSbv9f9EwoowTVdEUP3-dIiSewCc3_6UaPL9dgirGAs05DH3nBHp2rKc",
    ['feedback'] = 'https://discord.com/api/webhooks/1133741643091165265/g-JLqT5cIA9OS2w0SvfCzseYyH5Cy1vZhBj5oq65TSM-QSnjmQsPrdCTjzcV5TUKytFl',
    ['kills'] = 'https://discord.com/api/webhooks/1197607027271278726/B6uzehUsYEn1FbJIwuUWb6CVKASmE729Qiq7CKHknb8HuFHOEquhDNhSBSMy2slxJglX',
    ['damage'] = 'https://discord.com/api/webhooks/1197606901383434391/PrqyEi6r8V2w0fJ4uohwvtxG8oAYEFBNz8E0HJ97QxksXvVe24VDHqSVs2SL3eVKFLKN',
    -- store
    ['store-sell'] = 'https://discord.com/api/webhooks/1143229362322292826/nYsMCbHkn4Lo7gp4o-HRzQdlIZquCX-FzceWcq56rH9a2o3ikCcJylF6MNX0_Bm_drDI', 
    ['store-redeem'] = 'https://discord.com/api/webhooks/1143229309960605767/Y0CrSZsp8IsLIrys1a_Ok6680eQwhQMcEiKpX0qAXBfsn_5P93vlUim980hHyCE3wVzr',
    ['store-unban'] = 'https://discord.com/api/webhooks/1145143051086471318/vBE3t2tj9EEQvnsWTZex5dkd_Hjy-8GDIZW5IZqi4yJNj3efXf7Jc2BhZn7voL_NyiM6',
    ['tebex'] = 'https://discord.com/api/webhooks/1173671026572398613/A_RUwhIYnGVsTj635oSJMK74F8GzzKUD-oi0vtGJlYAczD1WpdW4N6-GoyZFtkakdvwY',
    ['trigger-bot'] = 'https://discord.com/api/webhooks/1208417067351539833/9cygLESZfX4HII0kVlMLP1zXg6X2OEUC-IZinxHYSrWjEaPbyEk8RKiKPOj-bX_pZc9W',
    ['headshot'] = 'https://discord.com/api/webhooks/1166209238528442470/zZGXZT-huuuQ1b9ZeuzEy5NTSVplHKyOFoDrLnHeeoTJax7wAYpTx4hctgNMIkzNd_1T',
}

local webhookQueue = {}
Citizen.CreateThread(function()
    while true do
        if next(webhookQueue) then
            for k,v in pairs(webhookQueue) do
                Citizen.Wait(100)
                if webhooks[v.webhook] ~= nil then
                    PerformHttpRequest(webhooks[v.webhook], function(err, text, headers) 
                    end, "POST", json.encode({username = "XTRA Logs", avatar_url = 'https://i.imgur.com/418xn77.png', embeds = {
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