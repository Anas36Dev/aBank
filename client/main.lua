--@Script Bank
--@Author Anas36_Dev

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local mainMenu = RageUI.CreateMenu("Banque", "~g~Banque")
local subMenu = RageUI.CreateSubMenu(mainMenu, "Déposer", "Combien voulez vous deposer ?")
local subMenu2 = RageUI.CreateSubMenu(mainMenu, "Retirer", "Combien voulez vous retirer ?")
local subMenu3 = RageUI.CreateSubMenu(mainMenu, "Transférer", "Effectuer un transfert ")
local bank = false
mainMenu.Closed = function() bank = false end 

portefeuille = 0
account = 0
iban2 = nil
montant2 = nil

function Bank()
    if bank then bank = false RageUI.Visible(mainMenu, false) return else bank = true RageUI.Visible(mainMenu, true)
        CreateThread(function()
            while bank do 
                RageUI.IsVisible(mainMenu, function()
                    startAnim('mini@atmenter', 'enter')
                    RageUI.Separator("Nom : ~g~"..GetPlayerName(PlayerId()).."~w~")
                    RageUI.Separator("Votre Compte : ~g~"..account.."$")
                    RageUI.Separator("Votre RIB : ~g~"..GetPlayerServerId(PlayerId()).."~w~")
                    RageUI.Separator('')
                    RageUI.Button("Faire un ~g~dépôt", nil, {RightLabel = "→"}, true, {onSelected = function() end}, subMenu)
                    RageUI.Button("Faire un ~r~retrait", nil, {RightLabel = "→"}, true, {onSelected = function() end}, subMenu2)
                    RageUI.Button("Faire un ~b~transfère", nil, {RightLabel = "→"}, true, {onSelected = function() end}, subMenu3)
                end)

                RageUI.IsVisible(subMenu, function()
                    RageUI.Button("[~g~Dépôt~s~] Montant Personnalisé", nil, {RightBadge = RageUI.BadgeStyle.Package}, true, {
                        onSelected = function()
                            local depose = KeyboardInput("Montant à déposer :", "", 8)
                            depose = tonumber(depose)
                            TriggerServerEvent('AnasBank:deposer', depose)
                            TriggerServerEvent("AnasBank:anas", fct)
                            TriggerServerEvent("AnasBank:banque", fct)
                            exports['okokNotify']:Alert("", "Vous venez de déposer <span style='color:#47cf73'>" ..depose.. "</span> $", 5000, 'success')
                        end
                    })
                    RageUI.Button("[~g~Dépôt~s~] Montant : ~g~1000$", nil, {RightBadge = RageUI.BadgeStyle.Cash}, true, {
                        onSelected = function()
                            depose = 1000
                            TriggerServerEvent('AnasBank:deposer', depose)
                            TriggerServerEvent("AnasBank:anas", fct)
                            TriggerServerEvent("AnasBank:banque", fct)
                            exports['okokNotify']:Alert("", "Vous venez de déposer <span style='color:#47cf73'>1,000</span> $", 5000, 'success')
                        end
                    })
                    RageUI.Button("[~g~Dépôt~s~] Montant : ~g~2500$", nil, {RightBadge = RageUI.BadgeStyle.Cash}, true, {
                        onSelected = function()
                            depose = 2500
                            TriggerServerEvent('AnasBank:deposer', depose)
                            TriggerServerEvent("AnasBank:anas", fct)
                            TriggerServerEvent("AnasBank:banque", fct)
                            exports['okokNotify']:Alert("", "Vous venez de déposer <span style='color:#47cf73'>2,000</span> $", 5000, 'success')
                        end
                    })
                    RageUI.Button("[~g~Dépôt~s~] Montant : ~g~5000$", nil, {RightBadge = RageUI.BadgeStyle.Cash}, true, {
                        onSelected = function()
                            depose = 5000
                            TriggerServerEvent('AnasBank:deposer', depose)
                            TriggerServerEvent("AnasBank:anas", fct)
                            TriggerServerEvent("AnasBank:banque", fct)
                            exports['okokNotify']:Alert("", "Vous venez de déposer <span style='color:#47cf73'>5,000</span> $", 5000, 'success')
                        end
                    })
                end)
                RageUI.IsVisible(subMenu2, function()
                    RageUI.Button("[~r~Retrait~s~] Montant Personnalisé", nil, {RightBadge = RageUI.BadgeStyle.Package}, true, {
                        onSelected = function()
                            local retire = KeyboardInput("Montant à retirer :", "", 8)
                            retire = tonumber(retire)
                            TriggerServerEvent('AnasBank:retirer', retire)
                            TriggerServerEvent("AnasBank:anas", fct)
                            TriggerServerEvent("AnasBank:banque", fct)
                            exports['okokNotify']:Alert("", "Vous venez de retirer <span style='color:#47cf73'>" ..retire.. "</span> $", 5000, 'success')
                        end
                    })
                    RageUI.Button("[~r~Retrait~s~] Montant : ~g~1000$", nil, {RightBadge = RageUI.BadgeStyle.Cash}, true, {
                        onSelected = function()
                            retire = 1000
                            TriggerServerEvent('AnasBank:retirer', retire)
                            TriggerServerEvent("AnasBank:anas", fct)
                            TriggerServerEvent("AnasBank:banque", fct)
                            exports['okokNotify']:Alert("", "Vous venez de retirer <span style='color:#47cf73'>1,000</span> $", 5000, 'success')
                        end
                    })
                    RageUI.Button("[~r~Retrait~s~] Montant : ~g~2500$", nil, {RightBadge = RageUI.BadgeStyle.Cash}, true, {
                        onSelected = function()
                            retire = 2500
                            TriggerServerEvent('AnasBank:retirer', retire)
                            TriggerServerEvent("AnasBank:anas", fct)
                            TriggerServerEvent("AnasBank:banque", fct)
                            exports['okokNotify']:Alert("", "Vous venez de retirer <span style='color:#47cf73'>2,000</span> $", 5000, 'success')
                        end
                    })
                    RageUI.Button("[~r~Retrait~s~] Montant : ~g~5000$", nil, {RightBadge = RageUI.BadgeStyle.Cash}, true, {
                        onSelected = function()
                            retire = 5000
                            TriggerServerEvent('AnasBank:retirer', retire)
                            TriggerServerEvent("AnasBank:anas", fct)
                            TriggerServerEvent("AnasBank:banque", fct)
                            exports['okokNotify']:Alert("", "Vous venez de retirer <span style='color:#47cf73'>5,000</span> $", 5000, 'success')
                        end
                    })
                end)
                RageUI.IsVisible(subMenu3, function()
                    RageUI.Button("RIB", nil, {RightBadge = RageUI.BadgeStyle.Card}, true, {
                        onSelected = function()
                            local iban = KeyboardInput("RIB du destinataire", "", 4)
                            if iban == nil then
                                ESX.ShowNotification("IBAN Invalide")
                            else
                                iban2 = tonumber(iban)
                                ibanf = "~b~"..iban2..""
                            end
                        end
                    })
                    RageUI.Button("Montant", nil, {RightBadge = RageUI.BadgeStyle.Cash}, true, {
                        onSelected = function()
                            local montant = KeyboardInput("Montant à transférer", "", 8)
                            if montant == nil then
                                ESX.ShowNotification("Montant Invalide")
                            else
                                montant2 = tonumber(montant)
                                montantf = "~g~"..montant2.."$"
                            end
                        end
                    })
                    RageUI.Button('Valider', false, {RightBadge = RageUI.BadgeStyle.Tick}, true, {
                        onSelected = function()
                            TriggerServerEvent('AnasBank:transfere', iban2, montant2)
                            TriggerServerEvent("AnasBank:banque", fct)
                        end
                    })
                end)
            Wait(0)
            end
        end)
    end
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Citizen.Wait(0) end 
    if UpdateOnscreenKeyboard() ~= 2 then local result = GetOnscreenKeyboardResult() Citizen.Wait(500) blockinput = false return result else Citizen.Wait(500) blockinput = false return nil end
