--[[

]]

function download_to_file(url, file_name)
  -- print to server
  -- print("url to download: "..url)
  -- uncomment if needed
  local respbody = {}
  local options = {
    url = url,
    sink = ltn12.sink.table(respbody),
    redirect = true
  }

  -- nil, code, headers, status
  local response = nil

  if url:starts('https') then
    options.redirect = false
    response = {https.request(options)}
  else
    response = {http.request(options)}
  end

  local code = response[2]
  local headers = response[3]
  local status = response[4]

  if code ~= 200 then return nil end

  file_name = file_name or get_http_file_name(url, headers)

  local file_path = "data/"..file_name
  -- print("Saved to: "..file_path)
	-- uncomment if needed
  file = io.open(file_path, "w+")
  file:write(table.concat(respbody))
  file:close()

  return file_path
end
function run_command(str)
  local cmd = io.popen(str)
  local result = cmd:read('*all')
  cmd:close()
  return result
end
function string:isempty()
  return self == nil or self == ''
end

-- Returns true if the string is blank
function string:isblank()
  self = self:trim()
  return self:isempty()
end

-- DEPRECATED!!!!!
function string.starts(String, Start)
  -- print("string.starts(String, Start) is DEPRECATED use string:starts(text) instead")
  -- uncomment if needed
  return Start == string.sub(String,1,string.len(Start))
end

-- Returns true if String starts with Start
function string:starts(text)
  return text == string.sub(self,1,string.len(text))
end

local getUser = function(user_id,cb)
tdcli_function({ID = "GetUser",user_id_ = user_id},cb,nil)
end

Bot_Api = 'https://api.telegram.org/bot'.. Token
function send_inline(chat_id,text,keyboard,markdown)
local url = Bot_Api
if keyboard then
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=html&reply_markup='..URL.escape(json:encode(keyboard))
else
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=HTML'
end
if markdown == 'md' or markdown == 'markdown' then
url = url..'&parse_mode=Markdown'
elseif markdown == 'html' then
url = url..'&parse_mode=HTML'
end
return https.request(url)
end








function lock_photos(msg)
if not msg.Director then 
return "❍ *│* هذا الامر يخص {المدير,المنشئ,المطور} فقط  \n"
end
redis:set(black.."getidstatus"..msg.chat_id_, "Simple")
return  "❍ ** أهلا عزيزي "..msg.TheRankCmd.."\n❍ ** تم تعطيل الايدي بالصوره  \n" 
end 
function unlock_photos(msg)
if not msg.Director then
return "❍ ** هذا الامر يخص {المدير,المنشئ,المطور} فقط  \n"
end
redis:set(black.."getidstatus"..msg.chat_id_, "Photo")
return  "❍ ** أهلا عزيزي "..msg.TheRankCmd.."\n❍ ** تم تفعيل الايدي بالصوره \n" 
end
function cmds_on(msg)
if not msg.Creator then return "❍ ** هذا الامر يخص {المنشئ,المطور} فقط  \n"
end
redis:set(black..'lock:kara:'..msg.chat_id_,'on')
return "❍ ** أهلا عزيزي "..msg.TheRankCmd.."\n❍ ** تم تعطيل الرفع في المجموعه \n"
end
function cmds_off(msg)
if not msg.Creator then return "❍ ** هذا الامر يخص {المنشئ,المطور} فقط  \n"
end
redis:set(black..'lock:kara:'..msg.chat_id_,'off')
return "❍ ** أهلا عزيزي "..msg.TheRankCmd.."\n❍ ** تم تفعيل الرفع في المجموعه \n"
end

function lockjoin(msg)
if not msg.Admin then return "❍ *│* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n"
end
redis:set(black..'lock:join:'..msg.chat_id_,true)
return "*❍ ** أهلا عزيزي *"..msg.TheRankCmd.."*\n❍ ** تم قفل الدخول بالرابط \n*" 

end
function unlockjoin(msg)
if not msg.Admin then return "❍ ** هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n"
end
redis:del(black..'lock:join:'..msg.chat_id_)
return "*❍ ** أهلا عزيزي *"..msg.TheRankCmd.."*\n❍ ** تم فتح الدخول بالرابط \n*" 
end


local function iblack(msg,MsgText)

Channel = redis:get(black..'setch') or katrenno
--JoinChannel
function is_JoinChannel(msg)
if redis:get(black..'joinchnl') then
local url  = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender_user_id_)
if res ~= 200 then
end
Joinchanel = json:decode(url)
if not GeneralBanned((msg.adduser or msg.sender_user_id_)) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not msg.SudoUser then
function name(arg,data)
bd = '❍ اسمك  ('..(data.first_name_ or '')..')\n❍ معرفك (@'..(data.username_ or '')..')\n\n❍ اشترك بالقناه اولا \n❍ ثم ارجع استخدم الامر.'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'اشترك بالقناه .',url='https://telegram.me/'..Channel}}}   
send_inline(msg.chat_id_,bd,keyboard,'html')
end
getUser(msg.sender_user_id_,name)
else
return true
end
else
return true
end
end
if msg.type ~= 'pv' then

if MsgText[1] == "تفعيل" and not MsgText[2] then
redis:set(black.."getidstatus"..msg.chat_id_, "Photo")
redis:set(black..'lock:kara:'..msg.chat_id_,'off')
return modadd(msg)  
end

if MsgText[1] == "تعطيل" and not MsgText[2] then
return modrem(msg) 
end






if MsgText[1] == "تفعيل الايدي بالصوره" and not MsgText[2] then
return unlock_photos(msg)  
end
if MsgText[1] == "تعطيل الايدي بالصوره" and not MsgText[2] then
return lock_photos(msg) 
end
if MsgText[1] == "تعطيل الرفع" and not MsgText[2] then
return cmds_on(msg)  
end
if MsgText[1] == "تفعيل الرفع" and not MsgText[2] then
return cmds_off(msg) 
end

if MsgText[1] == "قفل الدخول بالرابط" and not MsgText[2] then
return lockjoin(msg)  
end
if MsgText[1] == "فتح الدخول بالرابط" and not MsgText[2] then
return unlockjoin(msg) 
end

end


if msg.type ~= 'pv' and msg.GroupActive then 

if MsgText[1] == 'شحن' and MsgText[2] then
if not msg.SudoUser then return "♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
if tonumber(MsgText[2]) > 0 and tonumber(MsgText[2]) < 1001 then
local extime = (tonumber(MsgText[2]) * 86400)
redis:setex(black..'ExpireDate:'..msg.chat_id_, extime, true)
if not redis:get(black..'CheckExpire::'..msg.chat_id_) then 
redis:set(black..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿\n🕵🏼️‍♀️│في مجموعه  » »  '..redis:get(black..'group:name'..msg.chat_id_))
else
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│عزيزي المطور ✋🏿\n👨🏻‍🔧│شحن الاشتراك يكون ما بين يوم الى 1000 يوم فقط 🍃')
end 
return false
end

if MsgText[1] == 'الاشتراك' and MsgText[2] then 
if not msg.SudoUser then return "♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
if MsgText[2] == '1' then
redis:setex(black..'ExpireDate:'..msg.chat_id_, 2592000, true)
if not redis:get(black..'CheckExpire::'..msg.chat_id_) then 
redis:set(black..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `30 يوم`  *(شهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم تفعيل الاشتراك  👍🏿\n📆│ الاشتراك » `30 يوم`  *(شهر)*')
end
if MsgText[2] == '2' then
redis:setex(black..'ExpireDate:'..msg.chat_id_,7776000,true)
if not redis:get(black..'CheckExpire::'..msg.chat_id_) then 
redis:set(black..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `90 يوم`  *(3 اشهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `90 يوم`  *(3 اشهر)*')
end
if MsgText[2] == '3' then
redis:set(black..'ExpireDate:'..msg.chat_id_,true)
if not redis:get(black..'CheckExpire::'..msg.chat_id_) then 
redis:set(black..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `مفتوح`  *(مدى الحياة)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `مفتوح`  *(مدى الحياة)*')
end 
return false
end


if MsgText[1] == 'الاشتراك' and not MsgText[2] and msg.Admin then
if not msg.Admin then return "♦️*│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
local check_time = redis:ttl(black..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*مـفـتـوح *🎖\n✓' end
year = math.floor(check_time / 31536000)
byear = check_time % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if tonumber(check_time) > 1 and check_time < 60 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..sec..'* ثانيه'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = '💳│`باقي من الاشتراك ` » » '..min..' *دقيقه و * *'..sec..'* ثانيه'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 31536000 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..year..'* سنه و *'..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه' end
return remained_expire
end


if MsgText[1] == "المجموعه" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(black..'group:name'..msg.chat_id_) or '')
redis:set(black..'linkGroup'..msg.chat_id_,(data.invite_link_ or ""))
return sendMsg(msg.chat_id_,msg.id_,
"❍ ❪ مـعـلومـات الـمـجـموعـه ❫\n\n"
.."*❍ * عدد الأعضاء ⇜ ❪ *"..data.member_count_.."* ❫"
.."\n*❍ * عدد المحظورين ⇜ ❪ *"..data.kicked_count_.."* ❫"
.."\n*❍ * عدد المشرفين ⇜ ❪ *"..data.administrator_count_.."* ❫"
.."\n*❍ * ايدي المجموعه ⇜ ❪"..msg.chat_id_.."❫"
.."\n\n❍ اسم المجموعه ⇜ ❪  ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")  ❫\n"
)
end,nil) 
return false
end

if MsgText[1] == "التفاعل" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="active"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="active"})
end  
return false
end

if MsgText[1] == "منع" then 
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return AddFilter(msg, MsgText[2]) 
end

if MsgText[1] == "الغاء منع" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return RemFilter(msg, MsgText[2]) 
end

if MsgText[1] == "قائمه المنع" then 
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return FilterXList(msg) 
end

if MsgText[1] == "الحمايه" then 
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return settingsall(msg) 
end

if MsgText[1] == "الاعدادات" then 
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return settings(msg) 
end

if MsgText[1] == "الوسائط" then 
if not msg.Admin then return "❍ *│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return media(msg) 
end

if MsgText[1] == "الادمنيه" then 
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return GetListAdmin(msg) 
end

if MsgText[1] == "تاك" then
if not msg.Admin then return "❍ ** هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 100
},function(ta,taha)
local t = "\n قائمة الاعضاء \n——————\n"
x = 0
local list = taha.members_
for k, v in pairs(list) do
users = redis:get(black..'user_names:'..v.user_id_) or v.user_id_
x = x + 1
t = t..""..x.." - {["..users.."](tg://user?id="..v.user_id_..")} \n"
end
send_msg(msg.chat_id_,t,msg.id_)
end,nil)
end

if (MsgText[1] == "نذار" and is_JoinChannel(msg)) then 
if not msg.Admin then return "❍ ** هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "تاك للكل" then 
if not msg.Admin then return "❍ ** هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "المنشى الاساسي" then 
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return MONSEBOT(msg) 
end

if MsgText[1] == "المدراء" then 
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return ownerlist(msg) 
end

if MsgText[1] == "المنشئ الاساسي" then 
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return Hussainlist(msg) 
end

if MsgText[1] == "المميزين" then 
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return whitelist(msg) 
end


if MsgText[1] == "صلاحياته" then 
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
if MsgText[1] == "صلاحياتي" then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Get_Info(msg,msg.chat_id_,msg.sender_user_id_)
end  
end
if MsgText[1] == "صلاحياته" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if tonumber(msg.reply_to_message_id_) == 0 then 
local username = MsgText[2]
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
return sendMsg(msg.chat_id_,msg.id_,'❍ المعرف غير صحيح \n')   
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
return sendMsg(msg.chat_id_,msg.id_,'❍ هاذا معرف قناة \n')   
end      
Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
if MsgText[1] == "فحص البوت" then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. msg.chat_id_ ..'&user_id='.. black..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end 
return sendMsg(msg.chat_id_,msg.id_,'\n❍ ًاهلا عزيزي البوت هنا ادمن بالقروب \n❍ وصلاحياته هي ↓ \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n❍ تغير معلومات المجموعه ↞ ❪ '..info..' ❫\n❍ حذف الرسائل ↞ ❪ '..delete..' ❫\n❍ حظر المستخدمين ↞ ❪ '..restrict..' ❫\n❍ دعوة مستخدمين ↞ ❪ '..invite..' ❫\n❍ تثبيت الرسائل ↞ ❪ '..pin..' ❫\n❍ اضافة مشرفين جدد ↞ ❪ '..promote..' ❫\n\n❍ ملاحضه » علامة ❪  ꪜ ❫ تعني لديه الصلاحية وعلامة ❪ ✘ ❫ تعني ليس ليديه الصلاحيه')   
end
end
end

if MsgText[1] == "تثبيت" and msg.reply_id then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(black..'lock_pin'..msg.chat_id_) then
return "لا يمكنك التثبيت الامر مقفول من قبل الاداره ."
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(black..":MsgIDPin:"..msg.chat_id_,msg.reply_id)
return sendMsg(msg.chat_id_,msg.id_,"❍ **ً أهلا عزيزي "..msg.TheRankCmd.." \n❍ ** تم تثبيت الرساله \n✓")
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** ًعذرا لا يمكنني التثبيت .\n❍ ** لست مشرف او لا املك صلاحيه التثبيت \n')    
end
end,nil)
end
return false
end

if MsgText[1] == "الغاء التثبيت" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not msg.Director and redis:get(black..'lock_pin'..msg.chat_id_) then
return "لا يمكنك الغاء التثبيت الامر مقفول من قبل الاداره"
else
local GroupID = msg.chat_id_:gsub('-100','')
tdcli_function({ID="UnpinChannelMessage",channel_id_ = GroupID},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"❍ **ًأهلا عزيزي "..msg.TheRankCmd.."  \n❍ ** تم الغاء تثبيت الرساله \n")    
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ **❍ عذراً لا يمكنني الغاء التثبيت .\n❍ ** لست مشرف او لا املك صلاحيه التثبيت \n')    
elseif data.ID == "Error" and data.code_ == 400 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** ًعذرا عزيزي '..msg.TheRankCmd..' .\n❍ ** لا توجد رساله مثبته لاقوم بازالتها \n')    
end
end,nil)
end
return false
end


if MsgText[1] == "تقييد" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="tqeed"}) 
end 
return false
end

if MsgText[1] == "فك التقييد" or MsgText[1] == "فك تقييد" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="fktqeed"}) 
end 
return false
end


if MsgText[1] == "رفع مميز" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then
if redis:get(black..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(black..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(black..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(black..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"❍ ** أهلا عزيزي "..msg.TheRankCmd.."\n❍ ** الرفع معطل \n")
end
return false
end


if MsgText[1] == "تنزيل مميز" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remwhitelist"})
end 
return false
end


if (MsgText[1] == "رفع المدير"  or MsgText[1] == "رفع مدير" ) then
if not msg.Creator then return "❍ **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
if not MsgText[2] and msg.reply_id then
if redis:get(black..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setowner"})
end
end
if redis:get(black..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setowner"})
end
end
if redis:get(black..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setowner"})
end
end
if redis:get(black..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"❍ ** أهلاً عزيزي "..msg.TheRankCmd.."\n❍ ** الرفع معطل \n")
end
return false
end


if (MsgText[1] == "تنزيل المدير" or MsgText[1] == "تنزيل مدير" ) then
if not msg.Creator then return "❍ **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remowner"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remowner"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remowner"})
end 
return false
end


if (MsgText[1] == "رفع منشى اساسي" or MsgText[1] == "رفع منشئ اساسي") then
if not msg.SudoUser then return "❍ **هذا الامر يخص {المطور,المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setkara"}) 
return false
end 
end

if (MsgText[1] == "تنزيل منشى اساسي" or MsgText[1] == "تنزيل منشئ اساسي") then
if not msg.SudoUser then return "❍ **هذا الامر يخص {المطور,المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remkara"}) 
return false
end 
end


if (MsgText[1] == "رفع منشى" or MsgText[1] == "رفع منشئ") then
if not msg.Kara then return "❍ **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setmnsha"})
end  
return false
end


if (MsgText[1] == "تنزيل منشى" or MsgText[1] == "تنزيل منشئ" ) then
if not msg.Kara then return "❍ **هذا الامر يخص {المطور,المنشى الاساسي فقط} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remmnsha"})
end 
return false
end


if MsgText[1] == "رفع ادمن" then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not MsgText[2] and msg.reply_id then
if redis:get(black..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="promote"})
end
end
if redis:get(black..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="promote"})
end
end
if redis:get(black..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="promote"})
end
end
if redis:get(black..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"❍ ** أهلا عزيزي "..msg.TheRankCmd.."\n❍ ** الرفع معطل \n")
end
return false
end



if MsgText[1] == "تنزيل ادمن" then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="demote"})
end 
return false
end



if MsgText[1] == "تنزيل الكل" then
if not msg.Creator then return "❍ **هذا الامر يخص {المطور,المنشئ} فقط  \n" end

local Admins = redis:scard(black..'admins:'..msg.chat_id_)
redis:del(black..'admins:'..msg.chat_id_)
local NumMDER = redis:scard(black..'owners:'..msg.chat_id_)
redis:del(black..'owners:'..msg.chat_id_)
local MMEZEN = redis:scard(black..'whitelist:'..msg.chat_id_)
redis:del(black..'whitelist:'..msg.chat_id_)

return "❍ أهلاً عزيزي "..msg.TheRankCmd.." ↓\n❍ تم تنزيل ❴ "..Admins.." ❵ من الادمنيه\n❍ تم تنزيل ❴ "..NumMDER.." ❵ من المدراء\n❍ تم تنزيل ❴ "..MMEZEN.." ❵ من المميزين\n\n❍ تم تـنـزيـل الـكـل بـنـجـاح\n" 
end


--{ Commands For locks }

if MsgText[1] == "قفل" then

if MsgText[2] == "الكل"		 then return lock_All(msg) end
if MsgText[2] == "الوسائط" 	 then return lock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 	 then return tqeed_photo(msg) end
if MsgText[2] == "الفيديو بالتقييد"  then return tqeed_video(msg) end
if MsgText[2] == "المتحركه بالتقييد" then return tqeed_gif(msg) end
if MsgText[2] == "التوجيه بالتقييد"  then return tqeed_fwd(msg) end
if MsgText[2] == "الروابط بالتقييد"  then return tqeed_link(msg) end
if MsgText[2] == "الدردشه"    	     then return mute_text(msg) end
if MsgText[2] == "المتحركه" 		 then return mute_gif(msg) end
if MsgText[2] == "الصور" 			 then return mute_photo(msg) end
if MsgText[2] == "الفيديو"			 then return mute_video(msg) end
if MsgText[2] == "البصمات" 		then  return mute_audio(msg) end
if MsgText[2] == "الصوت" 		then return mute_voice(msg) end
if MsgText[2] == "الملصقات" 	then return mute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return mute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return mute_forward(msg) end
if MsgText[2] == "الموقع"	 	then return mute_location(msg) end
if MsgText[2] == "الملفات" 		then return mute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return mute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return mute_inline(msg) end
if MsgText[2] == "الكيبورد" 	then return mute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return lock_link(msg) end
if MsgText[2] == "التاك" 		then return lock_tag(msg) end
if MsgText[2] == "المعرفات" 	then return lock_username(msg) end
if MsgText[2] == "التعديل" 		then return lock_edit(msg) end
if MsgText[2] == "الكلايش" 		then return lock_spam(msg) end
if MsgText[2] == "التكرار" 		then return lock_flood(msg) end
if MsgText[2] == "البوتات" 		then return lock_bots(msg) end
if MsgText[2] == "البوتات بالطرد" 	then return lock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return lock_markdown(msg) end
if MsgText[2] == "الويب" 		then return lock_webpage(msg) end 
if MsgText[2] == "التثبيت" 		then return lock_pin(msg) end 
end

--{ Commands For Unlocks }
if MsgText[1] == "فتح" 		then 
if MsgText[2] == "الكل" then return Unlock_All(msg) end
if MsgText[2] == "الوسائط" then return Unlock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 		then return fktqeed_photo(msg) 	end
if MsgText[2] == "الفيديو بالتقييد" 	then return fktqeed_video(msg) 	end
if MsgText[2] == "المتحركه بالتقييد" 	then return fktqeed_gif(msg) 	end
if MsgText[2] == "التوجيه بالتقييد" 	then return fktqeed_fwd(msg) 	end
if MsgText[2] == "الروابط بالتقييد" 	then return fktqeed_link(msg) 	end
if MsgText[2] == "المتحركه" 	then return unmute_gif(msg) 	end
if MsgText[2] == "الدردشه" 		then return unmute_text(msg) 	end
if MsgText[2] == "الصور" 		then return unmute_photo(msg) 	end
if MsgText[2] == "الفيديو" 		then return unmute_video(msg) 	end
if MsgText[2] == "البصمات" 		then return unmute_audio(msg) 	end
if MsgText[2] == "الصوت" 		then return unmute_voice(msg) 	end
if MsgText[2] == "الملصقات" 	then return unmute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return unmute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return unmute_forward(msg) end
if MsgText[2] == "الموقع" 		then return unmute_location(msg) end
if MsgText[2] == "الملفات" 		then return unmute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return unmute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return unmute_inline(msg) 	end
if MsgText[2] == "الكيبورد" 	then return unmute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return unlock_link(msg) 	end
if MsgText[2] == "التاك" 		then return unlock_tag(msg) 	end
if MsgText[2] == "المعرفات" 	then return unlock_username(msg) end
if MsgText[2] == "التعديل" 		then return unlock_edit(msg) 	end
if MsgText[2] == "الكلايش" 		then return unlock_spam(msg) 	end
if MsgText[2] == "التكرار" 		then return unlock_flood(msg) 	end
if MsgText[2] == "البوتات" 		then return unlock_bots(msg) 	end
if MsgText[2] == "البوتات بالطرد" 	then return unlock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return unlock_markdown(msg) end
if MsgText[2] == "الويب" 		then return unlock_webpage(msg) 	end
if MsgText[2] == "التثبيت" 		then return unlock_pin(msg) end 
end
 
if MsgText[1] == "انشاء رابط" then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(black..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(black..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(black..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"❍ **تم انشاء رابط جديد \n❍ ["..LinkGp.."]\n❍ لعرض الرابط ارسل { الرابط } \n")
else
return sendMsg(msg.chat_id_,msg.id_,"❍ لا يمكنني انشاء رابط للمجموعه .\n❍ لانني لست مشرف في المجموعه \n")
end
else
return sendMsg(msg.chat_id_,msg.id_,"❍ لقد قمت بانشاء الرابط سابقا .\n❍ ارسل { الرابط } لرؤيه الرابط  \n")
end
return false
end 

if MsgText[1] == "ضع رابط" then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:setex(black..'linkGroup'..msg.sender_user_id_,300,true)
return '❍ عزيزي قم برسال الرابط الجديد ...🍂'
end

if MsgText[1] == "الرابط" then
if not redis:get(black..'linkGroup'..msg.chat_id_) then 
return "❍ ** اوه لا يوجد رابط .\n❍ **لانشاء رابط ارسل { `انشاء رابط` }\n" 
end
local GroupName = redis:get(black..'group:name'..msg.chat_id_)
local GroupLink = redis:get(black..'linkGroup'..msg.chat_id_)
local LinkG = "["..GroupName.."]("..GroupLink..")"
return 
sendMsgg(msg.chat_id_,msg.id_,LinkG)
end
  

if MsgText[1] == "الرابط خاص" then
if not msg.Admin then return "❍ *│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
local GroupLink = redis:get(black..'linkGroup'..msg.chat_id_)
if not GroupLink then return "❍ ** اوه لا يوجد هنا رابط\n❍ *رجائا اكتب [ضع رابط]*" end
local Text = "❍ رابـط الـمـجـمـوعه ❍ \n"..Flter_Markdown(redis:get(black..'group:name'..msg.chat_id_)).." :\n\n["..GroupLink.."]\n"
local info, res = https.request(ApiToken..'/sendMessage?chat_id='..msg.sender_user_id_..'&text='..URL.escape(Text)..'&disable_web_page_preview=true&parse_mode=Markdown')
if res == 403 then
return "❍ **عذرا عزيزي \n❍ لم استطيع ارسالك الرابط لانك قمت بحظر البوت\n!"
elseif res == 400 then
return "❍ **عذرا عزيزي \n❍ لم استطيع ارسالك الرابط يجب عليك مراسله البوت اولا \n!"
end
if res == 200 then 
return "❍ **أهلاً عزيزي "..msg.TheRankCmd.."  \n❍ تم ارسال الرابط خاص لك ."
end
end


if MsgText[1] == "ضع القوانين" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:setex(black..'rulse:witting'..msg.sender_user_id_,300,true)
return '❍ حسننا عزيزي  .\n❍ الان ارسل القوانين  للمجموعه .'
end

if MsgText[1] == "القوانين" then
if not redis:get(black..'rulse:msg'..msg.chat_id_) then 
return "❍ **مرحباً عزيري القوانين كلاتي .\n❍ ممنوع نشر الروابط \n❍ ممنوع التكلم او نشر صور اباحيه \n❍ ممنوع  اعاده توجيه\n❍ ممنوع التكلم بالسياسة \n❍ الرجاء احترام المدراء والادمنيه\n"
else 
return "*❍ القوانين :*\n"..redis:get(black..'rulse:msg'..msg.chat_id_) 
end 
end


if MsgText[1] == "ضع تكرار" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return "❍ ** حدود التكرار ,  يجب ان تكون ما بين  *[2-50]*" 
end
redis:set(black..'flood'..msg.chat_id_,MsgText[2]) 
return "❍ ** تم وضع التكرار » { *"..MsgText[2].."* }"
end



if MsgText[1] == "مسح" then
if not MsgText[2] and msg.reply_id then 
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if 500 < tonumber(MsgText[2]) then return "❍ ** حدود المسح ,  يجب ان تكون ما بين  *[2-100]*" end
local DelMsg = MsgText[2] + 1
GetHistory(msg.chat_id_,DelMsg,function(arg,data)
All_Msgs = {}
for k, v in pairs(data.messages_) do
if k ~= 0 then
if k == 1 then
All_Msgs[0] = v.id_
else
table.insert(All_Msgs,v.id_)
end  
end 
end 
if tonumber(DelMsg) == data.total_count_ then
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*❍ * تـم مسح ←  { *"..MsgText[2].."* } من الرسائل  \n")
end,nil))
else
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*❍ * تـم مسح ←  { *"..MsgText[2].."* } من الرسائل  \n")
end,nil))
end
end)
return false
end

if MsgText[2] == "الادمنيه" then 
if not msg.Director then return "❍ *هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end

local Admins = redis:scard(black..'admins:'..msg.chat_id_)
if Admins ==0 then  
return "❍ ** اوه هنالك خطأ .\n❍ عذراً لا يوجد ادمنيه ليتم مسحهم ." 
end
redis:del(black..'admins:'..msg.chat_id_)
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."   \n❍ تم مسح {"..Admins.."} من الادمنيه في البوت \n"
end


