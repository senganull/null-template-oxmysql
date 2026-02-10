--licenseを取得
local function GetPlayerLicense(source)
    for _, identifier in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(identifier, 1, 8) == "license:" then
            return identifier
        end
    end
    return nil
end

local function SyncPlayerToDatabase(source)
    local identifier = GetPlayerLicense(source)
    local playerName = GetPlayerName(source)

    if not identifier then return end

    --初期値としてのデータ(実際は変数から取得)
    local defaultMoney = 5000
    local defaultJob = "umemployed"

    -- ON DUPLICATE KEY UPDATEを使うことで、既存なら更新
    -- なければ新規作成を1回で行う
    MySQL.update.await([[
        INSERT INTO `null_template_users` (identifier, name, money, job)
        VALUES(?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE name = ?, money = ?, job = ?
    ]], {
        identifier, playerName, defaultMoney, defaultJob, --INSERT値
        playerName, defaultMoney, defaultJob -- UPDATE値
    })
    print(('[DATABASE] プレイヤー同期完了: %s (%s)'):format(playerName, identifier))
end

RegisterCommand('null_db_sync', function (source, args)
    if source == 0 then
        print("このコマンドはコンソールから実行できません。")
        return
    end

    SyncPlayerToDatabase(source)
end, false)