end

local pos = {
    {x = 150.03, y = -1040.64, z = 29.37},
    {x = -2962.99, y = 482.38, z = 15.7}, 
    {x = 246.59, y = 223.54, z = 106.29}, -- Banque Centrale
    {x = 314.38, y = -278.87, z = 54.17}, 
    {x = -1212.79, y = -330.47, z = 37.79}, 
    {x = 1175.34, y = 2706.53, z = 38.09}, -- Sandy Shores
    {x = -111.86, y = 6468.95, z = 31.63}, -- Paleto Bay
    {x = -351.02, y = -49.83, z = 49.04}, 
    {x = 4477.23, y = -4464.22, z = 4.24}, -- Cayo Perico
}

Citizen.CreateThread(function()
    while true do
        local wait = 900
        for k,v in pairs(pos) do
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z)
            if dist <= 1.5 then
                wait = 1
                DrawMarker(6, v.x, v.y, v.z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.6, 0.6, 0.6, 0, 0, 0, 82, 84, 196, p19, false) 
            end
            if dist <= 0.7 then
                wait = 1
                ESX.ShowHelpNotification("~b~E~w~ → Parler avec le banquier")
                if IsControlJustPressed(1,51) then
                    TriggerServerEvent("AnasBank:anas", fct)
                    TriggerServerEvent("AnasBank:banque", fct)
                    createProgressBar("Connexion au compte bancaire", 0, 255, 185, 120, 2000)
                    Citizen.Wait(2000)
					Bank()
                end
            end
        end
    Citizen.Wait(wait)
    end
