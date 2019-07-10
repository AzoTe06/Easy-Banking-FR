TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  amount = tonumber(amount)

  if not tonumber(amount) then return end
  amount = ESX.Math.Round(amount)

  if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
            TriggerClientEvent("pNotify:SendNotification", -1, {
            text = "Vous n'avez pas assez d'argent !",
            type = "error",
            queue = "lmao",
            timeout = 5000,
            layout = "bottomRight"
        })
  else
    xPlayer.removeMoney(amount)
    xPlayer.addAccountMoney('bank', amount)
            TriggerClientEvent("pNotify:SendNotification", -1, {
            text = "Vous avez déposé "..amount.."€",
            type = "success",
            queue = "lmao",
            timeout = 5000,
            layout = "bottomRight"
        })
  end
end)

RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  amount = tonumber(amount)
  local accountMoney = xPlayer.getAccount('bank').money

  if not tonumber(amount) then return end
  amount = ESX.Math.Round(amount)

  if amount == nil or amount <= 0 or amount > accountMoney then
            TriggerClientEvent("pNotify:SendNotification", -1, {
            text = "Vous n'avez pas assez d'argent !",
            type = "error",
            queue = "lmao",
            timeout = 5000,
            layout = "bottomRight"
        })
  else
    xPlayer.removeAccountMoney('bank', amount)
    xPlayer.addMoney(amount)
            TriggerClientEvent("pNotify:SendNotification", -1, {
            text = "Vous avez retiré "..amount.."€",
            type = "success",
            queue = "lmao",
            timeout = 5000,
            layout = "bottomRight"
        })
  end
end)

RegisterServerEvent('bank:withdrawal')
AddEventHandler('bank:withdrawal', function(amount)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  amount = tonumber(1000)
  local accountMoney = xPlayer.getAccount('bank').money

  if not tonumber(1000) then return end
  amount = ESX.Math.Round(amount)

  if amount == nil or amount <= 0 or amount > accountMoney then
            TriggerClientEvent("pNotify:SendNotification", -1, {
            text = "Vous n'avez pas assez d'argent !",
            type = "error",
            queue = "lmao",
            timeout = 5000,
            layout = "bottomRight"
        })
  else
    xPlayer.removeAccountMoney('bank', amount)
    xPlayer.addMoney(amount)
            TriggerClientEvent("pNotify:SendNotification", -1, {
            text = "Vous avez retiré "..amount.."€",
            type = "success",
            queue = "lmao",
            timeout = 5000,
            layout = "bottomRight"
        })
  end
end)

