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

