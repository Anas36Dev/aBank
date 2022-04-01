--@Script Bank
--@Author Anas36_Dev

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("AnasBank:anas") AddEventHandler("AnasBank:anas", function(fct, amount) TriggerClientEvent("AnasBank:portefeuille", source, ESX.GetPlayerFromId(source).getMoney()) end)
RegisterServerEvent("AnasBank:banque") AddEventHandler("AnasBank:banque", function(fct, amount) TriggerClientEvent("AnasBank:account", source, ESX.GetPlayerFromId(source).getBank()) end)

RegisterServerEvent("AnasBank:deposer")
AddEventHandler("AnasBank:deposer", function(somme)
    if ESX.GetPlayerFromId(source).getMoney() >= somme then
    	ESX.GetPlayerFromId(source).addAccountMoney('bank', somme)
    	ESX.GetPlayerFromId(source).removeMoney(somme)
    else
        TriggerClientEvent('esx:showNotification', source, "Le montant est trop élevé")
    end    
end)

RegisterServerEvent("AnasBank:retirer")
AddEventHandler("AnasBank:retirer", function(somme)
    if ESX.GetPlayerFromId(source).getBank() >= somme then
    	ESX.GetPlayerFromId(source).removeAccountMoney('bank', somme)
    	ESX.GetPlayerFromId(source).addMoney(somme)
    else
        TriggerClientEvent('esx:showNotification', source, "Le montant est trop élevé")
    end    
end)

RegisterServerEvent('AnasBank:transfere')
AddEventHandler('AnasBank:transfere', function(iban2, montant2)
    local balance = 0
    if (ESX.GetPlayerFromId(iban2) == nil or ESX.GetPlayerFromId(iban2) == -1) then
        TriggerClientEvent('esx:showNotification', source, "Votre destinataire est introuvable")
    else
        balance = ESX.GetPlayerFromId(source).getAccount('bank').money
        zbalance = ESX.GetPlayerFromId(iban2).getAccount('bank').money
        if tonumber(source) == tonumber(iban2) then
            TriggerClientEvent('esx:showNotification', source, "Vous ne pouve pas transférer de l'argent à votre IBAN")
        else
            if balance <= 0 or balance < tonumber(montant2) or tonumber(montant2) <= 0 then
                TriggerClientEvent('esx:showAdvancedNotification', source, 'Fleeca Bank', "Infos Transfère", "Vous n'avez pas les fonds", 'CHAR_BANK_FLEECA', 9)
            else
                ESX.GetPlayerFromId(source).removeAccountMoney('bank', tonumber(montant2))
                ESX.GetPlayerFromId(iban2).addAccountMoney('bank', tonumber(montant2))
            end
        end
    end
end)