if MsgText[2] == "قائمه المنع" then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local Mn3Word = redis:scard(black..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return "❍ ** عذراً لا توجد كلمات ممنوعه ليتم حذفها" 
end
redis:del(black..':Filter_Word:'..msg.chat_id_)
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."   \n❍ تم مسح {*"..Mn3Word.."*} كلمات من المنع"
end


if MsgText[2] == "القوانين" then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(black..'rulse:msg'..msg.chat_id_) then 
return "❍ عذراً لا يوجد قوانين ليتم مسحه \n!" 
end
redis:del(black..'rulse:msg'..msg.chat_id_)
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."   \n❍ تم حذف القوانين بنجاح"
end


if MsgText[2] == "الترحيب"  then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(black..'welcome:msg'..msg.chat_id_) then 
return "❍ ** اوه هنالك خطأ .\n❍ عذراً لا يوجد ترحيب ليتم مسحه ." 
end
redis:del(black..'welcome:msg'..msg.chat_id_)
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."   \n❍ تم حذف الترحيب بنجاح \n"
end


if MsgText[2] == "المنشئ الاساسي" then
if not msg.SudoUser then return "❍ **هذا الامر يخص {المطور} فقط  \n" end
local NumMnsha = redis:scard(black..':Hussain:'..msg.chat_id_)
if NumMnsha ==0 then 
return "❍ عذراً لا يوجد منشى اساسي \n!" 
end
redis:del(black..':Hussain:'..msg.chat_id_)
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."   \n❍  تم مسح {* "..NumMnsha.." *} المنشى الاساسي \n✓"
end


if MsgText[2] == "المنشئيين" then
if not msg.SudoUser then return "❍ **هذا الامر يخص {المطور} فقط  \n" end
local NumMnsha = redis:scard(black..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return "❍ عذراً لا يوجد منشئيين ليتم مسحهم \n!" 
end
redis:del(black..':MONSHA_BOT:'..msg.chat_id_)
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."   \n❍ تم مسح {* "..NumMnsha.." *} من المنشئيين\n"
end


if MsgText[2] == "المدراء" then
if not msg.Creator then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local NumMDER = redis:scard(black..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return "❍ عذراً لا يوجد مدراء ليتم مسحهم \n!" 
end
redis:del(black..'owners:'..msg.chat_id_)
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."   \n❍ تم مسح {* "..NumMDER.." *} من المدراء  \n"
end

if MsgText[2] == 'المحظورين' then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end

local list = redis:smembers(black..'banned:'..msg.chat_id_)
if #list == 0 then return "*❍ لا يوجد مستخدمين محظورين  *" end
message = '❍ ** قائمه الاعضاء المحظورين :\n'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(black..'banned:'..msg.chat_id_)
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."   \n❍  تم مسح {* "..#list.." *} من المحظورين  \n"
end

if MsgText[2] == 'المكتومين' then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local MKTOMEN = redis:scard(black..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "❍ ** لا يوجد مستخدمين مكتومين في المجموعه " 
end
redis:del(black..'is_silent_users:'..msg.chat_id_)
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."   \n❍ تم مسح {* "..MKTOMEN.." *} من المكتومين  \n"
end

if MsgText[2] == 'المميزين' then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local MMEZEN = redis:scard(black..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return "*❍ *لا يوجد مستخدمين مميزين في المجموعه " 
end
redis:del(black..'whitelist:'..msg.chat_id_)
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."   \n❍ تم مسح {* "..MMEZEN.." *} من المميزين  \n"
end


if MsgText[2] == 'الرابط' then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(black..'linkGroup'..msg.chat_id_) then
return "*❍ *لا يوجد رابط مضاف اصلا " 
end
redis:del(black..'linkGroup'..msg.chat_id_)
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."   \n❍ تم مسح رابط المجموعه \n"
end


end 
--End del 


if MsgText[1] == "ضع اسم" then
if not msg.Creator then return "❍ **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
redis:setex(black..'name:witting'..msg.sender_user_id_,300,true)
return "❍ حسننا عزيزي  .\n❍ الان ارسل الاسم  للمجموعه .\n"
end


if MsgText[1] == "مسح الصوره" then
if not msg.Creator then return "❍ **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
https.request(ApiToken.."/deleteChatPhoto?chat_id="..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'❍ تم مسح الصوره المجموعه .\n')
end


if MsgText[1] == "ضع صوره" then
if not msg.Creator then return "❍ **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then 
photo_id = data.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = data.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = GetInputFile(photo_id)},
function(arg,data)
if data.ID == "Ok" then
--return sendMsg(msg.chat_id_,msg.id_,'❍ تم تغيير صوره المجموعه ⠀\n')
elseif  data.code_ == 3 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ليس لدي صلاحيه تغيير الصوره \n❍ يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n')
end
end, nil)
end

end ,nil)
return false
else 
redis:setex(black..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return '❍ حسننا عزيزي .\n❍ الان قم بارسال الصوره\n' 
end 
end


if MsgText[1] == "ضع وصف" then 
if not msg.Creator then return "❍ **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
redis:setex(black..'about:witting'..msg.sender_user_id_,300,true) 
return "❍ حسننا عزيزي .\n❍ الان ارسل الوصف  للمجموعه\n" 
end


if MsgText[1] == "طرد البوتات" then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID="ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(msg.chat_id_,msg.id_,"❍ لا يـوجـد بـوتـات في الـمـجـمـوعـه .") 
else
local NumBot = 0
local NumBotAdmin = 0
for k, v in pairs(data.members_) do
if v.user_id_ ~= our_id then
kick_user(v.user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
NumBot = NumBot + 1
else
NumBotAdmin = NumBotAdmin + 1
end
local TotalBots = NumBot + NumBotAdmin  
if TotalBots  == Total - 1 then
local TextR  = "❍ عـدد الـبـوتات ❍⊱ {* "..(Total - 1).." *} ⊰❍\n\n"
if NumBot == 0 then 
TextR = TextR.."❍ لا يـمـكـن طردهم لانـهـم مشـرفـين .\n"
else
if NumBotAdmin >= 1 then
TextR = TextR.."❍ لم يتم طـرد {* "..NumBotAdmin.." *} بوت لأنهم مـشـرفين."
else
TextR = TextR.."❍ تم طـرد كــل البوتات بنجاح .\n"
end
end
return sendMsg(msg.chat_id_,msg.id_,TextR) 
end
end)
end
end
end

end,nil)

return false
end


if MsgText[1] == "كشف البوتات" then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = '❍ قـائمه البوتات الـحالية\n\n'
local NumBot = 0
for k, v in pairs(data.members_) do
GetUserID(v.user_id_,function(arg,data)
if v.status_.ID == "ChatMemberStatusEditor" then
BotAdmin = "» *♚*"
else
BotAdmin = ""
end

NumBot = NumBot + 1
AllBots = AllBots..NumBot..'- @['..data.username_..'] '..BotAdmin..'\n'
if NumBot == total then
AllBots = AllBots..[[

❍ لديك {]]..total..[[} بوتات
❍ ملاحظة : الـ ♚ تعنـي ان البوت مشرف في المجموعـة.]]
sendMsg(msg.chat_id_,msg.id_,AllBots) 
end

end,nil)
end

end,nil)
return false
end


if MsgText[1] == 'طرد المحذوفين' then
if not msg.Creator then return "❍ **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
sendMsg(msg.chat_id_,msg.id_,'❍ جارٍ البحث عن الحسابات المحذوفة ...')
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100','')
,offset_ = 0,limit_ = 200},function(arg,data)
if data.total_count_ and data.total_count_ <= 200 then
Total = data.total_count_ or 0
else
Total = 200
end
local NumMem = 0
local NumMemDone = 0
for k, v in pairs(data.members_) do 
GetUserID(v.user_id_,function(arg,datax)
if datax.type_.ID == "UserTypeDeleted" then 
NumMemDone = NumMemDone + 1
kick_user(v.user_id_,msg.chat_id_,function(arg,data)  
redis:srem(black..':MONSHA_BOT:'..msg.chat_id_,v.user_id_)
redis:srem(black..'whitelist:'..msg.chat_id_,v.user_id_)
redis:srem(black..'owners:'..msg.chat_id_,v.user_id_)
redis:srem(black..'admins:'..msg.chat_id_,v.user_id_)
end)
end
NumMem = NumMem + 1
if NumMem == Total then
if NumMemDone >= 1 then
sendMsg(msg.chat_id_,msg.id_,"❍ تم طـرد {* "..NumMemDone.." *} من الحسابات المحذوفه‏‏ .")
else
sendMsg(msg.chat_id_,msg.id_,'❍ لا يوجد حسابات محذوفه في المجموعه .')
end
end
end,nil)
end
end,nil)
return false
end  

if MsgText[1] == "ايدي" or MsgText[1]:lower() == "id" then
if not MsgText[2] and not msg.reply_id then

if redis:get(black..'lock_id'..msg.chat_id_) then 
local msgs = redis:get(black..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserNameID = "@"..data.username_.."" else UserNameID = "" end
local points = redis:get(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if points and points ~= "0" then
nko = points
else
nko = '0'
end
local rfih = (redis:get(black..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local NumGha = (redis:get(black..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local Namei = FlterName(data.first_name_..' '..(data.last_name_ or ""),20)
GetPhotoUser(msg.sender_user_id_,function(arg, data)
if redis:get(black.."getidstatus"..msg.chat_id_) == "Photo" then
	if data.photos_[0] then 
		ali = {'شهل صورة😍😌','لا قيمه للقمر امام وجهك🌚🥀','خليني احبك🙈❤️','ببكن خاص 🌚😹','نكبل 🙈♥','منور اليوم 😻','فديت الحلو🌚😹','شهل عسل ،₍🍯😻⁾ ','كلي يا حلو منين الله جابك🙈❤️','يهلا بلعافيه😍','مارتاحلك😐','تحبني؟🙈',
		}
		ssssys = ali[math.random(#ali)]
		if not redis:get("KLISH:ID") then
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,'✇-𝐍𝐀𝐌𝐄 :  ۦ'..Namei..'    \n✇-𝐔𝐒𝐄𝐑 : ۦ'..UserNameID..' .\n✇-𝐌𝐒𝐆𝐄⁞  : ۦ'..msgs..' .\n✇-𝐒𝐓𝐀•|• : ۦ '..msg.TheRank..' .\n✇-𝐈𝐃  ۦ'..msg.sender_user_id_..' .\n✇-𝐂𝐇 : ۦ @BLACK_TEAM_3 .\n▁',dl_cb,nil)
		else
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,"🎇│"..ssssys.."\n"..Text.."",dl_cb,nil)
		end
	else
		if not redis:get("KLISH:ID") then
		sendMsg(msg.chat_id_,msg.id_,'❍لا يمكنني عرض صورتك لانك قمت بحظر البوت او انك لاتملك صوره في بروفيلك ...!\n✇-𝐍𝐀𝐌𝐄 :  ۦ '..Namei..'  \n✇-𝐔𝐒𝐄𝐑 : ۦ'..UserNameID..' .\n✇-𝐌𝐒𝐆𝐄⁞  : ۦ  '..msgs..' .\n✇-𝐒𝐓𝐀•|• : ۦ'..msg.TheRank..' .\n✇-𝐈𝐃  ۦ'..msg.sender_user_id_..' .\n✇-𝐂𝐇 : ۦ @BLACK_TEAM_3 .\n▁')
		else
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Text))
		end
	end
else
	if redis:get("KLISH:ID") then
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Text))
		else
		sendMsg(msg.chat_id_,msg.id_,'❍الايدي بالصوره معطل \n❍✇-𝐍𝐀𝐌𝐄 :  ۦ '..Namei..'    \n✇-𝐔𝐒𝐄𝐑 : ۦ'..UserNameID..' .\n✇-𝐌𝐒𝐆𝐄⁞  : ۦ'..msgs..' .\n✇-𝐒𝐓𝐀•|• : ۦ'..msg.TheRank..' .\n✇-𝐈𝐃 ۦ : ۦ'..msg.sender_user_id_..' .\n✇-𝐂𝐇 ۦ : ۦ @BLACK_TEAM_3 .')
		end
end

end) 
end ,nil)
end
return false

end

if msg.reply_id and not MsgText[2] then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="iduser"})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="iduser"})
return false
end 
return false
end


if MsgText[1] == "cv" or MsgText[1]:lower() == "CV" or MsgText[1]:lower() == "Cv" or MsgText[1]:lower() == "cV" or MsgText[1]:lower() == "سيفي" or MsgText[1]:lower() == "سي في" then
if not MsgText[2] and not msg.reply_id then

if redis:get(black..'lock_id'..msg.chat_id_) then 
local msgs = redis:get(black..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserNameID = "@"..data.username_.."" else UserNameID = "" end
local points = redis:get(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if points and points ~= "0" then
nko = points
else
nko = '0'
end
local rfih = (redis:get(black..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local NumGha = (redis:get(black..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local Namei = FlterName(data.first_name_..' '..(data.last_name_ or ""),20)
GetPhotoUser(msg.sender_user_id_,function(arg, data)
if redis:get(black.."getidstatus"..msg.chat_id_) == "Photo" then
	if data.photos_[0] then 
		ali = {'شهل صورة😍😌','لا قيمه للقمر امام وجهك🌚🥀','خليني احبك🙈❤️','ببكن خاص 🌚😹','نكبل 🙈♥','منور اليوم 😻','فديت الحلو🌚😹','شهل عسل ،₍🍯😻⁾ ','كلي يا حلو منين الله جابك🙈❤️','يهلا بلعافيه😍','مارتاحلك😐','تحبني؟🙈',
		}
		ssssys = ali[math.random(#ali)]
		if not redis:get("KLISH:ID") then
		sendPhoto_Weloame(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,'✇-𝐍𝐀𝐌𝐄 :  ۦ'..NameBot'..'    '.\n✇-𝐂𝐇 : ۦ @BLACK_TEAM_3 .\n▁',dl_cb,nil)
	else
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendPhoto_Weloame(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].Photo_Weloame.persistent_id_,"🎇│"..ssssys.."\n"..Text.."",dl_cb,nil)
		end
	else
		if not redis:get("KLISH:ID") then
		sendMsg(msg.chat_id_,msg.id_,'❍لا يمكنني عرض صورتي لانك قمت بحظر البوت او انك لاتملك صوره في بروفيلك ...!\\n❍✇-𝐍𝐀𝐌𝐄 :  ۦ '..NameBot..'    .\n✇-𝐂𝐇 ۦ : ۦ @BLACK_TEAM_3 .')
    else
		Text = redis:get("KLISH:ID")
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendPhoto_Weloame(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].Photo_Weloame.persistent_id_,"🎇│"..ssssys.."\n"..Text.."",dl_cb,nil)
		else
		sendMsg(msg.chat_id_,msg.id_,'السي في بالصوره معطل \n❍✇-𝐍𝐀𝐌𝐄 :  ۦ '..NameBot..'    .\n✇-𝐂𝐇 ۦ : ۦ @BLACK_TEAM_3 .')
		end
end

end) 
end ,nil)
end
return false

end

if msg.reply_id and not MsgText[2] then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="iduser"})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="iduser"})
return false
end 
return false
end

if MsgText[1] == "الرتبه" and not MsgText[2] and msg.reply_id then 
return GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="rtba"})
end


if MsgText[1]== 'رسائلي' or MsgText[1] == 'رسايلي' or MsgText[1] == 'احصائياتي'  then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(black..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(black..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(black..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(black..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(black..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(black..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(black..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(black..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(black..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info =  " \n❍ ( الاحـصـائـيـات الـرسـائـلك )\n \n"
.."❍ الـرسـائـل ( "..msgs.." )\n"
.."❍ الـجـهـات ( "..NumGha.." )\n"
.."❍ الـصـور ( "..photo.." )\n"
.."❍ الـمـتـحـركـه ( "..animation.." )\n"
.."❍ الـمـلـصـقات ( "..sticker.." )\n"
.."❍ الـبـصـمـات ( "..voice.." )\n"
.."❍ الـصـوت ( "..audio.." )\n"
.."❍ الـفـيـديـو ( "..video.." )\n"
.."❍ الـتـعـديـل ( "..edited.." )\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'رسائلي'  then
local msgs = redis:get(black..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if rfih == 0 then  return "❍ **عذرا لا يوجد رسائل لك في البوت  ." end
redis:del(black..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_)
return "❍ **تم مسح {* "..msgs.." *} من رسائلك .\n"
end

if MsgText[1]== 'جهاتي' then
return '❍ **  عدد جهاتك المضافة‏‏ ⇜ ❪ '..(redis:get(black..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ❫ \n.'
end

if MsgText[1] == 'مسح' and MsgText[2] == 'جهاتي'  then
local adduser = redis:get(black..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
if adduser == 0 then  return "❍ **عذرا ليس لديك جهات لكي يتم مسحها" end
redis:del(black..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) 
return "❍ **تم مسح {* "..adduser.." *} من جهاتك\n✓"
end

if MsgText[1]== 'اسمي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local FlterName = FlterName(data.first_name_..'\n\n-اسمك الثاني ⇜ '..(data.last_name_ or ""),90)
local Get_info = "-اسمك الاول ⇜ \n "..FlterName.." \n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'نقاطي'  then
local points = redis:get(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
if points == 0 then  return "❍ **عذرا ليس لديك نقاط لكِ يتم مسحها" end
redis:del(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
return "❍ **تم مسح {* "..points.." *} من نقاطك\n"
end

if MsgText[1] == 'معلوماتي' or MsgText[1] == 'موقعي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(black..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(black..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(black..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(black..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(black..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(black..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(black..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(black..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(black..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="❍ اهلاً بك في معلوماتك . \n"
.."————————————————\n"
.."❍ الأسم ( "..FlterName(data.first_name_..' '..(data.last_name_ or ""),25).." )\n"
.."❍ المعرف ( "..ResolveUser(data).." )\n"
.."❍ الأيدي ( `"..msg.sender_user_id_.."` )\n"
.."❍ رتبتك ( "..msg.TheRank.." )\n"
.."❍ ـ ( `"..msg.chat_id_.."` )\n"
.."————————————————\n"
.." ❍ الأحصائيات الرسائل .\n"
.."❍ الرسائل ( `"..msgs.."` )\n"
.."❍ الجهات ( `"..NumGha.."` )\n"
.."❍ الصور ( `"..photo.."` )\n"
.."❍ المتحركه ( `"..animation.."` )\n"
.."❍ الملصقات ( `"..sticker.."` )\n"
.."❍ البصمات ( `"..voice.."` )\n"
.."❍ الصوت ( `"..audio.."` )\n"
.."❍ الفيديو ( `"..video.."` )\n"
.."❍ التعديل (`"..edited.."` )\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "مسح معلوماتي" then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:del(black..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:del(black..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:del(black..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:del(black..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:del(black..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:del(black..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:del(black..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:del(black..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:del(black..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="❍ أهلاً عزيزي تم مسح جميع معلوماتك "
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "تفعيل" then

if MsgText[2] == "الردود" 	then return unlock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return unlock_brod(msg) end
if MsgText[2] == "الايدي" 	then return unlock_ID(msg) end
if MsgText[2] == "االترحيب" 	then return unlock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return unlock_waring(msg) end 
end




if MsgText[1] == "تعطيل" then

if MsgText[2] == "الردود" 	then return lock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return lock_brod(msg) end
if MsgText[2] == "الايدي" 	then return lock_ID(msg) end
if MsgText[2] == "االترحيب" 	then return lock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return lock_waring(msg) end
end


if MsgText[1] == "ضع الترحيب" then 
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:set(black..'welcom:witting'..msg.sender_user_id_,true) 
return "❍ حسننا عزيزي .\n❍ ارسل كليشه الترحيب الان\n\n❍ ملاحظه تستطيع اضافه دوال للترحيب مثلا :\n❍ أظهار قوانين المجموعه  » *{القوانين}*  \n❍  أظهار الاسم العضو » *{الاسم}*\n❍ أظهار المعرف العضو » *{المعرف}*\n❍ أظهار اسم المجموعه » *{المجموعه}*" 
end


if MsgText[1] == "الترحيب" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if redis:get(black..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(black..'welcome:msg'..msg.chat_id_))
else 
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."  \n❍ نورت المجموعه \n" 
end 
end


if MsgText[1] == "كشف"  then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="whois"})
return false
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="whois"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="whois"}) 
return false
end 
end


if MsgText[1] == "طرد" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kick"})  
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="kick"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="kick"}) 
return false
end 
end


if MsgText[1] == "حظر" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="ban"}) 
return false
end 
end


if (MsgText[1] == "الغاء الحظر" or MsgText[1] == "الغاء حظر") and msg.Admin then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="uban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unban"})
return false
end 
end


if MsgText[1] == "كتم" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="silent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="silent"}) 
return false
end 
end


if MsgText[1] == "الغاء الكتم" or MsgText[1] == "الغاء كتم" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unsilent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unsilent"}) 
return false
end 
end

if MsgText[1] == "المكتومين" then 
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return MuteUser_list(msg) 
end

if MsgText[1] == "المحظورين" then 
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return GetListBanned(msg) 
end

if MsgText[1] == "رفع الادمنيه" then
if not msg.Creator then return "❍ **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
return set_admins(msg) 
end

end -- end of insert group 


if MsgText[1] == 'مسح' and MsgText[2] == 'المطورين'  then
if not msg.SudoBase then return"❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" end
local mtwren = redis:scard(black..':SUDO_BOT:')
if mtwren == 0 then  return "❍ ** عذراً لا يوجد مطورين في البوت ." end
redis:del(black..':SUDO_BOT:') 
return "❍ ** تم مسح {* "..mtwren.." *} من المطورين .\n"
end

if MsgText[1] == 'مسح' and MsgText[2] == "قائمه العام"  then
if not msg.SudoBase then return"❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" end
local addbannds = redis:scard(black..'gban_users')
if addbannds ==0 then 
return "*❍ قائمة الحظر فارغه .*" 
end
redis:del(black..'gban_users') 
return "❍ ** تـم مـسـح { *"..addbannds.." *} من قائمه العام\n" 
end 

if msg.SudoBase then

if MsgText[1] == "رفع مطور" then
if not msg.SudoBase then return "❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="up_sudo"}) 
return false
end 
end

if MsgText[1] == "تنزيل مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="dn_sudo"}) 
return false
end 
end

if MsgText[1] == "تنظيف المجموعات" or MsgText[1] == "تنظيف المجموعات 🗑" then
local groups = redis:smembers(black..'group:ids')
local GroupsIsFound = 0
for i = 1, #groups do 
GroupTitle(groups[i],function(arg,data)
if data.code_ and data.code_ == 400 then
rem_data_group(groups[i])
print(" Del Group From list ")
else
print(" Name Group : "..data.title_)
GroupsIsFound = GroupsIsFound + 1
end
print(GroupsIsFound..' : '..#groups..' : '..i)
if #groups == i then
local GroupDel = #groups - GroupsIsFound 
if GroupDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'❍ ** جـيـد , لا توجد مجموعات وهميه \n')
else
sendMsg(msg.chat_id_,msg.id_,'❍ ** عدد المجموعات ❍⊱ { *'..#groups..'*  } ⊰❍\n❍ ** تـم تنظيف  ❍⊱ { *'..GroupDel..'*  } ⊰❍ مجموعه \n❍ ** اصبح العدد الحقيقي الان ❍⊱ { *'..GroupsIsFound..'*  } ⊰❍ مجموعه')
end
end
end)
end
return false
end
if MsgText[1] == "تنظيف المشتركين" or MsgText[1] == "تنظيف المشتركين 🗑" then
local pv = redis:smembers(black..'users')
local NumPvDel = 0
for i = 1, #pv do
GroupTitle(pv[i],function(arg,data)
sendChatAction(pv[i],"Typing",function(arg,data)
if data.ID and data.ID == "Ok"  then
print("Sender Ok")
else
print("Failed Sender Nsot Ok")
redis:srem(black..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
if NumPvDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'❍ جـيـد , لا يوجد مشتركين وهمي')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'❍ ** عدد المشتركين ❍⊱ { *'..#pv..'*  } ⊰❍\n❍ ** تـم تنظيف  ❍⊱ { *'..NumPvDel..'*  } ⊰❍ مشترك \n❍ ** اصبح العدد الحقيقي الان ❍⊱ { *'..SenderOk..'*  } ⊰❍ من المشتركين') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "ضع صوره للترحيب" or MsgText[1]=="ضع صوره للترحيب 🌄" then
redis:setex(black..'welcom_ph:witting'..msg.sender_user_id_,300,true) 
return'❍ حسننا عزيزي .\n❍ الان قم بارسال الصوره للترحيب \n' 
end

if MsgText[1] == "تعطيل" and MsgText[2] == "البوت خدمي" then
return lock_service(msg) 
end

if MsgText[1] == "تفعيل" and MsgText[2] == "البوت خدمي" then 
return unlock_service(msg) 
end

if MsgText[1] == "صوره الترحيب" then
local Photo_Weloame = redis:get(black..':WELCOME_BOT')
if Photo_Weloame then
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[❍ اهلا انا بوت]]..redis:get(black..':NameBot:')..[[ .
❍ اختصاصي حماية‌‏ المجموعات
❍ مـن السبام والتوجيه‌‏ والتكرار والخ...

❍ مـعـرف الـمـطـور  » ]]..SUDO_USER:gsub([[\_]],'_')..[[ .
]])

return false
else
return "❍ لا توجد صوره مضافه للترحيب في البوت \n❍ لاضافه صوره الترحيب ارسل `ضع صوره للترحيب`"
end
end

if MsgText[1] == "ضع كليشه المطور" then 
redis:setex(black..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return '❍ حسننا عزيزي .\n❍ الان قم بارسال الكليشه \n' 
end

if MsgText[1] == "ضع شرط التفعيل" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(black..':addnumberusers',MsgText[2]) 
return '❍ ** تم وضـع شـرط التفعيل البوت اذا كانت المجموعه‏‏ اكثر مـن *【'..MsgText[2]..'】* عضـو  .\n' 
end

if MsgText[1] == "شرط التفعيل" then 
return'❍ ** شـرط التفعيل البوت اذا كانت المجموعه‏‏ اكثر مـن *【'..redis:get(black..':addnumberusers')..'】* عضـو .\n' 
end 
end

if MsgText[1] == 'المجموعات' or MsgText[1] == "المجموعات 🌋" then
if not msg.SudoUser then return "❍ **هذا الامر يخص {المطور} فقط  \n" end
return '❍ ** عدد المجموعات المفعلة » `'..redis:scard(black..'group:ids')..'`  ➼' 
end

if MsgText[1] == "المشتركين" or MsgText[1] == "المشتركين Ⓜ" then
if not msg.SudoUser then return "❍ **هذا الامر يخص {المطور} فقط  \n" end
return '❍ **عدد المشتركين في البوت : `'..redis:scard(black..'users')..'` \n'
end

if MsgText[1] == 'قائمه المجموعات' then 
if not msg.SudoBase then return "❍ **هذا الامر يخص {المطور} فقط  \n" end
return chat_list(msg) 
end

if MsgText[1] == 'تعطيل' and MsgText[2] and MsgText[2]:match("-100(%d+)") then
if not msg.SudoUser then return "❍ **هذا الامر يخص {المطور} فقط  \n" end
if redis:sismember(black..'group:ids',MsgText[2]) then
local name_gp = redis:get(black..'group:name'..MsgText[2])
sendMsg(MsgText[2],0,'❍ ** تم تعطيل المجموعه بأمر من المطور  \n❍ ** سوف اغادر ...\n✘')
rem_data_group(MsgText[2])
StatusLeft(MsgText[2],our_id)
return '❍ ** تم تعطيل المجموعه ومغادرتها \n❍ ** المجموعة » ['..name_gp..']\n❍ ** الايدي » ( *'..MsgText[2]..'* )\n'
else 
return '❍ ** لا توجد مجموعه مفعله بهذا الايدي .\n ' 
end 
end 

if MsgText[1] == 'المطور' then
return redis:get(black..":TEXT_SUDO") or '❍ لا توجد كليشه المطور .\n❍ يمكنك اضافه كليشه من خلال الامر\n       " `ضع كليشه المطور` " \n'
end

if MsgText[1] == "اذاعه بالتثبيت"  or MsgText[1] =="ااذاعه بالتثبيت ♥" then
if not msg.SudoUser then return"❍ **هذا الامر يخص {المطور} فقط  \n🚶" end
if not msg.SudoBase and not redis:get(black..'lock_brod') then return "❍ ** الاذاعه مقفوله من قبل المطور الاساسي ." end
redis:setex(black..':prod_pin:'..msg.chat_id_..msg.sender_user_id_,300, true) 
return "❍ حسننا الان ارسل الكليشه للاذاعه بالتثبيت  \n ♥" 
end

if MsgText[1] == "المطورين" or MsgText[1] == "المطورين 🔥" then
if not msg.SudoUser then return"❍ **هذا الامر يخص {المطور} فقط  \n❍ " end
return sudolist(msg) 
end
 
if MsgText[1] == "قائمه العام" or MsgText[1]=="قائمه العام 📜" then 
if not msg.SudoUser then return"❍ **هذا الامر يخص {المطور} فقط  \n" end
return GetListGeneralBanned(msg) 
end

if MsgText[1] == "تعطيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل ✖️") then 
if not msg.SudoBase then return"❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" end
return lock_twasel(msg) 
end

if MsgText[1] == "تفعيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل 🔛") then 
if not msg.SudoBase then return"❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" end
return unlock_twasel(msg) 
end

if MsgText[1] == "حظر عام" then
if not msg.SudoBase then 
return "❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" 
end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="banall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="bandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="banall"}) 
return false
end 
end

if MsgText[1] == "الغاء العام" or MsgText[1] == "الغاء عام" then
if not msg.SudoBase then return"❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unbanall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unbandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unbanall"}) 
return false
end 
end 

if MsgText[1] == "رتبتي" then return '❍ ** رتبتك هنا 𖣄 ←  ( '..msg.TheRank..' )\n' end

----------------- استقبال الرسائل ---------------
if MsgText[1] == "الغاء الامر ✖️" or MsgText[1] == "الغاء" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:del(black..'welcom:witting'..msg.sender_user_id_,
black..'rulse:witting'..msg.sender_user_id_,
black..'rulse:witting'..msg.sender_user_id_,
black..'name:witting'..msg.sender_user_id_,
black..'about:witting'..msg.sender_user_id_,
black..'fwd:all'..msg.sender_user_id_,
black..'fwd:pv'..msg.sender_user_id_,
black..'fwd:groups'..msg.sender_user_id_,
black..':prod_pin:'..msg.chat_id_..msg.sender_user_id_,
black..'namebot:witting'..msg.sender_user_id_,
black..'addrd_all:'..msg.sender_user_id_,
black..'delrd:'..msg.sender_user_id_,
black..'addrd:'..msg.sender_user_id_,
black..'delrdall:'..msg.sender_user_id_,
black..'text_sudo:witting'..msg.sender_user_id_,
black..'addrd:'..msg.chat_id_..msg.sender_user_id_,
black..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return '❍ ** تم إلغاء الأمر بنجاح .  \n'
end  


if (MsgText[1] ==  'تحديث السورس'  or MsgText[1] ==  'تحديث السورس 🔂' ) then
if not msg.SudoBase then return "*│*هذا الامر يخص {المطور الاساسي} فقط  \n" end
local GetVerison = https.request( 'https://raw.githubusercontent.com/black1eljoker1/blackfiles/main/GetVersion.txt' ) or 0
print(GetVerison.." > "..version)
if GetVerison > version then
UpdateSourceStart = true
sendMsg(msg.chat_id_,msg.id_,' *╿* يوجد تحديث جديد الان \n*╽* جاري تنزيل وتثبيت التحديث  ...' )
redis:set(black..":VERSION",GetVerison)
return false
else
return "╿الاصدار الحالي : *v"..version.."* \n*╽* لديـك احدث اصدار \n"
end
return false
end

if MsgText[1] == 'اصدار السورس' or MsgText[1] == 'الاصدار' then
return '❍ اصدار سورس بلاك : *v'..version..'* \n'
end



if MsgText[1] == 'نسخه احتياطيه للمجموعات' then
if not msg.SudoBase then return"❍ *│*هذا الامر يخص {المطور الاساسي} فقط  \n" end
return buck_up_groups(msg)
end 

if MsgText[1] == 'رفع نسخه الاحتياطيه' then
if not msg.SudoBase then return "❍ *│*هذا الامر يخص {المطور الاساسي} فقط  \n" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessageDocument' then
local file_name = data.content_.document_.file_name_
if file_name:match('.json')then
if file_name:match('@[%a%d_]+.json') then
if file_name:lower():match('@[%a%d_]+') == Bot_User:lower() then 
io.popen("rm -f ../.telegram-cli/data/document/*")
local file_id = data.content_.document_.document_.id_ 
tdcli_function({ID = "DownloadFile",file_id_ = file_id},function(arg, data) 
if data.ID == "Ok" then
Uploaded_Groups_Ok = true
Uploaded_Groups_CH = msg.chat_id_
Uploaded_Groups_MS = msg.id_
print(Uploaded_Groups_CH)
print(Uploaded_Groups_MS)
sendMsg(msg.chat_id_,msg.id_,'❍ ** جارٍ رفع النسخه انتظر قليلا ... \n')
end
end,nil)
else 
sendMsg(msg.chat_id_,msg.id_,"❍ ** عذراً النسخه الاحتياطيه هذا ليست للبوت » ["..Bot_User.."]  \n")
end
else 
sendMsg(msg.chat_id_,msg.id_,'❍ ** عذراً اسم الملف غير مدعوم للنظام او لا يتوافق مع سورس بلاك يرجاء جلب الملف الاصلي الذي قمت بسحبه وبدون تعديل ع الاسم\n')
end  
else
sendMsg(msg.chat_id_,msg.id_,'❍ ** عذراً الملف ليس بصيغه Json !?\n')
end 
else
sendMsg(msg.chat_id_,msg.id_,'❍ ** عذراً هذا ليس ملف النسحه الاحتياطيه للمجموعات\n')
end 
end,nil)
else 
return "❍ ** ارسل ملف النسخه الاحتياطيه اولا\n❍ ** ثم قم بالرد على الملف وارسل \" `رفع نسخه الاحتياطيه` \" "
end 
return false
end

if (MsgText[1]=="تيست" or MsgText[1]=="test") then 
if not msg.SudoBase then return"❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" end
return "❍ البوت شـغــال ." 
end

if (MsgText[1]== "ايدي" or MsgText[1]=="ID") and msg.type == "pv" then return  "\n❍ اهلاً عزيزي المطور ايديك :\n\n❍ "..msg.sender_user_id_.."\n"  end

if MsgText[1]== "قناة السورس" and msg.type == "pv" then
local inline = {{{text="-قنآهہ‏‏ آلسـورس اضـغـط هـنـآ ",url="https://t.me/BLACK_TEAM_3"}}}
send_key(msg.sender_user_id_,'   [قناة سورس : بلاك](https://t.me/BLACK_TEAM_3)' ,nil,inline,msg.id_)
return false
end

if MsgText[1]== "المبرمج جاك" and msg.type == "pv" then
local inline = {{{text="-مبرمج آلسـورس اضـغـط هـنـآ ",url="https://t.me/V_P_E"}}}
send_key(msg.sender_user_id_,'   [مبرمج السورس جاك](https://t.me/V_P_E)' ,nil,inline,msg.id_)
return false
end

if MsgText[1]== "المطور الجوكر" and msg.type == "pv" then
local inline = {{{text="-مطور السورس اضـغـط هـنـآ ",url="https://t.me/A_j_o_k_e_r"}}}
send_key(msg.sender_user_id_,'   [مطور السورس](https://t.me/A_j_o_k_e_r)' ,nil,inline,msg.id_)
return false
end

if MsgText[1]== "رفع نسخه الاحتياطيه" and msg.type == "pv" then
local inline = {{{text="-رفع نسخه الاحتياطيه "}}}
send_key(msg.sender_user_id_,'   [رفع نسخه الاحتياطيه)' ,nil,inline,msg.id_)
return false
end

if MsgText[1]== "مصنع بوتات المبرمج" and msg.type == "pv" then
local inline = {{{text="-مصنع بوتات المبرمج ",url="https://t.me/J_A_C_K_0_Bot"}}}
send_key(msg.sender_user_id_,'   [مصنع بوتات المبرمج](https://t.me/J_A_C_K_0_Bot)' ,nil,inline,msg.id_)
return false
end

if (MsgText[1]== "الاحصائيات 💥" or MsgText[1]=="الاحصائيات") then
if not msg.SudoBase then return"❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" end
return '❍ الاحصائيات . \n\n❍ **عدد المجموعات المفعله : '..redis:scard(black..'group:ids')..'\n❍ **عدد المشتركين في البوت : '..redis:scard(black..'users')..'\n'
end
---------------[End Function data] -----------------------
if MsgText[1]=="اضف رد عام" or MsgText[1]=="اضف رد عام ➕" then
if not msg.SudoBase then return"❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(black..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,300,true)
redis:del(black..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
return "❍ حسننا الان ارسل كلمة الرد العام .\n"
end


if MsgText[1]== 'مسح' and MsgText[2]== 'الردود' then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local names 	= redis:exists(black..'replay:'..msg.chat_id_)
local photo 	= redis:exists(black..'replay_photo:group:'..msg.chat_id_)
local voice 	= redis:exists(black..'replay_voice:group:'..msg.chat_id_)
local imation   = redis:exists(black..'replay_animation:group:'..msg.chat_id_)
local audio	 	= redis:exists(black..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:exists(black..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:exists(black..'replay_video:group:'..msg.chat_id_)
if names or photo or voice or imation or audio or sticker or video then
redis:del(black..'replay:'..msg.chat_id_,black..'replay_photo:group:'..msg.chat_id_,black..'replay_voice:group:'..msg.chat_id_,
black..'replay_animation:group:'..msg.chat_id_,black..'replay_audio:group:'..msg.chat_id_,black..'replay_sticker:group:'..msg.chat_id_,black..'replay_video:group:'..msg.chat_id_)
return "❍ تم مسح كل الردود ."
else
return '❍ ** لا يوجد ردود ليتم مسحها \n'
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود العامه' then
if not msg.SudoBase then return"❍ للمطورين فقط ." end
local names 	= redis:exists(black..'replay:all')
local photo 	= redis:exists(black..'replay_photo:group:')
local voice 	= redis:exists(black..'replay_voice:group:')
local imation 	= redis:exists(black..'replay_animation:group:')
local audio 	= redis:exists(black..'replay_audio:group:')
local sticker 	= redis:exists(black..'replay_sticker:group:')
local video 	= redis:exists(black..'replay_video:group:')
if names or photo or voice or imation or audio or sticker or video then
redis:del(black..'replay:all',black..'replay_photo:group:',black..'replay_voice:group:',black..'replay_animation:group:',black..'replay_audio:group:',black..'replay_sticker:group:',black..'replay_video:group:')
return "❍ تم مسح كل الردود العامه ."
else
return "❍ لا يوجد ردود عامه ليتم مسحها ."
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد عام' then
if not msg.SudoBase then return"❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:set(black..'delrdall:'..msg.sender_user_id_,true) 
return "❍ حسننا عزيزي  .\n❍ الان ارسل الرد لمسحها من  المجموعات ."
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد' then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:set(black..'delrd:'..msg.sender_user_id_,true)
return "❍ حسننا عزيزي  .\n❍ الان ارسل الرد لمسحها من  للمجموعه ."
end

if MsgText[1]== 'الردود' then
if not msg.Director then return "❍ *│*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local names  	= redis:hkeys(black..'replay:'..msg.chat_id_)
local photo 	= redis:hkeys(black..'replay_photo:group:'..msg.chat_id_)
local voice  	= redis:hkeys(black..'replay_voice:group:'..msg.chat_id_)
local imation 	= redis:hkeys(black..'replay_animation:group:'..msg.chat_id_)
local audio 	= redis:hkeys(black..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:hkeys(black..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:hkeys(black..'replay_video:group:'..msg.chat_id_)
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '❍ **لا يوجد ردود مضافه حاليا \n' 
end
local ii = 1
local message = '❍ **ردود البوت في المجموعه  :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره ) \n' 	 ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص ) \n'  	 ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..  voice[i]..' *}_*( بصمه ) \n' 	 ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه ) \n' ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه ) \n'  ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق ) \n' 	 ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو ) \n' ii = ii + 1 end
return message..'\n➖➖➖'
end

if MsgText[1]== 'الردود العامه' or MsgText[1]=='الردود العامه 🗨' then
if not msg.SudoBase then return "❍ للمطور فقط ." end
local names 	= redis:hkeys(black..'replay:all')
local photo 	= redis:hkeys(black..'replay_photo:group:')
local voice 	= redis:hkeys(black..'replay_voice:group:')
local imation 	= redis:hkeys(black..'replay_animation:group:')
local audio 	= redis:hkeys(black..'replay_audio:group:')
local sticker 	= redis:hkeys(black..'replay_sticker:group:')
local video 	= redis:hkeys(black..'replay_video:group:')
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '❍ **لا يوجد ردود مضافه حاليا \n' 
end
local ii = 1
local message = '❍ **الردود العامه في البوت :   :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره ) \n' 	ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص ) \n'  	ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..	voice[i]..' *}_*( بصمه ) \n' 	ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه ) \n'ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه ) \n' ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق ) \n' 	ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو ) \n'ii = ii + 1 end
return message..'\n➖➖➖'
end