end)

RegisterNetEvent("AnasBank:portefeuille") AddEventHandler("AnasBank:portefeuille", function(money, cash) portefeuille = tonumber(money) end)
RegisterNetEvent("AnasBank:account") AddEventHandler("AnasBank:account", function(money, cash) account = tonumber(money) end)

Citizen.CreateThread(function()
    for k,v in pairs(pos) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite (blip, 500)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.7)
        SetBlipColour (blip, 2)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName('Banque')
        EndTextCommandSetBlipName(blip)
    end
end)

function startAnim(lib, anim)
    ESX.Streaming.RequestAnimDict(lib, function()
        TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
    end)
end

function createProgressBar(Text,r,g,b,a,Timing,NoTiming)
	local petitpoint = {".","..","...",""}
    if not Timing then 
        return 
    end
    killProgressBar()
    haveprogress = true
    Citizen.CreateThread(function()
        local Timing1, Timing2 = .0, GetGameTimer() + Timing
        local E, Timing3 = ""
        while haveprogress and (not NoTiming and Timing1 < 1) do
            Citizen.Wait(0)
            if not NoTiming or Timing1 < 1 then 
                Timing1 = 1-((Timing2 - GetGameTimer())/Timing)
            end
            if not Timing3 or GetGameTimer() >= Timing3 then
                Timing3 = GetGameTimer()+500;
                E = petitpoint[string.len(E)+1] or ""
            end;
            DrawRect(.5,.875,.15,.03,0,0,0,100)
            local y, endroit=.15-.0025,.03-.005;
            local chance = math.max(0,math.min(y,y*Timing1))
            DrawRect((.5-y/2)+chance/2,.875,chance,endroit,r,g,b,a) -- 0,155,255,125
            DrawNiceText(.5,.875-.0125,.3,(Text or"Action en cours")..E,0,0,false)
        end;
        killProgressBar()
    end)
end

function killProgressBar()
    haveprogress = nil 
end

function DrawNiceText(Text,Text3,Taille,Text2,Font,Justi,havetext)
    SetTextFont(Font)
    SetTextScale(Taille,Taille)
    SetTextColour(255,255,255,255)
    SetTextJustification(Justi or 1)
    SetTextEntry("STRING")
        if havetext then 
            SetTextWrap(Text,Text+.1)
        end;
        AddTextComponentString(Text2)
    DrawText(Text,Text3)
end