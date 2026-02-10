--licenseを取得
local function GetPlayerLicense(source)
    for _, identifier in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(identifier, 1, 8) == "license:" then
            return identifier
        end
    end
    return nil
end

RegisterCommand('null_db_test', function (source, args)
    local xPlayer_identifier = "license:xxxxxxxx"
    local targetMoney = tonumber(args[1]) or 1000

    SaveUserMoney(xPlayer_identifier, targetMoney)

    local data = GetUserData(xPlayer_identifier)
    if data then
        print(('[DATABASE] 取得結果: 名前=%s, 所持金=%d'):format(data.name, data.money))
    end
end, true)