if MsgText[1]=="اضف رد" and msg.GroupActive then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:setex(black..'addrd:'..msg.chat_id_..msg.sender_user_id_,300,true) 
redis:del(black..'replay1'..msg.chat_id_..msg.sender_user_id_)
return "❍ حسننا , الان ارسل كلمه الرد \n"
end

if MsgText[1] == "ضع اسم للبوت" or MsgText[1]== 'ضع اسم للبوت ©' then
if not msg.SudoBase then return"❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(black..'namebot:witting'..msg.sender_user_id_,300,true)
return"❍ حسننا عزيزي .\n❍ الان ارسل الاسم  للبوت ."
end



if MsgText[1] == 'server' then
if not msg.SudoUser then return "❍ للمطور فقط." end
return io.popen([[

linux_version=`lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '📟 ❪ Seystem ❫\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*❍ ❪ Memory ❫\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*❍ ❪ HardDisk ❫\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*❍ ❪ Processor ❫\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*❍ ❪ Server[_]Login ❫\n*»» '`whoami`'*'
echo '*------------------------------\n*❍ ❪ Uptime ❫  \n*»» '"$uptime"'*'
]]):read('*all')
end


if MsgText[1] == 'السيرفر' then
if not msg.SudoUser then return "❍ للمطور فقط." end
return io.popen([[

linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo ' ( نظام التشغيل )\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*❍ ( الذاكره العشوائيه )\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*❍ ( وحـده الـتـخـزيـن )\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*❍ ( الـمــعــالــج )\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*❍ ❪ الــدخــول ❫\n*»» '`whoami`'*'
echo '*------------------------------\n*❍( مـده تـشغيـل الـسـيـرفـر )  \n*»» '"$uptime"'*'
]]):read('*all')
end


if msg.type == 'channel' and msg.GroupActive then
if MsgText[1] == "الاوامر" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❍ " end
return [[
‌‌‏‌‌‏‌‏    ‌‌‏‌‌‏‌‌‌‌‏                                    
    ⋆  الاوامر العامـه‌‏ :
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 【▣】م1 ➢ اوامر الإداره .‌‏
 【▣】م2 ➢ اوامر اعدادات المجمّوعه .‌‏
 【▣】م3 ➢ اوامر الحِمايـه .
 【▣】م4 ➢ اوامر الخِدمـه .
 【▣】م5 ➢ اوامر التسـليه .
 【▣】م6 ➢ اوامر التعَطيل و التفَعيل .
 【▣】م7 ➢ اوامر الوضع للمجموعه .
 【▣】م8 ➢ اوامر التسليه الجديده .
 【▣】م9 ➢ اوامر الروايات .
 【▣】م10 ➢ اوامر تريمكس .
 【▣】م المطور ➢ اوامر آلمـطـور .
 【▣】  اوامر الرد ➢ لاضـافة‌‏ رد مـعين .
 【▣】الوسائط ➢ لمعرفه الاعدادات 
 【▣】الاعدادات ➢ اعدادات المجموعه .
 【▣】السورس ➢ سورس البوت
 【▣】المطور  ➢ مطور البوت
 ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ⋆ يُـوزر المّـطور ➢{ ]]..SUDO_USER..[[ } ✓ ]]
end
if MsgText[1]== 'م1' then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❍ " end
local text =[[     
١ ⋆ اوامـر الرفع و التنزيل .
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 【▣】رفع ⟷ تنزيل مـدير .
 【▣】رفع ⟷  تنزيل ادمن .
 【▣】رفع ⟷ تنزيل مميز .
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
       ٢ ⋆ اوامـر المسح للمنشئ .
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 【▣】مسح الادمنـيـه ➢ لمسح الادمنيه
 【▣】مسح المميزين ➢ لمسح المميزين 
 【▣】مسح المـــدراء ➢ لمسح المدراء 
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
      ٣ ⋆ اوامـر الحظـر والطــرد والتقييد .
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 【▣】حظر بالرد ⟷ بالمعرف ➢ لحظر العضو
 【▣】الغاء الحظر بالرد ⟷ بالمعرف ➢ لالغاء الحظر 
 【▣】طرد بالرد ⟷ بالمعرف ➢ لطرد العضو
 【▣】كتم بالرد ⟷ بالمعرف ➢ لكتم العضو 
 【▣】الغاء الكتم بالرد ⟷ بالمعرف ➢ لالغاء الكتم 
  【▣】تقييد بالرد  ⟷ بالمعرف ➢ لتقييد العضو
 【▣】فك التقييد  بالرد ⟷ بالمعرف ➢ لالغاء تقييد العضو
  【▣】منع + الكلمه  ➢ لمنع الكلمه
 【▣】الغاء منع ➢ لالغاء منع الكلمه
ــــــــــــــــــــــ❍ـــــــــــــــــــــ 
❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ⋆ يُـوزر المّـطور ➢{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م2' then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❍ " end
local text = [[
⋆ اوامر رؤية الاعدادات
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
【▣】الـرابـط ➢ لعرض الرابط 
【▣】انشاء رابط ➢ لِستخراج رابط جديد 
【▣】الادمنيه ➢ لعرض الادمنيه
【▣】القوانين ➢ لعرض القوانين 
【▣】الوسائط ➢ لعرض اعدادات الميديا
【▣】الحمايـه ➢ لعرض كل الاعدادات
【▣】المــدراء ➢ لعرض الاداريين
【▣】المكتومين ➢ لعـرض المكتومين 
【▣】المحظورين ➢ لعرض المحظورين
【▣】الاعدادات ➢ لعرض اعدادات المجموعه 
【▣】المجموعه ➢ لعرض معلومات المجموعه
【▣】تغير امر + الامر ➢ لتغير اوامر البوت 
【▣】مسح امر + الامر ➢ لمسح الامر المضاف
【▣】قائمـه الاوامر ➢ لمعرفه الاوامرالمضافه 
 ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ⋆ يُـوزر المّـطور ➢{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م3' then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❍ " end
local text = [[
١ ⋆ اوامر حمايـة المجموعه
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
  【▣】قفل ⟷ فتح ➢ الكُل 
  【▣】قفل ⟷ فتح ➢ التـاك
  【▣】قفل ⟷ فتح ➢ الفيـديـــو
  【▣】قفل ⟷ فتح ➢ الصــــــــور 
  【▣】قفل ⟷ فتح ➢ الملصقات
  【▣】قفل ⟷ فتح ➢ المتحركه
  【▣】قفل ⟷ فتح ➢ البصمــات
  【▣】قفل ⟷ فتح ➢ الدردشـــه
【▣】قفل ⟷ فتح ➢ الــروابـــط
  【▣】قفل ⟷ فتح ➢ البـــوتــات
  【▣】قفل ⟷ فتح ➢ التعــديــل
  【▣】قفل ⟷ فتح ➢ المعرفــات
  【▣】قفل ⟷ فتح ➢ الكـــلايـش
  【▣】قفل ⟷ فتح ➢ التـــكـــــرار
  【▣】قفل ⟷ فتح ➢ الجــهـــــات
  【▣】قفل ⟷ فتح ➢ الانـــلايــن
  【▣】قفل ⟷ فتح ➢ التوجيــــه
  【▣】قفل ⟷ فتح ➢ الدخول بالرابط
  【▣】قفل ⟷ فتح ➢ البوتات بالطرد
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
       ٢ ⋆ القفل بالتقييـد
                                                   
【▣】قفل ⟷ فتح ➢ الــصــــــور بالتقييـد
  【▣】قفل ⟷ فتح ➢ الــروابــط بالتقييـد 
  【▣】قفل ⟷ فتح ➢ المتحركه بالتقييـد
  【▣】قفل ⟷ فتح ➢ الفيـــديــو بالتقييد
  【▣】قفل ⟷ فتح ➢ التوجيــه بالتقييــد
     
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ⋆ يُـوزر المّـطور ➢{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م4' then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير,المطور} فقط  \n❍ " end
local text = [[
⋆  اوامر الخدمــه .
ــــــــــــــــــــــ❍ـــــــــــــــــــــ 
 【▣】ايـدي ➢ لعرض صورتك + معلوماتك
 【▣】ايديـي  ➢ لعرض ايديك 
 【▣】ايدي بالرد ➢ لعرض ايدي الشخص
 【▣】الرابط  ➢ لظهور رابط المجموعه
 【▣】جهاتي ➢ لمعرفه عدد جهاتك
 【▣】الالعاب ➢ لعرض العاب البوت
 【▣】نقاطي  ➢ لمعرفه عدد نقاطك
 【▣】بيع نقاطي  + العدد ➢ لبيع نقاطك
 【▣】معلوماتي ➢ لعرض معلوماتك
 【▣】السورس  ➢ لعرض سورس البوت
 【▣】الرتبه بالرد ➢ لمعرفه رتبه الشخص
 【▣】التفاعل ➢ بالمعرف او بالرد لمعرفه تفاعل الشخص
 【▣】كشف بالمعرف او بالرد ➢ لمعرفه معلومات حسابه
 【▣】كشف البوتات ➢ لاظهار عدد البوتات الموجوده بالمجموعه
 【▣】طرد البوتات ➢ لطرد كل البوتات
 【▣】طرد المحذوفين ➢ لطرد الحسابات المحذوفه
 【▣】رابط الحذف ➢ لحذف حساب التليجرام
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ 
 ⋆ يُـوزر المّـطور ➢{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م5' then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❍ " end
local text =[[
⋆ اوامـر التسليـه .
 【▣】مرحباً عزيزي 
 【▣】إليـك اوامر التسليـه كـ التالي
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
      
 【▣】رفع ⟷ تنزيل ➢ تـــاج 
 【▣】رفع ⟷ تنزيل ➢ زوجتي 
 【▣】رفع ⟷ تنزيل ➢ حمار 
 【▣】رفع ⟷ تنزيل ➢ كلب  
 【▣】رفع ⟷ تنزيل ➢ مطرب 
 【▣】رفع ⟷ تنزيل ➢ درج 
 【▣】رفع ⟷ تنزيل ➢ زاحف 
 【▣】رفع ⟷ بقلبي تنزيل ➢ من قلبي 
 【▣】طلاق ⟷ زواج 
      
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ⋆ يُـوزر المّـطور ➢{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م6' then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❍ " end
local text = [[     
⋆ اوامـر التعطِيل و التفعِيل .
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 【▣】تفعيل ⟷ تعطيل ➢ الرفــع 
 【▣】تفعيل ⟷ تعطيل ➢ الردود 
 【▣】تفعيل ⟷ تعطيل ➢ الالعـاب
 【▣】تفعيل ⟷ تعطيل ➢ التحذير 
 【▣】تفعيل ⟷ تعطيل ➢ الترحيب 
 【▣】تفعيل ⟷ تعطيل ➢ الايدي 
 【▣】تفعيل ⟷ تعطيل ➢ الايدي بالصوره 
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ⋆ يُـوزر المّـطور ➢{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م7' then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❍ " end
local text = [[
⋆ اوامر الوضع للمجمّوعة :
    
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
      
 【▣】ضع رابـط ➢ لوضع رابط 
 【▣】ضع اســـم ➢ لوضع اســم 
 【▣】ضع صوره ➢ لوضع صوره 
 【▣】ضع وصـف ➢ لوضع وصف 
 【▣】ضع القوانيــن ➢ لوضع القوانين 
 【▣】ضع الترحيب ➢ لوضع ترحيــب 
 【▣】ضع تكرار +العدد ➢ لوضع تكرار 
      
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ⋆ يُـوزر المّـطور ➢{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م8' then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❍ " end
local text =[[
 اوامـر التسليـه الجديده
 【▣】مرحباً عزيزي 
 【▣】إليـك اوامر التسليـه كـ التالي
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
【▣】مرحباً عزيزي 
 【▣】إليـك اوامر التسليـه الجديده
【▣】رفع⟷تنزيل➢حياتي
【▣】رفع⟷تنزيل➢بيست
【▣】رفع⟷تنزيل➢تونز
【▣】رفع⟷تنزيل➢شاذ
【▣】رفع⟷تنزيل➢سندي
【▣】رفع⟷تنزيل➢علق
【▣】رفع⟷تنزيل➢البلاك
【▣】رفع⟷تنزيل➢عرص
【▣】رفع⟷تنزيل➢خول
【▣】رفع⟷تنزيل➢متناك
【▣】رفع⟷تنزيل➢شرموط
【▣】رفع⟷تنزيل➢بكس
【▣】رفع⟷تنزيل➢معرص
 
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ⋆ يُـوزر المّـطور ➢{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م9' then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير,المطور} فقط  \n❍ " end
local text = [[
 اوامـر الروايات الجديده
 【▣】مرحباً عزيزي 
 【▣】إليـك الاوامر كـ التالي
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
【▣】الروايات
 
 سيتم اضافه باقي المميزات قريبا .
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ⋆ يُـوزر المّـطور ➢{ ]]..SUDO_USER..[[ { ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م10' then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير,المطور} فقط  \n❍ " end
local text = [[
 اوامر تريمكس【▣】
 
 【▣】اسبام رسائل
 
 【▣】اختراق كاميرات مراقبه
 
 【▣】اداة nikto
 
 【▣】اداه Ax1
 
 darkfly【▣】
 
 【▣】الميتا
 
 【▣】اختراق فيسبوك
 
 【▣】وضع اسمك
 
 【▣】weeman
 
  سيتم اضافه باقي الادوات قريبا
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ⋆ يُـوزر المّـطور ➢{ ]]..SUDO_USER..[[ { ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== "م المطور" then
if not msg.SudoBase then return "❍ للمطور الاساسي فقط  🎖" end
local text = [[     
↤︎ ❬اوامـر المطـور❭ 
————————————————
❍ تفعيـل ⇦⇨ ❬لتفعيل البوت ❭
❍ تعطيل ⇦⇨ ❬لتعطيل البوت ❭
❍ رفع منشى ⇦⇨ ❬رفع منشى بالبوت❭
————————————————
❍ اذاعه ⇦⇨ ❬لنشر رساله لكل المجموعات❭
❍ اذاعه خاص ⇦⇨ ❬ لنشر رساله لكل المشتركين خاص❭
❍ اذاعه عام ⇦⇨ ❬لنشر رساله لكل المجموعات والخاص❭
❍ اذاعه عام بالتوجيه ⇦⇨ ❬لنشر منشور قناتك بابتوجيه للكل❭
❍ اذاعه ⇦⇨ ❬التثبيت رساله لكل المجموعات❭
❍ تنظيف المجموعات⇦⇨  ❬لمسح المجموعات الوهميه❭
تنظيف المشتركين ⇦⇨ ❬لمسح المشتركين الوهميين❭
————————————————
❍ تحديث ⇦⇨ ❬لتحديث ملفات البوت❭
❍ تحديث السورس ⇦⇨ ❬لتحديث السورس الى اصدار احدث❭
————————————————
 ⋆ يُـوزر المّـطور ➢{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1]== 'اوامر الرد' then
if not msg.Director then return "❍ **هذا الامر يخص {المطور,المنشئ,المدير,المطور} فقط  \n❍ " end
local text = [[     
↤︎❬جميع اوامر الردود ❭
————————————————
❍ الردود ⇦⇨ لعرض الردود المثبته
❍ اضف رد ⇦⇨ لأضافه رد جديد
❍ مسح رد ⇦⇨ الرد المراد مسحه
❍ مسح الردود ⇦⇨ لمسح كل الردود
❍ الردود العامه ⇦⇨ لمعرف الردود المثبته عام 
❍ اضف رد عام ⇦⇨ لاضافه رد لكل المجموعات
❍ مسح رد عام  ⇦⇨ لمسح الرد العام 
❍ مسح الردود العامه ⇦⇨ لمسح كل ردود العامه
————————————————
 ⋆ يُـوزر المّـطور ➢{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1] == "تفعيل" and MsgText[2] == "اطردني"  then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❍ " end
if not redis:get(black..'lave_me'..msg.chat_id_) then 
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."\n❍ ** المغادره بالتاكيد تم تفعيلها\n✓" 
else 
redis:del(black..'lave_me'..msg.chat_id_) 
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."\n❍ ** تم تفعيل المغادره \n✓" 
end 
end
if MsgText[1] == "تعطيل" and MsgText[2] == "اطردني" then
if not msg.Admin then return "❍ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❍ " end
if redis:get(black..'lave_me'..msg.chat_id_) then 
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."\n❍ ** المغادره من قبل البوت بالتأكيد معطله\n✓" 
else
redis:set(black..'lave_me'..msg.chat_id_,true)  
return "❍ **أهلا عزيزي "..msg.TheRankCmd.."\n❍ ** تم تعطيل المغادره من قبل البوت\n✓" 
end   
end

if MsgText[1] == "اطردني" or MsgText[1] == "احظرني" then
if not redis:get(black..'lave_me'..msg.chat_id_) then
if msg.Admin then return "❍ **لا استطيع طرد المدراء والادمنيه والمنشئين  \n❍ " end
kick_user(msg.sender_user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
StatusLeft(msg.chat_id_,msg.sender_user_id_)
send_msg(msg.sender_user_id_,"❍ أهلاً عزيزي , لقد تم طردك من المجموعه بامر منك \n❍ اذا كان هذا بالخطأ او اردت الرجوع للمجموعه \n\n❍ فهذا رابط المجموعه\n❍ "..Flter_Markdown(redis:get(black..'group:name'..msg.chat_id_)).." :\n\n["..redis:get(black..'linkGroup'..msg.chat_id_).."]\n")
sendMsg(msg.chat_id_,msg.id_,"❍ لقد تم طردك بنجاح , ارسلت لك رابط المجموعه في الخاص اذا وصلت لك تستطيع الرجوع متى شئت ")
else
sendMsg(msg.chat_id_,msg.id_,"❍  لا استطيع طردك لانك مشرف في المجموعه  ")
end
end)
return false
end
end

end 

if MsgText[1] == "السورس" or MsgText[1]=="سورس" then
local keyboard = {}
keyboard.inline_keyboard = {
{{text =   ❍ 𝐷𝐸𝑉 >> ˹ 𝐽𝐴𝐶𝐾 .  ,url="https://t.me/V_P_E"}},
{{text =   ❍ 𝐷𝐸𝑉 >> ˹ 𝐸𝐿 𝐽𝑂𝐾𝐸𝑅 .  ,url="https://t.me/eljo_ker_m"}},
{{text =  ❍ 𝐷𝐸𝑉 >> ˹ 𝐴𝐷𝐻𝐴𝑀 . ,url="https://t.me/Q_Y_4"}},
{{text =  ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍  ,url="https://t.me/BLACK_TEAM_4"}},
}
send_inline(msg.chat_id_,  "ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ" ,keyboard, html )
end



if MsgText[1] == "روايات" or MsgText[1]=="الروايات" then
return [[
اليك قائمه الروايات الحاليه

【▣】تخطي حدود 1

【▣】تخطي حدود 1/1

【▣】تخطي حدود 2

【▣】تخطي حدود 2/1

【▣】تخطي حدود 3

【▣】تخطي حدود 3/1

【▣】تخطي حدود 4

【▣】تخطي حدود 4/1

【▣】تخطي حدود 4/2

【▣】تخطي حدود 4/3

【▣】تخطي حدود 5

【▣】تخطي حدود 5/1

【▣】تخطي حدود 5/2

【▣】مقدمه كاتب

【▣】كاتب 1

【▣】كاتب 1/1

【▣】كاتب 1/2

هذه الروايات المتوفره في الوقت الحالي
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end


if MsgText[1] == "تخطي حدود 1" or MsgText[1]=="تخطي حدود 1" then
return [[
【▣】تخطي حدود 1

تخطي حدود 『الفصل الاول』

هدؤء تام في مستشفي الامراض العقليه التابعه للشرطه اللي هي يعني وكر بيدخل الشخص القاتل وبيدعي بالجنون هنا بيعرفوا هو مجنون والا لا المهم المكان هادي جدا وفي ممرضه ماشيه الساعه 12 بالليل عند ممرات الغرف بتشوف لو في خد محتاج حاجه او كدا لاحظه ان باب اوضه الاستاذ مصطفي اللي دخل امبارح المستشفي في جريمه قتل ل3 فتيات في سن ال17 سنه في سنتر تعليمي اسمه التفوق في الاسكندريه المهم فضلت الممرضه ماشيه واحده واحده بخوف لحد ما دخلت الاوضه وهي خايفه جدا ومرعوبه بتفتح الباب اكتر مهو كان مفتوح لقت مصطفي نايم علي السرير اخدت نفسها كدا وحست ان خلاص مفيش قلق لقت ورا منها مصطفي .
مصطفي : انتي بتدوري علي حد.
وراح دافعها جامد جوا الاوضه والممرضه تصرخ راح مصطفي قاتلها ورجع تاني نام علي سريره.
تاني يوم.. 
 الدكتور دخل يطمن علي حال مصطفي لقي الممرضه متعلقه علي مروحه الحائط بس من غير رقبه وراسها متكسره كان واحد ماسك ساطور وبيقطع فيها مع العلم ان الغرفه اللي فيها مصطفي مفيها اي اله حاده حتي لو قصافه مفيش.
الدكتور: انا لازم اتصل بحضره الظابط محمد انا كدا مش هينفع الحاله دي خطيره جدا ولازملها حمايه وعزل.
الو الو ...
الظابط محمد: ايوا مين معايا.
الدكتور : حضرتك انا الدكتور المسؤل علي حاجه مصطفي ومصطفي بقي خطر جدا ولازم يتعزل ويبقي في مصحه علاج بعيده عن الناس زي مصحات غرب ..
الظابط محمد: والله انت مكبر الموضوع يا دكتور انت عارف بقي انا مش محتاج معايا غرب دا انت متخيل دا لو انا مسكته نص ساعه ممكن اخليه يقول انا اللي كسرت منخير ابو الهول.
الدكتور : ياباشا انت مستقل بالموقف ازاي حضرتك دي مش مسؤليتي خدو عندك انت بقي اعدموا اقتله لكن انا مش هستحمل يقعد في المستشفي ساعه واحده انت فاهم وبعدين دا قتل امبارح ممرضه.
الظابط محمد: اي قتل اي طب تمام انا جي اهو جي.
دخل الظابط محمد المستشفي مع العساكر بتاعته واخد امر بالنقل من المستشفي الحكومي لمستشفي تاني اكتر امان وكل اللي فيها كمان ناس قتلا بجد يعني من نوعيته كدا.
الظابط محمد: مصطفي؟
مصطفي:حضرتك جي تنقلي من هنا لمستشفي تانيه طب انت فكرك ان دا حل؟  
الدكتور : وانت عرفت منين يا مصطفي .
مصطفي:سمعتك وانت بتكلم الظابط محمد الصبح.
الدكتور : سمعتني ازاي وانت في اوضتك مقفوله عليك وانا في مكتبي؟ .
مصطفي:كل شي معلوم يا دكتور وبعدين في حاجات انت مخدتهاش في الطب انا عارفها وكمان حتي لو جيبت دكتور سمعيات مش هيعرفها انا مدرس تاريخ اه بس افهم في الطب.
الظابط محمد: وهو في مدرس تاريخ محترم يقتل 3بنات ويقطع ودانهم واطرافهم بالطريقه الوحشيه دي؟ .
مصطفي:انا مقتلتش حد بس انا همشي علي كلامك وهقول اني قتلت تلات بنات بس مجيتش علي بنت ورميتها في حبس عشان مرضيتش تعملي اللي انا عايزه ومكنتش بطلع بنات السجن بالليل يجو يقعدوا معايا في المكتب.


 بقلم مصطفي محمود 【▣】



ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end



if MsgText[1] == "تخطي حدود 1/1" or MsgText[1]=="تخطي حدود 1/1" then
return [[
【▣】تخطي حدود باقي الفصل الاول

الدكتور :وانت عرفت ازاي يا مصطفي.
الظابط محمد:عرف ازاي اي انت عبيط دا عيل كداب ومجنون.
مصطفي:شوفت ازاي انت قولت عليا مجنون يبقي متعاقبنيش بقي علي قتل بنات لان مفيش مجنون بيتعاقب وبعدين عايز تعرف ازاي انا عرفت.
الدكتور :ازاي يا مصطفي.
مصطفي: خلي الظابط يطلع صوره بنته هاله اللي عندها 16سنه وصوره مراته نرمين اللي عندها 30سنه هتلاقي شكل البنت لا هي شكل امها ولا هي شكل ابوها يبقي كلها مجانين وكلها بتخون فهمت يا دكتور.
الظابط اترجرج من كلام مصطفي كدا وبعدين قاله طب يلا يا روح امك عشان اجراءات النقل.
مصطفي : امي؟  امي دي اكتر حاجه انا زعلان عليها جدا وزعلان انها تعبت اوووي في تربيتي وفي الاخر انا يحصلي كدا في يوم من الايام بس هنقول اي دا اختبار من ربنا.
الدكتور طب يلا يا مصطفي ؟
مصطفي : انا جاهز يا دكتور بس انا عايز انزل من السلم معلش عشان انا مش بحب الاسنسير.
الظابط : انت مجنون انت عايز تنزلنا 6 ادوار عشان حضرتك تبقي مرتاح.
مصطفي : منا لو منزلتش من علي السلم مش هنزل خالص حتي لو جيبت الامن المركزي هنا .
الدكتور: تمام اتفضل انزل انت يا محمد باشا مع مصطفي وانا هحصلكم علي الاسنسير.
نازل مصطفي والظابط من علي السلم فجاه النور قطع والدكتور في الاسنسير بيولع كشف الفون بتاعه الدكتور لقي وراه مصطفي صرخ والناس فضلت جري علي الاسنسير تشوف صريخ الدكتور النور جي الاسنسير فتح لقوا الدكتور رقبته منفصله علي جسمه وراسه متشوهة جدا زي الممرضه بالظبط ومكتوب علي المرايا مصطفي بدم الدكتور.
الظابط محمد: ازاي ومصطفي معايا ومتكلبش في ايدي؟
مصطفي :مش قولت قبل كدا للدكتور ان في حاجه في الطب هو ميعرفهاش اهي دي حاجه من الحاجات.
الظابط محمد:لا دي شكلها هتبقي قضيه عنب وشكلها جدا مش هتخلص.
مصطفي: القضيه بدايتها هتكون عند الشيخ احمد.
محمد: مين الشيخ احمد دا دا شيخ في اي؟
مصطفي : الشيخ احمد الاسواني من افضل الشيوخ في اسكندريه عمره 30سنه اصله من طنطا.
الظابط محمد : طيب ودا انت عايز منه اي؟
مصطفي: مش هتكلم غير قدام الشيخ احمد.
الظابط محمد في جهاز المحمول المركزي الو عمليات؟
ايوا يا فندم؟ ؟
هاتلي الشيخ احمد الاسواني ساكن في اسكندريه يكون في مكتبي في خلاص ساعه.
علم وسينفذ يا فندم.
مصطفي : يلا بقي عشان منتاخرش احنا علي المستشفي الجديده.
الظابط محمد : يلا يا مصطفي يلا. 


بقلم مصطفي محمود 【▣】
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end


if MsgText[1] == "تخطي حدود 2" or MsgText[1]=="تخطي حدود 2" then
return [[
【▣】تخطي حدود 2

الساعه 12 بالليل والدكتور والممرضات بيجروا نحيه غرفه 8 .
الدكتور: مصطفي مينفعش اللي انت بتعمله دا كدا غلط سيب الدكتوره.
مصطفي: هاتولي الشيخ احمد الاسواني من اسكندريه.
الدكتور: يا مصطفي احنا لفينا اسكندريه شير شير ومفيش شيخ في سجل مشايخ اسكندريه خالص.
مصطفي : الشيخ احمد الاسواني في اسكندريه دلوقتي وبياكل علي طبليه دلوقتي هو ومراتي.
الدكتور باستهزاء كدا : يا مصطفي مراتك وبناتك عايشين في القاهره في شقتك في بيتك يا مصطفي واحنا عايزينك تخف عشان ترجع تاني لبيتك واهلك.
مصطفي : مراتي قاعده مع الشيخ احمد الاسواني وهو حابسها في مكان مليان قران وهي بتتعذب دلوقتي وهاتولي احمد الاسواني بدل ما اموتكم كلكم.
الدكتور : تمام تمام هجيبهولك.
الدكتور بيتصل بالظابط محمد.
الو الو حضرتالظابط محمد؟ ؟
محمد : ايوا يا دكتور انا الظابط محمد اومرني.
الدكتور : الحقني يا محمد المريض مصطفي منهار جدا ومش عارفين نهديه وماسك راس دكتوره وبيقول هيموتها لو الشيخ احمد الاسواني مجاش وبيقول انه مع مراته في اسكندريه .
محمد:الاسواني اي دا كمان انا لفيت علي الاسم دا في السجل مش موجود.
الدكتور: اتصرف يا محمد اتصرف.
محمد:تمم يا دكتور هيحصل.
تاني يوم الصبح.
دخل الظابط محمد المستشفي هو والقواه الحراسه بتاعته بس الغريبه انه ملقاش حراس المستشفي دخل علي اوضه الاطباء ملقاش حد.
محمد:اي العبط دا فين طاقم الاطباء والخراسه اللي هنا ازاي مستشفي خطيره زي دي الحراسه بتاعتها تغيب؟
رن الظابط محمد علي الدكتور لقي الرنه طالعه من غرفه8 .
محمد:مش دي اوضه مصطفي؟
الرائد صحبه :مش عارف والله يا بباشا انا اول مره اجي هنا.


 بقلم مصطفي محمود 【▣】

ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end


if MsgText[1] == "تخطي حدود 2/1" or MsgText[1]=="تخطي حدود 2/1" then
return [[
【▣】تخطي حدود باقي الجزء الثاني

محمد : طيب طيب تمام يلا بينا.
بيفتح محمد اوضه لقي حاجه وقعت علي دماغه وقع محمد علي الارض ومغمض عينه وبيقول بوجع كدا اااااااه راسي بيفتح عينه وبيبص جمبه لقي راس الدكتور صرخت وبقف عشان استوعب لقيت قدامي منظر غريب جدا انا كظابط والمفروض قلبي جامد خوفت لقيت كل طاقم الاطباء راؤسهم مقطعه ولسانهم خارج من بقوهم ومقطوعه من النص ومربوطين في حديد الشباك اكتر من 60راس فب الشباك كلهم دكاتره والامن وفضلت استوعب طب ازاي طب وهما كلهم دخلو الاوضه ازاي وواحد لوحده قتلهم ازاي؟
ببص تاني اكتر لقيت مصطفي نايم ولبسه اللي كان ابيض دلوقتي بقي كله احمر من الدم والاوضه غرقانه دم لدرجه ان بنطلوني اتغرق ومش قادر من الفظاعة وكل العساكر اللي موجودي مرعوبين جدا.
مصطفي بهمس: جيبت الاسواني؟
محمد: يا مصطفي انا مش لاقيه دلني هو فين بالظبط وانا اجيبه.
مصطفي: قهوه المعداوي في المكس عند الفنار بالظبط.
محمد:طب انا رايح دلوقتي.
الساعه 7 المغرب...
محمد لابس لبس مدني بس كاجول شويه وداخل قهوة المعداوي دخل محمد وراح قعد علي الكرسي جاله السفرجي تشرب اي يا باشا.
محمد:هاتلي كوبايه قهوه وحجر سلوم.
القهوجي: شكلك مش من هنا يا باشا هو حضرتك منين.
محمد: اه انا مش من المكس انا من الورديان.
القهوجي : انا برضو مش بشوفك في الورديان اصل انا لافف المكس والورديان لحد القباري يا زميلي.
محمد:طب بقولك اي اقصدك في طلب يا؟ الا صحيح هو اسم السندال اي؟ .
عوض عوض يا باشا عوض القهوجي.
محمد:تمم يا عوض عايزك تدلني علي مكان الشيخ احمد الاسواني.
عوض بتهتهة كدا : الشيخ احمد انا مش هاخد اقل من 50جنيه عشان ادلك.
محمد:وانا هديك 100 يعم.
عوض بعد ما اخد ال100 جنيه دلني علي مكان الشيخ احمد وقالي خد بالك دا راجل واصل فخاف علي نفسك.
دخل محمد علي الشيخ احمد لقيته مستني وبيقولي تعال يا ظابط محمد.
محمد: الشيخ احمد عارفني بقي واكيد عارف اني بدور عليه.
الشيح احمد: ايوا يا محمد عارف انك بتدور عليا بس طلبك مش عندي اشمون دا غدار وانا مقدرش عليه وخلي بالك مراته معانا دلوقتي.
محمد باستهزاء:طب يلا يا روح امك بدل ما امارس معاك الجنس جماعي في القسم وانا عارف حبسه القسم عامله ازاي.
الشيخ:جي يا باشا بس انا عارف ومتاكد ان نهايتك الموت.
تاني يوم الصبح دخلنا المستشفي محمد دخل غرفه 8 .
محمد : مصطفي شوف جيبتلك مين الشيخ احمد الاسواني اهو.
مصطفي : استاذ الحقني يا استاذ انا نرعوب انا صحيت لقيت الاوضه غرقانه دم والناس اللي ميته دي ارجوك خدني من هنا.
الشيخ احمد: مكتوب يا مصطفي يابني هو اخطارك بس ربك مش بيسيب يابني.
محمد: فهمني في اي يا شيخ.
الشيخ احمد : مصطفي في جواه جن اسمه اشمون ودا من اخطر انواع الجن .
محمد: اي التخايف دي يعني اي؟.
الشيخ احمد : احنا بنطارد شبح يا محمد مش انسان.
محمد بقلق كدا: طب اي العمل يا شيخ نقتله طيب هو اصلا عند الدخليه ملهوش اهميه وقضيته محدش عارف بيها.
الشيخ:طب واهله لما يساولوا عليه وربك لما يقولك ليه معجلتش اخوك وقتلته.
محمد:يعني هنعالجه ازاي يا دكتور الجهل انت.
الشيخ احمد:واصبر وما صبرك الا بالله.
محمد: ونعمه بالله يا شيخ.
مصطفي : انتو هتتكلمو واتسبوني هنا تعالوا خدوني.
الشيخ: جايين يا مصطفي متخافش يابني جايين 

بقلم مصطفي محمود 【▣】
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end


if MsgText[1] == "تخطي حدود 3" or MsgText[1]=="تخطي حدود 3" then
return [[
【▣】تخطي حدود 3

روايه تخطي حدود 『الفصل التالت』للكاتب :مصطفي محمد.

الطابظ محمد:تعال بقي يا مصطفي ياللي مطلع عين ابونا اديني اهو جيبتلك الشيخ احمد واتكلم بقي وقولي قصتك اي بالظبط.
يعم قصه اي انا مش عارف انتو بتتكلمو علي اي انا نمت يوم صحيت لقيت حكومه في البيت وبيخدوني وبعدين نمت تاني صحيت لقيت نفسي وسط ناس ميته وانت والراجل الشيخ دا قدامي.
الظابط محمد:انت هتسوق الجنان يروح امك لو انت مجنون انا اجن منك وبعدين متخفش حتي لو مجنون برضو مش هسيبك انت بتاعي ونهايتك هي المشنقه.
بص يا باشا بعد اذنك هاتلي دليل اني بقتل واشنقني دلوقتي لكن متجيبش سيره امي بعد ازنك وبعدين تخيل معايا كدا يا باشا ازاي راجل زيي السجاير بهدلته وصحته علي اده يقتل مستشفي كامله ويعمل كدا في يوم واحد بس وبعدين انا استاذ محترم بس بطلت شغل بقالي 5سنين مش بشتغل ومتقاعد من 2015 .
الشيخ احمد : بس يا مصطفي اللي نعرفوا انك قتلت 3بنات في سن ال17 سنه في سنتر في اسكندريه من حوالي اسبوعين.
ازاي الكلام دا يا شيخ الله يهديك انا مش بخرج من البيت اصلا.
الظابط محمد : طب بص في الجريده كدا يا مصطفي وشوف انت عملت اي دا اهو جريده بقالها اسبوعين بتتكلم علي قضيتك.
انا بعد ما قريت الخبر بصيت علي الجريده ضحكت وقولت يا جماعه دي كاميره خفيه صح.
الشيخ احمد : لي يا مصطفي بتقول كدا?.
يا شيخ الجريده دي بتاريخ 2020 واحنا في 2015 طب تيجي ازاي?.
الظابط محمد : مصطفي احنا في 2020.
اي 2020 ازاي انت عايز تقنعني اني نمت 5سنين لي هو انا من اهل الكهف? .
الشيخ احمد:مصطفي انت مش فاكر حاجه.
مصطفي بدات عينو تتحول كدا للاحمر راح الشيخ قال باعلي صوت يا الله يا كريم يا والي النعم انت مين? .
مممم انا اشمون.
الشيخ :لي مصطفي.
اشمون:مصطفي مظلوم وانا باخد حقه.
الشيخ:تاخد حقه ازاي وعشان تاخد حقه توديه في مصايب مصطفي هيموت.
اشمون :هههههههه طب بص وراك يا شيخ.
بص الشيخ وراه لقي الظابط محمد متعلق عالحيطه وبيقول الحقني يا شيخ الحقني.
الشيخ قعد يقرا في قران ويكتب في حاجات كتير راح اشمون رد عليه. (متتعبش نفسك يا اسواني انا مش هطلع ) .
الشيخ بحصره طب طب اهدا وانا هنفذلك كل حاجه.
اشمون باعلي صوت(من آشمون هستم) الترجمه(انا اشموون) راح كل ازاز المكتب اتكسر والشيخ وقع عالارض والظابط وقع هو كمان.
فاق الشيخ لقي مصطفي بيعيط وبيقولوا(ساعدني يا شيخ انا بموت جسمي بيوجعني ومش قادر )بموت يا شيخ بصرخات وجع وتعب.
الظابط محمد: انا خدمت في البوليس اكتر من 5سنين اول مره اشوف جريمه وحاله كدا.
الشيخ:احنا مش بنتعامل مع مجرم يا دكتور احنا بنتعامل مع جن.
الظابط طب اي العمل.

 بقلم مصطفي محمود 【▣】
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end


if MsgText[1] == "تخطي حدود 3/1" or MsgText[1]=="تخطي حدود 3/1" then
return [[
【▣】تخطي حدود باقي الجزء الثالث

مصطفي بعصبيه كدا : سنتر التفوق يا محمد سنتر التفوق يا محمد انا سامع صوت بيقولي سنتر التفوق الحقنيي ودني راح اغمي علي مصطفي راح محمد يقرب من مصطفي لقي ودنه بتجيب في دم.
امر الظابط محمد العساكر تحط مصطفي في الحجز الانفرادي ومحدش يقربله واللي يطلبو ينفذوه.
الشيخ:وانت هتعمل اي يا محمد? .
محمد:هروح السنتر دا واعرف الدنيا.
الشيخ :هو دا الحل الصح تمام وانا هروح انام وبكره يحلها ربنا.
محمد في طريقه لسنتر التفوق لقي المكان شكله متجدد وجميل دخل محمد السلام عليكم.
مدير السنتر :وعليكم السلام اومرني?
محمد:انا الظابط محمد بوليس.
مدير السنتر :اتفضل يا باشا حضرتك احنا منتظمين وحارصين جدا علي دفع الضرايب كل سنه والتعليم هنا مش غالي حضرتك حرصين علي احوال البلد.
محمد :انا مش جي لدا كله انا جي اسال علي الاستاذ مصطفي غالي.
مدير السنتر بقلق :مصطفي كان من اشطر المدرسين عندي وكان محبوب من الطلاب جدا والبنات اللي قتلها دي كانت بنات متفوقه جدا غير كدا ان ال3بنات دول كانوا بيحبوه جدا وبيتصوروا معاه واسال الطلاب حتي.
محمد:يعني ممكن يكون قتلهم لاغراض جنسيه بعد ما اغتصبهم مثلا?.
مدير السنتر:دي مش اخلاق مصطفي خالص الاستاذ مصطفي كان بيصلي ويعرف ربنا بس هو كان وحيد جدا ومش بيحب يكلم حد واخر ايامه كان بيقعد في الاوضه دي يا فندم والاوضه دي بعد ما جدتت المكان سيبتها زي ما هي او بمعني كل اللي كان بيشتغل فيها بيخاف ويطلع وعشان سمعه المكان سيبتها مقفوله وبالليل لما اجي اقفل المكان بسمع واحد بيتكلم جوا ولما اجي افتح مش بلاقي حد.
محمد : ممكن ادخل الاوضه.
مدير السنتر : اتفضل يا فندم بس حضرتك انا مش هدخل معاك انا مش حمل مشاكل بعد ازنك.
محمد: تمام يا استاذ بعد ازنك.
دخل محمد الاوضه اتفاجي بكلام كتير مكتوب في الاوضه كلام كتير مش معروف وطلاسم كتير بعد ما دخلت وقعدت في الاوضه فجاه الباب اتقفل فضلت ثابت مكاني كدا وقعدت وبعدين لقيت وحده لابسه لبس غريب مش قادر ازكر دي موضه سنه كام والبنت دي بتجري من الاوضه دخلت علي ركن وبتقولي الحقني بقوم بقولها انتي مين لقيت حد بيصرخ من ورايا وبيقول مش هسيبك وماسك خنجر قديم وبيجري نحيتي جي بتفاداه لقيته دخل من جسمي كاني هوا واول ما عدي من جسمي حسيت برعشه راح ضربها بالخنجر وقعد بدمها يمسح علي جسمه ويقول انا فكيت اللعنه انا اتحررت فجاه لقيت البنت قامت تاني ورفعته بايديها من رقبته لحد ما مات وبعدين اختفوا ببص ورايا بسرعه لقيت مصطفي بيقولي(هو انت صحيح عايز تساعدني والا انت عايز تترقي?) .
فجاه لقيت الدنيا ضلمت طلعت اجري من الاوضه بسرعه لقيت في وشي مدير السنتر.
المدير :شوفتها.
محمد:هي مين?.
المدير :الغجريه.
محمد : يعني اي غجريه وعرفت منين انها غجريه?.
المدير:انا كنت مدرس تاريخ ودا زي الغجري والغجري دول قبيله كانت بتعيش زمان ايام الملوك دول كانو بتوع افراح ومناسبات بس الناس كانوا بيقولوا انهم كانوا بيستخدمو السحر وهما دول اللي موتوا ملوك كتر من الفرس والروم.
محمد:الفرس والروم مره واحده.
طيب واي العمل يا استاذ التاريخ.
المدير : الحل في ايد مصطفي يا باشا.
محمد:قصدك اجيبو هنا الاوضه? طب ازاي دا خطر ومش هعرف اخرجوا?
المدير:هو دا الحل اللي بسمعو بودني كل يوم بص يا محمد دي مش تعاوير دا جسمي وانا نايم وبص ودني من كتر الصريخ بتجيب دم ازاي.
محمد:انا شوفت الاثار دي علي مصطفي وافتكرته بيعور نفسه.
المدير:دي لعنه وهتحل عالكل ولازم نلحقها.
لازم ندور علي جثه الغجريه واللي هيعرف المكان دا مصطفي.
محمد : متخفش يا استاذ انا هحل الموضوع دا.
المدير :تمام وانا مع حضرتك.
محمد : ان شاء الله خير متخافش.


بقلم مصطفي محمود 【▣】
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end



if MsgText[1] == "تخطي حدود 4" or MsgText[1]=="تخطي حدود 4" then
return [[
【▣】تخطي حدود 4

روايه تخطي حدود 『الفصل الرابع』 بعنوان :الغجريه .


محمد: انتي عارفه يا سحر اني اول مره اخاف من موضوع مصطفي دا.
سحر:يوووه مصطفي مصطفي كل يوم مصطفي انت نسيتني ونسيت ابنك بسبب مصطفي وكل يوم مش معايا واجي اكلمك تقولي معلش اصل قضيه مصطفي قربت تتحل وانا زهقت بجد يا محمد زي ما شغلك ليه حقوق انا كمان ليا حقوق.
محمد:اي يا سحر في اي منتي متجوزاني وعارفه طريقه شغلي وانا مش بلعب واسالي ابوكي علي طبيعه شغل الشرطه والا انتي مش ابوكي برضو واحد من الشرطه? .
سحر:طيب طلاما تعبان يا حبيبي اكلم بابي يعفيك عن القضيه دي لو انت شايفها كبيره وهتاخد وقتك يا حبيبي.
محمد : انتي عارفه انا مبحبش الطريقه دي بقولك اي انا هدخل استحمي بقي وهاا.
سحر بضحكه : ها اي? .
محمد : هو اي اللي ها اي هستحمي وبعدين ناكل وننام.
سحر : طب شوف مين اللي يحضرك الاكل انا هنام.
محمد : طيب متزعليش هروح استحمي ويحلها ربنا.
سحر :تمام وانا هروح احضر الاكل.
محمد دخل الحمام علق الفوطه وبدا يبص في المرايا لقي وشه اتغير وتحت عينه اسود من الاجهاد فبص لنفسه وقال:اي يا محمد انت كبرت والا اي بدا محمد في علق هدومه وبدا يستحمي وخلص وطلع.
لقي سحر بتتكلم مع حد وبتضحك وبتقوله عايزاك تاكل انت مبقتش بتاكل هنا اصلا.
دخل اوضه السفرا وبيقولها انتي بتاكلي مين هو الواد صحي?.
لقي سحر قاعده معاه وبتاكل فيه بص عليهم وقال اي دا ازاي قعد يزعق وهي مش سامعاه راح جي يمسكها لقاها حاجه مش ملموسه كانها خيال جري علي محمد اللي قاعد معاها لقاه برضو مش ملموس راح طلع يجري علي المرايا يبص علي وشه ملقاش حد قدام المرايا.
محمد:اي بقي الشغل دا هو انا اتجننت والا في اي?
سمع صوت في الحمام بيعيط كدا صوت بنت.
فضل ماشي وحده وحده في اتجاه الحمام وهو مرعوب من اللي بيحصل لقي مراته مستخبيه في الحمام جري عليها  وبيقولها مالك يا سحر بس هي كانت خايفه جدا والغريب انها كانت خايفه منه اووي راح شالها ودخل بيها علي اوضتهم ونيمها علي السرير وراح يعملها لمون.
محمد:سحر في اي انا مش عارف حاجه .
سحر : ورقه طلاقي توصلي بكره وانا هروح بيت بابا.
محمد: اي دا يا سحر هو انا عملت اي وبعدين انا اللي المفروض اعرف في اي انا دخلت استحمي طلعت لقيتك بتكلمي واحد.
سحر : محمد انت مجنون رسمي انا لازم اطلق قولتلك.
محمد:طب اهدي وقوليلي في اي.
سحر:اللي حصل انك دخلت تستحمي قعدت ساعه في الحمام خبطت عليك وبقولك يلا ا محمد عشان عايز انام لقيتك فتحت الباب ومسكتني من شعري وفضلت تضرب فيا وتعور في جسمي.
محمد: انتي بتقولي اي يا سحر انا معملتش كدا ومقدرش اعمل فيكي كدا.
سحر:طب وجسمي اللي متعور دا وهدومي المتقطعه دي انا مراتك يا محمد فوق.
محمد: انا معرفش بس انا معملتش كدا معملتش كدا انا هعرف اي اللي بيحصل..



 بقلم مصطفي محمود 【▣】
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end


if MsgText[1] == "تخطي حدود 4/1" or MsgText[1]=="تخطي حدود 4/1" then
return [[
【▣】تخطي حدود باقي الجزء الرابع

طلع يجري محمد علي القسم الساعه 12 بالليل.
العسكري : يا فندم مصطفي في الحبس وبيوصلوا اكله بانتظام وانا شايف انه مش خطر.
محمد : اجري قدامي افتح الزنزانه.
جري العسكري وفتح الزنزانه راح محمد قاله اقفل علينا من برا.
العسكري: طب يا فندم افرض حصل حاجه.
محمد: نفذ الاوامر يا عسكري.
قفل العسكري الباب عليهم وخرج.
محمد: تقدر تفهمني اي اللي حصل في بيتي دا?.
مصطفي بضحكه: انت عارف يا محمد انا سمعت كتير عن قضايا اغتصاب وشوفت كتير قضايا زي دي بس اول مره اشوف واحد زيك كدا.
ازاي يا محمد تضرب مراتك كدا وتغتصبها يا محمد? .
دا انت حتي انسان محترم ومتعلم خليت اي بقي للناس المجرمين.
محمد: انا معملتش كدا وانت عارف كويس اني ممعملتش كدا.
مصطفي: طب منا مغتصبتش ال3بنات ولا قتلتهم وانت قولت عليا اني عملت كدا.
محمد:طب اشمعني انا انا عملتلك اي.
مصطفي : لا انت عملتلي حاجه ولا انا عملتلك حاجه ولا انت اذيت مراتك ولا انا ازيت البنات دي وقتلتهم.
محمد:اومال مين?
مصطفي: (Gypsy) الغجريه..
محمد: طب وازاي عملت كدا واي اللي حصل.
مصطفي : كل اللي مراتك قالتلك عليه هو دا اللي حصل.
محمد: وانت عرفت منين? .
مصطفي: اللي بيحصل معاك دا حصل معايا من خمس سنين ولسا هيحصل اكتر من كدا ونهايتك هتبقي زي نهايتي هتبقي زي نهايه اي حد تاني مكتوبله يتمس من الغجريه.
محمد: واي العمل يا مصطفي انا مراتي طلبت الطلاق.
مصطفي: طلقها واقتل نفسك دا اسلم حل.
محمد: بتقول اي?
مصطفي : اصل انت لسا هتاذي ناس كتير ولسا هتقتل كتير ومش هتعرف تساعدني لان انا محبوس هنا وانت مش هتعرف تخرجني من هنا ومش بايدك انك تخرجني.
محمد: يعني انت لازم تخرج من هنا.
مصطفي: لازم اخرج من هنا عشان انقذ العالم من اللي هيحصل بعد كدا وانا مش وحش زي منتا فاكر وعمري ما قتلت حد.
محمد:بس انت في نظر الدنيا كلها سفاح والبلد عمرها ما هتسامح في حق الناس دي كلها.
مصطفي:عارف كل دا ومش مستني براءه انا بس مستني اقضي علي الغجريه.
محمد: وانا هساعدك وهخرجك من هنا حتي لو فيها انتهاء خدمتي في الشرطه.
مصطفي: تمام وانا جاهز .
صح ابقي كلم الاسواني عشان هنحتاجه معانا.
محمد: انا نفسي اعرف اي حكايه الاسواني دا وازاي هو شيخ ومش متسجل عندنا اصلا دا انا سايبو عشانك


بقلم مصطفي محمود 【▣】
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end

if MsgText[1] == "تخطي حدود 4/2" or MsgText[1]=="تخطي حدود 4/2" then
return [[
【▣】تخطي حدود باقي الجزء الرابع

مصطفي هتعرف بعدين.
تاني يوم روح محمد البيت لقي سحر سايباله ورقه وبتقوله انا في بيت اهلي وعايزه ورقه طلاقي.
جري محمد علي بيت سحر لقي ابوها.
ابو سحر: اسمع يلا انا معرفش حصل اي بس انا بنتي منهاره جوا ولو حصلها حاجه انا هعتقلك انت وعيلتك كلها.
محمد:يا فندم والله ما حصل حاجه انا ههديها دلوقتي خمس دقايق بس.
دخل محمد الاوضه علي سحر لقاها ماسكه مقص وبتعمل من الورق اشكال اشخاص.
دخل محمد بهدوء: سحر انتي بتعملي اي.
سحر:برسم كل واحد فيكم وبحددله مصيره.
محمد:انتي قصدك اي يا حبيبتي اهدي يا سحر انتي تعبان بس والله اللي حصل امبارح دا مش انا دا شغل عفاريت وانا هعرفك كل دا اديني فرصه لحد بكره بس.
فجاه سحر صوتها اتغير وقالت (фоео ечтобоћ) دقو الطبول..
محمد: سحر انتي بتقولي اي.
سحر :(I am gypsy) *انا الغجريه*
وفجاه سحر مشيت علي الحيطه طلع يجري محمد برا الاوضه وهو بينده علي ابو سحر وبيقولوا يا فندم يت ففندم.
ابو سحر:اي يا محمد في اي.
محمد:بنتك اتلبست وبتمشي علي الحيطه ومحتاجه رعايه كامله.
ابو سحر: اي الجنان دا تعال وريني.
روحت انا وعمي نشوف سخر لقيناها نايمه علي السرير ومتغطيه .
دخلت عليها سحر يا سحر انتي كويسه?.
ابوها:انت لازم تطلقها يا استاذ انت اللي محتاج رعايه انت اتجننت.
سحر:مش عايزه اشوفه يا بابا مش عايزه اشوفه.
محمد:سحر انا محمد حبيبك ابو ابنك حبيبتي احنا كلنا في خطر وابوس ايدك اديني فرصه يوم واحد بس ولو الكابوس دا متشالش انا همشي وهنفذلك اللي انتي عايزاه ومش هوريكي وشي بس اديني اخر فرصه.
ابوها :لا فرصه ولا نيله انت هتطلقها بالزوق احسن ما اخليك تطلقها بطريقتي.
محمد:يا فندم افهم بس انت عارف حكايه الاستاذ مصطفي اللي قالبه الدخليه والري العام .
ابو سحر: ايوا وقولتلك انقلك مليون مره منها لو مش حاببها.
محمد:يا فندم دي لعنه ولازم تتحل وحتي لو انا بعدت برضو مش هتسيبنا ودا اللي والله حصل لبنتك امبارح دا السبب وانت مربيني يا فندم وعارف اني مش وحش ولا اقدر ازعل سحر مني لاني بحبها.
ابو سحر: تمام يا محمد بكره القضيه دي تخلص.
محمد: هبدا شغل من النهارده والله بس محتاج طلب.
ابو سحر: اتفضل عايز اي.
محمد : عايز من حضرتك توصيه بس عشان انا هاخد مصطفي معايا في مكان وهو دا اللي هيحل القضيه.


بقلم مصطفي محمود 【▣】
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end

if MsgText[1] == "تخطي حدود 4/3" or MsgText[1]=="تخطي حدود 4/3" then
return [[
【▣】تخطي حدود باقي الجزء الرابع

ابو سحر: هههه انت بتحلم يا استاذ مصطفي مش هيخرج من مكانه دا وزير الدخليه عرف بالموضوع دا ومهما حصل ومهما عملت مش هيخرج.
محمد:يا فندم لازم يخرج من مكانه دا عشان اعرف اشتغل واخلص القضيه.
ابو سحر: الموضوع خرج من ايدي شرفتني وياريت لو مهخلصتش القضيه بكره متنساش تبعت ورقه البنت ياما هيكون ليا تصرف تاني.
محمد:تحت امرك يا فندم.
راح محمد للسنترل التعليمي تاني واول ما دخل لقي المدير في وشه.
المدير : اي ياباشا لقيت حل?.
محمد:القضيه دي بتاعتي وانا اللي هخلصها.
المدير : طيب يا محمد ان شاء الله هتتحل بس انت فكر بعقل واهدا.
محمد : انا هدخل الاوضه تاني يااستاذ انا حاسس اني هلاقي حاجه.
المدير : اتفضل حضرتك المكان اعتبرو بتاعك.
دخل محمد الاوضه وقفل علي نفسه وقعد نفس القعده مستني حاجه تحصل بس مفيش حاجه حصلت. 
عدت ساعه وبرضو مفيش حاجه حصلت ..
زهق محمد وقام من علي الكرسي عشان يفتح الباب ويطلع فجاه سمع صوت وراه بيبص وراه ملقاش حاجه رجع تاني يبص علي الباب ملقاش الباب ..
صرخ محمد باعلي صوت ليه الحقوني الحقوني بس مفيش حد سامعه.
رعت امكانه تاني بس لقي المكان شكله جديد ومتلمع والاوضه نضيفه جدا بص لقي الحيطه اتفتحت لبيت تاني.
دخل محمد السرايا دي لقي نفسه لابس لبس غريب لبس ملوكي من بتاع زمان ولقي نفسه ماشي في وسط ناس بتحتفل في السرايا وعلي اخر السرايا ملك ومراته قاعدين مبسوطين بالرقص والحفله وفجاه باب السرايا اتفتح ومنادي الحفله بيقولوا (والان مع فقره الاسري الرابعه الغجريه)  دخلت بنت نفس البنت اللي ماتت وكنت شايفها في الاوضه كانت جميله جدا ومن شده جمالها مكنتش عارف اشيل عيني من عليها.
وفجاه السكوت عم المكان وابو الغجريه قال:(دقو الطبول احتفالا بمولد حامي العرش الملك المأمون .
الطبول اشتغلت وبدات الغجريه في الغناء بصوتها العذب الذي تطرب اليه الاذن.
وبعد ما خلصت الغجريه الغناء اهدت الملك تمثال مصنوع من الجرانيت القديم وقالت له (تمثال ولي العهد سيديم المامون في امان وسيحتل العالم بفضل قوه اشمون)  .
قال الملك ضاحكآ: (انتم يا غجريين تمونون بما لا نؤمن به ونحن لا نؤمن الا بالله عز وجل وهديتك مقبوله بدافع التقبيل وليس بدافع السحر).
الغجريه:يا ملك ان اشمون يقول لك ان لم تؤمن فسنسلط عليك اجناس الارض من كل مكان واقراد الجان من كل الاركان).. 
الملك ساخرا : يا ويلي اشمون سيقتلني ههههههه
الغجريه ضاحكه:ستموت حصرتا علي زوجتك وسيموت المامون حصرتا علي اخيه.
الملك:اخيه? انا لم انجب سوا المامون?
الغجريه:لعل القادم افضل.
طبعا الملك محطش في دماغو وكمل الحفله والغجريه مشيت وبعدين الباب اتفتح.
المدير: يا محمد يا محمد مالم في ااي.
محمد:اي في ااي .
المدير :انا لقيتك واقع يا محمد في الارض فجريت عليك.
محمد:مصطفي لازم يخرج ويجي هنا هو هيفسر كل دا ويعرف مين المامون ددا.
المدير:يا محمد لو قصدك علي الملك المامون فدا اخر ملك حكم الخلافه الاسلاميه قبل الضعف والتفتت .
محمد:يعني كلام الغجريه صح.
المدير : غجريه اي? ?
محمد:انا هقولك تعال معايا القسم بس هعرفك كل حاجه.
المدير :حاضر انا جي معاك.
محمد:نهايتك قربت يا غجريه وزي ما قضيتي علي حياتنا انا هقضي عليكي.
المدير:طب وهنخرج مصطفي ازاي?
محمد:هتعرف لما نروح القسم.


بقلم مصطفي محمود 【▣】
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end

if MsgText[1] == "تخطي حدود 5" or MsgText[1]=="تخطي حدود 5" then
return [[
【▣】تخطي حدود 5

تخطي حدود.  #لاقيس. (To measure)


مدير السنتر: انت متاكد من اللي احنا هنعملو دا .
محمد:ملكش دعوه بقي تعال من غير كلام كتير انا عارف انا هخرج مصطفي ازاي .
المدير: حاضر يا باشا وانا اللي انت عايزه انا هنفذه.
محمد:تمام.
وبعد خمس دقايق طلع محمد الموبايل بتاعه يتصل علي الشيخ احمد الاسواني.
محمد:الووو شيخ احمد معايا.  
شخص مجهول : الشيخ احمد اتوفي امبارح يا باشا ولما الحكومه دخلت علي بيته لقت جثته مشنوقه في البيت وايده كان فيها اثر حروق كدا كان حد عذبه وقتله والحكومه بتحقق في الموضوع.
محمد ببرود اعصاب كدا : تمام هشوف انا الموضوع دا.
راح محمد عند بيت الشيخ احمد لقي حكومه واقفه بتحقق دخل محمد للظابط اللي بيحقق في القضيه وقاله(متخافش لو قلبت قرد مش هتعرف اي اللي حصل) ..
الظابط : انت مين وازاي دخلت هنا وانت ازاي تكلمني انا كدا.
محمد:انا الظابط محمد احمد مباحث.
الظابط اللي بيحقق في القضيه: اسف يا فندم مع حضرتك الظابط مسعد الشاذلي من مباحث جنائيه.
محمد: طيب يا شاذلي الحل من الموضوع دا عند خارج الطبيعه وهتقولي ازاي هقولك مش عارف انا برضو مش مصدق بس هنعمل اي لازم نامن بان اللي حصل واللي لسا هيحصل دا خارج عن الطبيعه.
الشاذلي : طيب يا فندم والمفروض نعمل اي؟ ..
محمد: لا انت متعملش انت افضل العب في الشقه كدا شويه وانا هخلص القضيه وجي.
الشاذلي : العب ازاي يا فندم يعني مشتغلش؟ .
محمد: اه العبلك10ضغط وكام عقله في المشنقه اللي متعلقه دي لحد ما اخلص واجيلك بالادله تمم.
الشاذلي بنظره سخريه كدا: انت شايف نفسك لي علي فكره بقي انا هوصل انا عارف حقد الظباط دا انا هوصل لحل القضيه وهجيبك القاتل وساعتها هلعبك قدامي انا ضغط.
محمد بسخريه: شاذلي اعتبر نفسك مفصول لو محلتش القضيه وانا هعتبر نفسي مفصول لو انت حليتها تمام.
الشاذلي :تمم.


بقلم مصطفي محمود 【▣】
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end


if MsgText[1] == "تخطي حدود 5/1" or MsgText[1]=="تخطي حدود 5/1" then
return [[
【▣】تخطي حدود باقي الفصل الخامس

مشي محمد متجه للقسم راح الموبايل رن.
الو ممين معايا.
مدير السنتر :انا مدير السنتر يا باشا.
محمد:حلو تعالي علي القسم دلوقتي انا مستنيك هناك.
المدير: يا باشا انا اللي هناك ومستنيك بقالي ساعه.
محمد:اي دا بجد طيب تمام انا جي.
بعد مرور ربع ساعه دخل محمد القسم.
محمد:فين يابني الراجل اللي كان مستنيني ؟.
العسكري:معرفش هو كان لسا هنا.
محمد :لاحسن يكون !! وطلع يجري محمد نحيه حبس مصطفي وفتح الباب لقي مصطفي قاعد بيتكلم مع المدير وبيضحك.
محمد:انت دخلت هنا ازاي؟
المدير : معرفش انا كنت مستنيك برا اصلا روحت اشتري اكل لقيت نفسي هنا مش عارف ازاي.
مصطفي : اه اصل انا فتحت محل بدل القعده ههههههه.
محمد : مش وقته هزار خالص عايزين نشوف حل ازاي نخرجك من هنا.
مصطفي : منا حليتهالك اهو وانت مش مستوعب اني بساعدك وهفضل اساعدك كل مره لحد ما نموت كلنا.
محمد : انت قصدك المدير يبقي مصطفي ومصطفي المدير؟.
مصطفي: شايف حل تاني؟
محمد : لا هي فكره حلوه اووي كمان.
المدير : انتو بتتعازموا علي انكم تحبسوني؟ لا انسوا انا مش هقعد هنا لوحدي دقيقه واحده انا استاذ محترم.
محمد: انا شايف ان دا الحل يا استاذ يا محترم وهي ساعه واحده بس اتاخرنا بلغ ووديني في داهيه يا عم تمم كدا.
المدير : طيب بس والنبي متتاخروش عليا وان شاء الله تلاقوا حل تمام.
مصطفي: ان شاء الله هنلاقي حل.
خرج مصطفي مع محمد في اتجاه للسنتر التعليمي واول ما دخلو الاوضه ملقوش حاجه ..
محمد: احنا هنفضل كدا كتير يا مصطفي؟ ..
مصطفي: انا زيي زيك والله يعني فاهدا شويه.
محمد : طب يلا بينا انا اتخنقت وبعدين الراجل اللي موجود مكانك ملهوش زنب .
مصطفي :تمام بلا بينا .
خرجو مصطفي ومحمد من الاوضه لقوا نفسهم في صحراء محمد بص لمصطفي في دهشه كدا وتعجب  .
محمد:اديني تفسير علمي للي بيحصل دا غير اننا في نهاية العالم.
مصطفي : او تقريبا كدا احنا اتشلحنا.
محمد : طب احنا الاتنين في حلم؟.
مصطفي: احنا في حلم علي اساس واقع ولازم نطلع من الحلم دا.
محمد :طيب واي العمل.
مصطفي: احنا هنمشي في اي اتجاه عادي وربنا يكرمنا بقي .
محمد: طيب ماشي يلا بينا .
فضلو محمد ومصطفي ماشيين في الصحرا دي لحد ما قابلهم بنت شكلها جميل.  محمد بدهشه : انتي مين واحنا فين ؟!.
مصطفي: دي روجينا الطيب اول واحده قتلتها في السنتر.
محمد بحصره: حد يقتل الملاك دا .


بقلم مصطفي محمود 【▣】
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end


if MsgText[1] == "تخطي حدود 5/2" or MsgText[1]=="تخطي حدود 5/2" then
return [[
【▣】تخطي حدود باقي الفصل الخامس


روجينا : استاذ مصطفي انا بحبك اوووي وجايا اقولك اني مش زعلانه منك بالعكس انا في مكان جميل اوووي بس انا حبيت اساعدك ومشوفش الحزن علي وشك وراجعه تاني.
مصطفي : شكرا يا روجينا المفروض هنعمل اي.
روجينا: مش انا اللي هقولك اللي هتقولك اميره علي التله اللي هناك دي.
جري محمد ومصطفي نحيه التله لقي اميره مستنياه وهي مبتسمه.
اميره: استاذ مصطفي شكرا ليك بجد علي اللي انت عملتو معانا واحنا بجد فخورين بيك جدا انت بينت لينا الحقيقه الظاهره وعرفتنا ان اله العدل اله الطبيعه.
محمد: هو انت عملت اي انا مش فاهم حاجه؟ .
مصطفي: يعم ولا انا كمان عارف المهم نطلع من هنا ونشوف الموضوع دا.
مصطفي : طيب يا اميره يا حبيبتي المفروض نعمل اي.
اميره: مش انا اللي هدلكم انتو هتلبسو اللبس دا وتدخلو السرايا اللي هناك دي وهتعرفوا كل حاجه.
لبس محمد ومصطفي الزي الملوكي ودخلو السرايا لقي في وشهم نها مبتسمه لمصطفي وبتقوله انت النور اللي نورت بيه وشنا ممكن تروح تقعد علي كرسي الملك وتستقبل حفلك.
مصطفي: حفلي انا.
نها : اه حفلتك انت يا لاقيس.
محمد: هو في اي يا مصطفي.
مصطفي : روح مع نها وهتعرف كل حاجه منها وانا هستقبل الحفل .
محمد: يلا بينا يا نها..

الاسكندريه عام 2040 ميلادي.

سحر : اي يا هيثم يا حبيبي انت بتعمل اي.
هيثم : مش بعمل حاجه يا ست الكل اهو لسا خارج من الكليه ورايح السنتر عشان ميعاد حصتي قرب بس قولت اقلب شويه في صورنا زمان واشوف والدي.
سحر: الله يرحمه.
هيثم: ماما هو مين مصطفي اللي كان بابا كاتب اسمو في الورق دا؟ .
سحر بغضب: قولتلك مليون مره التزم انت كبيرت وانا خلاص علي عتبه الموت عايزاك تلتزم شويه وتلحق وقت دروسك الطلاب ملهمش دعوه بتاخيرك.
هيثم : طيب طيب يا ماما خلاص اهو انا رايح بس لينا كلام لما اجي.
سحر: حاضر يا حبيبي بس لما تيجي.
بدا حصته هيثم وخلصها وكانت بتتكلم علي حضاره الفرس وازدهارها خلصت الحصه وبدا هيثم يلم ورقه عشان يمشي.
استاذ هيثم استاذ هيثم.
هيثم : افندم؟.
 انا روجينا وانا اميره وانا نها حضرتك احنا مش فاهمين من زحمه السنتر وعايزين ناخد مع حضرتك درس خاص ممكن؟.
------------------------------------------------------------------------


بقلم مصطفي محمود 【▣】
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end

if MsgText[1] == "مقدمه كاتب" or MsgText[1]=="مقدمه كاتب" then
return [[
مقدمه كاتب

المنصوره عام 1946.

كان خلف راجع من الغيط الساعه 6المغرب ومروح علي البيت وصل خلف البيت لقي مراته بتبكي.
خلف:في اي يا وليه مالك بتبكي لي؟ .
مراته: الحق يا خلف ابنك حمدان لحد دلوقتي لسا مرجعش واني نبهت عليه متتاخرش عن الساعه خمسه عشان النداهة متندهوش.
خلف:يا عبيطه ابننا كبر متخافيش ومتحطيش في دماغه الحاجات دي.
مراته : لا يا خلف اتصرف وهاتلي ابني.
خلف : خلاص اهدي اني طالع ادور عليه اهو .
طلع خلف يدور علي ابنه الوحيد حمدان اللي عنده 17سنه ومتعلم وغاوي قرايه كتب وملهوش في الفلاحه يعني زي ابوه.
خلف: حمدان يا ولدي يا حمدان انت فين يا حمدان .
فضل خلف ينادي علي ابنه لحد ما راح نحيه الترعه عند الجسر لقي نور احمر مضي راح عنده لقي ابنه موجود.
حمدان:الحقني يابا اني مش قادر اتحرك.
خلف :ايه دي وايه الكتاب اللي بينور ديه.
حمدان : دا كتاب لقيته في اوضه عم سلمان دجال البلد.
خلف:وانت يابن الكلب اي اللي يوديك عند الراجل الوحش دا تعال معايا.
خلف لما ادرك ان حمدان ولده مش قادر يمشي قام شاله وخد معاه الكتاب وروحوا عالبيت.
الساعه 12بالليل ...
حمدان: اه يارجلي يابا رجلي وجعاني يابا.
مرات خلف: الحق ابنك ياخلف ابنك رجله اسودت واني خايفه اووي عليه اروح ادقله عليها دقيه توم ممكن تطيب؟ .
خلف :لا يا وليه متعمليش حاجه لاحسن رجل الواد تعجز اني هنزل البندر اشوف دكتور بكره انتي بس خليكي معاه دلوقتي وبكره نشوف الموضوع. 
الساعه 5الفجر دخل سليمان الدجال بيت خلف.
خلف:اي اللي جابك يا وش البوم بص كتابك عمل اي في الواد.
سلمان الدجال: فين الكتاب؟ .
خلف:عايز الكتاب اه دا بعينك يا حرامي الكتاب دي اني هوديه للبيه المعاون بايدي.
سلمان: انا هشفيلك ابنك هات الكتاب.
مرات خلف: الحقني يا خلف الواد السواد اللي في رجاله بيطلع علي جسمه.
سلمان:هات الكتاب بسرعه ابنك بيموت.
خلف : امسك اهو الكتاب وابني لو متشفيش وايمانات المصطفي لروح فيك اللومان دا ابني الوحيد ياناس.
سلمان: (الرب الاحد الرب الصمد العنان العنام اتيان ايتيان اتوني مستاكيين مستاكيين الوحي الوحي العجل العجل اتيني اشمون عمام عمام) فجاه نور لمبه الجاز ولع بدرجه كبيره اوووي وبعدين انطفي خالص.
خلف:هو اي اللي حصل.
سلمان الدجال : ابنك تعيش انت يا خلف ابنك لو كان كبر وعاش كان هيفسد في الارض ودا قضاء ربك.
صرخت ام حمدان وابوه في حاله هزل وخوف مبقاش عارف يعمل اي .
خلف: كتابك اللي موت ابني.
سلمان: ابنك اللي موت نفسه يا خلف.
خلف : هات الكتاب دي.
سلمان : لا يخلف الكتاب اكتر مني ومنك.
خلف: هات الكتاب بدل ما اربطك واولع فيك في نص البلد والراجل يحوش عنك.
اخد خلف الكتاب من سلمان ومسك لمبه الجاز وقربها علي الكتاب.
سلمان : انت بتعمل اي يا مجنون هتودينا كلنا في داهية.
خلف : الكتاب دي لازم ينحرق عشان مياذيش حد تاني زي ولدي.
سلمان : انت كدا هتموتنا كلنا لا يا خلف لاااا.
حرق خلف الكتاب وبقي عباره عن رماد ومع حرقه للكتاب بدا الكتاب باخراج اصوات عذاب كأن خلف كان بيحرق راجل مش كتاب.
خلف :يحصل اللي يحصل اني كدا ارتحت.
طلع يجري سلمان نحيه بيته وهو بيجري لقي خيال اسود قدامه.
سلمان:اني مليش دعوه اني طول عمري خدامكم مش اني.
الكتاب كان معاك انت وانت محافظتش عليه.
الساعه 4العصر ..
راجل من البلد: يا خلف يا خلف.
خلف : اي ياواد في اي.
الراجل اللي من البلد: سلمان الدجال ميت مشنوق في الهوا.
خلف : اي دا في الهوا ازاي؟ .
الراجل اللي من البلد : والله زي ما بقولك كدا يا عم خلف والناس كلها خايفه وشكل البلد كلها صابتها العفاريت.
خلف : طيب كلم الشيخ اسماعيل يجي يغسلو وندفنو حرام برضو دا روح.
حاضر ياعم خلف هروح اكلمو.

الساعه6 بالليل ...
الباب خبط.
خلف: مين.
اني حمدان يا ابوي.
خلف : حمدان مين ابني؟.
مرات خلف : افتحلو بسرعه يا خلف ابننا رجع.
خلف : هو كان في السعوديه ياوليه استني ابننا دفناه النهارده دا مش ابننا.
خلف : امشي يا شطان اعوذ بالله من الخبث والخباث.
وفجاه قامت صرخات في البلد وكل يوم بيت يولع وحد يموت وياترا البلد دي هتفضل علي حالها كدا؟ ..


كدا بدايه الروايه خلصت ودا مش البارت الاول لا يسطا دا مقدمه للرواية عشان تعرف احنا كلامنا هيكون علي اي.


بقلم مصطفي محمود 【▣】
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end



if MsgText[1] == "كاتب 1" or MsgText[1]=="كاتب 1" then
return [[
كاتب 1【▣】


بتأمن بالاشباح والجن والشغل دا؟ ..
طب لو بتأمن عمرك شوفتهم او حسيت بيهم؟..
كنت دايما بسأل نفسي الاساله دي واقعد اوهم نفسي بكدا لحد ما كبرت وعرفت ان اي حاجه انت او انتي بتتخيلها فعقلك هو اللي بيخليك تشوفها ومش بتكون حقيقيه زي مثلا وانت نايم ممكن تحس بخيال بيجري او ممكن تلاقي ركن من اركان بيتك فيه خيال بيتحرك ولو انت في دماغك ان دا شبح فمخك هياكدلك انه شبح لكن لو في خيالك ان دا مثلا خيال جاي من الشباك او ضعف نظر منك او تخاريف من وحي مخك فمخك هياكدلك كدا بس دا برضو ميمنعش ان في اشباح وفيه جن وانا من كتر حبي في الاثاره والمواضيع دي مبقتش اتكلم غير عليها ..
انا اسمي احمد الضبع شاب عندي 25سنه طموح جدا بدرس في جامعه القاهره في كليه اداب قسم عربي بس تقريبا كدا بكسل اقرا صفحه من كتب الكليه مع اني ممكن اقرا روايه مرعبه كامله في يوم ومن كتر حبي في الرعب الخوارج الطبيعيه بقيت بكتب روايات رعب ورواياتي بقت معروفه وبقيت مشهور جدا والناس عارفاني عملت اكتر من كتاب وكل كتبي بقت مشهوره ومبيعاتها بقت في العالي لحد ما جي عليا اليوم اللي اعتزلت فيه كتابه ايوا اعتزلت كتابه لاني حسيت اني سبب في قتل شخص كان معجب باعمالي جدا وقبل ما يموت كلمني وقالي (يا ضبع انا خايف انا بحس بحاجات بتلمسني وانا نايم وعشان اصحي لازم حد يفوقني وممكن اصحي وافتح عيني ومقدرش اتحرك لحد ما حد يجي يلمسني ويفوقني)  انا كنت بقول دا عادي جدا واحد معجب بقصصي وخياله واسع وعايز يخوفني وخلاص بس اكتشفت بعديها بيومين ان الشخص دا مات منتحر ولما روحت بيته وقابلت اهله لقيته كان محتفظ بكل كتبي وكان بيكتب كلام مش مفهوم زي الساحره والاسقاط النجمي وشبح النوم والجاثوم دول حاجات انا كنت بتكلم فيها بس بعمق كبير اوووي فهل انا كنت السبب في قتل روح بسبب كتاباتي؟؟.
انا فكرت خلاص ولازم ابعد عن كل حاجه وارجع جامعتي واعلن اعتزلي واذاكر.
اول يوم ليا في الجامعه بعد ما كنت منقطع الناس طلعت تجري عليا تتصور معايا واعمالك وكدا وانا معتزل ومش عايز اقول لي مش عايز اخوف حد مني مش عايز الناس تشوفني مسخ شيطان ويرموا عليا اخطاء مش اخطاءي.
يمكن اكون انا فيا حاجه مش عند حد او يمكن عشان دايما لوحدي ومش بحب اكلم حد او اقعد مع حد فالناس واصحابي شايفيني متوحد ومش طبيعي؟ !..
انا لازم اتعرف علي ناس واكون صدقات وابقي ناجح في حياتي العمليه ودا اللي حصل في اول اسبوع كليه اتعرفت علي 4اشخاص.
محمد مصطفي النجار ودا كان اجدع شخص عرفته ومن الناس المحترمه جدا زي ما بتقولوا صاحب صحبه يعني.
تاني شخص كان مينا كميل ودا كان الكوميدي بتاع الشله اللي لو كنت عندك هم الدنيا هيضحكك يعني هيضحكك وطيب جدا.
تالت شخص كان ادهم كمال ودا كان وسيم الشله الراجل اللي مهتم بجسمو وشعرو وبيحب الموضه وكدا يعني.
رابع شخص كانت مريم مصطفي دي كانت بنت اه بس بمليون راجل كانت بتحب الهزار ودحيحه الدفعه واللي كنا حاطين امل نجاحنا فيها.
الناس دي بجد عوضتني عن الشهره اللي ضاعت من اعتزالي وعوضوني عن الوحده اللي كنت عايش فيها وكنت بحبهم اوووي وبيحبوني اوووي .
النهارده انا رايح الكليه ولابس احسن لبس في دولابي عشان جميله وجميله دي كانت اجمل بنت في الكليه وكانت يعتبر البنت اللي رسمها خيالي انها تكون ام لاولادي.
ادهم : يا ضبع؟  انت ياض .
اي اي عايز اي يا ادهم مش وقتك.
اادهم : ياض الوتكه بتاعتك جات اهي ادخل اشقط ياض والا اشقطهالك انا.
ادهم انت عارف اني مش بحب الهزار بالطريقه دي ولو هتمشي عالنمط دا هنخسر بعض.
مريم: يا احمد فكك منو وبعدين بنت مين اللي تشقطها يا ادهم مفيش بنت بتشقط بنت.
مينا: اوبا واحده واحده يا مريم عليه ادهم لسا صغير وبعدين هما بيهزروا يعني مش موضوع.
مريم : طب منا كمان بهزر.
ادهم: بصي يا مريم انا مش هرد عليكي عشان ميقولوش راجل زعق في بنت وعشان صحوبيتنا.
مريم : لا انا اللي مش هرد عليك عشان ميقولوش بنتين اتخانقوا مع بعض في الكليه.
يوووه متهدي بقي يا مريم خلاص هو ادهم كدا بيحب يهزر كتير وانت يا ادهم هزر في اي حاجه بس دي خط احمر.
مينا: انتو بتتخانقوا والبنت هتمشي يابني الله يرضي عليك ادخل كلمها.
طب يا مينا اقولها اي؟.


بقلم مصطفي محمود 【▣】
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end

if MsgText[1] == "كاتب 1/1" or MsgText[1]=="كاتب 1/1" then
return [[
【▣】باقي كاتب الفصل الاول

مينا : قولها مثلا مدرج ب منين هتقولك من هنا قولها طب انا جديد ممكن تيجي تعرفيني فين ولما تمشي معاها خد الرقم عشان تذاكرك وخلصت يا ببرو.
ياعم اي حركات الاطفال دي وبعدين ازاي انا مش عارف مدرج ب وانا شحط كدا وكبير.
مريم: طب اروح اكلمهالك انا احنا بنات زي بعض عادي.
لا يا مريم عشان مش عايز اتجرح واحرجك معايا كمان.
محمد مصطفي: والله يا احمد انا شايف ان كل دا عبط واسلم حل انك تروح تطلب ميعاد وتتقدم زي ما قال الله ورسوله عشان دا غلط وحرام.
طيب با محمد افهم انا والله ناوي علي خير وجواز بس افرض اتقدمت وهي مش عايزاني واترفضت لازم اكون عارف راسي من رجلي فهمت.
محمد: طب يلا يا احمد روح كلمها وصدقني هتتكلم معاك متنساش انك كنت شبح الرعب ومتسيط.
تمام انا رايح.
مشيت وانا خايف لاني اول مره اتكلم مع بنت في المواضيع دي واقولها اني معجب بيها .. دخلت عليها وهي قاعده علي الكرسي وقولتلها ممكن اقعد معاكي.
جميله : اه اتفضل طبعا.
انتي جميله؟ .
جميله : اه انا جميله.
لا مش قصدي اسمك انا قصدي وصفك.
جميله : اااااه وانت عبيط؟.
لا انا احمد .. احمد الضبع.
جميله: طب وانا مالي اعملك اي؟ .
لا انا بعرفك علي نفسي بس.
جميله : طيب يا سيدي شكرا عايز حاجه؟.
انتي متعرفنيش؟.
جميله لا والله اول مره اتشرف.
انا الضبع شبح الرعب بتاع الكتب.
جميله: انا سمعت الاسم دا قبل كدا بس مكدبش عليك انا مش بتابع رعب.
طيب دي قناتي يوتيوب اعملي سيرش عنها وامسكي دا اخر كتاب ليا كتابته ابقي اقريه.
جميله: تمام هقراه وهبقي ارجعهولك يا احمد.
لا ممكن تعتبريه هديه مني ليكي.
جميله : ميرسي يا احمد علي زوقكك بس الكتاب دا ناقص؟
اه مننا مكملتهوش واعتزلت.
جميله :واعتزلت لي بقي ياعم الضبع خوفت والا اي.
امممم حاجه زي كدا .
جميله : مسمي نفسك شبح رعب وبتخاف؟.
اه بخاف كلنا بنخاف وربنا زارع في كل قلب واحد خوف ومن غير الخوف ممنقدرش نعيش ومفيش حد مش بيخاف.
جميله: طيب يا فيلسوف احمد انا لازم امشي عشان عشان ورايا سكشن وشكرا عالكتاب وهبقي اقولك رايي علي رقمك اللي علي الكتاب تمام.
تمام يا جميله.. هو احنا هنتقابل تاني.
جميله: ان شاء الله.
طيب سلام عشان معطلكيش.
جميله: سلام.
مريم: الجان بتاعنا عمل اي؟؟.
جميله اوووي يا مريم.
مريم : اه ومحترمه.

بقلم مصطفي محمود 【▣】
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end

if MsgText[1] == "كاتب 1/2" or MsgText[1]=="كاتب 1/2" then
return [[
【▣】باقي كاتب الفصل الاول

ادهم: يعم محترمه اي ممفيش بنت محترمه وملكيش دعوه يا مريم انا بتكلم علي البنات فمتحطيش نفسك.
مريم: يعني انت امك مكنتش محترمه؟.
ادهم : لا امي مش بنت امي ست هههه.
مينا: بقولك اي يسطا انت متتكلمش تاني بقي عشان البنت دي هزقتك وانا عايز اقف معاك بس انت غلطان فاسكت بقي .
محمد: سيبك منهم يا احمد حسيت معاها باي؟.
يااااااه يا محمد بجد احلي 10دقايق في حياتي اللي كلمتها فيهم ببجد.
محمد: طيب يا حبيبي ربنا يكتبها ليك يرب ويلا بقي عشان نروح.
تمام يلا .
الساعه 12 بالليل.
احمد معايا؟.
اه انا احمد مين.
انا جميله.
جميله عامله اي .
جميله انا تتمام والروايه بدات فيها وتجنن بجد.
طيب لما تخلصيها قوليلي.
جميله:بس مش ععارفه في حاجه غريبه.
اي هي في ااي.
جميله:حاسه ان نفسي مقبوض كدا وحاسه بخيالات واوهام.
طب خلاص متكمليش الروايه ممكن تكوني ببتخافي وعاقلك وهمك.
جميله : لا متخافش عليا انا اهو قربت اخلص علي بارت الساحره وداخله علي الجاثوم.
طيب يا جميله هسيبك تكملي الروايه وانا فاتح اهو ابقي ككلميني.
جميله : حاضر يا احمد.

الساعه 3الفجر...

جميله : احمد الحقي يا احمد اانا خايفه.
اي مالك في اي؟ .
جميله: انا خايفه اوووي وحاسه ان في حاجه باصه عليا او حد متابعني ومش عارفه اعمل اي .
طب اقعدي مع اهلك طيب والا اجيلك طيب؟.
جميله:طيب طيب انا هتغطي واكلمك وانت متسيبنيش.
حاضر اهدي انا معاكي اهو.
جميله : شكرا بجد ليك انك معايا.
انتي طيب في اي مالك فيكي اي.
جميله: مش عارفه والله يا احمد انا اول مره اخاف ككدا.
خلاص يا حبيبتي نامي وبكره نتكلم.
جميله: احمد في حد بيسحب مني الغطاء.
لا يا حبيبتي مفيش حاجه موجوده اهدي.
جميله في ريكورد : الحقني يا احمممممممد...

بقلم مصطفي محمود 【▣】
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end


if MsgText[1] == "اسبام رسائل" or MsgText[1]=="اسبام رسائل"then
return [[
【▣】رسائل اسبام

apt install git

وبعده

git clone https://github.com/TheSpeedX/TBomb.git

وبعده

cd TBomb

وبعده

chmod +x TBomb.sh

وبعده

./TBomb.sh

هيظهرلك المسدج دا 

Press any key to continue...

اضغط 

+

وبعدين اختار 1

وبعدين اكتب الرمز الدولي

وبعدين رقم الفون

وبعدين عدد الرسائل (اكبر عدد 100 رساله )

وبعدين عدد الثواني الفاصل بفضله يبقي 1

وبعدين اكتب 100

وبعدين انتر

ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end


if MsgText[1] == "اختراق كاميرات مراقبه" or MsgText[1]=="اختراق كاميرات مراقبه" then
return [[
【▣】اختراق كاميرات مراقبه

خد الاوامر دي كوبي مره واحده 

apt update && apt upgrade -y
pkg install python3
apt install git
git clone https://github.com/AngelSecurityTeam/Cam-Hackers
pip3 install requests
cd Cam-Hackers
python3 cam-hackers.py 

هيظهرلك قائمه فيها 91 دوله

اختار الدوله اللي تعوزها
واكتب ورقمها وبعدين دوس انتر
واستني التحميل وخد اي رابط من اللي هيظهرو
وحطه ف جوجل كروم
واضغط بحث

ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end

if MsgText[1] == "اداة nikto" or MsgText[1]=="اداة nikto" then
return [[
【▣】اداة nikto

اداة nikto . تستخدم هذه الاداة بشكل كبير في فحص المواقع من الثغرات والبورتات المفتوحة والمعلومات الاساسية في المواقع المستهدفة ...

اوامر التثبيت كالأتي 
ومثل كل مرة في بداية كل شرح اكتب امر التحديث 
pkg update

وفي حال كنت مستخدم جديد في تيرمكس ولم ثبت ال git 
اكتب الامر 
pkg install git 

والأن . بما ان الاداة تعمل بلغة perl عليك تثبيت حزم لغة ال perl 

pkg install perl

وامر تنصيب الاداة
git clone https://github.com/sullo/nikto


امر فتح مجلد الاداة 
cd nikto

cd program

امر تشغيل الاداة 

perl nikto.pl

والأن نريد فحص موقع محدد مثلاً 
هذا الموقع www.gov.il 

امر الفحص ستكتبه بهذا الشكل...
perl nikto.pl -h www.gov.il

ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end

if MsgText[1] == "اداه Ax1" or MsgText[1]=="اداه Ax1" then
return [[
اداه Ax1【▣】

اداهه لتثبيت جميع الادوات للمبتدئين بضغطت زر فقط
pkg install git
pkg install bash
git clone https://github.com/Ax1-Ahmedx1/Ax1-Tools.git
cd Ax1-Tools
chmod +x Ahmed-Ax1.sh
./Ahmed-Ax1.sh

انتظر 10 ثواني لحين فتح الاداه
الاداه بتحمل جميع الحزم تلقائيا ما عليك سوي الضغط علي y اذا واجهتك (y, n)  
بعد تثبيت جميع الادوات قم بفتح الاداهه مرة اخري وستري الفرق

ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end

if MsgText[1] == "darkfly" or MsgText[1]=="darkfly" then
return [[
اداة darkfly【▣】

تحتوي علي 600 نوع من الأدوات
للتثبيت أدخل الأوامر التالية

apt update

apt upgrade

git clone https://github.com/Ranginang67/DarkFly-Tool


chmod +x *

python2 install.py
والان تم تثبيت الأداة
لتشغيل الأداة أكتب الأمر التالي

 DarkFly

ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end

if MsgText[1] == "الميتا" or MsgText[1]=="الميتا" then
return [[
الميتا【▣】

apt update && apt upgrade 
pkg install curl
pkg install git
pkg install openssh
pkg install ruby
تابع هذه الاوامر جيدا
gem install bundle
gem install bundler
git clone https://github.com/rapid7/metasploit-framework
ls
cd metasploit-framework

نقوم بدخول الى نظام ميتاسبلويت عبر الامر
msfconsole

ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end

if MsgText[1] == "اختراق فيسبوك" or MsgText[1]=="اختراق فيسبوك" then
return [[
【▣】اختراق فيسبوك

apt install git
apt install python
apt install python2
git clone https
شيل المسافه
://github.com/M-T-R/hack.MTR.git
cd hack.MTR
chmod +x *
ls
الان صناعه لسته الباسوردات وبعد الانتهاء منها اكتب

python list.py

ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end

if MsgText[1] == "وضع اسمك" or MsgText[1]=="وضع اسمك" then
return [[
【▣】وضع اسمك علي واجهه تريمكس

git clone https://github.com/Bhai4You/Termux-Banner

cd Termux-Banner

chmod 777 t-ban.sh 4-requirement.sh

bash requirement.sh

bash t-ban.sh

وبعدين اكتب اسمك واعمل انتر

وبعدين اكتب اسم الشهره و انتر

وبعدين اكتب exit او اختارها من ستاره الفون

ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end

if MsgText[1] == "weeman" or MsgText[1]=="weeman" then
return [[
اداة weeman【▣】

أداة weeman : هي اداة تقوم ب انشاء صفحة وهمية في  تسجيل الدخول إلى فيسبوك اي توهم الضحية بانه موقع فيسبوك اي عندما يقوم بتسجيل الدخول إلى فيسبوك ويدخل حسابه فالمعلومات التي أدخلها تصل اليك عن طريق الأداة.
المتطلبات والاوامر :
 تثبيت اداه ngrok وبعد التثبيت
لتثبيت انسخ هذا :    
git clone https://github.com/samyoyo/weeman
اوامر التشغيل :
set url http://www.fb.com
set action_security http://www.fb.com
set action_security url http://www.fb.com
set action_url http://www.fb.com
run
بعد فتح نافذة جديدة نكتب 8080 http ngrok/. هذا الامر لفتح البورت 

بعد كتابة run انتظر قليلا وسيظهر رابط تقوم ب ارساله للضحية واقنعه يدخل حسابه
بعد ان يدخل حسابه سوف يوصلك عالاداة نفسها وهكذا تتم العملية بنجاح


ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end

if MsgText[1] == "اظهار داتا الاصدقاء" or MsgText[1]=="اظهار داتا الاصدقاء" then
return [[
اظهار داتا الاصدقاء【▣】

pkg install python2

pkg install git 

git clone https://github.com/CiKu370/OSIF

cd OSIF

pip2 install -r requirements.txt

chmod 777 osif.py

python2 osif.py

token
تكتب الميل والباسورد الخاص بك 
ملحوظة كلمه السر تكون مخفية وهذا شي طبيعي


ls

python2 osif.py
هذا لايظهار ايمل اصدقا۽ك كاملا


dump_mail

ــــــــــــــــــــــ❍ـــــــــــــــــــــ
 ❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 >> [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
]]
end

if MsgText[1] == "التاريخ" then
return "\n❍  الـتـاريـخ : "..os.date("%Y/%m/%d")
end

if MsgText[1]== "سحكاتي" then
return '❍ **عدد سحكاتك ⇜ ❪ '..(redis:get(black..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ❫ \n'
end

if MsgText[1] == 'مسح' and MsgText[2] == 'سحكاتي'  then
local rfih = (redis:get(black..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
if rfih == 0 then  return "❍ *│* لا يوجد سحكات لك في البوت ." end
redis:del(black..':edited:'..msg.chat_id_..':'..msg.sender_user_id_)
return "❍ *│*تم مسح {* "..rfih.." *} من سحكاتك .\n"
end

if MsgText[1] == "تفعيل الاشتراك الاجباري" or MsgText[1] == "تفعيل الاشتراك الاجباري ☑" then
if not msg.SudoBase then return"❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" end
if redis:get(black..":UserNameChaneel") then
return "❍ اهلا عزيزي المطور \n❍ الاشتراك بالتأكيد مفعل"
else
redis:setex(black..":ForceSub:"..msg.sender_user_id_,350,true)
return "❍ مرحبا بـك في نظام الاشتراك الاجباري\n❍ الان ارسل معرف قـنـاتـك"
end
end

if MsgText[1] == "تعطيل الاشتراك الاجباري" or MsgText[1] == "تعطيل الاشتراك الاجباري ♻️" then
if not msg.SudoBase then return"❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" end
local SubDel = redis:del(black..":UserNameChaneel")
if SubDel == 1 then
return "❍ تم تعطيل الاشتراك الاجباري . \n✓"
else
return "❍ الاشتراك الاجباري بالفعل معطل . \n✓"
end
end

if MsgText[1] == "الاشتراك الاجباري" or MsgText[1] == "الاشتراك الاجباري ⚠️" then
if not msg.SudoBase then return"❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" end
local UserChaneel = redis:get(black..":UserNameChaneel")
if UserChaneel then
return "❍ اهلا عزيزي المطور \n❍ الاشتراك الاجباري للقناة : ["..UserChaneel.."]\n"
else
return "❍ لا يوجد قناة مفعله على الاشتراك الاجباري . \n"
end
end

if MsgText[1] == "تغيير الاشتراك الاجباري" or MsgText[1] == "تغيير الاشتراك الاجباري 🔁" then
if not msg.SudoBase then return"❍ **هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(black..":ForceSub:"..msg.sender_user_id_,350,true)
return "❍ مرحبا بـك في نظام الاشتراك الاجباري\n❍ الان ارسل معرف قـنـاتـك"
end





end

local function dblack(msg)



local getChatId = function(id)
  local chat = {}
  local id = tostring(id)
  if id:match("^-100") then
    local channel_id = id:gsub("-100", "")
    chat = {ID = channel_id, type = "channel"}
  else
    local group_id = id:gsub("-", "")
    chat = {ID = group_id, type = "group"}
  end
  return chat
end
local getChannelFull = function(channel_id, cb)
  tdcli_function({
    ID = "GetChannelFull",
    channel_id_ = getChatId(channel_id).ID
  }, cb or dl_cb, nil)
end

local getUser = function(user_id, cb)
tdcli_function({ID = "GetUser", user_id_ = user_id}, cb, nil)
end
local getChat = function(chat_id, cb)
tdcli_function({ID = "GetChat", chat_id_ = chat_id}, cb or dl_cb, nil)
end


if redis:get(black..'welc'..msg.chat_id_) == 'on' then
if msg.content_.ID == 'MessageChatJoinByLink' then
function WelcomeByAddUser(BlaCk,Diamond)
local function setlinkgp(td,mrr619)
function gps(arg,data)

txt = '❍ اهلآ عزيزي '..(Diamond.first_name_ or '---')..'\n❍ المجموعه  '..(data.title_ or '---')..' \n❍ احترام الادمنيه\n❍ ممنوع طلب الرتب\n❍ ممنوع السب \n❍ ممنوع التكلم بالسياسة\n❍ الاعضاء '..mrr619.member_count_..' عضو\n❍ الادمنيه '..mrr619.administrator_count_..' \n❍ وقت الانضمام :【*'..os.date("%H:%M:%S")..'*】\n❍ تاريخ الانضمام :【*'..os.date("%Y/%m/%d")..'*】\n'
sendMsg(msg.chat_id_,msg.id_,txt)
end
getChat(msg.chat_id_,gps)
end
getChannelFull(msg.chat_id_,setlinkgp)
end
getUser(msg.sender_user_id_,WelcomeByAddUser)
end
end



local Text = msg.text
if Text then


if Text and (Text:match('(.*)')) and tonumber(msg.sender_user_id_) ~= 0 then
function dl_username(arg,data)
if data.username_ then
info = data.username_
else
info = data.first_name_
end
local hash = black..'user_names:'..msg.sender_user_id_
redis:set(hash,info)
end
getUser(msg.sender_user_id_,dl_username)
end

------set cmd------
Black = msg.text 
if Black == 'رفع مشرف كامل' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "❍ **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function setadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'❍ البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'❍ الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\n❍ تم رفعه مشرف بكامل الصلاحيات\n‏‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},setadmins,nil)

return false

end




if Black == 'رفع مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "❍ **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function setadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'❍ البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'❍ الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\n❍ تم رفعه مشرف \n‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},setadmins,nil)

return false

end




if Black == 'تنزيل مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "❍ **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function remadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'❍ البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'❍ الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\n❍ تم ازالته من الاشراف\n‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},remadmins,nil)

return false

end




if Black == 'تنزيل مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "❍ **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function remadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'❍ البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'❍ الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\n❍ تم إزالته من الاشراف')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},remadmins,nil)

return false

end
mmd = redis:get(black..'addcmd'..msg.chat_id_..msg.sender_user_id_)
if mmd then
redis:sadd(black..'CmDlist:'..msg.chat_id_,msg.text)
redis:hset(black..'CmD:'..msg.chat_id_,msg.text,mmd)
sendMsg(msg.chat_id_,msg.id_,'❍ اهلا عزيزي \n❍ تم تثبيت الامر الجديد\n✓')
redis:del(black..'addcmd'..msg.chat_id_..msg.sender_user_id_)
end

if Black:match('تغير امر (.*)') then
if not msg.Kara then return "❍ **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local cmd = Black:match('تغير امر (.*)') 
redis:setex(black..'addcmd'..msg.chat_id_..msg.sender_user_id_,120,cmd)
sendMsg(msg.chat_id_,msg.id_,'❍ اهلا بك عزيزي\n❍ الامر الي تريد تغيره الي  "'..cmd..'" \n❍ ارسله الان\n')
end

if Black and (Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')) then
if not msg.Kara then return "❍ **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local cmd = Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')
redis:hdel(black..'CmD:'..msg.chat_id_,cmd)
redis:srem(black..'CmDlist:'..msg.chat_id_,cmd)
sendMsg(msg.chat_id_,msg.id_,"❍ اهلا عزيزي\nالامر >"..cmd.."\n❍ تم مسحه من قائمه الاوامر\n")
end
if Black == 'مسح قائمه الاوامر' or Black == 'مسح قائمه الاوامر' then
if not msg.Kara then return "❍ **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
redis:del(black..'CmD:'..msg.chat_id_)
redis:del(black..'CmDlist:'..msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,"❍ اهلا عزيزي تم مسح قائمه الاوامر")
end
if Black == "قائمه الاوامر" then
if not msg.Kara then return "❍ **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local CmDlist = redis:smembers(black..'CmDlist:'..msg.chat_id_)
local t = '❍ قائمه الاوامر : \n'
for k,v in pairs(CmDlist) do
mmdi = redis:hget(black..'CmD:'..msg.chat_id_,v)
t = t..k..") "..v.." > "..mmdi.."\n" 
end
if #CmDlist == 0 then
t = '❍ عزيزي لم تقم ب اضافه امر .'
end
sendMsg(msg.chat_id_,msg.id_,t)
end




if Black == 'welcome on' or Black == 'تفعيل الترحيب' then
if redis:get(black..'welc'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل الترحيب سابقا')
else
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل الترحيب')
redis:set(black..'welc'..msg.chat_id_,'on')
end
end
if Text == 'welcome off' or Text == 'تعطيل الترحيب' then
if redis:get(black..'welc'..msg.chat_id_) == 'off' then
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل الترحيب سابقا')
redis:set(black..'welc'..msg.chat_id_,'off')
redis:del(black..'welc'..msg.chat_id_,'on')
else
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل الترحيب')
end
end

if Black == 'welcome on' or Black == 'تفعيل البلاك تيم' then
if redis:get(black..'welc'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل البلاك تيم سابقا')
else
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل البلاك تيم')
redis:set(black..'welc'..msg.chat_id_,'on')
end
end
if Text == 'welcome off' or Text == 'تعطيل تيم البلاك' then
if redis:get(black..'welc'..msg.chat_id_) == 'off' then
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل تيم البلاك سابقا')
redis:set(black..'welc'..msg.chat_id_,'off')
redis:del(black..'welc'..msg.chat_id_,'on')
else
sendMsg(msg.chat_id_,msg.id_,'تم البلاك الترحيب')
end
end


if Text == "join on" and msg.SudoUser then
redis:set(black..'joinchnl',true)
sendMsg(msg.chat_id_,msg.id_,'on')
end
if Text and redis:get(black..'setchs') and msg.SudoUser then
redis:set(black..'setch',Text)
sendMsg(msg.chat_id_,msg.id_,'تم تعين القناه علي \n'..Text)
redis:del(black..'setchs')
end
if Text and (Text:match("^setch$")) and msg.SudoUser then
sendMsg(msg.chat_id_,msg.id_,'ارسل معرفك بدون @')
redis:setex(black..'setchs',120,true)
end


if Text == 'time' or Text == 'الوقت' and is_JoinChannel(msg) then
local colors = {'blue','green','yellow','magenta','Orange','DarkOrange','red'}
local fonts = {'mathbf','mathit','mathfrak','mathrm'}
local url1 = 'http://latex.codecogs.com/png.download?'..'\\dpi{600}%20\\huge%20\\'..fonts[math.random(#fonts)]..'{{\\color{'..colors[math.random(#colors)]..'}'..os.date("%H:%M")..'}}'	
file = download_to_file(url1,'time.webp')

print('TIMESSSS')
sendDocument(msg.chat_id_,msg.id_,file,'',dl_cb,nil)
end
if Text:match('^tosticker$') or Text:match('^تحويل ملصق$') and tonumber(msg.reply_to_message_id_) > 0 then
whoami()
BD = '/home/root/.telegram-cli/data/'
function tosticker(arg,data)
if data.content_.ID == 'MessagePhoto' then
if BD..'photo/'..data.content_.photo_.id_..'_(1).jpg' == '' then
pathf = BD..'photo/'..data.content_.photo_.id_..'.jpg'
else
pathf = BD..'photo/'..data.content_.photo_.id_..'_(1).jpg'
end
sendSticker(msg.chat_id_,msg.id_,pathf,'')
else
sendMsg(msg.chat_id_,msg.id_,'❍ عزيزي المستخدم\n❍ الامر فقط للصوره\n')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tosticker, nil)
end

if Text == 'tophoto' or Text == 'صوره' and tonumber(msg.reply_to_message_id_) > 0 then
function tophoto(kara,black)   
if black.content_.ID == "MessageSticker" then        
local bd = black.content_.sticker_.sticker_.path_          
sendPhoto(msg.chat_id_,msg.id_,bd,'')
else
sendMsg(msg.chat_id_,msg.id_,'❍ عزيزي المستخدم\n❍ الامر فقط للملصق\n✓')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tophoto, nil)
end
end

if msg.type == "pv" then 

if not msg.SudoUser then
local msg_pv = tonumber(redis:get(black..'user:'..msg.sender_user_id_..':msgs') or 0)
if msg_pv > 5 then
redis:setex(black..':mute_pv:'..msg.sender_user_id_,18000,true)   
return sendMsg(msg.chat_id_,0,'*❍ * تم حظرك من البوت بسبب التكرار \n') 
end
redis:setex(black..'user:'..msg.sender_user_id_..':msgs',2,msg_pv+1)
end

if msg.text=="/start" then 

if msg.SudoBase then
local text = '- شكراً لك لإستخدام سورس بلاك\n- أنت المطور الاساسي هنا\n—————————\n\n- يمكنك الأن التحكم بأوامر البوت عن طريق لوحة التحكم بالبوت\nفقط انقر على الأمر الذي اريده‏'
local keyboard = {
{"المطور الجوكر","المبرمج جاك"},
{"مصنع بوتات المبرمج"},
{"ضع اسم للبوت","ضع صوره للترحيب"},
{"تفعيل البلاك تيم","تعطيل تيم البلاك"},
 {"تعطيل التواصل","تفعيل التواصل"},
{"تعطيل البوت خدمي","تفعيل البوت خدمي","المطورين"},
 {"المشتركين","المجموعات","الاحصائيات"},
 {"اضف رد عام","الردود العامه"},
{"اذاعه بالتثبيت"},
 {"تحديث","قائمه العام","ايدي"},
{"تعطيل الاشتراك الاجباري","تفعيل الاشتراك الاجباري"},
{"تغيير الاشتراك الاجباري","الاشتراك الاجباري"},
{"تنظيف المشتركين","تنظيف المجموعات"},
 {"نسخه احتياطيه للمجموعات","رفع نسخه الاحتياطيه"},
 {"تحديث السورس"},
 {"قناة السورس"},
 {"الغاء"}}
return send_key(msg.sender_user_id_,text,keyboard,nil,msg.id_)
else
redis:sadd(black..'users',msg.sender_user_id_)
if redis:get(black..'lock_service') then 
text = [[❍ أهلاً انا بوت   []]..redis:get(black..':NameBot:')..[[] 🗽
❍ أختصاصي حماية المجموعات ..
❍ مـن السبام والتوجيه والتكرار والخ..
❍ لتفعيل البوت اتبع الشـروط ..
1- اضف البوت الى المجموعه
2- ارفع البوت مشرف في المجموعه
2- ارسل تفعيل وسيتم تفعيل البوت ورفع مشرفي القررب تلقائياً .

ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
 ❍ مـعـرف الـمـطـــور : ]]..SUDO_USER..[[
]]
else
text = [[❍ أهلاً انا بوت    []]..redis:get(black..':NameBot:')..[[] 🗽
❍ أختصاصي حماية المجموعات ..
❍ مـن السبام والتوجيه والتكرار والخ..
❍ لتفعيل البوت اتبع الشـروط ..
1- اضف البوت الى المجموعه
2- ارفع البوت مشرف في المجموعه
2- ارسل تفعيل وسيتم تفعيل البوت ورفع مشرفي القررب تلقائياً .

ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
 ❍ مـعـرف الـمـطـــور : ]]..SUDO_USER..[[
]]
end
xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
local inline = {{{text="مـطـور الـبـوت ✓",url="t.me/"..xsudouser}}}
send_key(msg.sender_user_id_,text,nil,inline,msg.id_)
return false
end
end
 
if msg.SudoBase then
if msg.reply_id and msg.text ~= "رفع نسخه الاحتياطيه" then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,datainfo)
if datainfo.forward_info_ then
local FwdUser = datainfo.forward_info_.sender_user_id_
local FwdDate = datainfo.forward_info_.date_
GetUserID(FwdUser,function(arg,data)
local MSG_ID = (redis:get(black.."USER_MSG_TWASEL"..FwdDate) or 1)
if msg.text then
sendMsg(FwdUser,MSG_ID,Flter_Markdown(msg.text))
elseif msg.sticker then
sendSticker(FwdUser,MSG_ID,sticker_id,msg.content_.caption_ or '')
elseif msg.photo then
sendPhoto(FwdUser,MSG_ID,photo_id,msg.content_.caption_ or '')
elseif msg.voice then
sendVoice(FwdUser,MSG_ID,voice_id,msg.content_.caption_ or '')
elseif msg.animation then
sendAnimation(FwdUser,MSG_ID,animation_id,msg.content_.caption_ or '')
elseif msg.video then
sendVideo(FwdUser,MSG_ID,video_id,msg.content_.caption_ or '')
elseif msg.audio then
sendAudio(FwdUser,MSG_ID,audio_id,msg.content_.caption_ or '')
end 

if data.username_ then 
USERNAME = '@'..data.username_
else 
USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or ""),20) 
end
USERCAR = utf8.len(USERNAME)

SendMention(msg.sender_user_id_,data.id_,msg.id_,"❍ تم ارسال الرسالة .\n❍ إلى : "..USERNAME.." .",39,USERCAR) 
return false 
end,nil)
end  
end,nil)
end 
else
if not redis:get(black..'lock_twasel') then
if msg.forward_info_ or msg.sticker or msg.content_.ID == "MessageUnsupported" then
sendMsg(msg.chat_id_,msg.id_,"❍ عذراً لا يمكنك ارسال { توجيه‌‏ , ملصق , فديو كام} .")
return false
end
redis:setex(black.."USER_MSG_TWASEL"..msg.date_,43200,msg.id_)
sendMsg(msg.chat_id_,msg.id_,"❍ تم آرسـآل رسالتك إلى المطور\n❍ سـآرد عليك في اقرب وقت ممكن \n❍ معرف المطور "..SUDO_USER)
tdcli_function({ID='GetChat',chat_id_ = SUDO_ID},function(arg,data)
fwdMsg(SUDO_ID,msg.chat_id_,msg.id_)
end,nil)
return false
end
end
end

--====================== Reply Only Group ====================================
if redis:get(black..'addrd:'..msg.chat_id_..msg.sender_user_id_) and redis:get(black..'replay1'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(black..'replay1'..msg.chat_id_..msg.sender_user_id_)
if msg.text then 
redis:hset(black..'replay:'..msg.chat_id_,klma,Flter_Markdown(msg.text))
redis:del(black..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n❍ تم اضافت الرد . \n-')
elseif msg.photo then 
redis:hset(black..'replay_photo:group:'..msg.chat_id_,klma,photo_id)
redis:del(black..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'❍ تم اضافه صوره للرد بنجاح\n❍ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.voice then
redis:hset(black..'replay_voice:group:'..msg.chat_id_,klma,voice_id)
redis:del(black..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'❍ تم اضافه بصمه صوت للرد بنجاح\n❍ يمكنك ارسال ❴ ['..klma..'] ❵ لسماع البصمه الاتيه ')
elseif msg.animation then
redis:hset(black..'replay_animation:group:'..msg.chat_id_,klma,animation_id)
redis:del(black..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'❍ تم اضافه متحركه للرد بنجاح\n❍ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.video then
redis:hset(black..'replay_video:group:'..msg.chat_id_,klma,video_id)
redis:del(black..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'❍ تم اضافه فيديو للرد بنجاح\n❍ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الفيديو الاتي ')
elseif msg.audio then
redis:hset(black..'replay_audio:group:'..msg.chat_id_,klma,audio_id)
redis:del(black..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'❍ تم اضافه للصوت للرد بنجاح\n❍ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوت الاتي ')
elseif msg.sticker then
redis:hset(black..'replay_sticker:group:'..msg.chat_id_,klma,sticker_id)
redis:del(black..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'❍ تم اضافه ملصق للرد بنجاح\n❍ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الملصق الاتي ')
end  

end

--====================== Reply All Groups =====================================
if redis:get(black..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) and redis:get(black..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(black..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
if msg.text then
redis:hset(black..'replay:all',klma,Flter_Markdown(msg.text))
redis:del(black..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  ❍ تم اضافت الرد لكل المجموعات . ')
elseif msg.photo then 
redis:hset(black..'replay_photo:group:',klma,photo_id)
redis:del(black..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'❍ تم اضافه صوره للرد العام\n❍ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.voice then
redis:hset(black..'replay_voice:group:',klma,voice_id)
redis:del(black..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'❍ تم اضافه بصمه صوت للرد العام\n❍ يمكنك ارسال ❴ ['..klma..'] ❵ لسماع البصمه الاتيه ')
elseif msg.animation then
redis:hset(black..'replay_animation:group:',klma,animation_id)
redis:del(black..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'❍ تم اضافه متحركه للرد العام\n❍ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.video then
redis:hset(black..'replay_video:group:',klma,video_id)
redis:del(black..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'❍ تم اضافه فيديو للرد العام\n❍ يمكنك ارسال ❴ ['..klma..'] ❵لأظهار الفيديو الاتي ')
elseif msg.audio then
redis:hset(black..'replay_audio:group:',klma,audio_id)
redis:del(black..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'❍ تم اضافه للصوت للرد العام\n❍ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوت الاتي ')
elseif msg.sticker then
redis:hset(black..'replay_sticker:group:',klma,sticker_id)
redis:del(black..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'❍ تم اضافه ملصق للرد العام\n❍ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الملصق الاتي ')
end  

end

if msg.text then
--====================== Requst UserName Of Channel For ForceSub ==============
if redis:get(black..":ForceSub:"..msg.sender_user_id_) then
if msg.text:match("^@[%a%d_]+$") then
redis:del(black..":ForceSub:"..msg.sender_user_id_)
local url , res = https.request(ApiToken..'/getchatmember?chat_id='..msg.text..'&user_id='..msg.sender_user_id_)
if res == 400 then
local Req = JSON.decode(url)
if Req.description == "Bad Request: chat not found" then 
sendMsg(msg.chat_id_,msg.id_,"❍ عذراً , هناك خطأ لديك \n❍ المعرف الذي ارسلته ليس معرف قناة.")
return false
elseif Req.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
sendMsg(msg.chat_id_,msg.id_,"❍ عذراً , لقد نسيت شيئا \n❍ يجب رفع البوت مشرف في قناتك لتتمكن من تفعيل الاشتراك الاجباري .")
return false
end
else
redis:set(black..":UserNameChaneel",msg.text)
sendMsg(msg.chat_id_,msg.id_,"❍ جـيـد , الان لقد تم تفعيل الاشتراك الاجباري\n❍ على قناتك ⇜ ["..msg.text.."]")
return false
end
else
sendMsg(msg.chat_id_,msg.id_,"❍ عذرا , عزيزي المطور \n❍ هذا ليس معرف قناة , حاول مجددا .")
return false
end
end

if redis:get(black..'namebot:witting'..msg.sender_user_id_) then --- استقبال اسم البوت 
redis:del(black..'namebot:witting'..msg.sender_user_id_)
redis:set(black..':NameBot:',msg.text)
Start_Bot() 
sendMsg(msg.chat_id_,msg.id_,"❍ تم تغير اسم البوت  .\n❍ الان اسمه "..Flter_Markdown(msg.text).." \n")
return false
end

if redis:get(black..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد لكل المجموعات
if not redis:get(black..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال كلمه الرد لكل المجموعات
redis:hdel(black..'replay_photo:group:',msg.text)
redis:hdel(black..'replay_voice:group:',msg.text)
redis:hdel(black..'replay_animation:group:',msg.text)
redis:hdel(black..'replay_audio:group:',msg.text)
redis:hdel(black..'replay_sticker:group:',msg.text)
redis:hdel(black..'replay_video:group:',msg.text)
redis:setex(black..'allreplay:'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"❍ جيد , يمكنك الان ارسال جوا ب الردالعام \n❍ [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]\n")
end
end

if redis:get(black..'delrdall:'..msg.sender_user_id_) then
redis:del(black..'delrdall:'..msg.sender_user_id_)
local names = redis:hget(black..'replay:all',msg.text)
local photo =redis:hget(black..'replay_photo:group:',msg.text)
local voice = redis:hget(black..'replay_voice:group:',msg.text)
local animation = redis:hget(black..'replay_animation:group:',msg.text)
local audio = redis:hget(black..'replay_audio:group:',msg.text)
local sticker = redis:hget(black..'replay_sticker:group:',msg.text)
local video = redis:hget(black..'replay_video:group:',msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'❍ **هذا الرد ليس مضاف في قائمه الردود .')
else
redis:hdel(black..'replay:all',msg.text)
redis:hdel(black..'replay_photo:group:',msg.text)
redis:hdel(black..'replay_voice:group:',msg.text)
redis:hdel(black..'replay_audio:group:',msg.text)
redis:hdel(black..'replay_animation:group:',msg.text)
redis:hdel(black..'replay_sticker:group:',msg.text)
redis:hdel(black..'replay_video:group:',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'('..Flter_Markdown(msg.text)..')\n❍ تم مسح الرد . ')
end 
end 


if redis:get(black..'text_sudo:witting'..msg.sender_user_id_) then -- استقبال كليشه المطور
redis:del(black..'text_sudo:witting'..msg.sender_user_id_) 
redis:set(black..':TEXT_SUDO',Flter_Markdown(msg.text))
return sendMsg(msg.chat_id_,msg.id_, "❍ ** تم وضع الكليشه بنجاح كلاتي .\n\n*{*  "..Flter_Markdown(msg.text).."  *}*\n")
end
if redis:get(black..'welcom:witting'..msg.sender_user_id_) then -- استقبال كليشه الترحيب
redis:del(black..'welcom:witting'..msg.sender_user_id_) 
redis:set(black..'welcome:msg'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"❍ ** تم وضع الترحيب بنجاح كلاتي .\n" )
end
if redis:get(black..'rulse:witting'..msg.sender_user_id_) then --- استقبال القوانين
redis:del(black..'rulse:witting'..msg.sender_user_id_) 
redis:set(black..'rulse:msg'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'❍ ** مرحبآ عزيزي\n❍ تم حفظ القوانين بنجاح .\n❍ ارسل [[ القوانين ]] لعرضها \n')
end
if redis:get(black..'name:witting'..msg.sender_user_id_) then --- استقبال الاسم
redis:del(black..'name:witting'..msg.sender_user_id_) 
tdcli_function({ID= "ChangeChatTitle",chat_id_=msg.chat_id_,title_=msg.text},dl_cb,nil)
end
if redis:get(black..'linkGroup'..msg.sender_user_id_,link) then --- استقبال الرابط
redis:del(black..'linkGroup'..msg.sender_user_id_,link) 
redis:set(black..'linkGroup'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'❍ تم وضع الرابط الجديد بنجاح .. 🍂')
end
if redis:get(black..'about:witting'..msg.sender_user_id_) then --- استقبال الوصف
redis:del(black..'about:witting'..msg.sender_user_id_) 
tdcli_function({ID="ChangeChannelAbout",channel_id_=msg.chat_id_:gsub('-100',''),about_ = msg.text},function(arg,data) 
if data.ID == "Ok" then 
return sendMsg(msg.chat_id_,msg.id_,"❍ ** تم وضع الوصف بنجاح\n")
end 
end,nil)
end


if redis:get(black..':prod_pin:'..msg.chat_id_..msg.sender_user_id_) then 
redis:del(black..':prod_pin:'..msg.chat_id_..msg.sender_user_id_)
local pv = redis:smembers(black..'users')  
local groups = redis:smembers(black..'group:ids')
local allgp =  #pv + #groups
if allgp >= 300 then
sendMsg(msg.chat_id_,msg.id_,'❍ اهلا عزيزي المطور \n❍ جاري نشر الرساله للمجموعات ...')			
end
local NumGroupsDel = 0
for i = 1, #groups do 
local NumGroupsDel = 0
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),function(arg,data)
if data.chat_id_ then redis:setex(black..":propin"..data.chat_id_,100,data.content_.text_) end
end)
end
sendMsg(msg.chat_id_,msg.id_,'❍ **عدد المجموعات { *'..#groups..'*  } ⊰•\n❍ **تـم الاذاعه بالتثبيت بنجاح ♥')
end
end)
end
end 
end 

if msg.text and msg.type == "channel" then
if msg.text:match("^"..Bot_Name.." غادر$") and (msg.SudoBase or msg.SuperCreator) then
sendMsg(msg.chat_id_,msg.id_,'اوك باي') 
rem_data_group(msg.chat_id_)
StatusLeft(msg.chat_id_,our_id)
return false
end
end

if msg.adduser and msg.adduser == our_id and redis:get(black..':WELCOME_BOT') then
sendPhoto(msg.chat_id_,msg.id_,redis:get(black..':WELCOME_BOT'),[[❍أهلاً انا بوت ]]..redis:get(black..':NameBot:')..[[
❍ أختصاصي حماية‌‏ المجموعات
❍ مـن السبام والتوجيه‌‏ والتكرار والخ...

❍ مـعـرف الـمـطـور  : ]]..SUDO_USER:gsub([[\_]],'_')..[[
]])
return false
end 

if msg.forward_info and redis:get(black..'fwd:'..msg.sender_user_id_) then
redis:del(black..'fwd:'..msg.sender_user_id_)
local pv = redis:smembers(black..'users')
local groups = redis:smembers(black..'group:ids')
local allgp =  #pv + #groups
if allgp == 500 then
sendMsg(msg.chat_id_,msg.id_,'❍ اهلا عزيزي المطور \n❍ جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
local number = 0
for i = 1, #pv do 
fwdMsg(pv[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
for i = 1, #groups do 
fwdMsg(groups[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
return sendMsg(msg.chat_id_,msg.id_,'❍ **تم اذاعه التوجيه بنجاح .\n❍ **للمجموعات » ❴ *'..#groups..'* ❵\n❍ **للخاص » ❴ '..#pv..' ❵\n')			
end

if msg.content_.ID == "MessagePhoto" and redis:get(black..'welcom_ph:witting'..msg.sender_user_id_) then
redis:del(black..'welcom_ph:witting'..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:set(black..':WELCOME_BOT',photo_id)
return sendMsg(msg.chat_id_,msg.id_,'❍ تم تغيير صوره‏‏ الترحيب للبوت .\n')
end 

if msg.content_.ID == "MessagePhoto" and msg.type == "channel" and msg.GroupActive then
if redis:get(black..'photo:group'..msg.chat_id_..msg.sender_user_id_) then
redis:del(black..'photo:group'..msg.chat_id_..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_=msg.chat_id_,photo_=GetInputFile(photo_id)},function(arg,data)
if data.code_ == 3 then
sendMsg(arg.chat_id_,arg.id_,'❍ ليس لدي صلاحيه تغيير الصوره \n❍ يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n')
end
end,{chat_id_=msg.chat_id_,id_=msg.id_})
return false
end
end

if not msg.GroupActive then return false end
if msg.text then

if redis:get(black..'addrd:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد للمجموعه فقط

if not redis:get(black..'replay1'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
redis:hdel(black..'replay:'..msg.chat_id_,msg.text)
redis:hdel(black..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(black..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(black..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(black..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(black..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(black..'replay_video:group:'..msg.chat_id_,msg.text)
redis:setex(black..'replay1'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"❍ جيد , يمكنك الان ارسال جواب الرد \n❍ [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]\n")
end
end

if redis:get(black..'delrd:'..msg.sender_user_id_) then
redis:del(black..'delrd:'..msg.sender_user_id_)
local names 	= redis:hget(black..'replay:'..msg.chat_id_,msg.text)
local photo 	= redis:hget(black..'replay_photo:group:'..msg.chat_id_,msg.text)
local voice 	= redis:hget(black..'replay_voice:group:'..msg.chat_id_,msg.text)
local animation = redis:hget(black..'replay_animation:group:'..msg.chat_id_,msg.text)
local audio 	= redis:hget(black..'replay_audio:group:'..msg.chat_id_,msg.text)
local sticker 	= redis:hget(black..'replay_sticker:group:'..msg.chat_id_,msg.text)
local video 	= redis:hget(black..'replay_video:group:'..msg.chat_id_,msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'❍ **هذا الرد ليس مضاف في قائمه الردود .')
else
redis:hdel(black..'replay:'..msg.chat_id_,msg.text)
redis:hdel(black..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(black..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(black..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(black..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(black..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(black..'replay_video:group:'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..msg.text..'])\n❍ تم مسح الرد . ')
end 
end

end

if msg.pinned then
print(" -- pinned -- ")
local msg_pin_id = redis:get(black..":MsgIDPin:"..msg.chat_id_)
if not msg.Director and redis:get(black..'lock_pin'..msg.chat_id_) then
if msg_pin_id then
print(" -- pinChannelMessage -- ")
tdcli_function({ID ="PinChannelMessage",
channel_id_ = msg.chat_id_:gsub('-100',''),
message_id_ = msg_pin_id,
disable_notification_ = 0},
function(arg,data)
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"❍ ** ًعذرا التثبيت مقفل من قبل الاداره تم ارجاع التثبيت القديم\n")
end
end,nil)
else
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"❍ ** ًعذرا التثبيت مقفل من قبل الاداره تم الغاء التثبيت\n")      
end
end,nil)
end
return false
end
redis:set(black..":MsgIDPin:"..msg.chat_id_,msg.id_)
end

if msg.content_.ID == "MessageChatChangePhoto" then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end
return sendMsg(msg.chat_id_,msg.id_," قام ["..UserName.."] بتغير صوره المجموعه .\n")
end)
end

if msg.content_.ID == "MessageChatChangeTitle" then
GetUserID(msg.sender_user_id_,function(arg,data)
redis:set(black..'group:name'..msg.chat_id_,msg.content_.title_)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end

return sendMsg(msg.chat_id_,msg.id_,"❍ قام  ["..UserName.."]\n❍ بتغير اسم المجموعه .\n❍ الى "..Flter_Markdown(msg.content_.title_).." \n") 
end)
end
if msg.adduser or msg.joinuser then
if redis:get(black..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
else
if redis:get(black..'welcome:get'..msg.chat_id_) then 
if not msg.adduserType then
GetUserID(msg.sender_user_id_,function(arg,data)  
welcome = (redis:get(black..'welcome:msg'..msg.chat_id_) or "❍ اهلاً عزيزي {الاسم}\n❍ معرفك » {المعرف}\n{القوانين}\n\nالرجاء الالتزام بالقوانين\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n❍ اسم القروب » {المجموعه}")
if welcome then
rules = (redis:get(black..'rulse:msg'..msg.chat_id_) or "❍ مرحباً عزيري القوانين كلاتي .\n❍ ممنوع نشر الروابط\n❍ ممنوع التكلم او نشر صور اباحيه\n❍ ممنوع  اعاده توجيه\n❍ ممنوع التكلم بالسياسة\n❍ الرجاء احترام المدراء والادمنيه .\n")
welcome = welcome:gsub("{القوانين}", rules)
if data.username_ then UserName = '@'..data.username_ else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(black..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(data.first_name_..' '..(data.last_name_ or "" ),20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end)
else
welcome = (redis:get(black..'welcome:msg'..msg.chat_id_) or "❍ اهلن بك عزيزي {الاسم}\n❍ معرفك » {المعرف}\n{القوانين}\n\nالرجاء الالتزام بالقوانين\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n❍ اسم القروب » {المجموعه}")
if welcome then
rules = (redis:get(black..'rulse:msg'..msg.chat_id_) or "❍ مرحباً عزيري القوانين كلاتي .\n❍ ممنوع نشر الروابط\n❍ ممنوع التكلم او نشر صور اباحيه\n❍ ممنوع  اعاده توجيه\n❍ ممنوع التكلم بالسياسة\n❍ الرجاء احترام المدراء والادمنيه\n")
welcome = welcome:gsub("{القوانين}", rules)
if msg.addusername then UserName = '@'..msg.addusername else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(black..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(msg.addname,20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end

end
end
end 

--------------------------------------------
if msg.adduser and redis:get(black..'welcome:get'..msg.chat_id_) then
local adduserx = tonumber(redis:get(black..'user:'..msg.sender_user_id_..':msgs') or 0)
if adduserx > 3 then 
redis:del(black..'welcome:get'..msg.chat_id_)
end
redis:setex(black..'user:'..msg.sender_user_id_..':msgs',3,adduserx+1)
end

if not msg.Admin and not msg.Special and not (msg.adduser or msg.joinuser or msg.deluser ) then -- للاعضاء فقط   

if not msg.forward_info and redis:get(black..'lock_flood'..msg.chat_id_)  then
local msgs = (redis:get(black..'user:'..msg.sender_user_id_..':msgs') or 0)
local NUM_MSG_black = (redis:get(black..'num_msg_black'..msg.chat_id_) or 5)
if tonumber(msgs) > tonumber(NUM_MSG_black) then 
GetUserID(msg.sender_user_id_,function(arg,datau)
Restrict(msg.chat_id_,msg.sender_user_id_,1)
redis:setex(black..'sender:'..msg.sender_user_id_..':flood',30,true)
if datau.username_ then USERNAME = '@'..datau.username_ else USERNAME = FlterName(datau.first_name_..' '..(datau.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,datau.id_,msg.id_,"❍ العضو » "..USERNAME.."\n❍ قمـت بتكرار اكثر مـن "..NUM_MSG_black.." رسالة‌‏ , لذا تم تقييدك مـن المجموعه‌\n",12,USERCAR) 
return false
end)
end 
redis:setex(black..'user:'..msg.sender_user_id_..':msgs',2,msgs+1)
end
 
 function Get_Info(msg,chat,user) --// ارسال نتيجة الصلاحيه
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
return sendMsg(msg.chat_id_,msg.id_,'❍ صلاحياته منشئ القروب\n')   
end 
if Json_Info.result.status == "member" then
return sendMsg(msg.chat_id_,msg.id_,'❍ مجرد عضو هنا\n')   
end 
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end
return sendMsg(chat,msg.id_,'❍ الرتبة : مشرف\n❍ والصلاحيات هي ↓ \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n❍ تغير معلومات المجموعه ↞ ❪ '..info..' ❫\n❍ حذف الرسائل ↞ ❪ '..delete..' ❫\n❍ حظر المستخدمين ↞ ❪ '..restrict..' ❫\n❍ دعوة مستخدمين ↞ ❪ '..invite..' ❫\n❍ تثبيت الرسائل ↞ ❪ '..pin..' ❫\n❍ اضافة مشرفين جدد ↞ ❪ '..promote..' ❫\n\n❍ ملاحضه » علامة ❪  ꪜ ❫ تعني لديه الصلاحية وعلامة ❪ ✘ ❫ تعني ليس ليديه الصلاحيه')   
end
end
end

if msg.forward_info_ then
if redis:get(black..'mute_forward'..msg.chat_id_) then -- قفل التوجيه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd \27[0m")

if data.ID == "Error" and data.code_ == 6 then 
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) and not redis:get(black..':User_Fwd_Msg:'..msg.sender_user_id_..':flood') then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذراً ممنوع اعادة التوجيه  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
return redis:setex(black..':User_Fwd_Msg:'..msg.sender_user_id_..':flood',15,true)
end,nil)
end
end)
return false
elseif redis:get(black..':tqeed_fwd:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd tqeed \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false 
end
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(black..'mute_inline'..msg.chat_id_) then -- قفل الانلاين
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send inline \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذراً الانلاين مقفول  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text then -- رسايل فقط
if utf8.len(msg.text) > 500 and redis:get(black..'lock_spam'..msg.chat_id_) then -- قفل الكليشه 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send long msg \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ ممنوع ارسال الكليشه والا سوف تجبرني على طردك  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") 
or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.text:match(".[Pp][Ee]") 
or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.text:match("[Hh][Tt][Tt][Pp]://") 
or msg.text:match("[Ww][Ww][Ww].") 
or msg.text:match(".[Cc][Oo][Mm]")) 
and redis:get(black..':tqeed_link:'..msg.chat_id_)  then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user i restricted becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false
elseif(msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Oo][Rr][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match(".[Pp][Ee]")) 
and redis:get(black..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ ممنوع ارسال الروابط  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Tt][Kk]") or msg.text:match(".[Mm][Ll]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(black..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ ممنوع ارسال روابط الويب   \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("#[%a%d_]+") and redis:get(black..'lock_tag'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send tag \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ ممنوع ارسال التاك  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("@[%a%d_]+")  and redis:get(black..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ ممنوع ارسال المعرف   \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
end,nil)
end
end)
return false
elseif not msg.textEntityTypeBold and (msg.textEntityTypeBold or msg.textEntityTypeItalic) and redis:get(black..'lock_markdown'..msg.chat_id_) then 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send markdown \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ ممنوع ارسال الماركدوان  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.textEntityTypeTextUrl and redis:get(black..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web page \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ ممنوع ارسال روابط الويب   \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
 
elseif msg.edited and redis:get(black..'lock_edit'..msg.chat_id_) then -- قفل التعديل
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Edit \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذراً ممنوع التعديل تم المسح \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end 
elseif msg.content_.ID == "MessageUnsupported" and redis:get(black..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذرا ممنوع ارسال الفيديو كام \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.photo then
if redis:get(black..'mute_photo'..msg.chat_id_)  then -- قفل الصور
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذرا ممنوع ارسال الصور  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif redis:get(black..':tqeed_photo:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user resctricted becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.video then
if redis:get(black..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send vedio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذرا ممنوع ارسال الفيديو  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(black..':tqeed_video:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.document and redis:get(black..'mute_document'..msg.chat_id_) then -- قفل الملفات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send file \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذرا ممنوع ارسال الملفات  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.sticker and redis:get(black..'mute_sticker'..msg.chat_id_) then --قفل الملصقات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send sticker \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذرا ممنوع ارسال الملصقات  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.animation then
if redis:get(black..'mute_gif'..msg.chat_id_) then -- قفل المتحركه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذرا ممنوع ارسال الصور المتحركه  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(black..':tqeed_gif:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.contact and redis:get(black..'mute_contact'..msg.chat_id_) then -- قفل الجهات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Contact \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذرا ممنوع ارسال جهات الاتصال  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.location and redis:get(black..'mute_location'..msg.chat_id_) then -- قفل الموقع
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send location \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذرا ممنوع ارسال الموقع  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.voice and redis:get(black..'mute_voice'..msg.chat_id_) then -- قفل البصمات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send voice \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذرا ممنوع ارسال البصمات  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.game and redis:get(black..'mute_game'..msg.chat_id_) then -- قفل الالعاب
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send game \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذرا ممنوع لعب الالعاب  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.audio and redis:get(black..'mute_audio'..msg.chat_id_) then -- قفل الصوت
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send audio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذرا ممنوع ارسال الصوت  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.replyMarkupInlineKeyboard and redis:get(black..'mute_keyboard'..msg.chat_id_) then -- كيبورد
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send keyboard \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذرا الكيبورد مقفول  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end

if msg.content_ and msg.content_.caption_ then -- الرسايل الي بالكابشن
print("sdfsd     f- ---------- ")
if (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.content_.caption_:match("[Tt].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match(".[Pp][Ee]")) 
and redis:get(black..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذرا ممنوع ارسال الروابط  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") 
or msg.content_.caption_:match("[Ww][Ww][Ww].") 
or msg.content_.caption_:match(".[Cc][Oo][Mm]")) 
and redis:get(black..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send webpage caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "❍ عذرا ممنوع ارسال روابط الويب  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.content_.caption_:match("@[%a%d_]+") and redis:get(black..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'❍ ** لا يمكنني مسح الرساله المخالفه .\n❍ ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(black..'lock_woring'..msg.chat_id_) then
local msgx = "❍ عذرا ممنوع ارسال التاك او المعرف  \n"
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"❍ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end 
end)
return false
end 

end --========{ End if } ======

end 
SaveNumMsg(msg)
------------------------------{ Start Replay Send }------------------------

if msg.text and redis:get(black..'replay'..msg.chat_id_) then

local Replay = false

 Replay = redis:hget(black..'replay:all',msg.text)
if Replay then
sendMsg(msg.chat_id_,msg.id_,Replay)
return false
end

 Replay = redis:hget(black..'replay:'..msg.chat_id_,msg.text)
if Replay then 
 sendMsg(msg.chat_id_,msg.id_,Replay) 
return false
end
 Replay = redis:hget(black..'replay_photo:group:',msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(black..'replay_voice:group:',msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(black..'replay_animation:group:',msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(black..'replay_audio:group:',msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(black..'replay_sticker:group:',msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(black..'replay_video:group:',msg.text)
if Replay then 
print("0000000000000") 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(black..'replay_photo:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(black..'replay_voice:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(black..'replay_animation:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(black..'replay_audio:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(black..'replay_sticker:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(black..'replay_video:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

if not Replay then

--================================{{  Reply Bot  }} ===================================

local nnn = {
"اسمي ["..Bot_Name.."] .",
"تدلل .",
"تفضل .",
"عيوني لك .",
}

local Text = msg.text
local Text2 = Text:match("^"..Bot_Name.." (%d+)$")

if msg.SudoUser and Text == Bot_Name and not Text2 then
return sendMsg(msg.chat_id_,msg.id_,su[math.random(#su)])
elseif not msg.SudoUser and Text== Bot_Name and not Text2 then  
return sendMsg(msg.chat_id_,msg.id_,ss97[math.random(#ss97)])
elseif Text:match("^قول (.*)$") then
if utf8.len(Text:match("^قول (.*)$")) > 500 then 
return sendMsg(msg.chat_id_,msg.id_,"- ما اقدر اقول اكثر من 500 حرف ")
end
local callback_Text = FlterName(Text:match("^قول (.*)$"),50)
if callback_Text and callback_Text ==  ' الاسم سبام ❗️'  then
return sendMsg(msg.chat_id_,msg.id_,"- للاسف النص هذا مخالف ")
else
return sendMsg(msg.chat_id_,0,callback_Text) 
end
elseif not msg.SudoUser and Text==" باي" or Text == "باي" then
return sendMsg(msg.chat_id_,msg.id_,dr[math.random(#dr)])
elseif not msg.SudoUser and Text==" بوت" or Text == "بوت" then
return 
sendMsg(msg.chat_id_,msg.id_,nnn[math.random(#nnn)]) 
elseif Text== "جاك" or Text== "جاك" then return  sendMsg(msg.chat_id_,msg.id_,"[مطور سورس جاك](https://t.me/V_P_E)")
elseif Text== "الجوكر" or Text== "الجوكر" then return  sendMsg(msg.chat_id_,msg.id_,"[مطور سورس بلاك ↯](https://t.me/A_j_o_k_e_r)")
elseif Text== "سورس بلاك" or Text== "سورس بلاك" then return  sendMsg(msg.chat_id_,msg.id_,"[احسن سورس مصري ↯](https://t.me/BLACK_TEAM_3)")
elseif Text== "رفع غبي"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم رفع الغبي بنجاح↯\n❍ تمت إضافته إلى قائمه الأغبياء\n☆")
elseif Text== "رفع خول"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ لقـد تم رفع الخول بنجاح\n❍الان هو خـول \n")
elseif Text== "تنزيل خول"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ تم تنزيل الخول بنجاح \n❍ الان تم ازلته من قائمه الخولات \n")
elseif Text== "رفع بكس"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ تم رفع الكس بنجاح\n❍الا❍الان هو في قائمه المكسكسين \n")
elseif Text== "تنزيل بكس"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ تم تنزيل الكس بنجاح \n❍الان تم ازلته من قائمه المكسكسين \n")
elseif Text== "رفع متناك"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ تم رفع المتناك بنجاح\n❍الان هو في قائمه المتناكين \n")
elseif Text== "تنزيل متناك"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ تم تنزيل المتناك بنجاح \n❍الان تم ازلته من قائمه المتناكين \n")
elseif Text== "رفع عرص"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ تم تنزيل عرص بنجاح\n❍الان تم ازلته من قائمه معرصين \n")
elseif Text== "تنزيل عرص"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ تم تنزيل عرص بنجاح \n❍الان تم ازلته من قائمه معرصين \n")
elseif Text== "رفع شرموط"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ تم رفع الشرموط بنجاح\n❍الان هو في قائمه الشراميط \n")
elseif Text== "تنزيل شرموط"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ تم تنزيل الشرموط بنجاح \n❍الان تم ازلته من قائمه الشراميط \n")
elseif Text== "رفع شرموط"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ تم رفع الشرموط بنجاح\n❍الان هو في قائمه الشراميط \n")
elseif Text== "رفع علق"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ تم رفع العلق بنجاح\n❍الان هو في قائمه العلوق \n")
elseif Text== "تنزيل علق"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ تم تنزيل العلق بنجاح \n❍الان تم ازلته من قائمه العلوق\n")
elseif Text== "رفع شاذ"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ تم رفع الشاذ بنجاح \n❍الان هو في قائمه الشواذ\n")
elseif Text== "تنزيل شاذ"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ تم تنزيل شاذ بنجاح \n❍الان تم ازلته من قائمه الشواذ\n")
elseif Text== "رفع بيست"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ لقد تم رفع بيست بنجاح \n❍ الان هـ بيست يمكنك اخد مح\n")
elseif Text== "تنزيل بيست"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ لقد تم تنزيل بيست \n❍ يمكن استرجاع المح الان\n")
elseif Text== "رفع حياتي"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ لقد تم رفع حياتي \n❍ الان هـ حياتك تفضل خد بوثه\n")
elseif Text== "تنزيل حياتي"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ لقد تم تنزيل من حياتي \n❍ الان يمكن استرجاع البوثه\n")
elseif Text== "رفع تونز"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ لقد تم رفع تونز بنجاح \n❍ تفضل في الخاص عشان المراره\n")
elseif Text== "تنزيل تونز"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ لقد تم تنزيل تونز بنجاح \n❍ الان يمكن عمل بلوك\n")
elseif Text== "رفع سندي"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ لقد تم رفع سندي بنجاح \n❍ الان هو سندك\n")
elseif Text== "تنزيل سندي"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ لقد تم تنزيل سندي \n❍ يمكن الان شقط سند اخر\n")
elseif Text== "رفع البلاك"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ لقد تم رفع بلاك بنجاح \n❍ اديلو بلاك\n")
elseif Text== "تنزيل البلاك"  then return sendMsg(msg.chat_id_,msg.id_,"❍ آههلآ  عـزيزي\n❍ لقد تم رفع بلاك بنجاح \n❍ اديلو بلاك\n")
elseif Text== "تنزيل غبي"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\nلقد تم تنزيل الهاك\n❍ تمت الزاله من قائمه الأغبياء\n☆")
elseif Text== "رفع كلب"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم رفع الكلب بنجاح↯\n❍ تمت إضافته إلى قائمه الكلاب\n☆")
elseif Text== "رفع حمار"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم رفع الحمار بنجاح↯\n❍ تمت إضافته إلى قائمه الحمير\n☆")
elseif Text== "تنزيل حمار"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم تنزيل الحمار بنجاح↯\n❍ تمت ازالته من قائمه الحمير\n☆")
elseif Text== "تنزيل كلب"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي \n❍ تم تنزيل الكلب بنجاح↯\n❍ تمت إزالته من قائمه الكلاب\n☆")
elseif Text== "تنزيل متوحده"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم تنزيل المتوحده بنجاح↯\n❍ لا متحاولوش حتي لو نزلتوها هتفضل متوحده\n☆")
elseif Text== "رفع متوحده"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم رفع المتوحده بنجاح↯\n❍ تمت إضافتها الي قائمة المتوحدين والمتخلفين عقلياً\n☆")
elseif Text== "رفع متوحد"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم رفع المتوحد بنجاح↯\n❍ تمت  اضافته الي قائمة المتوحديد والمرضي المفسيين\n☆")
elseif Text== "تنزيل متوحد"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم تنزيل المتوحد بنجاح↯\n❍ لا متحاولوش حتي لو نزلتوه هيفضل متوحد\n☆")
elseif Text== "رفع بقلبي"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم رفع العضو داخل قلبك↯\n❍ تمت ترقيته بنجاح\n☆")
elseif Text== "تنزيل من قلبي"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم تنزيل من داخل قلبك↯\n❍ تمت ازالته من قائمه القلوب\n☆")
elseif Text== "رفع وتكه"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم رفع العضو وتكه بنجاح↯ \n❍ اصبحت وتكتك\n☆")
elseif Text== "تنزيل وتكه"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم تنزيل العضو \n❍ من قائمة وتكاتك بنجاح\n☆")
elseif Text== "رفع زوجتي"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم رفع العضو زوجتك↯\nالآن يمكنكم أخذ راحتكم واتفضلو اعملو واحد\n☆")
elseif Text== "تنزيل زوجتي"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم تنزيل زوجتك بنجاح↯\nالآن انتم مفترقان طلقتها علشان مبتعرفش صح\n☆")
elseif Text== "زواج"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم زواجكم الاثنين بنجاح↯\n❍ الآن هي حلالك بلالك\n☆")
elseif Text== "طلاق"  then return sendMsg(msg.chat_id_,msg.id_,"❍ أهلاً عزيزي\n❍ تم طلاق الخاينه بنجاح↯\n❍ الآن هي مطلقه \n☆")
elseif Text== "اوامر التسليه"  then return sendMsg(msg.chat_id_,msg.id_,"\n‌‌‏┄─┅══┅─┄\n❍ مرحباً عزيزي\n❍ هذي اوامر التسليه:  \n┄─┅═ـ═┅─┄\n❍ رفع ⇦⇨ تنزيل ❬ متوحد ❭\n❍ رفع ⇦⇨ تنزيل ❬ وتكه ❭\n❍ رفع ⇦⇨ تنزيل ❬ غبي ❭\n❍ رفع ⇦⇨ تنزيل ❬ كلب ❭\n❍ رفع ⇦⇨ تنزيل ❬ حمار ❭\n❍ رفع ⇦⇨ تنزيل ❬ زوجتي ❭\n❍ رفع ⇦⇨ تنزيل ❬ متوحده ❭\n❍ رفع ⇦⇨ ❬ بقلبي ❭ تنزيل ⇦⇨ ❬ من قلبي❭\n❍ ❬ طلاق ❭ ⇦⇨ ❬ زواج ❭\n┄─┅═ـ═┅─┄")
elseif Text== "اوامر التسليه الجديده"  then return sendMsg(msg.chat_id_,msg.id_,"\n‌‌‏┄─┅══┅─┄\n❍ مرحباً عزيزي\n❍ هذي اوامر التسليه:  \n┄─┅═ـ═┅─┄\nرفع ⇦⇨ تنزيل ❬ خول ❭\n❍رفع ⇦⇨ تنزيل ❬ عرص ❭\n❍رفع ⇦⇨ تنزيل ❬ بكس ❭\n❍رفع ⇦⇨ تنزيل ❬ متناك ❭\n❍رفع ⇦⇨ تنزيل ❬ شرموط ❭\n❍رفع ⇦⇨ تنزيل ❬ البلاك ❭\n❍رفع ⇦⇨ تنزيل ❬ شاذ ❭\n❍رفع ⇦⇨ تنزيل❬ بيست ❭\n❍رفع ⇦⇨ تنزيل❬ تونز ❭\n❍رفع ⇦⇨ تنزيل❬ علق ❭\n❍رفع ⇦⇨ تنزيل❬ حياتي ❭\n❍رفع ⇦⇨ تنزيل❬ سندي ❭\n❍رفع ⇦⇨ تنزيل❬  \n┄─┅═ـ═┅─┄")
elseif Text:match(Bot_Name.."كيفك") then 
  return sendMsg(msg.chat_id_,msg.id_,"بخير يقلبي ونت .")
  elseif Text== "ياتي"  then return sendMsg(msg.chat_id_,msg.id_,"بتكسف يووه.")
  elseif Text== "احبك."  then return sendMsg(msg.chat_id_,msg.id_,"مش اكتر مني ")
  elseif Text== "احبك"  then return sendMsg(msg.chat_id_,msg.id_,"ياتي")
  elseif Text== "يحلو"  then return sendMsg(msg.chat_id_,msg.id_,"اي يقلبي")
  elseif Text== "كسمك"  then return sendMsg(msg.chat_id_,msg.id_,"عيب.")
  elseif Text== "مخنوق"  then  return sendMsg(msg.chat_id_,msg.id_,"اقرء قرأن.")
  elseif Text== "مرحبا"  then return sendMsg(msg.chat_id_,msg.id_,"اهلاً عزيزي .")
  elseif Text== "سالكه"  then  return sendMsg(msg.chat_id_,msg.id_,"[سالكه ۦ](https://t.me/FlassTas5/255)."  )
  elseif Text== "مساعدة"  then return sendMsg(msg.chat_id_,msg.id_,"لعرض قائمة المساعدة اكتب الاوامر 🌚❤️")
  elseif Text== "خول"  then return sendMsg(msg.chat_id_,msg.id_,"شبهك.")
  elseif Text== "حلو"  then return sendMsg(msg.chat_id_,msg.id_,"مش احلي منك")
  elseif Text== "قمر"  then return sendMsg(msg.chat_id_,msg.id_,"انت لقمر يروحي")
  elseif Text== "عاش"  then return sendMsg(msg.chat_id_,msg.id_,"عاشت ايامك")
  elseif Text== "ورده" or Text== "وردة" then return sendMsg(msg.chat_id_,msg.id_,"انت عطرها")
  elseif Text== "اسمك اي"  then return sendMsg(msg.chat_id_,msg.id_,"أعمي انت صح؟")
  elseif Text== "حبيبي" or Text=="حبي" then return  sendMsg(msg.chat_id_,msg.id_,"امـريقلبي")
  elseif Text== "حبيبتي" then return sendMsg(msg.chat_id_,msg.id_,"ف الخـاص مش هنا هنا ")
  elseif Text== "حياتي" then return sendMsg(msg.chat_id_,msg.id_,"اي يروح حياتك")
  elseif Text== "عمري" then return sendMsg(msg.chat_id_,msg.id_,"يحمي عممرك")
  elseif Text== "اسكت" then return sendMsg(msg.chat_id_,msg.id_,"اوك")
  elseif Text== "بتحبني" then return sendMsg(msg.chat_id_,msg.id_,"بعشـقك")
  elseif Text== "اقول" or Text=="اقولك" or Text=="اقولك." then return sendMsg(msg.chat_id_,msg.id_,"قول بحب الفضايح")
  elseif Text== "موجود" then return sendMsg(msg.chat_id_,msg.id_,"امـريعيني")
  elseif Text== "اكلك" then return sendMsg(msg.chat_id_,msg.id_,"هممم يجمل")

  elseif Text== "ايديي" or Text=="ايدي" then 
  GetUserID(msg.sender_user_id_,function(arg,data)
  if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
  local USERCAR = utf8.len(USERNAME)
  SendMention(msg.chat_id_,data.id_,msg.id_,"\n\n _ 𝚄𝚂𝙴𝚁 𖣼 "..USERNAME..".   _ 𝚈𝙾𝚄𝚁 𝙸𝙳 𖢇 "..data.id_.." ",37,USERCAR)  
  return false
  end)
  elseif Text=="ابي رابط الحذف" or Text=="ابي رابط حذف" or Text=="رابط حذف" or Text=="رابط الحذف" then
  return sendMsg(msg.chat_id_,msg.id_,[[
 ❍ رابط حذف [Telegram](https://my.telegram.org/auth?to=delete) ܁
 ❍ رابط حذف [instagram](https://www.instagram.com/accounts/login/?next=/accounts/remove/request/permanent/) ܁
 ❍ رابط حذف [Facebook](https://www.facebook.com/help/deleteaccount) ܁
 ❍ رابط حذف [Snspchat](https://accounts.snapchat.com/accounts/login?continue=https%3A%2F%2Faccounts.snapchat.com%2Faccounts%2Fdeleteaccount) ܁
‏
  ]] )
  --=====================================
elseif Text== "انا مين" or Text== "مين انا"  then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_,"[انت مطوري الغالي ♕](https://t.me/BLACK_TEAM_3) ")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_,"[انت منشئ المجموعه  تاج راسي♔](https://t.me/BLACK_TEAM_3)")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_,"[انت مدير المجموعه๑](https://t.me/BLACK_TEAM_3)")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,"[انت ادمن شد حيلك♘](https://t.me/BLACK_TEAM_3)")
else 
return sendMsg(msg.chat_id_,msg.id_,"[مجرد عضو هنا 𖦹](https://t.me/BLACK_TEAM_3)")
end 
end 
elseif Text== "مين ضافني" or Text== "منو ضافني"  then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_,"[انت مكانك كل مكان يا مطور♕](https://t.me/BLACK_TEAM_3) ")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_,"[انت منشئ المجموعه](https://t.me/BLACK_TEAM_3)")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_,"[انت دخلت عبر الرابط](https://t.me/BLACK_TEAM_3)")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,"[انت دخلت عبر الرابط](https://t.me/BLACK_TEAM_3)")
else 
return sendMsg(msg.chat_id_,msg.id_,"[انت دخلت عبر الرابط](https://t.me/BLACK_TEAM_3)")
end



end 


end


------------------------------{ End Replay Send }------------------------

------------------------------{ Start Checking CheckExpire }------------------------
if not redis:get('kar') then
  redis:setex('kar',86400,true) 
  json_data = '{"BotID": '..black..',"UserBot": "'..Bot_User..'","Groups" : {'
  local All_Groups_ID = redis:smembers(black..'group:ids')
  for key,GroupS in pairs(All_Groups_ID) do
  local NameGroup = (redis:get(black..'group:name'..GroupS) or '')
  NameGroup = NameGroup:gsub('"','')
  NameGroup = NameGroup:gsub([[\]],'')
  if key == 1 then
  json_data =  json_data ..'"'..GroupS..'":{"Title":"'..NameGroup..'"'
  else
  json_data =  json_data..',"'..GroupS..'":{"Title":"'..NameGroup..'"'
  end
  local admins = redis:smembers(black..'admins:'..GroupS)
  if #admins ~= 0 then
  json_data =  json_data..',"Admins" : {'
  for key,value in pairs(admins) do
  local info = redis:hgetall(black..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end
  end
  json_data =  json_data..'}'
  end
  
  local creators = redis:smembers(black..':MONSHA_BOT:'..GroupS)
  if #creators ~= 0 then
  json_data =  json_data..',"Creator" : {'
  for key,value in pairs(creators) do
  local info = redis:hgetall(black..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end 
  end
  json_data =  json_data..'}'
  end
  local creator = redis:smembers(black..':KARA_BOT:'..GroupS)
  if #creator ~= 0 then
  json_data =  json_data..',"Kara" : {'
  for key,value in pairs(creator) do
  local info = redis:hgetall(black..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end 
  end
  json_data =  json_data..'}'
  end
  
  local owner = redis:smembers(black..'owners:'..GroupS)
  if #owner ~= 0 then
  json_data =  json_data..',"Owner" : {'
  for key,value in pairs(owner) do
  local info = redis:hgetall(black..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end
  end
  json_data =  json_data..'}'
  end
  json_data =  json_data.."}"
  end
  local Save_Data = io.open("./inc/"..Bot_User..".json","w+")
  Save_Data:write(json_data..'}}')
  Save_Data:close()
  sendDocument(SUDO_ID,0,"./inc/"..Bot_User..".json","❍ ملف نسخه تلقائيه\n❍   اليك مجموعاتك » { "..#All_Groups_ID.." }\n❍ للبوت » "..Bot_User.."\n❍ التاريخ » "..os.date("%Y/%m/%d").."\n",dl_cb,nil)
  end
  if redis:get(black..'CheckExpire::'..msg.chat_id_) then
  local ExpireDate = redis:ttl(black..'ExpireDate:'..msg.chat_id_)
  if not ExpireDate and not msg.SudoUser then
  rem_data_group(msg.chat_id_)
  sendMsg(SUDO_ID,0,'❍ انتهى الاشتراك في احد المجموعات .\n❍ المجموعه : '..FlterName(redis:get(black..'group:name'..msg.chat_id_))..'.\n❍ ايدي : '..msg.chat_id_)
  sendMsg(msg.chat_id_,0,'❍ انتهى الاشتراك البوت.\n❍ سوف اغادر المجموعه فرصه سعيده .\n❍ او راسل المطور للتجديد '..SUDO_USER..' 🍃')
  return StatusLeft(msg.chat_id_,our_id)
  else
  local DaysEx = (redis:ttl(black..'ExpireDate:'..msg.chat_id_) / 86400)
  if tonumber(DaysEx) > 0.208 and ExpireDate ~= -1 and msg.Admin then
  if tonumber(DaysEx + 1) == 1 and not msg.SudoUser then
  sendMsg(msg.chat_id_,'❍ باقي يوم واحد وينتهي الاشتراك .\n❍ راسل المطور للتجديد '..SUDO_USER..'\n')
  end 
  end 
  end
  end
  
  ------------------------------{ End Checking CheckExpire }------------------------
  
  
  end 
  
  
  return {
  black = {
  "^(تقييد)$",
  "^(تقييد) (%d+)$",
  "^(تقييد) (@[%a%d_]+)$",
  "^(فك التقييد)$",
  "^(فك التقييد) (%d+)$",
  "^(فك التقييد) (@[%a%d_]+)$",
  "^(فك تقييد)$",
  "^(فك تقييد) (%d+)$",
  "^(فك تقييد) (@[%a%d_]+)$",
  "^(ضع شرط التفعيل) (%d+)$",
  "^(التفاعل)$",
  "^(التفاعل) (@[%a%d_]+)$",
  "^([iI][dD])$",
  "^(تفعيل الايدي بالصوره)$",
  "^(تعطيل الايدي بالصوره)$",
  "^(تعطيل الرفع)$",
  "^(تفعيل الرفع)$",
  "^(قفل الدخول بالرابط)$",
  "^(فتح الدخول بالرابط)$", 
  "^(ايدي)$",
  "^(سي في)$",
  "^(cv)$",
  "^(cv)$ (@[%a%d_]+)$,
  "^(CV)$",
  "^(Cv)$",
  "^(cV)$",
  "^(سيفي)$",
  "^(ايدي) (@[%a%d_]+)$",
  "^(كشف)$",
  "^(كشف) (%d+)$",
  "^(كشف) (@[%a%d_]+)$",
  '^(رفع مميز)$',
  '^(رفع مميز) (@[%a%d_]+)$',
  '^(رفع مميز) (%d+)$',
  '^(تنزيل مميز)$',
  '^(تنزيل مميز) (@[%a%d_]+)$',
  '^(تنزيل مميز) (%d+)$',
  '^(رفع ادمن)$',
  '^(رفع ادمن) (@[%a%d_]+)$',
  '^(رفع ادمن) (%d+)$',
  '^(تنزيل ادمن)$',
  '^(تنزيل ادمن) (@[%a%d_]+)$',
  '^(تنزيل ادمن) (%d+)$', 
  '^(رفع مطي)$',
  '^(تنزيل مطي)$', 
  '^(رفع متوحده)$',
  '^(تنزيل متوحده)$', 
  '^(رفع المدير)$',
  '^(رفع مدير)$',
   
  '^(رفع مدير) (@[%a%d_]+)$',
  '^(رفع المدير) (@[%a%d_]+)$',
  '^(رفع المدير) (%d+)$',
  '^(رفع مدير) (%d+)$',
  '^(رفع منشى اساسي)$',
  '^(رفع منشئ اساسي)$',
  '^(رفع منشئ اساسي) (@[%a%d_]+)$',
  '^(رفع منشى اساسي) (@[%a%d_]+)$',
  '^(تنزيل منشئ اساسي)$',
  '^(تنزيل منشى اساسي)$',
  '^(تنزيل منشئ اساسي) (%d+)$',
  '^(تنزيل منشى اساسي) (%d+)$',
  '^(تنزيل منشى اساسي) (@[%a%d_]+)$',
  '^(تنزيل منشئ اساسي) (@[%a%d_]+)$',
  '^(رفع منشى)$',
  '^(رفع منشئ)$',
  '^(رفع منشئ) (@[%a%d_]+)$',
  '^(رفع منشى) (@[%a%d_]+)$',
  '^(تنزيل منشئ)$',
  '^(تنزيل منشى)$',
  '^(تنزيل منشئ) (%d+)$',
  '^(تنزيل منشى) (%d+)$',
  '^(تنزيل منشى) (@[%a%d_]+)$',
  '^(تنزيل منشئ) (@[%a%d_]+)$',
  '^(تنزيل المدير)$',
  '^(تنزيل مدير)$',
  '^(تنزيل مدير) (@[%a%d_]+)$',
  '^(تنزيل المدير) (@[%a%d_]+)$',
  '^(تنزيل المدير) (%d+)$',
  '^(تنزيل مدير) (%d+)$',
   '^(صلاحياته)$',
   '^(صلاحياتي)$',
  '^(صلاحياته) (@[%a%d_]+)$',
  '^(قفل) (.+)$',
  '^(فتح) (.+)$',
  '^(تفعيل)$',
  '^(تفعيل) (.+)$',
  '^(تعطيل)$',
  '^(تعطيل) (.+)$',
  '^(ضع تكرار) (%d+)$',
  "^(مسح)$",
  "^(مسح) (.+)$",
  '^(منع) (.+)$',
  '^(الغاء منع) (.+)$',
  "^(حظر عام)$",
  "^(حظر عام) (@[%a%d_]+)$",
  "^(حظر عام) (%d+)$",
  "^(الغاء العام)$",
  "^(الغاء العام) (@[%a%d_]+)$",
  "^(الغاء العام) (%d+)$",
  "^(الغاء عام)$",
  "^(الغاء عام) (@[%a%d_]+)$",
  "^(الغاء عام) (%d+)$",
  "^(حظر)$",
  "^(حظر) (@[%a%d_]+)$",
  "^(حظر) (%d+)$",
  "^(الغاء الحظر)$", 
  "^(الغاء الحظر) (@[%a%d_]+)$",
  "^(الغاء الحظر) (%d+)$",
  "^(الغاء حظر)$", 
  "^(الغاء حظر) (@[%a%d_]+)$",
  "^(الغاء حظر) (%d+)$",
  "^(طرد)$",
  "^(طرد) (@[%a%d_]+)$",
  "^(طرد) (%d+)$",
  "^(كتم)$",
  '^(تفعيل البلاك تيم)$',
  '^(تعطيل تيم البلاك)$',
  "^(كتم) (@[%a%d_]+)$",
  "^(كتم) (%d+)$",
  "^(الغاء الكتم)$",
  "^(الغاء الكتم) (@[%a%d_]+)$",
  "^(الغاء الكتم) (%d+)$",
  "^(الغاء كتم)$",
  "^(الغاء كتم) (@[%a%d_]+)$",
  "^(الغاء كتم) (%d+)$",
  "^(رفع مطور)$",
  "^(رفع مطور) (@[%a%d_]+)$",
  "^(رفع مطور) (%d+)$",
  "^(تنزيل مطور)$",
  "^(تنزيل مطور) (%d+)$",
  "^(تنزيل مطور) (@[%a%d_]+)$",
  "^(تعطيل) (-%d+)$",
  "^(الاشتراك) ([123])$",
  "^(الاشتراك)$",
  "^(تنزيل الكل)$", 
  "^(شحن) (%d+)$",
  "^(المجموعه)$",
  "^(كشف البوت)$",
  "^(انشاء رابط)$",
  "^(ضع الرابط)$",
  "^(تثبيت)$",
  "^(الغاء التثبيت)$",
  "^(الغاء تثبيت)$",
  "^(رابط)$",
  "^(الرابط)$",
  "^(ضع رابط)$",
  "^(رابط خاص)$",
  "^(الرابط خاص)$",
  "^(القوانين)$",
  "^(ضع القوانين)$",
  "^(ضع قوانين)$",
  "^(ضع تكرار)$",
  "^(ضع التكرار)$",
  "^(الادمنيه)$",
  "^(تاك للكل)$",
  "^(نذار)$",
  "^(تاك)$",
  "^(قائمه المنع)$",
  "^(المدراء)$",
  "^(المميزين)$",
  "^(المكتومين)$",
  "^(ضع الترحيب)$",
  "^(الترحيب)$",
  "^(المنشى الاساسي)$",
  "^(المنشئ الاساسي)$",
  "^(المحظورين)$",
  "^(ضع اسم)$",
  "^(ضع صوره)$",
  "^(ضع وصف)$",
  "^(طرد البوتات)$",
  "^(كشف البوتات)$",
  "^(طرد المحذوفين)$",
  "^(رسائلي)$",
  "^(رسايلي)$",
  "^(احصائياتي)$",
  "^(معلوماتي)$",
  "^(مسح معلوماتي)$",
  "^(موقعي)$",
  "^(رفع الادمنيه)$",
  "^(صوره )$",
  "^(ضع كليشه المطور)$",
  "^(المطور)$",
  "^(شرط التفعيل)$",
  "^(قائمه المجموعات)$",
  "^(المجموعات)$",
  "^(المجموعات 🌋)$",
  "^(المشتركين)$",
  "^(المشتركين Ⓜ)$",
  "^(اذاعه 🗣)$", 
  "^(قائمه العام)$",
  "^(قائمه العام 📜)$",
  "^(المطورين)$",
  "^(المطورين 🔥)$",
  "^(تيست)$",
  "^(test)$",
  "^(ايدي)$",
  "^(المبرمج جاك)$",
  "^(المطور الجوكر)$",
  "^(مصنع بوتات المبرمج)$",
  "^(رفع نسخه الاحتياطيه)$",
  "^(قناة السورس)$",
  "^(الاحصائيات)$",
  "^(الاحصائيات 💥)$",
  "^(اضف رد عام)$",
  "^(اضف رد عام ➕)$",
  "^(مسح الردود)$",
  "^(مسح الردود العامه)$",
  "^(ضع اسم للبوت)$",
  "^(مسح الصوره)$",
  "^(مسح رد)$",
  "^(الردود)$",
  "^(الردود العامه)$",
  "^(الردود العامه 🗨)$",
  "^(اضف رد)$",
  "^(/UpdateSource)$",
  "^(تحديث السورس 🔂)$",
  "^(تحديث السورس)$",
  "^(تنظيف المجموعات)$",
  "^(تنظيف المشتركين)$",
  "^(تنظيف المجموعات 🗑)$",
  "^(تنظيف المشتركين 🗑)$",
  "^(رتبتي)$",
  "^(ضع اسم للبوت ©)$",
  "^(ضع صوره للترحيب 🌄)$",
  "^(ضع صوره للترحيب)$",
  "^(الحمايه)$",
  "^(الاعدادات)$",
  "^(الوسائط)$",
  "^(الغاء الامر ✖️)$",
  "^(الرتبه)$",
  "^(الغاء)$",
  "^(سحكاتي)$",
  "^(اسمي)$",
  "^(التاريخ)$",
  "^(/[Ss]tore)$",
  "^(اصدار السورس)$",
  "^(الاصدار)$",
  "^(server)$",
  "^(السيرفر)$",
  "^(اذاعه بالتثبيت)$",
  "^(اذاعه بالتثبيت ♥)$", 
  "^(فحص البوت)$", 
  "^(نسخه احتياطيه للمجموعات)$",
  "^(رفع نسخه الاحتياطيه)$", 
  "^(تفعيل الاشتراك الاجباري)$", 
  "^(تعطيل الاشتراك الاجباري)$", 
  "^(تغيير الاشتراك الاجباري)$", 
  "^(الاشتراك الاجباري)$", 
  "^(تفعيل الاشتراك الاجباري ☑)$", 
  "^(تعطيل الاشتراك الاجباري ♻️)$", 
  "^(تغيير الاشتراك الاجباري 🔁)$", 
  "^(الاشتراك الاجباري ⚠️)$", 
  "^(احظرني)$", 
  "^(اطردني)$", 
  "^(جهاتي)$", 
  
  
  
  
 
	
  
  
  
  "^(السورس)$",
  "^(سورس)$",
  "^(م المطور)$", 
  "^(اوامر الرد)$",
  "^(الاوامر)$",
  "^(م1)$",
  "^(م2)$",
  "^(م3)$",
  "^(م4)$",
  "^(م5)$",
  "^(م6)$",
  "^(م7)$",
  "^(م8)$",
  "^(م9)$",
  "^(م10)$",
  "^(روايات)$",
  "^(الروايات)$",
  "^(تخطي حدود 1)$",
  "^(تخطي حدود 1/1)$",
  "^(تخطي حدود 2)$",
  "^(تخطي حدود 2/1)$",
  "^(تخطي حدود 3)$",
  "^(تخطي حدود 3/1)$",
  "^(تخطي حدود 4)$",
  "^(تخطي حدود 4/1)$",
  "^(تخطي حدود 4/2)$",
  "^(تخطي حدود 4/3)$",
  "^(تخطي حدود 5)$",
  "^(تخطي حدود 5/1)$",
  "^(تخطي حدود 5/2)$",
  "^(مقدمه كاتب)$",
  "^(كاتب 1)$",
  "^(كاتب 1/1)$",
  "^(كاتب 1/2)$",
  "^(اسبام رسائل)$",
  "^(اختراق كاميرات مراقبه)$",
  "^(اداة nikto)$",
  "^(اداه Ax1)$",
  "^(darkfly)$",
  "^(الميتا)$",
  "^(اختراق فيسبوك)$",
  "^(وضع اسمك)$",
  "^(weeman)$",
  "^(اظهار داتا الاصدقاء)$",
                     },
   iblack = iblack,
   dblack = dblack,
   }
  
