--データ取得
-- MySQL.prepare.awaitは単一の値や行を取得するのに適したモダンな書き方
local function GetUserData(identifier)
    local result = MySQL.prepare.await('SELECT * FROM `null_template_users` WHERE `identifier` = ?', {
        identifier
    })

    return result
end

--データの保存更新
--MySQL.update.awaitは影響を受けた行数を返す
local function SaveUserMoney(identifier, amount)
    local affectedRows = MySQL.update.await([[
        INSERT INTO `null-null_template_users` (identifier, money)
        VALUES (?, ?)
        ON DUPLICATE KEY UPDATE money = ?
    ]], {
        identifier, amount, amount
    })

    if affectedRows > 0 then
        print(('[DATABASE] $s の所持金を %d に更新しました'):format(identifier, amount))
    end
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