--データ取得
-- MySQL.prepare.awaitは単一の値や行を取得するのに適したモダンな書き方
local function GetUserData(identifier)
    local result = MySQL.prepare.await('SELECT * FROM `null_template_users` WHERE `identifier` = ?', {
        identifier
    })

    return result
end