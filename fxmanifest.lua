fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'senganull'
version '1.0.0'

-- サーバー側でoxmysqlの機能を使用するための宣言
-- oxmysqlは@oxmysql/lib/MySQL.luaを読み込むことで、MySQLオブジェクトが使える
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/sv_main.lua'
}

files {
    'schema.sql'
}