--[[
الالعاب لسورس جاك ✾
تم تعديل الملف واضافه الالعاب بواسطه جاك (@V_P_E)
--]]
local function games(msg,MsgText)
if msg.type ~= "pv" then
if MsgText[1] == "تفعيل" and MsgText[2] == "الالعاب" or MsgText[2] == "اللعبه" or MsgText[2] == "اللعبة" then
if not msg.Admin then return "*-›* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط" end
if not redis:get(black..'lock_geams'..msg.chat_id_) then 
return "*-›* أهلا عزيزي "..msg.TheRankCmd.."\n*-›* الالعاب بالتاكيد تم تفعيلها" 
else 
redis:del(black..'lock_geams'..msg.chat_id_) 
return "*-›* أهلا عزيزي "..msg.TheRankCmd.."\n*-›* تم تفعيل الالعاب" 
end 
end
if MsgText[1] == "تعطيل" and MsgText[2] == "الالعاب" or MsgText[2] == "اللعبه" or MsgText[2] == "اللعبة" then
if not msg.Admin then return "*-›* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط" end
if redis:get(black..'lock_geams'..msg.chat_id_) then 
return "*-›* أهلا عزيزي "..msg.TheRankCmd.."\n*-›* الالعاب بالتأكيد معطله" 
else
redis:set(black..'lock_geams'..msg.chat_id_,true)  
return "*-›* أهلا عزيزي "..msg.TheRankCmd.."\n*-›* تم تعطيل الالعاب" 
end   
end
if MsgText[1] == "اضف رسائل" and msg.reply_to_message_id_ == 0 then       
if not msg.Creator then 
return "*-›* هذا الامر يخص {المطور,المنشئ} فقط" 
end 
local ID_USER = MsgText[2]
redis:set(black..'SET:ID:USER'..msg.chat_id_,ID_USER)  
redis:setex(black.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_,500,true)  
sendMsg(msg.chat_id_,msg.id_,'*- حلو ، ارسل لي عدد الرسائل الذي تريده*')
end
if MsgText[1] == "اضف نقاط" and msg.reply_to_message_id_ == 0 then       
if not msg.Creator then 
return "*-›* هذا الامر يخص {المطور,المنشئ} فقط" 
end 
local ID_USER = MsgText[2]
redis:set(black..'SET:ID:USER:NUM'..msg.chat_id_,ID_USER)  
redis:setex(black.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_,500,true)  
sendMsg(msg.chat_id_,msg.id_,'*- حلو ، ارسل لي عدد النقاط الذي تريده*')
end
if not redis:get(black..'lock_geams'..msg.chat_id_) and msg.GroupActive then
if MsgText[1] == 'اسئله' or MsgText[1] == 'ختيارات' or MsgText[1] == 'بدء الاسئله' then   
redis:set(black.."GAME:S"..msg.chat_id_,true) 
t1 = [[
ماهو اطول نهر في العالم 
1- النيل  
2- الفرات 
3- نهر الكونغو


- 【▣】 فكر اول 【▣】
]]
t2 = [[
ماعدد عظام الوجه?
1- 15
2- 13
3- 14 

- 【▣】 فكر اول 【▣】
]]
t3 =[[
كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون?

1- الفم 
2- الاذن
3- الثلاجه


- 【▣】 فكر اول 【▣】
]]
t4 =[[
كم جزء تحتوي مسلسل وادي الذئاب?

1- 7
2- 15
3- 11


- 【▣】 فكر اول 【▣】
]]
t5 =[[
كم جزء يحتوي القران الكريم?

1- 60
2- 70
3- 30 


- 【▣】 فكر اول 【▣】
]]
t6 =[[
من هوه اغنى رئيس في العالم??

1- ترامب
2- اوباما
3- بوتين  


- 【▣】 فكر اول 【▣】
]]

t7 =[[
من هوه مؤسس شركه ابل العالميه 

1-لاري بايج 
2- بيا غايتز
3- ستيف جوبر


- 【▣】 فكر اول 【▣】
]]
t8 =[[
ماهي عاصمه فرنسا?

1- باريس 
2- لوين 
3- موسكو 


- 【▣】 فكر اول 【▣】
]]
t9 =[[
ماعدد دول العربيه التي توجد في افريقيا 

1- 10 
2- 17
3- 9

- 【▣】 فكر اول 【▣】
]]
t11 =[[
ماهو الحيوان الذي يحمل 50 فوق وزنه ?
1-الفيل
2- النمل  
3- الثور


- 【▣】 فكر اول 【▣】
]]
t12 =[[
ماذا يوجد بيني وبينك؟  
1- الضل
2- الاخلاق
3-حرف الواو  


- 【▣】 فكر اول 【▣】
]]
t13 =[[
ماهو الشيء النبات ينبت للانسان بلا بذر؟
1-الاضافر 
2- الاسنان
3- الشعر


- 【▣】 فكر اول 【▣】
]]
t14 =[[
م̷ـــِْن هو اول الرسول الى الارض؟
1- ادم
2- نوح
3-ابراهيم 


- 【▣】 فكر اول 【▣】
]]
t15 =[[
ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين؟
1- سحاب
2- بئر
3- نهر


- 【▣】 فكر اول 【▣】
]]
t16 =[[
ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا؟
1- العمر
2- ساعه
3- الاسم


- 【▣】 فكر اول 【▣】
]]
t17 =[[
اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم
1- نحاس
2- الماس
3- ذهب


- 【▣】 فكر اول 【▣】
]]
t18 =[[
في الليل ثلاثة لكنه في النهار واحده فما هو
 1- حرف الباء
 2- حرف الام 
3- حرف الراء


- 【▣】 فكر اول 【▣】
]]
t19 =[[
على قدر اصل العزم تأتي?
1- العزائم 
2- المكارم
3- المبائب


- 【▣】 فكر اول 【▣】
]]

t20 =[[
ماهي جمع كلمه انسه ?
1- سيدات
2- انسات 
3- قوانص


- 【▣】 فكر اول 【▣】
]]
t21 =[[
اله اتسعلمت قديما في الحروب?
1- الصاروخ
2- المسدس
3- المنجنيق 


- 【▣】 فكر اول 【▣】
]]
t22 =[[
تقع لبنان في قاره?
1- افريقيا 
2- اسيا  
3- امركيا الشماليه


- 【▣】 فكر اول 【▣】
]]

t23 =[[
1- ماهو الحيوان الذي يلقب بملك الغابه?
1-الفيل
2- الاسد 
3- النمر


- 【▣】 فكر اول 【▣】
]]
t24 =[[
كم صفرا للمليون ?
1- 4 
2- 3
3-6

- 【▣】 فكر اول 【▣】
]]
t25 =[[
ما اسم صغير الحصان?
1- مهر  
2- جرو
3- عجل


- 【▣】 فكر اول 【▣】
]]
t26 =[[
ما الحيوان الذي ينام واحدى عينه مفتوحه?

1- القرش
2- الدلفين 
3- الثعلب


- 【▣】 فكر اول 【▣】
]]
t27 =[[
ماهي القاره التي تلقب بالقاره العجوز?

1- امريكا الشماليه 
2- امريكا الجنوبيه
3- افريقيا 


- 【▣】 فكر اول 【▣】
]]
t28 =[[
ما اسم المعدن الموجود فيي الحاله السائله 

1- النحاس 
2- الحديد
3- الزئبق  


- 【▣】 فكر اول 【▣】
]]
t29 =[[
ماهي عاصمه انجلترا?
1- لندن  
2- لفرسول
3- تركيا


- 【▣】 فكر اول 【▣】
]]
t30 =[[
ماهو الشئ الذي برأسه سبع فتحات

1- الهاتف
2- التلفاز
3- الانسان 


- 【▣】 فكر اول 【▣】
]]
t31 =[[
ماهي عاصمه اليابان ?
1- بانكول
2- نيو دلهي
3- طوكيو 


- 【▣】 فكر اول 【▣】
]]
t32 =[[
من هي زوجه الرسول الاكبر منه سنآ?

1- حفضه
2- زينب 
3- خديجه 


- 【▣】 فكر اول 【▣】
]]
TAHA = {t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31,t32,t1,t2,t3,t4,t5,t6,t7,t8,t9,t11,t12,t13,t14,t15}
local SENDTEXT = TAHA[math.random(#TAHA)]
if SENDTEXT:find('النيل') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'النيل') 
elseif SENDTEXT:find('14') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'14') 
elseif SENDTEXT:find('الفم') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الفم') 
elseif SENDTEXT:find('11') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'11') 
elseif SENDTEXT:find('30') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'30') 
elseif SENDTEXT:find('بوتين') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'بوتين') 
elseif SENDTEXT:find('ستيف جوبر') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ستيف جوبر') 
elseif SENDTEXT:find('باريس') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'باريس') 
elseif SENDTEXT:find('10') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'10') 
elseif SENDTEXT:find('النمل') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'النمل') 
elseif SENDTEXT:find('حرف الواو') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حرف الواو') 
elseif SENDTEXT:find('الشعر') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الشعر') 
elseif SENDTEXT:find('ابراهيم') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ابراهيم') 
elseif SENDTEXT:find('سحاب') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'سحاب') 
elseif SENDTEXT:find('الاسم') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الاسم') 
elseif SENDTEXT:find('ذهب') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ذهب') 
elseif SENDTEXT:find('حرف الام') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حرف الام') 
elseif SENDTEXT:find('العزائم') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'العزائم') 
elseif SENDTEXT:find('انسات') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'انسات') 
elseif SENDTEXT:find('المنجنيق') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'المنجنيق') 
elseif SENDTEXT:find('اسيا') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اسيا') 
elseif SENDTEXT:find('الاسد') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الاسد') 
elseif SENDTEXT:find('6') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'6') 
elseif SENDTEXT:find('مهر') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'مهر') 
elseif SENDTEXT:find('الدلفين') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الدلفين') 
elseif SENDTEXT:find('اوروبا') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اوروبا') 
elseif SENDTEXT:find('الزئبق') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الزئبق') 
elseif SENDTEXT:find('لندن') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'لندن') 
elseif SENDTEXT:find('الانسان') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الانسان') 
elseif SENDTEXT:find('طوكيو') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'طوكيو') 
elseif SENDTEXT:find('خديجه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'خديجه') 
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'الغاز' or MsgText[1] == 'الالغاز' or MsgText[1] == 'بدء الالغاز' then   
redis:set(black.."GAME:S"..msg.chat_id_,true) 
J2 =[[
طائر يتصف بالغرور ......
1- الهدهد  
2- الطاوس 
3- الاسد

【▣】 فكر اول 【▣】
]]
J3 =[[
شئ يأخذ منك قبل أن يعطى إليك .....
1- الاسم
2- الصوت
3- الصوره

【▣】 فكر اول 【▣】
]]
J4 =[[
خمسه وخمستين وكثفهم مرتين يبقا عددهم كام .....
1- 45
2- 55
3- 30

【▣】 فكر اول 【▣】
]]
J5 =[[
شئ كلما تحرك فقد قطعه من ذيله ....
1- الرمال
2- السحاب
3- الإبره

【▣】 فكر اول 【▣】
]]
J6 =[[
حمل سيدنا ..... عليه السلام معه من الحيوانات في السفينة قبل الطوفان
1- موسى
2- عيسي
3- نوح

【▣】 فكر اول 【▣】
]]
J7 =[[
ماهو الشئ الذي يجري ولا يستطيع المشي .....
1- الماء
2- الهواء
3- التربه

【▣】 فكر اول 【▣】
]]
J8 =[[
ما نوع القلم الذي يحمل طعامه فوق رأسه وإذا مشى أكل منه وإذا سكن غطى رأسه ونام .....
1- الإسنان
2- الرصاص
3- الحبر

【▣】 فكر اول 【▣】
]]
J9 =[[
شئ صافي كالماء ومولود في النار وإذا مات استقر علي الأرض ......
1- الزجاج
2- الذهب
3- الفضه

【▣】 فكر اول 【▣】
]]
J10 =[[
تستطيع مسكه لاكن لا تستطيع لمسه ....
1- يديك
2- لسانك
3- رجلك

【▣】 فكر اول 【▣】
]]
J11 =[[
إذا دخل الماء لا يبتل وإذا انقطع عنّا بحثنا فوراً عن حل فما هو
1- الماء
2- الهواء
3- الضوء

【▣】 فكر اول 【▣】
]]
J12 =[[
شيء اذا حذفت أوله اصبح عظيم الشان، وإذا حذفت وسطه أصبح عدو الإنسان، وإذا حذفت آخره أصبح غالي الأثمان، وإذا عكسته تقشعر منه الأبدان فما هو ...
1- برب
2- درب
3- ردب

【▣】 فكر اول 【▣】
]]
J13 =[[
شيء قلبه يأكل قشره فما هو ....
1- الشمس
2- الشمع
3- النحل

【▣】 فكر اول 【▣】
]]
J14 =[[
شئ يشم من لسانه ...
1- الضفضع
2- الثعبان
3- القط

【▣】 فكر اول 【▣】
]]
J15 =[[
شيء موجود في السماء إذا أضفت إليه حرفا أصبح في الارض .....
1- نيزك
2- قمر
3- نجم

【▣】 فكر اول 【▣】
]]
J16 =[[
ما هو الشيء الذي يوصلك من بيتك إلى عملك دون أن يتحرك ..
1- الكره الارضيه
2- الطريق
3- السياره

【▣】 فكر اول 【▣】
]]
J17 =[[
تاجر من التجار إذا اقتلعنا عينه طار. فمن هو ....
1- البقال
2- العطار
3- الجزار

【▣】 فكر اول 【▣】
]]
J18 =[[
ما هو الشيء الذي ترميه كلما احتجت اليه .....
1- المنطاد
2- شبكه الصيد
3- السناره

【▣】 فكر اول 【▣】
]]
J19 =[[
يسير بلا رجلين و لا يدخل إلا بالأذنين ما هو ...
1- الضوء
2- الصوت
3- الرياح

【▣】 فكر اول 【▣】
]]
J20 =[[
من هو الانسان الذي قتل ربع سكان العالم ...
1- هتلر
2- قابيل
3- هابيل

【▣】 فكر اول 【▣】
]]
J21 =[[
ما هو الشي الذي كلما كثر لدينا غلا و كلما قل رخص ...
1- العقل
2- المال
3- الحيوان

【▣】 فكر اول 【▣】
]]
J22 =[[
ما هو الشي الذي يوجد في وسط باريس ...
1- حرف
2- برج
3- علم

【▣】 فكر اول 【▣】
]]
J23 =[[
ما هو الشي الذي له أربع أرجل و لا يستطيع المشي ...
1- الكرسي
2- البطريق
3- الاخطابوط 

【▣】 فكر اول 【▣】
]]
J24 =[[
ما هو الشي الذي يستحيل كسره ...
1- المبتدأ
2- المنتهي
3- الاوسط

【▣】 فكر اول 【▣】
]]
J25 =[[
ما هو القبر الذي سار بصاحبه ...
1- القرش
2- الحوت
3- الدولفين

【▣】 فكر اول 【▣】
]]
J26 =[[
ماهو الشي الذي ينبض بلا قلب ..
1- حنكش
2- الساعه
3- القلب

【▣】 فكر اول 【▣】
]]
J27 =[[
أكلت فلفل فتفلفل فمي .. كم فاء في ذلك ....
1- 7
2- لا يوجد
3- 8

【▣】 فكر اول 【▣】
]]
J28 =[[
أخت خالك و ليست خالتك من تكون ..
1- امك
2- عمتك
3- خالتك

【▣】 فكر اول 【▣】
]]
JACK = {J2,J3,J4,J5,J6,J7,J8,J9,J10,J11,J12,J13,J14,J15,J16,J17,J18,J19,J20,J21,J22,J23,J24,J25,J26,J27,J28}
local SENDTEXT = JACK[math.random(#JACK)]
if SENDTEXT:find('الطاوس') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الطاوس')
elseif SENDTEXT:find('الصوره') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الصوره')
elseif SENDTEXT:find('45') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'45')
elseif SENDTEXT:find('الإبره') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الإبره')
elseif SENDTEXT:find('نوح') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'نوح')
elseif SENDTEXT:find('الماء') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الماء')
elseif SENDTEXT:find('الحبر') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الحبر')
elseif SENDTEXT:find('الزجاج') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الزجاج')
elseif SENDTEXT:find('يديك') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'يديك')
elseif SENDTEXT:find('الضوء') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الضوء')
elseif SENDTEXT:find('درب') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'درب')
elseif SENDTEXT:find('الشمع') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الشمع')
elseif SENDTEXT:find('الثعبان') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الثعبان')
elseif SENDTEXT:find('نجم') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'نجم')
elseif SENDTEXT:find('الطريق') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الطريق')
elseif SENDTEXT:find('العطار') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'العطار')
elseif SENDTEXT:find('شبكه الصيد') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'شبكه الصيد')
elseif SENDTEXT:find('الصوت') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الصوت')
elseif SENDTEXT:find('قابيل') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'قابيل')
elseif SENDTEXT:find('العقل') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'العقل')
elseif SENDTEXT:find('حرف') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حرف')
elseif SENDTEXT:find('الكرسي') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الكرسي')
elseif SENDTEXT:find('المبتدأ') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'المبتدأ')
elseif SENDTEXT:find('الحوت') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الحوت')
elseif SENDTEXT:find('الساعه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'الساعه')
elseif SENDTEXT:find('لا يوجد') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'لا يوجد')
elseif SENDTEXT:find('امك') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'امك')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'من اكون' or MsgText[1] == 'من' then   
redis:set(black.."GAME:S"..msg.chat_id_,true) 

K2 =[[
وضعت في مصر نظام الاحتكار

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K3 =[[
لدي ثلاثه قلوب واعيش في البحر

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K4 =[[
حامل ومحمول نصف ناشف ونصف مبلول

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K5 =[[
حيوان عظامي بالخارج ولحمي بالداخل


فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K6 =[[
قاضي عادل والكل لاحكامي خاضغ 
انا في يدي كفتين ولكن لا يوجد صوابع
بصدر حكم منغير ما اتكلم ومحدش بيثور ويمانع

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K7 =[[
اذا اخدت مني كبرت

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K8 =[[
جماد كاللوح بداخلي نفس وليس بداخلي روح

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K9 =[[
امشي واقف واستطيع اكل الحجر كما يحب الناس حملي

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K10 =[[
مولود وسط نار اذا القيتني علي الارض حدث لي فوران

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K11 =[[
ارفع الاثقال ولا استطيع رفع مسمار

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K12 =[[
لي عين ولا يوجد راس لي

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K13 =[[
تاكل مني ولكني لا استطيع الاكل

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K14 =[[
يوجد بي العديد من الثقوب ولكنني احفظ الماء

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K15 =[[
انسان ولست ابن ادم

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K16 =[[
اذا اكلتني كاملا تعيش واذا اكلت نصفي تموت

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K17 =[[
حيون اذا قطعتني الي نصفين لا اموت

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K18 =[[
فتحت القسطنطينيه

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K19 =[[
ابن الماء ولكن اذا دخلت الماء موت

فمن اكون ?


【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]
K20 =[[
توجد حسه الشم في لساني

فمن اكون ?

【▣】 فكر اول 【▣】
【▣】 اكتب الاجابه بدون (ال) 【▣】
]]

KHALED = {K2,K3,K4,K5,K6,K7,K8,K9,K10,K11,K12,K13,K14,K15,K16,K17,K18,K19,K20}
local SENDTEXT = KHALED[math.random(#KHALED)]
if SENDTEXT:find('محمد علي') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'محمد علي')
elseif SENDTEXT:find('اخطابوط') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اخطابوط')
elseif SENDTEXT:find('سفينه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'سفينه')
elseif SENDTEXT:find('سلحفاه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'سلحفاه')
elseif SENDTEXT:find('ميزان') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ميزان')
elseif SENDTEXT:find('حفره') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حفره')
elseif SENDTEXT:find('منفاخ') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'منفاخ')
elseif SENDTEXT:find('ساعه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ساعه')
elseif SENDTEXT:find('زجاج') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'زجاج')
elseif SENDTEXT:find('بحر') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'بحر')
elseif SENDTEXT:find('محمول') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'محمول')
elseif SENDTEXT:find('ابره') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ابره')
elseif SENDTEXT:find('طبق') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'طبق')
elseif SENDTEXT:find('اسفنجه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اسفنجه')
elseif SENDTEXT:find('ادم') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ادم')
elseif SENDTEXT:find('سمسم') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'سمسم')
elseif SENDTEXT:find('دوده') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'دوده')
elseif SENDTEXT:find('محمد الفاتح') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'محمد الفاتح')
elseif SENDTEXT:find('ثلج') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ثلج')
elseif SENDTEXT:find('ثعبان') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ثعبان')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'انصحني' or MsgText[1] == 'نصيحه' or MsgText[1] == 'اريد نصيحه' then   
redis:set(black.."GAME:S"..msg.chat_id_,true) 
B1 =[[
لا تدع احد يجعل فضله عليك
]]
B2 =[[
اصنع نفسك بنفسك فلن يحزن احد عليك سوي نفسك
]]
B3 =[[
لما لا تقرب من الله فلن يساعدنا احد غيره سبحانه وتعالي
]]
B4 =[[
عامل الجميع بنفس المستوي فالبشر سواسيه كأسنان المشط
]]
B5 =[[
لما لا تمسك كتاب الله تعالي وتبدأ بإستغفاره
]]
B6 =[[
عندما تختار شخص كي تتبعه اختار الافضل 
]]
B7 =[[
لا تعصي الله فلا احد يعلم متي سنموت
]]
B8 =[[
النهايه تقترب ولن ينفعك احد سوي الاعمال الصالحه
]]
B9 =[[
ليس هناك شئ افضل من الصحه فحاول تناول الطعام الصحي لتحافظ علي صحتك
]]
B10 =[[
الرياضه مفيده للجسم فحاول ممارستها
]]
B11 =[[
ابتعد عن العاده السريه لانها من مشتقات الزنا
]]
B12 =[[
اذا ابتعد الجميع عنك فحاول ان تجعل لك شخصيه افضل منهم
]]
B13 =[[
اجعل لنفسك هدف في الحياه لانك مواطن مسؤول
]]
B14 =[[
اذا اخبرك الجميع انك لا شئ بدونهم فيجب ان تعلم انك كل شئ بدونهم ولكن يقولون لك هكذا كي لا تبتعد عنهم
]]
B15 =[[
اذا اخبرك احد انك لا تستحق العيش فأخبره ان الحياه ان الله قد خلقك فمن هو كي يعطي حقوق العيش والموت
]]
B16 =[[
حاول ان تقلد غيرك في الاشياء الجيده
]]
B17 =[[
لا تندرج مع احد تحت اي مسمي فستندم في النهايه
]]
B18 =[[
بر الوالدين افضل من مفاتيح الجنه فلا تغضبهما
]]
B19 =[[
اذا اخبرت احد بشئ ولم يصدقك فلا داعي للتبرير له
]]
B20 =[[
لا تغير حياتك من اجل احد 
واذا حاولت تغييرها حولها الي الافصل
]]
BABA = {B1,B2,B3,B4,KB5,B6,B7,B8,B9,B10,B11,B12,B13,B14,B15,B16,B17,B18,B19,B20}
local SENDTEXT = BABA[math.random(#BABA)]
if SENDTEXT:find('حصل') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حصل')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('لا') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'لا')
elseif SENDTEXT:find('بجد') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'بجد')
elseif SENDTEXT:find('يجدع') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'يجدع')
elseif SENDTEXT:find('عاش') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'عاش')
elseif SENDTEXT:find('فعلا') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'فعلا')
elseif SENDTEXT:find('ف') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ف')
elseif SENDTEXT:find('ض') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ض')
elseif SENDTEXT:find('س') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'س')
elseif SENDTEXT:find('ن') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ن')
elseif SENDTEXT:find('ق') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ق')
elseif SENDTEXT:find('غ') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'غ')
elseif SENDTEXT:find('ع') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ع')
elseif SENDTEXT:find('ه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ه')
elseif SENDTEXT:find('خ') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'خ')
elseif SENDTEXT:find('ح') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ح')
elseif SENDTEXT:find('ج') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ج')
elseif SENDTEXT:find('ش') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ش')
elseif SENDTEXT:find('س') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'س')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'اسألني' or MsgText[1] == 'اسالني' or MsgText[1] == 'اسأل'  or MsgText[1] == 'اسال'  or MsgText[1] == 'بدأ الاسئله'  then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
d1 =[[
اي اكتر اكله بتحبها ?
]]
d2 =[[
عملت اي في يومك النهارده ?
]]
d3 =[[
بتحب الفلاوله ولا الشيكولاته ?
]]
d4 =[[
مين اجمد واد علي التيلي ?
]]
d5 =[[
اي رأيك في سورس بلاك ?
]]
d6 =[[
مين اكتر شخص بتحبه في اهلك ?
]]
d7 =[[
بتحب المحشي ولا البشاميل ?
]]
d8 =[[
لو جبتيلك كوره و عجله تختار تلعب ب اي ?
]]
d9 =[[
التيلي ييفيدك ب اي ?
]]
d10 =[[
بتحب القطط ولا الكلاب ?
]]
d11 =[[
بتحب تلعب صراحه ولا تلعب جراءه ?
]]
d12 =[[
لو جاتلك فرصه تبقي في تيم بلاك هتوافق ولا لا ?
]]
d13 =[[
اي اكتر حاجه بتحب تعملها لما تتضايق ?
]]
d14 =[[
بتعرف تعزف بيانو ولا لا ?
]]
d15 =[[
لو جاتلك فرصه تبقي مغني او ممثل تختار اي ?
]]
d16 =[[
مين مثلك الاعلي في الحياه ?
]]
d17 =[[
انتا سنجل ولا مرتبط ?
]]
d18 =[[
لو شاطر اي اكتر حاجه انا بحبها ?
]]
d19 =[[
انتا لو بقيت اغني راجل العالم هتعمل اي ?
]]
d20 =[[
نفسك تبقي اب او ام ولا لا ?
]]
DAD = {d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20}
local SENDTEXT = DAD[math.random(#DAD)]
if SENDTEXT:find('حصل') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حصل')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'جريمتي' or MsgText[1] == 'اخبرني جريمتي' or MsgText[1] == 'أخبرني جريمتي'  or MsgText[1] == 'جريمتى'  then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
JJ1 =[[
عاوز تسرق دكر البط بتاع سوسن جارتك .
]]
JJ2 =[[
بتفكر تشقط بنت الجبيران .
]]
JJ3 =[[
عاوز تقتل الادمن .
]]
JJ4 =[[
عاوز تشقط بنات الروم .
]]
JJ5 =[[
بتكلم نسوان .
]]
JJ6 =[[
بتلعب ع الفون وانتا بتذاكر .
]]
JJ7 =[[
مفكر نفسك ادمن تتك وكسه اكتر ما انتا موكوس .
]]
JJ8 =[[
سرقت المصاصه بتاعه الواد اليتيم اللي بيلعب فالشارع يلنلحرميه .
]]
JJ9 =[[
بتقول للقطط تعالي اجيبلك لبن وبتزنقها عند باب الثلاجه .
]]
JJ10 =[[
بتحب تعمل احيه زي عادل امام .
]]
JJ11 =[[
كنت بترن الجرس وتجري .
]]
JJ12 =[[
بتلعب ع الفون وتعمل نفسك نايم لما حد بيجي جمب باب الاوضه .
]]
JJ13 =[[
ضربت بنت قبل كدا ونت صغير .
]]
JJ14 =[[
ماشي عمال تضرب ف العيال الصغيره في الشارع .
]]
JJ15 =[[
بتفكر ازاي تشقط كراش الواد سعيد كلوت .
]]
JJ16 =[[
عاوز تحتوي اي بنت كيرفي يقليل الادب .
]]
JJ17 =[[
بتفتح الاله الحاسبه كتير 😹😹😹 .
]]
JJ18 =[[
نسوانجي درجه اولي .
]]
JJ19 =[[
بتقفف البلكونه وتتف علي الناس اللي فالشارع .
]]
JJ20 =[[
عاوز تبقي خالد يوسف في نفسك .
]]
JJACK = {JJ1,JJ2,JJ3,JJ4,JJ4,JJ5,JJ6,JJ7,JJ8,JJ9,JJ10,JJ11,JJ12,JJ13,JJ14,JJ15,JJ16,JJ17,JJ18,JJ19,JJ20}
local SENDTEXT = JJACK[math.random(#JJACK)]
if SENDTEXT:find('حصل') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حصل')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'باد' then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
AS1 =[[
ما مقاس البرا التي ترتديها الان ?
]]
AS2 =[[
ما لون ملابسك الداخليه المفضل ?
]]
AS3 =[[
متي قمت بممارسه العاده السريه اخر مره ?
]]
AS4 =[[
لو انت ولد : 
ما المكان المفضل لك في ممارسه الجنس ?

لو انتي بنت :
بدك تمارسي العاده السريه من الامام ام الخلف ?
]]
AS5 =[[
اخر مره قمت بزياره المواقع الايباحيه ?
]]
AS6 =[[
مشتهي شي ?
]]
AS7 =[[
اخر مره قبلتي ولد ?

اخر مره قبلت بنت ?
]]
AS8 =[[
ما رأيك في اللون الاسود حينما ترتديه فتاه بيضاء ?
]]
AS9 =[[
عمرك مارست الجنس ?
]]
AS10 =[[
قبلتي صديقك قبل كدا ?
]]
AS11 =[[
بتسكسك مع كام بنت ?
]]
AS12 =[[
عمرك سكسكتي مع ولد ?
]]
AS13 =[[
بعتي نودز لكام ولد ?
]]
AS14 =[[
اي اكتر حاجه بتشدك لجسم الجنس الاخر ?
]]
AS15 =[[
اخر مرهه غفلت حد وعملت معاه الجولاشه امته ?
]]
AS16 =[[
لو جاتلك فرصه تنيج راح توافق ولا لا ?
]]
AS17 =[[
لو جاتلك فرصه تمارسي الجنس المخفف راح توافقي او لا ?
]]
AS18 =[[
مين الممثله اللي نفسك تعمل معاها احيه ?
]]
AS19 =[[
لو جيسكا قالتلك بيو بيو هتوافق ?
]]
AS20 =[[
عاوز تنزل ناو ولا لا ?
]]
BAD = {AS1,AS2,AS3,AS4,AS5,AS6,AS7,AS8,AS9,AS10,AS11,AS12,AS13,AS14,AS15,AS16,AS17,AS18,AS19,AS20}
local SENDTEXT = BAD[math.random(#BAD)]
if SENDTEXT:find('حصل') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حصل')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'غنيلي' or MsgText[1] == 'غني' or MsgText[1] == 'غني يا بوت'  then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
KH1 =[[
مفيش مرة تقربلي تطمني.. يللي حاببني ليه قلبك بيظلمني.. كل ما أحبك منك بتحرمني.. يبقى ده اسمه كلام.. عشان خاطري تكلمني تفهمني.. عرفني إيه يا حبيبي حصل مني.. إزاي يطاوعك قلبك تغيب عني.. وإحنا بينا غرام.. اّه ياناري وحنيني بفتكرك وانت ناسيني.. يا حبيبي على عيني أتعذب منه بعيني.. مفيش مرة تقربلي تطمني.. يللي حاببني ليه قلبك بيظلمني.. كل ما أحبك منك بتحرمني.. يبقى ده اسمه كلام.. هان عليك تنساني وتبقى أناني وترضى بجرحك فيا.. سهلة لو من غيرك كتر خيرك أنا ميهونش عليا.. مفيش مرة تقربلي تطمني.. يللي حاببني ليه قلبك بيظلمني.. يبقى ده اسمه كلام.. عشان خاطري تكلمني تفهمني.. عرفني إيه يا حبيبي حصل مني.. إزاي يطاوعك قلبك تغيب عني.. وإحنا بينا غرام.. اّه ياناري وحنيني أفتكرك وانت ناسيني.. يا حبيبي على عيني أتعذب منه بعيني..
]]
KH2 =[[
أيوة انا عارف ان كلامي عليها كتير اصل حكايتي معاها حكاية حب كبير ايوة انا عارف ان كلامي عليها كتير اصلي حكايتي معاها حكاية حب كبير ده انا من يوم ما سابتني و قلبي مهوش مرتاح أسكت ليه ده انا بس بقول اسمها برتاح انا بتكلم عن اللي انا شفته معاها في يوم بحكي الفرحة اللي بعيش فيها لحد اليوم لو مش هحكي عنها أتكلم بس في ايه مين يستاهل بعد حبيبي أحكي عليه ده انا من يوم ما سابتني و قلبي مهوش مرتاح أسكت ليه ده انا بس بقول اسمها برتاح كل ما اقول انا مش هاتكلم عنها خلاص و اعمل نفس قال بتكلم ويا الناس و اخد بالي عشان ما اغلطش في أي كلام برضة كلامي يلف و يرجع ليها قوام ده انا من يوم ما سابتني و قلبي مهوش مرتاح أسكت ليه ده انا بس بقول اسمها برتاح
]]
KH3 =[[
خلص الدمع من عيوني ونسيت اصل الوجع والاه وليش بكيت حبيتك، دفعت الثمن وشفيت شو ذكرك فيي؟؟؟ كنت الدني كلا كنت السنين كلا كان مطرحك بالبيت ياريت مافليت عيشتني بخريف ورئة على الرصيف بكير نتذكر باقي عمر اكتر ولك روح روح الله يسهلك خلص الدمع من عيوني ونسيت اصل الوجع والاه وليش بكيت حبيتك، دفعت الثمن وشفيت شو ذكرك فيي؟؟؟ سرئت الفرح مني دمعي حكي عني من خبرك الئلوب تنسى الاسى وبدوب متئولي مشتاق لي ذوق الوجع مثلي مكتوب ومئدر انساك انا اكثر ولك روح روح الله يسهلك خلص الدمع من عيوني ونسيت اصل الوجع والاه وليش بكيت حبيتك، دفعت الثمن وشفيت شو ذكرك فيي؟؟؟
]]
KH4 =[[
شو هالحلا بلاني زماني حلا على هضامي كمان قللي شو فيك يا روحي شو فيك قلبي بغرامك طاير طيران شو هالحلا بلاني زماني حلا على هضامي كمان قللي شو فيك ياروحي شو فيك قلبي بغرامك طاير طيران عنيك شغلي ماعندي غيرن شغل ولاعملي لا تستغرب لو مني طار عقلي وين عقلي وين عقلي وين عنيك شغلي ما عندي غيرن شغلي ولا عملي لا تستغرب لو مني طار عقلي وين عقلي وين عقلي وين قلي شو فيك يا روحي شو فيك قلبي بغرامك طاير طيران شو هالحلا بلاني زماني حلا على هضامي كمان قللي شو فيك يا روحي شو فيك قلبي بغرامك طاير طيران شو فيك حتى كل ما مرقت قبالي بدوخ حتى مابيبقى شي ببالي غيرك انت مين انت مين انت مين شو فيك حتى كل ما مرقت قبالي بدوخ حتى ما بيبقى شي ببالي غيرك انت مين انت مين انت مين قلي شو فيك يا روحي شو فيك قلبي بغرامك طاير طيران شو هالحلا بلاني زماني حلا على هضامي كمان قلي شو فيك يا روحي شو فيك قلبي بغرامك طاير طيران
]]
KH5 =[[
مالك مش باين ليه
قلبك تايه من مده كبيره
خايف تتكلم ليه
في عيونك حيره وحكاوي كتيره
متغير ياما عن زمان
قافل على قلبك البيبان
حبيت وفارقت كم مكان
عايش جواك
إحساسك كل يوم يقل
وتخطي وخطوتك تذل
من كتر ما أحبطوك تمل فين تلق دواك
بتودع حلم كل يوم
تستفرد بيك الهموم
وكله كوم والغربة كوم والجرح كبير
مبتديش حاجة اهتمام
أهلاً أهلاً سلام سلام
بقى طبعك قلة الكلام ومفيش تفسير

داري داري يا قلبي مهما تداري
قصاد الناس حزننا مكشوف
واهو عادي عادي محدش في الدنيا دي
بيتعلق بشيء إلا وفراقه يشوف
كل اللي معاك في الصورة غاب
وطنك والأهل والصحاب
كم واحد ودع وساب من غير أسباب
شايف في عينيك نظرة حنين بتحن لمين ولا مين
طول عمرها ماشيه السنين والناس ركاب
مع دقة عقرب الساعات
بتموت جوانا ذكريات
عشمنا قلوبنا باللي فات ونسينا نعيش
كان مكتوب نمشي الطريق ونفارق كل مدى شيء
اتسرق العمر بالبطيء ورسي على مافيش
ودارَيْ دارَيْ يا قَلْبَيْ مُهِمّا تُدارِي
قُصّاد الناس حزْننا مَكْشُوف
وَأاهْوَ عادِي عادِي محدش فِيَّ الدُنْيا دِي
بيتَعَلَّق بِشَيّء إِلّا وَفِراقهُ يُشَوِّف

داري داري يا قلبي مهما تداري
قصاد الناس حزننا مكشوف
واهو عادي عادي محدش في الدنيا دي
بيتعلق بشيء إلا وفراقه يشوف
وداري داري يا قلبي مهما تداري
قصاد الناس حزننا مكشوف
واهو عادي عادي محدش في الدنيا دي
بيتعلق بشيء إلا وفراقه يشوف
داري داري يا قلبي مهما تداري
قصاد الناس حزننا مكشوف
]]
KH6 =[[
حبيبي بالبُنط العريض
غالي واقرب م الوريد
حالتي تتشخص جُنون
بيقولولي انا بيك مريض

أتاري كُل ما احب فيك
بدمنك وبقيت مزاج
أتلحق بقى دي ف إيديك
ما انت في لُقاك العلاج

آه لقيت الطبطبه
واقوى لو ما انتش بعيد
ضحكتك فيها كهربا
بابقى زي واحد جديد

حبيبي خدها ومني ليك
مشتريك آه مشتريك
فوق ما تتصور كمان
والوحيد ولا ليك شريك

لو انا هوصفك اوصف ايه
عُقد فُل ابيض وفيه
قلب بيدلدق حنان
مِـلكي بقى وانا أدرى بيه

آه لقيت الطبطبه
واقوى لو ما انتش بعيد
ضحكتك فيها كهربا
بابقى زي واحد جديد
]]
KH7 =[[
شكله مش موضوع بسيط .. فيه غدر وفيه حوارات
ده أنا بسهر بالساعات .. كل ده بيحصل أوام
حاسس إني كده إبتديت .. أبقي رومانسي و ضعیف
ليه نومي بقي خفيف .. كنت لما بنام بنام
الجمال عدي الكلام .. تضحكي لي و تاخدي كام
أدفع العمر اللي جاي .. بس و تردي السلام
مش بأفور صدقيني .. حس بيا كلميني
حتي لو موضوع غريب .. اللي طالبه تفهميني
ده أنا و الله إبن ناس .. مش بعاكس م الأساس
هتقوليلي ده اندفاع .. يمكن تستغربيني
أوعي تمشي و تسيبيني .. قبل ما أخلص كلام
أنا شفتك قلبي ضاع .. و ده أصلا مش طبيعي
في الزحمة لو تضيعي .. قولي علي قلبي السلام
]]
KH8 =[[
انت معلم وحنا منك نتعلم
انت معلم وحنا منك نتعلم
نسكت ونتا موجود ما نرضى نتكلم
نسكت ونتا موجود ما نرضى نتكلم
انت معلم وحنا منك نتعلم
انت معلم وحنا منك نتعلم
آه نسكت ونتا موجود ما نرضى نتكلم
نسكت ونتا موجود ما نرضى نتكلم
والي خلاك ما يفهم يجيلو يوم و يندم
والي خلاك ما يفهم يجيلو يوم و يندم
وما تسمع الي يخدعك انت معلم
وما تسمع الي يخدعك انت معلم
انت معلم وحنا منك نتعلم (معلّم!)
انت معلم وحنا منك نتعلم
اه نسكت ونتا موجود ما نرضى نتكلم
نسكت ونتا موجود ما نرضى نتكلم
]]
KH9 =[[
سهرنا يا ليل
للصبح يا ليل
وأمانه ما تمشي يا قمر اليل أه يا محلى اليل ويا حبيبي
دي حياتي معاه
بقى ليها حياه
لو هفضل طول الليل حضناه مش هشبع من حضن حبيبي

استني يا شمس بقى استني
مش عايزه حبيبي يروح مني

ما تجيش وحياتك دلوقتي
اصل انا لسه ما خدتش وقتي
عايزه اسهر مره على طريقتي
واتهنى لحد الصبح معاه

استني يا شمس كمان حبه
محتاجه اني في حضنه اتخبى
وقف يا زمان ساعتك ليله
دي السهره بقت جنبو جميله
و حياتي ما جتش من الليله
دانا قلبي ما صدق يبقى معاه..

سهرنا يا ليل
للصبح يا ليل
و أمانه ما تمشي يا قمر اليل أه يا محلى اليل ويا حبيبي
هانغني يا ليل
للصبح يا ليل
و امانه ما تمشي يا قمر الليل
آه يا محلا الليل وياه حبيبي
دي حياتي معاه بقى ليها حياة
لو أفضل طول الليل حاضناه
مش هاشبع من حضن حبيبي

علشان خاطري بقا يا ليل طول
و يا ريت لو ترجع من أول
خليك سهران حبة معانا
الليله أنا أسعد إنسانه
لو هفضل مية ليل سهرانة
مش هتعب برضه ما دام حاضناه

وأمانه عليك آه يا ليل طول
وحياتنا لترجع من الأول
خليك سهران حبة معانا
الليلة أنا أجمل إنسانه
لو هفضل مية ليل سهرانة
مش هتعب برضو ما دام واياه

سهرنا يا ليل
للصبح يا ليل
و أمانه ما تمشي يا قمر اليل أه يا محلى اليل ويا حبيبي
علشان خاطري بقا يا ليل طول
و يا ريت لو ترجع من أول
خليك سهران حبة معانا
الليله أنا أسعد إنسانه
لو هفضل مية ليل سهرانة
مش هتعب برضه ما دام حاضناه
]]
KH10 =[[
أنا قولت اللي محدش قاله
وعملت اللي محدش عمله
يفارقني أنا راضي ومالو
بكرة هيعرف غلطة عمره
هيعيش يفتكرني
وكل ما يقابل في بٌعدي هيفتكرني
يتمني بس انه يقابلني
هيعيش يفتكرني
وكل ما يقابل في بٌعدي هيفتكرني
يتمني بس انه يقابلني
خليه يشوف بقي مين أبقاله
ده أنا ياما عملت حساب زعله
أنا بعد كلامه وأفعاله
ده لا يمكن حاجة تشفعله
هيعيش يفتكرني
وكل ما يقابل في بٌعدي هيفتكرني
يتمني بس انه يقابلني
هيعيش يفتكرني
وكل ما يقابل في بٌعدي هيفتكرني
يتمني بس انه يقابلني
آه، آه، آه
آه، آه، آه
هيعيش يفتكرني
وكل ما يقابل في بٌعدي هيفتكرني
يتمني بس انه يقابلني
هيعيش يفتكرني
وكل ما يقابل في بٌعدي هيفتكرني
يتمني بس انه يقابلني
]]
KH11 =[[
اهو ليل وعدى ليل وعدى وراح
اهو ليل وعدى ليل وعدى معدش تانى جراح

ملكيش فى الكون بديل مهو مصعب ومستحيل
اعشق واحب واميل معقول احب عليكى

اهو ليل وعدى ليل وعدى وراح
اهو ليل وعدى ليل وعدى معدش تانى جراح

هنعيش كتير حكايات و ان كان على الماضى فات
دلوقتى امنيات العمر كله ليكى

اهو ليل وعدى ليل وعدى وراح
اهو ليل وعدى ليل وعدى معدش تانى جراح

اجمل فيكى روح قلبك كتاب مفتوح
دلوقتى مش مسموح لحد يبص ليكى
]]
KH12 =[[
اسمع مني ياقلبي حبيبنا اهو سابنا وبيرتاح في عذابنا... دمر كل حياتي وليه الفضل
مش معقولة اللي انت بتعمله فيا فكر فيه شوية!... انا مش طالب منك غير العدل

وليه كل ده على ايه هوه يعني خلاص مفيش في الدنيا دي بعدييه!
وليه لسه باقي عليه يعني كده يرضيك ياقلبي أللي احنه عايشين فييه!

سابنا ياقلبى وقلت مسيرك تنسى ... ومع الوقت هتقسى وهنقفل صفحته انا وانت خلاص
من يوم بعده وسايبك تيجى عليا ... ملعونة الحنية والحب اللى يقلل قيمة الناس

وليه كل ده على ايه هوه يعني خلاص مفيش في الدنيا دي بعدييه!
وليه لسه باقي عليه يعني كده يرضيك ياقلبي أللي احنه عايشين فييه!
]]
KH13 =[[
ياحبيبى اهو بقلها بكل اللهجات
وبعلو الصوت ولو عايزني اخترعلك لهجة
حبيبى انا جاهز موت
هلبا هلبا برشا برشا مرة مرة كتير كتير بزاف وايد اوي اوي

انا نبغيك ونموت عليك رب يخليك علطول ليا
وهلا والله يا يا بعد عمري يا محلى الحياة بقربك ياقمرى
انا نبغيك تكوني حلالي ونموت عليك حبيبة ديالي رب يخليك علطول ليا
وهلا والله يا يا بعد عمري فى بيتك يا محلى الحياة بقربك ياقمري

ياحبيبى اهو بقلها بكل اللهجات
وبعلو الصوت ولو عايزني اخترعلك لهجة
حبيبى انا جاهز موت
انا قلتهالك وهفضل تاني اقلهالك
انا وانت هنبقى حكاية الناس تحكيها في كل مكان
هلبا هلبا برشا برشا مرة مرة كتير كتير بزاف وايد اوي اوي

دخيله الله يا الله شو بحبه والله عجماله اسماالله يأبرنى هواه
ايش لونك حبى اشتاق ليك قلبى يادمى وشهدى قاتلنى جفاه
دخيله الله يا الله شو بحبه والله يادلي عجماله اسماالله يأبرنى هواه
شلونك حبي احبك اشتاق الك قلبي ياغزالي يادمي وتشهدين قاتلني جفاه

ياحبيبى اهو بقلها بكل اللهجات
وبعلو الصوت ولو عايزني اخترعلك لهجة
حبيبى انا جاهز موت
انا قلتهالك وهفضل تاني اقلهالك
انا وانت هنبقى حكاية الناس تحكيها في كل مكان
هلبا هلبا برشا برشا مرة مرة كتير كتير بزاف وايد اوي اوي
]]
KHALEDD = {KH1,KH2,KH3,KH4,KH5,KH6,KH7,KH8,KH9,KH10,KH11,KH12,KH13}
local SENDTEXT = KHALEDD[math.random(#KHALEDD)]
if SENDTEXT:find('حصل') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حصل')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
elseif SENDTEXT:find('اه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اه')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'الحمل' or MsgText[1] == 'برج الحمل' then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
HA1 =[[
【▣】 برج الحمل

الصفات العاديه
يعتبر مواليد برج الحمل من الشخصيات الصبورة للغاية، بالرغم من الضغوطات التي يتعرضون لها، إلا أنهم يقفون مثل الوتد في الأرض، لا أحد يمكنه أن يزحزحهم عن أحلامهم، أو يعطلهم عن تحقيق أهدافهم، ومن مشاهير برج الحمل النجمة نادية الجندي، وفي إطار هذا السياق يقدم "اليوم السابع" توقعات علماء الفلك لأصحاب برج الحمل على الصعيد الصحي والمهني والعاطفي.

في العمل 
العمل يعتبر لك جزء أساسي في الحياة، لكنك لا تهتم بتفاصيل التعامل مع زملائك، يوجد منهم من لا يحبونك، وقد يكونوا يسعون لتعطيل مسيرتك العملية، تعامل معهم بحرص وتوقع أن تكون هناك عقبات، لكن تأكد أنك ستتجاوزها.

في العاطفه
آن الأوان أن تعترف لحبيبك بمشاعرك التي أخفيتها عنه لمدة طويلة، فهو بحاجة لأن يعرف مدى حبك له، وقد يكون تعبيرك عن الحب بهدية بسيطة أو دعوته للعشاء سوياً من الأفكار الجيدة، لكن لا تفوت الفرصة حتى تذوب الجليد الذي بينكما.

في الصحه
تتعرض لبعض المشكلات الصحية نتيجة الاجهاد والتوتر الناتج عن العمل لساعات طويلة، الراحة والهدوء هو كل ما تحتاجه هذه الفترة، خذ وقتاً للاستجمام.

في المستقبل
الفترة المقبلة ستحمل لك الخير نتيجة ما قمت به مؤخراً من مساعدة غيرك وتلبية احتياجات من هم أضعف منك، معاملتك الحسنة مع الغير تجعل منك إأنساناً مميزاً مليء بحب الخير، وتكسب احترام وتقدير الجميع.
]]
HA2= [[
【▣】 برج الحمل

مليء بالحيوية والطاقة وحب الحياة لأنه يحكمه المريخ ويحب الهدايا النادرة خارج الصندوق.
]]
HA3 =[[
【▣】 برج الحمل

ينتمي مواليد برج الحمل إلى الفترة الواقعة ما بين الواحد والعشرين من شهر آذار/ مارس إلى التاسع عشر من نيسان/ أبريل، ويتبع لعنصر النار، ويفضّل عادةً اللون الأحمر، ويُحقق توافقاً واسنجاماً مع برج الميزان والأسد في العادة، ويتصّف مواليد البرج عُموماً بالشجاعة، والثقة بالنفس، والتفاؤل، والصدق، والعاطفة، إلى جانب قلّة الصبر، وتقبّل المزاج، والاندفاعية أحياناً.
]]
HAMEL = {HA1,HA2,HA3}
local SENDTEXT = HAMEL[math.random(#HAMEL)]
if SENDTEXT:find('حمل') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حمل')
elseif SENDTEXT:find('حمل') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حمل')
elseif SENDTEXT:find('حمل') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حمل')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'الثور' or MsgText[1] == 'برج الثور'  then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
SO1 =[[
【▣】 برج الثور

الصفات العاديه
يتمتع مولود برج الثور بشخصية قوية، وقدرة كبيرة على تحقيق النجاح، فهو شخص مخلص لعمله ومثابر ولا ييأس في سبيل تحقيق أهدافه، بالإضافة إلى حبه لتطوير نفسه وأعماله، ويميل إلى العيش في رفاهية مع شريك حياته، فهو مخلص جدًا عندما يشعر بالحب، ومن مشاهير برج الثور جورج كلونى، وفي إطار هذا السياق يقدم "اليوم السابع" توقعات علماء الفلك لأصحاب برج الثور على الصعيد الصحي والمهني والعاطفي.

في العمل
تشعر أنك بحاجة للحصول على راحة من العمل والاستمتاع بقضاء يوم في أحد الأماكن المفضلة إليك لكي تتمكن من تجديد طاقتك بعد فترة من الضغوط في العمل.

في العاطغه
أنت شخص مخلص لشريك حياتك بشكل كبير، لكنك تحاول فرض سيطرتك عليه ومواقفك وآرائك بشكل مبالغ فيه، لذا حاول أن تتخلى عن هذه الطريقة حتى لا تؤثر على علاقتكما مع الوقت، خاصة أن الحبيب يكره حب التملك.

في الصحه
حاول أن تواظب على زيارة طبيب الأسنان لعلاج بعض المشكلات التى أصبحت تعانى منها مؤخرًا، ولا تهملها حتى لا يتسبب ذلك في تفاقم الأمور.

في المستقبل
يتوقع علماء الفلك لك خلال الفترة القادمة، أن تحصل على تقدير معنوى ومادى نظير بعض النجاحات التى ستحققها على مستوى شركتك، والتى ستساعد في وضعها في مقدمة المؤسسات العاملة في مجالها.
]]
SO2 =[[
【▣】 برج الثور

يحكمك كوكب الزهرة ويحبون الهدايا الشاعرية والرقيقة
]]
SO3 =[[
【▣】 برج الثور

يولد مولود برج الثور في الفترة الواقعة ما بين 20 نيسان/ أبريل إلى 20 أيار/ مايو، ويتبع لعنصر الأرض، ويقع تحت حكم كوكب الزُهرة، ويفضّل في العادة اللون الورديّ، ويُحقق توافقاً مع برجي العقرب والسرطان في العادة، ويتصف مواليد البرج عُموماً بالمنطق والتوازن، والصبر، ويُمكن الثقة بهم والاعتماد عليهم، هذا فضلاً عن كونهم مخلصين لمن حولهم، ويتحمّلون المسؤوليّة، إلا أنّهم قد لا يتقبّلون عمل تسويّة مع أحد للتوصل لحل وسط، بالإضافة إلى حبهم للتملّك في بعض الأحيان.
]]
SOUR = {SO1,SO2,SO3}
local SENDTEXT = SOUR[math.random(#SOUR)]
if SENDTEXT:find('ثور') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ثور')
elseif SENDTEXT:find('ثور') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ثور')
elseif SENDTEXT:find('ثور') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ثور')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'الجوزاء' or MsgText[1] == 'برج الجوزاء'  then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
GA1 =[[
【▣】 برج الجوزاء

الصفات العاديه
يتصف مولود برج الجوزاء بالحس الفكاهي والخيال الواسع والقدرة على الإبداع، بالإضافة إلى أنه اجتماعي ويفضل مساعدة من حوله، وهو أيضًا مرتبط بأسرته وداعم لهم بشد، ويحب الحرية والسفر، ولكنه شخص متقلب جدًا، وهو ما يجعل التعامل معه صعبًا في كثير من الأحيان، ومن مشاهير برج الجوزاء الفنانة زبيدة ثروت، وفي إطار هذا السياق يقدم "اليوم السابع" توقعات علماء الفلك لأصحاب برج الجوزاء على الصعيد الصحي والمهني والعاطفي.

في العمل
تحاول أن تحصل على أهدافك بطرق ملتوية، وهو ما يسبب لك بعض التوتر في التعامل مع زملائك، لذا حاول أن تغير أسلوبك وتكون أكثر وضوحًا، فالنجاحات لا قيمة لها إذا جاءت بمثل هذه الطرق، وتتسبب في خسارتك لحب الناس.

في العاطفه
حاول أن تشعر حبيبك بأهميته في حياتك لأن طريقتك معه تشعره بالإهمال، بالإضافة إلى عدم تقديرك لما يقدمه لك من دعم وحب غير مشروط، لذا حاول أن تسمعه كلمات الثناء والحب.

في الصحه
واظب على ممارسة التمارين الرياضية  حتى تحافظ على لياقتك البدنية ووزنك المثالى، فلا تسمح بخسارة ما وصلت إليه بعد مجهود شهور.

في المستقبل
يتوقع علماء الفلك لك خلال الفترة المقبلة، ان يدخل أسرتك شخص جديد سيصيبك بارتباك في البداية، لكن سرعان ما سيتحول الأمر إلى حالة من البهجة والسعادة.
]]
GA2 =[[
【▣】 برج الجوزاء

تحب الهدايا المتنوعة
]]
GA3 =[[
【▣】 برج الجوزاء

ينتمي مولود برج الجوزاء إلى الفترة الواقعة بين 21 أيار/ مايو إلى 20 حزيران/ يونيو، ويتبع لعنصر الهواء، ويفضّل اللون الأصفر في العادة، ويُحقق انسجاماً مع مولودي برجي القوس والدلو، ويتصف مواليد البرج عُموماً بالمرونة والانفتاح، والحنان، والفضول، وسرعة التعلّم، واللطف، إلا أنهم قد يعانن أحياناً من التردد، والعصبيّة.
]]
GAWZAA = {GA1,GA2,GA3}
local SENDTEXT = GAWZAA[math.random(#GAWZAA)]
if SENDTEXT:find('جوزاء') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'جوزاء')
elseif SENDTEXT:find('جوزاء') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'جوزاء')
elseif SENDTEXT:find('جوزاء') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'جوزاء')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'السرطان' or MsgText[1] == 'برج السرطان'  then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
SA1 =[[
【▣】 برج السرطان

الصفات العاديه
يمتلك مواليد برج السرطان الكثير من المشاعر والعواطف ويهتم من حلوه ويتمسك بهم، مما يجعلهم أشخاص يمكن الوثوق بها، ويحاولون حماية من يهمهم أمرهم بشتى الطرق حتى يبقيهم بأمان، وقد يكثرون فى التفكير والاستنتاجات مما قد يعرضهم للمشاكل، ومن مشاهيره توم كروز، وفي إطار هذا السياق يقدم "اليوم السابع" توقعات علماء الفلك لأصحاب برج السرطان على الصعيد الصحي والمهني والعاطفي.

في العمل

تتمتع بنشاط وحيوية لتنفيذ مهامك فى العمل، فأنت تقوم بعمل جيد جدًا، فقط حافظ على وتيرتك واستمر في المضي قدمًا، فلا يزال لديك الكثير من المهارات لتقديمها، واحرص على التحقق من مستنداتك من حين لآخر.

في العاطفه

حافظ على التحكم في أعصابك للحكم بشكل جيد على نجاح علاقتك مع شريك حياتك، فالغضب لن يؤدى إلى أى نتائج مثمرة، وتحتاج أيضًا إلى تحديد مشاعرك تجاه حبيبك، لأن الحفاظ على توازن جيد بين احترامك لذاتك والتزامك تجاه حبيبك أمرًا مهمًا للغاية الآن.

في الصحه

التفكير بإيجابية سيجعلك تحافظ على صحة جسمك وعقلك ويبعدك عن التوتر الذى يستنفذ صحتك، تحتاج إلى العودة إلى نظامك الغذائى الذى تجاهلته الفترة الماضية، كذلك يمكنك ممارسة الرياضة وإتباع روتين للياقة البدنية، وقد تصاب بألم في ركبتيك، فقط كن منتظمًا في التمرين، سوف تتلاشى في غضون يومين.

في المستقبل
حاول تحقيق التوازن بين عملك وصحتك، ولا تدع مشاغلك فى المهنة تؤثر على علاقاتك الاجتماعية، ويمكنك إرسال رسالة إلى أحد أصدقائك المقربين تسأله عن حاله، وهذه التغييرات ستجعلك تشعر بالراحة.
]]
SA2 =[[
【▣】 برج السرطان

تحب الهدايا الرومانسية الحالمة
]]
SA3 =[[
【▣】 برج السرطان

يولد صاحب برج السّرطان في التاريخ الواقع بين 21 يونيو إلى 22 يوليو، ويتبع لعنصر الماء، أما لونه المفضّل فهو الأرجواني، ويذكر أنه يُحقق توافقاً مع برجي الجدي والثور، ويتصف مواليد البرج عُموماً بالتماسُك، والخيال الواسع، والإخلاص، والعاطفة، والتعاطُف، والقدرة على الإقناع، إلا أنهم قد يكونوا متقلّبي المزاج، ومتشائمين أحياناً.
]]
SARATAN = {SA1,SA2,SA3}
local SENDTEXT = SARATAN[math.random(#SARATAN)]
if SENDTEXT:find('سرطان') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'سرطان')
elseif SENDTEXT:find('سرطان') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'سرطان')
elseif SENDTEXT:find('سرطان') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'سرطان')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'الاسد' or MsgText[1] == 'برج الاسد' or MsgText[1] == 'الأسد'  or MsgText[1] == 'برج الأسد' then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
AS1 =[[
【▣】 برج الاسد

الصفات العاديه
يتصف مواليد برج الأسد بالصفات القيادية التى تمكنهم من إدارة الأعمال بنجاح، بالإضافة إلى الكرم والاخلاص لمن حولهم وحب الخير للجميع، فهم يحبون الاستماع دائمًا إلى كلمات الثناء والحصول على اهتمام من حولهم، كما أنهم مندفعين جدًا وقت العصبية فقد يصل بهم الحال إلى خسارة بعض العلاقات الاجتماعية أثناء الغضب، ومن مشاهير برج الأسد منة شلبى، ويقدم "اليوم السابع" لمولود هذا البرج توقعات الأبراج وحظك اليوم على الصعيد المهني والعاطفي والصحي.

في العمل
تشعر بحالة من الارتباك اليوم، وهو ما قد يؤثر على أدائك في العمل، لكنك سرعان ما ستتمكن من تخطى الأمر وانجاز مهامك بجدية، لكن ستظل حالة الارتباك تلازمك إذا لم تعيد ترتيب أولوياتك وتنظيم يومك.

في العاطفه
تعيش يومًا رومانسيًا بعد مشاركتك بعض الإيماءات الرومانسية مع شريك حياتك بمناسبة عيد الحب، وهو ما سيسعدك ويجعلك مقبل على الحياة بشكل أكبر، بعد فترة من الضغوطات التي عشتها معه.

في الصحه
تعانى من حساسية بالجيوب الأنفية تسبب لك العديد من الأعراض المؤلمة، أبرزها الصداع المستمر، وهو ما يتطلب منك زيارة الطبيب المختص، لفحصك ومنحك العلاج اللازم.

في المستقبل
يتوقع علماء الفلك لمولود برج الأسد أن تتحسن أوضاعه الفترة القادمة على صعيد العمل، وكذلك الصعيد المادي، بعد حصوله على مبلغ مالى نظير بعض الأعمال التى قام بها مؤخرًا.
]]
AS2 =[[
【▣】 برج الاسد

تحب أن يكون مركز اهتمام لذا أن تكون الهدية مهمة وعلى جودة عالية.
]]
AS3 =[[
【▣】 برج الاسد

يولد صاحب برج الأسد في التاريخ الواقع بين 23 يوليو إلى 22 أغسطس، ويتبع لعنصر النار، ولونه المفضّل هي الذهبي، ويذكر أنه يحقق انسجاماً مع برجي الدلو والجوزاء، ويتصف مواليد البرج عُموماً بالإبداع، والعاطفة، والكرم، وطيبة القلب، والمرح، وحس الفكاهة، إلا أن من يتعامل مولودي برج الأسد قد يشعر بعنادهم، وعدم مرونتهم اتجاه الأمور الحياتية المختلفة في بعض الأحيان.
]]
ASAD = {AS1,AS2,AS3}
local SENDTEXT = ASAD[math.random(#ASAD)]
if SENDTEXT:find('اسد') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اسد')
elseif SENDTEXT:find('اسد') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اسد')
elseif SENDTEXT:find('اسد') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اسد')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'العذراء' or MsgText[1] == 'برج العذراء'  then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
AZ1 =[[
【▣】 برج العذراء

الصفات العاديه
يتميز برج العذراء بالكثير من المميزات منها الدقة والتركيز فى العمل، مما يؤهله للترقى وتولى المناصب العليا، حيث يستمرون دائمًا فى إثبات أنفسهم بشكل جيد، ويمكنهم حل المشكلات بطريقة جيدة لأنهم يمتلكون مهارات كثيرة تساعدهم فى ذلك، ومن مشاهيره ريهام حجاج، وفي إطار هذا السياق يقدم "اليوم السابع" توقعات علماء الفلك لأصحاب برج العذراء على الصعيد الصحي والمهني والعاطفي.

في العمل
عملك الجيد والدقيق ينال إعجاب رؤسائك، ويمكن أن يضاف إليك مسئوليات إضافية، وربما تترقى فى حياتك المهنية، فقط اهتم أكثر بتفاصيل وظيفتك ومهامك.

في العاطفه
تتعرض أنت وشريك حياتك لموقف يختبر قوة حبكما، لا تفقد ثقة حبيبك فيك، ويجب أن تجتاز هذا الاختبار بنجاح، حتى تضمن استمرار العلاقة بنجاح، وبالقليل من التفاهم ستكون قادرًا على التعامل مع أى موقف.

في الصحه
تفكر فى تغيير جذرى فى نظامك الغذائى، لا تدع مشغولياتك ورتابة حياتك تعطلك عن اتباع النظام الغذائى، وستفهم بالضبط ما هو مطلوب للحفاظ على صحتك الجيدة، وهو ما يمكن أن يحتاج إلى تغيير كامل في نمط حياتك.

في المستقبل
حساسيتك تجاه الآخرين وحبك لمساعدتهم تجعلك شخص محبوب، تأكد أن مجهودك سيقدره من حولك، وفى وقت شدتك ستجد الكثيرين يقفون بجانبك.
]]
AZ2 =[[
【▣】 برج العذراء

لا تتأثر بالهدايا ويصعب إرضائك بالهدايا وتكون هدية عملية ومفيدة أكتر منها رومانسية،
]]
AZ3 =[[
【▣】 برج العذراء

يولد صاحب برج العذراء في التاريخ الواقع بين 23 أغسطس إلى 22 سبتمبر، ويتبع لعنصر الأرض، أما لونه المفضل فهو الفضي، ويُحقق أفضل توافق عاطفي مع برج الحوت والسرطان، ويتصف مواليد البرج عُموماً بالولاء، والتفكير التحليلي، واللطف، والاجتهاد، والشخصيّة العمليّة، إلا أنه ومن جهة أخرى قد يكون مولود برج العذراء منتقداً للذات وللآخرين.
]]
AZRAA = {AZ1,AZ,2,AZ3}
local SENDTEXT = AZRAA[math.random(#AZRAA)]
if SENDTEXT:find('عذراء') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'عذراء')
elseif SENDTEXT:find('عذراء') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'عذراء')
elseif SENDTEXT:find('عذراء') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'عذراء')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'الميزان' or MsgText[1] == 'برج الميزان'  then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
ME1 =[[
【▣】 برج الميزان

الصفات العاديه
يقتنص الفرص ويتقدم سريعاً في العمل هذه من أهم مميزات مواليد برج الميزان، فهو دائماً ناجح، ويصل للمكانة التي يريدها بسهولة، لا يتعب من بذل مجهود مضاعف لمن يحبهم، ويجعل جميع المحيطين به في غاية السعادة بتحقيقه لرغباتهم، ومن مشاهير برج الميزان النجم عمرو دياب، وفي إطار هذا السياق يقدم "اليوم السابع" توقعات علماء الفلك لأصحاب برج الميزان على الصعيد الصحي والمهني والعاطفي.

في العمل
الحياة العملية تسير على ما يرام، انتبه لعملك بشكل أكثر جدية حتى إن كانت الأمور تبدو جيدة، كما يجب عليك أن تسعى للحصول على المزيد من الامتيازات.

في العاطفه
الحب والسعادة يكمنان داخل شخص واحد أنت تعرفه، وقد يكون بنسبة كبيرة هو الشخص المناسبة لاستكمال حياتك والعيش معه، استعد ذكرياتك وابحث في ماضيك عن هذا الشخص، فهو أيضًا قد يكون منتظرك.

في الصحه
يسيطر عليك الصداع نتيجة جلوسك أمام شاشة الكمبيوتر والهاتف المحمول لساعات طويلة، قد تكون المشكلة احتياجك لنظارة، أو يكون اجهاد وارهاق، استشر طبيب متخصص حتى لا يزيد الألم عليك.

في المستقبل
تأتي عليك بعض الأوقات يجب فيها البحث في الماضي لكي تتمكن من الوصول لما تحتاجه، كما أن مجرد تذكرك لشخص ما من الذاكرة قد يملأ قلبك سعادة، الذكريات أحياناً تكون المنقذ بالنسبة للبعض، فلا تتجاهل الإشارات والعلامات التي يرسلها لك عقلك وقلبك عند تذكرك لأحداث قديمة.
]]
ME2 =[[
【▣】 برج الميزان

تحب الشموع المعطرة والعطور والبالونات
]]
ME3 =[[
【▣】 برج الميزان

يولد صاحب برج الميزان في التاريخ الواقع بين 23 سبتمبر إلى 22 أكتوبر، ويتبع لعنصر الهواء، ولونه المفضل هو اللون الأزرق، ويُحقق انسجاماً مع برجي الحمل والقوس، ويتصف مواليد البرج عُموماً بالتعاون، والأسلوب اللبق، والكرم، والعدل، وامتلاك شخصيّة اجتماعيّة، ومن جهة أخرى قد يعاني مولود برج الميزان من التردد، وتجنّب المواجهات في بعض الأحيان.
]]
MEZAN = {ME1,ME2,ME3}
local SENDTEXT = MEZAN[math.random(#MEZAN)]
if SENDTEXT:find('ميزان') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ميزان')
elseif SENDTEXT:find('ميزان') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'مبزان')
elseif SENDTEXT:find('ميزان') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ميزان')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'العقرب' or MsgText[1] == 'برج العقرب'  then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
AG1 =[[
【▣】 برج العقرب

الصفات العاديه
يمتلك مولود برج العقرب الطموح الكبير، كما أنه يحب التنافس لتحقيق طموحاته، ويتميز بالوفاء وقدرته على تحمل المسئولية، كما يكره الكذب ويحب الوضوح والصراحة، فهو مستعدون لقول الحقيقة حتى لو كانت قاسية، ومن مشاهيره بيل جيتس، وفي إطار هذا السياق يقدم "اليوم السابع" توقعات علماء الفلك لأصحاب برج العقرب على الصعيد الصحي والمهني والعاطفي.

في العمل
ركز على خطواتك التالية خاصة أنك فى بداية حياتك المهنية، وسوف تكلفك أى أخطاء في مهام عملك الكثير من العواقب في وقت لاحق، لذلك خذ بعض الوقت لاتخاذ القرارات لنفسك، وقد تحصل على بعض المال من ميراثك.

في العاطفه
مفاجأة تحصل عليها من شريك حياتك، سيكون هذا هو الوقت المثالى لإعادة اكتشاف حبكما لبعضكما البعض، وتخلى عن تفكيرك فى المشاكل البسيطة التى تعرضتما لها، واستمتع باللحظات الجيدة.

في الصحه
بعض التغييرات المعتدلة في نمط حياتك يمكن أن تساعدك على عيش حياة أكثر صحة وسعادة، اتخذ قرارًا بالتخلي عن العادات الضارة بصحتك وستجد القوة للالتزام بها، وستبدأ في الاستمتاع بثمار هذه التغييرات في كل من جسدك وسلوكك.

في المستقبل
تحتاج إلى الوفاء ببعض الالتزامات العائلية، ستعمل على تقوية مهاراتك هذا الأسبوع لمواجهة التحديات الجديدة فى حياتك، ومن المحتمل أن تكون المرحلة صعبة، لكنك ستستمتع بكل لحظة فيها.
]]
AG2 =[[
【▣】 برج العقرب


تحب الأحلام والقصص الخيالية أكثر برج يتمسك بشريكه ومحبوبه.
]]
AG3 =[[
【▣】 برج العقرب

يولد صاحب برج العقرب في التاريخ الواقع بين 23 أكتوبر إلى 21 نوفمبر، ويتبع لعنصر الماء، ولونه المفضّل هو الأسود، ويُحقق توافقاً وانسجاماً مع برج الثور والسرطان، ويتصف مواليد البرج عُموماً بسعة الحيلة، والشجاعة، والولاء والوفاء للأصدقاء، والعاطفة، إلا أنّهم قد يكونوا غيورين، ويجدون صعوبة في الثقة بالآخرين، ما يجعلهم يميلون للكتمان في بعض الأحيان.
]]
AGRAB = {AG1,AG2,AG3}
local SENDTEXT = AGRAB[math.random(#AGRAB)]
if SENDTEXT:find('عقرب') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'عقرب')
elseif SENDTEXT:find('عقرب') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'عقرب')
elseif SENDTEXT:find('عقرب') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'عقرب')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'القوس' or MsgText[1] == 'برج القوس'  then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
CO1 =[[
【▣】 برج القوس

الصفات العاديه
قد يبدو عابساً طوال الوقت، لكنه يمتلك أصفى ابتسامة قد تراها من أحد، فيعتبر مواليد برج القوس من الشخصيات التي لا تثق بالمحيطين بها سريعاً، لا تأخذ حذرها طوال الوقت، مما يجعلها تبدو عابسة وجادة، لكنها تمتلك قلباً لا مثيل له، ومن مشاهير برج القوس النجمة علا غانم، وفي إطار هذا السياق يقدم "اليوم السابع" توقعات علماء الفلك لأصحاب برج القوس على الصعيد الصحي والمهني والعاطفي.

في العمل
العمل الذي تؤجله منذ فترة طويلة قد آن الأوان لإتمامه، تعطيل المهام وعدم إنجازها في وقتها قد يسبب لك العديد من المشكلات، فكن حريصاً على عملك، وكن ودوداً مع زملائك حتى تكتسب ثقتهم وتضمن مساعدتهم لك.

في العاطفه
الحياة العاطفية قد تبدو هادئة بالنسبة لك، لكن أحذر أن يكون هذا الهدوء الذي يسبق العاصفة، المشكلات التي حدثت بينك وبين الحبيب منذ فترة ولم تحل، لابد من إيجاد مبررات لها وحلها قريباً.

في الصحه
تناولك للغذاء الصحي والمحافظة على لياقتك يجعلك في أفضل حال، لا تستسلم لإراء أصدقائك لك بتناول طعام غير صحي، وتكسر قاعدة حياتك في تناول الطعام الصحي.

في المستقبل
الكثير من الجهد والتعب والاجتهاد في العمل هو المطلوب خلال الفترة المقبلة لكي تستعيد مكانتك بين زملائك، فلا تتكاسل واجتهد.
]]
CO2 =[[
【▣】 برج القوس


ستكون محظوظ خلال شهر فبراير
]]
CO3 =[[
【▣】 برج القوس

يولد صاحب برج القوس في التاريخ الواقع بين 22 نوفمبر إلى 21 ديسمبر، ويتبع لعنصر النار، ولونه المفضّل هو الأزرق، ويُحقق أفضل توافق مع برج الحمل والجوزاء، ويتصف مواليد البرج عُموماً بالكرم، والسعي للمثاليّة، وحس الدُعابة، إلا أنهم قد يتصفون بقلّة الصبر، وتقديم الكثير من الوعود في بعض الأحيان.
]]
COSS = {CO1,CO2,CO3}
local SENDTEXT = COSS[math.random(#COSS)]
if SENDTEXT:find('قوس') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'قوس')
elseif SENDTEXT:find('قوس') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'قوس')
elseif SENDTEXT:find('قوس') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'قوس')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'الجدي' or MsgText[1] == 'برج الجدي' or MsgText[1] == 'الجدى' or MsgText[1] == 'برج الجدى' then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
GAA1 =[[
【▣】 برج الجدي

الصفات العاديه
يعتبر مولود برج الجدي من الشخصيات التي تفرض نفسها بمجرد ظهورها في أي مكان، يحب الأصدقاء ويسعى لسعادة أسرته، ومن مشاهير برج الجدي المطربة أنغام، وفي إطار هذا السياق يقدم "اليوم السابع" توقعات علماء الفلك لأصحاب برج الجدي على الصعيد الصحي والمهني والعاطفي.

في العمل
تجد ذاتك في العمل، ولكنك تكره العمل الجماعي لما قد يحتويه من تطفل وصراعات، إذا كنت تعمل مع عدة أشخاص عليك تجنب الصراعات والحروب التي قد يوقعوك فيها.

في العاطفه
لازلت في حالة تردد لتحديد ما تريده فعلا في حياتك العاطفية، من يحبك بصدق أنت تعرفه جيداً لكنك تبحث عن المشكلات في علاقات مرهقة، رغم أن من يحبك حقاً أمامك، لذا أعط له فرصة للتقرب منك.

في الصحه
التعب والاجهاد يظهران على وجهك طوال الوقت، فأنت تحتاج للنوم بعدد ساعات كافية حتى تستعيد قوتك وإشراقتك من جديد.

في المستقبل
حالة التردد التي تسيطر عليك منذ فترة ستنتهي إذا قمت بتحديد ما تريده من الطرف الآخر لكي تنعم بحياة هادئة مليئة بالحب والمودة، على أن يكون الحب والاهتمام متبادل بينك وبينك حبيبك.
]]
GAA2 =[[
【▣】 برج الجدي

 لا تتوقع الكثير من شركاءه.
]]
GAA3 =[[
【▣】 برج الجدي

ينتمي مولود برج الجدي إلى الفترة الواقعة ما بين 22 ديسمبر إلى 19 يناير، ويتبع لعنصر الأرض، ولونه المفضل هو الأزرق، وأرقام الحظ بالنسبة له هي: 4، 8، 13، 22، ويُحقق أفضل توافق مع برجي الثور والسرطان، ويتصف مواليد البرج عُموماً بالقدرة على تحمّل المسؤوليّة، والانضباط، والتحكّم بالنفس، وقدرات إداريّة قويّة، إلا أنهم قد يعانون من السلبية والتشاؤم في بعض الأحيان.
]]
GAADEY = {GAA1,GAA2,GAA3}
local SENDTEXT = GAADEY[math.random(#GAADEY)]
if SENDTEXT:find('جدي') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'جدي')
elseif SENDTEXT:find('جدى') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'جدى')
elseif SENDTEXT:find('جدئ') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'جدئ')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'الدلو' or MsgText[1] == 'برج الدلو'  then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
DA1 =[[
【▣】 برج الدلو

الصفات العاديه
يتمتع مولود برج الدلو بشخصية جذابة، فهو شخص هادىء ومخطط جيد ومتأنى في اتخاذ القرارات، لكنه متمسك بآرائه ولا يقبل فيها مناقشة، ويحب فعل الخير، كما يتميز بالكرم والاخلاص لشريك حياته، وأيضًا هو صديق وفى، لكن يعيبه العند الزائد عندما يشعر أنه على صواب، ومن مشاهير برج الدلو الفنانة سعاد حسنى، وفي إطار هذا السياق يقدم "اليوم السابع" توقعات علماء الفلك لأصحاب برج الدلو على الصعيد الصحي والمهني والعاطفي.

في العمل
تشعر بتقدير كبير داخل مؤسستك بعد زيادة راتبك، وهو ما انعكس على معنوياتك وجعلك تقدم أفضل ما لديك، فحاول أن تثبت نفسك وأحقيتك في الحصول على هذا التقدير، والذي قد يكون بداية لإعادة النظر إلى مجهودك خلال السنوات الأخيرة وحصولك على ترقية.

في العاطفه
تعيش حياة مستقرة تمامًا مع شريك حياتك، وتجمعكما حالة من التفاهم والاحترام المتبادل والحب، فحاول أن تحافظ على هذا الاستقرار، ولا تسمح للآخرين بتدمير هذه العلاقة، كما يمكنك اليوم تقديم لمحات رومانسية لحبيبك وسيكون لها أثرًا إيجابيًا على يومكما.

في الصحه
تعانى من آلام مستمرة في الأذن والتى تسبب لك صداع مستمر، لذا قم بزيارة الطبيب لفحصك ومنحك العلاج اللازم حتى لا تتفاقم الأمور، فربما تعانى من إلتهابات أو ما شابه ذلك.

في المستقبل
يتوقع علماء الفلك لك خلال الفترة القادمة، فرصة جيدة لتطوير نفسك واكتساب مهارات جديدة من خلال بعض الدورات التى ستحصل عليها داخل شركتك، فحاول تحقيق أقصى استفادة منها.
]]
DA2 =[[
【▣】 برج الدلو

تبحث عن الهدايا التي تغذي روحك .
]]
DA3 =[[
【▣】 برج الدلو

يولد صاحب برج الدلو في التاريخ الواقع بين 20 يناير إلى 18 فبراير، ويتبع لعنصر الهواء، ولونه المفضّل هو الأزرق والوردي، ويُحقق توافقاً مع برجي الأسد والقوس، ويتصف مواليد البرج عُموماً بالتفكير بالمستقبل، وحس الإنسانيّة العالي، والإبداع، والاستقلاليّة، ومن ناحية أخرى قد يعاني مولود برج الدلو من تقلب المزاج، والانعزال، والعناد أحياناً.
]]
DALEW = {DA1,DA2,DA3}
local SENDTEXT = DALEW[math.random(#DALEW)]
if SENDTEXT:find('دلو') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'دلو')
elseif SENDTEXT:find('دلو') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'دلو')
elseif SENDTEXT:find('دلو') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'دلو')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'الحوت' or MsgText[1] == 'برج الحوت'  then
redis:set(black.."GAME:S"..msg.chat_id_,true) 
HO1 =[[
【▣】 برج الحوت

الصفات العاديه
يتصف مواليد برج الحوت بالغموض فى الكثير من الأحيان، فهم دائمًا ما يتصرفون بشكل غير متوقع، ويميزهم عدم التسرع، خاصة قبل إتخاذ أى قرار، ويفضلون الحياة البسيطة غير المتكلفة ولذلك يبتعدون كثيرًا عن المظاهر، ومن مشاهيره سيرين عبد النور، ويقدم "اليوم السابع" لمولود برج الحوت توقعات الأبراج وحظك اليوم على الصعيد المهني والعاطفي والصحي.

في العمل
يوم جيد لتحقيق مكاسب فى العمل، حافظ على تواصلك مع زملائك، ربما يكون أسبوع جيد لبدء مشروع جديد، فقط تذكر مهاراتك التنظيمية وابتعد عن الفوضى.

في العاطفه
حاول قضاء بعض الوقت مع والديك، فهذا هو أفضل وقت للاتصال بهم وتنظيم زيارة عائلية لهم، وسيخفف ذلك من إجهادك إلى حد كبير، وأشرك شريك حياتك في زيارة والديك أو أشقائك، وستقضى وقتًا مميزًا، وإذا كنت عازبًا يمكنك مقابلة شخص مميز من خلال والديك اليوم.

في الصحه
قدرتك على التفكير المنطقى اليوم غير جيدة، لذلك لا تتخذ قرارات مصيرية، وربما تؤثر صحتك الجسدية على صحتك العقلية، حاول الاهتمام بصحتك وتناول الخضروات والفاكهة بكثرة وحاول الاسترخاء لبعض الوقت.

في المستقبل
إقناع من حولك بوجهة نظرك، وستكون قادرًا على تقديم حل مبتكر لبعض المشاكل الرئيسية في مكان عملك أو لأحد أصدقائك، إنه وقت مثير بالنسبة لك، وسوف يلجأ الناس إليك للحصول على المساعدة والدعم.
]]
HO2 =[[
【▣】 برج الحوت

تحب الهدايا الملموسة .
]]
HO3 =[[
【▣】 برج الحوت

يولد صاحب برج الحوت في التاريخ الواقع بين 19 فبراير إلى 20 مارس، ويتبع لعنصر الماء، ولونه المفضل هو الأخضر، ويُحقق توافقاً وانسجاماً مع برجي العذراء والثور،[٢٥] ويتصف عُموماً بالعاطفة القويّة، والتعاطُف، والإيثار، والحس الفني العالي، والقدرة على مُعالجة عواطف الآخرين، في حين قد يكون مواليد هذ البرج مزاجين، ويفكرون بسلبية.
]]
HOOT = {HO1,HO2,HO3}
local SENDTEXT = HOOT[math.random(#HOOT)]
if SENDTEXT:find('حوت') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حوت')
elseif SENDTEXT:find('حوت') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حوت')
elseif SENDTEXT:find('حوت') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حوت')
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'المختلف' then
katu = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','✨','⛈','??','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧜‍♂','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕓','🕤','⌛️','📅',
};
name = katu[math.random(#katu)]
redis:set(black..':Set_alii:'..msg.chat_id_,name)
name = string.gsub(name,'😸','😹😹😹😹😹😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠','💀💀💀💀💀💀💀☠💀💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼👻👻👻👻👻')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟')
name = string.gsub(name,'✨','💫💫💫💫💫✨💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃☃☃☃☃☃⛄️☃☃☃☃')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀','🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂')
name = string.gsub(name,'🧜‍♂','🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♂🧜‍♀🧜‍♀🧜‍♀')
name = string.gsub(name,'🧝‍♂','🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀')
name = string.gsub(name,'🙍‍♂','🙎‍♂🙎‍♂🙎‍♂🙎‍♂🙎‍♂🙍‍♂🙎‍♂🙎‍♂🙎‍♂')
name = string.gsub(name,'🧖‍♂','🧖‍♀🧖‍♀🧖‍♀🧖‍♀🧖‍♀🧖‍♂🧖‍♀🧖‍♀🧖‍♀🧖‍♀')
name = string.gsub(name,'👬','👭👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕓','🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📆📅📆📆')
return '  اول واحد يطلع المختلف » {* '..name..' * } ' 
end

if MsgText[1] == 'امثله' then
katu = {
'حامض','غنيله','جاره','زرع','شقره','السواهي','الموجود','نخله','الشبل','القرد','سبقني','قلة','موت','فلوس','تغني','مجانا','السرج','اقرد','التهايم','عسفان'
};
name = katu[math.random(#katu)]
redis:set(black..':Set_Amthlh:'..msg.chat_id_,name)
name = string.gsub(name,'حامض','اللي مايطول العنب ...... عنه يقول')
name = string.gsub(name,'غنيله','ابعد عن الشر و ......')
name = string.gsub(name,'جاره','الكلام لك يا....... واسمعي يا كنة')
name = string.gsub(name,'زرع',' من جد وجد ومن ..... حصد')
name = string.gsub(name,'شقره','مع الخيل يا....')
name = string.gsub(name,'نخله','الطول طول.......والعقل عقل الصخلة')
name = string.gsub(name,'الموجود','الجود من ......')
name = string.gsub(name,'الشبل','هذا ...... من ذاك الاسد')
name = string.gsub(name,'القرد','...... في عين امه غزال')
name = string.gsub(name,'سبقني','ضربني وبكى و ..... واشتكى')
name = string.gsub(name,'موت','سائدوني سائدوني انا في .....')
name = string.gsub(name,'قلة','الضحك بدون سبب ..... ادب')
name = string.gsub(name,'فلوس','شنب ماتحته ..... يحتاج له موس')
name = string.gsub(name,'تغني','عاشر المصلي بتصلي , وعاشر المغني ب......')
name = string.gsub(name,'مجانا','حسبناهم رخاص طلعو .......')
name = string.gsub(name,'السرج','ياشين ال....... على البقر')
name = string.gsub(name,'اقرد','ارضي بقردك لا يجيك ...... منه')
name = string.gsub(name,'التهايم','تجيك ...... وانت نايم')
name = string.gsub(name,'السواهي','ياما تحت ..... دواهي')
name = string.gsub(name,'عسفان','ما اخس من ....... الا قديد')
return 'اكمل المثل التالي {* '..name..' *}'
end

if MsgText[1] == 'حزوره' then
katu = {'امي','انا','المخده','الهواء','الهواء','القمر','الباب المفتوح','النهر','الكف','الغيم','اسمك','حرف الام','الابجديه','الدائره','الساعه','تموز','الصمت','السلحفات','كم الساعه','شجره العائله','ضفدع','خليه النحل','الصوت','الجوع','الكتاب','البيض','الاسفنجه','البرتقال','الكفن','الساعه','ارجل المنضده','البصل','الوقت','النار','الثلج','العمر','المسمار','الحفره','المشط','التلفون','الجرص','المراه','الغداء','الفيل','الصدئ','الهواء','عقرب الساعه'};
name = katu[math.random(#katu)]
redis:set(black..':Set_Hzorh:'..msg.chat_id_,name)
name = string.gsub(name,'امي','اخت خالك ومو خالتك منو')
name = string.gsub(name,'انا','بنت امك وابنت ابوك ومش اختك ولاخوك منو')
name = string.gsub(name,'المخده','اني خفيفه واني لطيفه اكوم من حضن الوزير اكعد بحضن الخليفه أزيح الهموم  واخلي لحبيب نايم منو انني')
name = string.gsub(name,'الهواء','ماهو الشيء الذي يسير امامك ولا تراه')
name = string.gsub(name,'القمر','ماهو الشيء الذي يحيا اول الشهر ويموت في اخره')
name = string.gsub(name,'الباب المفتوح','ماهو الباب الذي لا يمكن فتحه')
name = string.gsub(name,'النهر','ماهو الشي الذي يجري ولا يمشي')
name = string.gsub(name,'الكف','ماهو الشي الذي لو خمس اصابع دون لحم او عضم')
name = string.gsub(name,'الغيم','ماهو الشي الذي يمشي بلا رجلين ويبكي بلا عينين')
name = string.gsub(name,'اسمك','ماهو الشيء الذي لك ويستخدمه الناس من دون اذنك')
name = string.gsub(name,'حرف الام','ماهو الشيء الذي تراه في الليل ثلاث مرات والنهار مره واحده')
name = string.gsub(name,'الابجديه','كلمه تتكون من 8 احرف لكنها تجمع كل الحروف')
name = string.gsub(name,'الدائره','ماهو الشيء الذي ليس له بدايه وليس له نهايه')
name = string.gsub(name,'الساعه','ماهو الشيء الذي لا يتكلم واذا اكل صدق واذا جاع كذب')
name = string.gsub(name,'تموز','ماهو اسم الشهر الميلادي الذي اذا حذفت اوله تحول الى فاكهه')
name = string.gsub(name,'الصمت','ماهي الكلمه الذي يبطل معناها اذا نطقت بها ')
name = string.gsub(name,'السلحفات','ماهو الذي لحمهه من الداخل وعضمهه من الخارج ')
name = string.gsub(name,'كم الساعه','ماهوه السوال الذي تختلف اجابته دائماً')
name = string.gsub(name,'شجره العائله','ما اسم الشجره التي ليس لها ضل ولا لها ثمار ')
name = string.gsub(name,'الضفدع','ماهو الحيوان الذي لسانه طويل وجسمه صغير')
name = string.gsub(name,'خليه النحل','ماهو الشيء الذي يتسع مئاات الالوف ولا يتسع طير منتوف')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا ب الاذنين؟؟')
name = string.gsub(name,'الجوع','ماهو الشيء الذي يقرصك ولا تراه')
name = string.gsub(name,'الكتاب','له اوراق وماهو بنبات . له جلد وماهو بحيوان . وعلم وماهو ب انسان من هو')
name = string.gsub(name,'البيض','ماهو الشي الذي اسمه علئ لونه')
name = string.gsub(name,'الاسفنجه','كلي ثقوب ومع ذالك احفظ الماء فمن انا ')
name = string.gsub(name,'البرتقال','ماهو الشيء نرميه بعد العصر')
name = string.gsub(name,'الكفن','ماهو الشيء لاتحب ان تلبسة وان لبستة لاترة')
name = string.gsub(name,'الساعه','ماهو الشيء الذي يمشي ويقف وليس له ارجل')
name = string.gsub(name,'ارجل المنضده','اننا اربعة اخوه ولنا راس واحد فمن نحن')
name = string.gsub(name,'البصل','شيء تذبحه وتبكي عليه؟')
name = string.gsub(name,'الوقت','يذهب ولا يرجع')
name = string.gsub(name,'النار','شيء ياكل ولايشبع وان شرب الماء مات')
name = string.gsub(name,'الثلج','شيء مصنوع من الماء. وان عاش في الماء يموت')
name = string.gsub(name,'العمر','ماهو الشيء الذي كلما زاد نقص')
name = string.gsub(name,'المسمار','ماهو الشيء الذي لا يمشي الا ب الضرب')
name = string.gsub(name,'الحفره','ماهو الشيء الذي كلما اخذنا منهه زاد وكبر')
name = string.gsub(name,'المشط','له اسنان ولا يعض ماهو ')
name = string.gsub(name,'التلفون','يسمع بلا اذن ويحكي بلا لسان فما هو')
name = string.gsub(name,'الجرص','ماهو الشيء الذي اذا لمستهه صاح')
name = string.gsub(name,'المراه','ارى كل شيء من دون عيون فمن اكون')
name = string.gsub(name,'الغداء','ماهو الشيء الذي لايؤكل في الليل ')
name = string.gsub(name,'الفيل','من هوه الحيوان الذي يحك اذنه في انفه')
name = string.gsub(name,'الصدئ','ماهو الشيء الذي يتكلم جميع اللغات ')
name = string.gsub(name,'الهواء','شيء بيني وبينك لا تراه عينك ولا عيني فما هوه')
name = string.gsub(name,'عقرب الساعه','هناك عقرب لا يلدغ ولا يخاف منه الاطفال فما هوه')
return '  اول واحد يحلها » {* '..name..' *} ' 
end


if MsgText[1] == 'كت تويت' or MsgText[1] == 'تويت' then
katu = {" دحوو1م "," دحوو2م "," دحوو3م "," دحوو4م "," دحوو5م "," دحوو6م "," دحوو7م "," دحوو8م "," دحوو9م "," دحوو10م "," دحوو11م "," دحوو12م "," دحوو13م "," دحوو14م "," دحوو15م "," دحوو16م "," دحوو17م "," دحوو18م "," دحوو19م "," دحوو20م "," دحوو21م "," دحوو22م "," دحوو23م "," دحوو24م "," دحوو25م "," دحوو26م "," دحوو27م "," دحوو28م "," دحوو29م "," دحوو30م "," دحوو31م "," دحوو32م "," دحوو33م "," دحوو34م "," دحوو35م "," دحوو36م "," دحوو37م "," دحوو38م "," دحوو39م "," دحوو40م "," دحوو41م "," دحوو42م "," دحوو43م "," دحوو44م "," دحوو45م "," دحوو46م "," دحوو47م "," دحوو48م "," دحوو49م "," دحوو50م "," دحوو51م "," دحوو52م "," دحوو53م "," دحوو54م "," دحوو55م "}
katu = {" دحوو1م "," دحوو2م "," دحوو3م "," دحوو4م "," دحوو5م "," دحوو6م "," دحوو7م "," دحوو8م "," دحوو9م "," دحوو10م "," دحوو11م "," دحوو12م "," دحوو13م "," دحوو14م "," دحوو15م "," دحوو16م "," دحوو17م "," دحوو18م "," دحوو19م "," دحوو20م "," دحوو21م "," دحوو22م "," دحوو23م "," دحوو24م "," دحوو25م "," دحوو26م "," دحوو27م "," دحوو28م "," دحوو29م "," دحوو30م "," دحوو31م "," دحوو32م "," دحوو33م "," دحوو34م "," دحوو35م "," دحوو36م "," دحوو37م "," دحوو38م "," دحوو39م "," دحوو40م "," دحوو41م "," دحوو42م "," دحوو43م "," دحوو44م "," دحوو45م "," دحوو46م "," دحوو47م "," دحوو48م "," دحوو49م "," دحوو50م "," دحوو51م "," دحوو52م "," دحوو53م "," دحوو54م "," دحوو55م "," دحوو56م "," دحوو57م "," دحوو58م "," دحوو59م "," دحوو60م "," دحوو61م "," دحوو62م "," دحوو63م "," دحوو64م "," دحوو65م "," دحوو66م "," دحوو67م "," دحوو68م "," دحوو69م "," دحوو70م "," دحوو71م "," دحوو72م "," دحوو73م "," دحوو74م "," دحوو75م "," دحوو76م "," دحوو77م "," دحوو78م "," دحوو79م "," دحوو80م "," دحوو81م "," دحوو82م "," دحوو83م "," دحوو84م "," دحوو85م "," دحوو86م "," دحوو87م "," دحوو88م "," دحوو89م "," دحوو90م "," دحوو91م "," دحوو92م "," دحوو93م "," دحوو94م "," دحوو95م "," دحوو96م "," دحوو97م "," دحوو98م "," دحوو99م "," دحوو100م "," دحوو101م "," دحوو102م "," دحوو103م "," دحوو104م "," دحوو105م "," دحوو106م "," دحوو107م "," دحوو108م "," دحوو109م "," دحوو110م "," دحوو111م "," دحوو112م "," دحوو113م "," دحوو114م "," دحوو115م "," دحوو116م "," دحوو117م "," دحوو118م "," دحوو119م "," دحوو120م "," دحوو121م "," دحوو121م "," دحوو122م "}
name = katu[math.random(#katu)]
redis:set(black..':Set_twet:'..msg.chat_id_,name)
name = string.gsub(name," دحوو1م "," نسبة رضاك عن الأشخاص من حولك هالفترة ؟ ")
name = string.gsub(name," دحوو2م "," ما السيء في هذه الحياة ؟ ")
name = string.gsub(name," دحوو3م ","الفلوس او الحب ؟")
name = string.gsub(name," دحوو4م "," أجمل شيء حصل معك خلال هذا الاسبوع ؟ ")
name = string.gsub(name," دحوو5م "," سؤال ينرفزك ؟ ")
name = string.gsub(name," دحوو6م "," كم في حسابك البنكي ؟ ")
name = string.gsub(name," دحوو7م ","اكثر ممثل تحبه ؟ ")
name = string.gsub(name," دحوو8م "," قد تخيلت شي في بالك وصار ؟ ")
name = string.gsub(name," دحوو9م "," كلمة لشخص أسعدك رغم حزنك في يومٍ من الأيام ؟ ")
name = string.gsub(name," دحوو10م "," شيء عندك اهم من الناس ؟ ")
name = string.gsub(name," دحوو11م "," اول ولد لك وش راح تسميه ؟ ")
name = string.gsub(name," دحوو12م "," تفضّل النقاش الطويل او تحب الاختصار ؟ ")
name = string.gsub(name," دحوو13م "," وش أخر شي ضيعته؟ ")
name = string.gsub(name," دحوو14م "," عادي تتزوج من برا القبيلة؟ ")
name = string.gsub(name," دحوو15م "," كم مره حبيت؟ ")
name = string.gsub(name," دحوو16م ","تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب؟")
name = string.gsub(name," دحوو17م ","لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟")
name = string.gsub(name," دحوو18م ","قلبي على قلبك مهما صار لمين تقولها؟")
name = string.gsub(name," دحوو19م ","اكثر المتابعين عندك باي برنامج؟")
name = string.gsub(name," دحوو20م ","نسبة النعاس عندك حاليًا؟")
name = string.gsub(name," دحوو21م ","نسبه الندم عندك للي وثقت فيهم ؟")
name = string.gsub(name," دحوو22م ","وش اسم اول شخص تعرفت عليه فالتلقرام ؟")
name = string.gsub(name," دحوو23م ","جربت شعور احد يحبك بس انت مو قادر تحبه؟")
name = string.gsub(name," دحوو24م ","تجامل الناس ولا اللي بقلبك على لسانك؟")
name = string.gsub(name," دحوو25م ","عمرك ضحيت باشياء لاجل شخص م يسوى ؟")
name = string.gsub(name," دحوو26م "," مغني تلاحظ أن صوته يعجب الجميع إلا أنت؟ ")
name = string.gsub(name," دحوو27م ","آخر غلطات عمرك؟ ")
name = string.gsub(name," دحوو28م ","مسلسل كرتوني له ذكريات جميلة عندك؟ ")
name = string.gsub(name," دحوو29م ","ما أكثر تطبيق تقضي وقتك عليه؟ ")
name = string.gsub(name," دحوو30م ","أول شيء يخطر في بالك إذا سمعت كلمة نجوم ؟ ")
name = string.gsub(name," دحوو31م ","قدوتك من الأجيال السابقة؟ ")
name = string.gsub(name," دحوو32م ","أكثر طبع تهتم بأن يتواجد في شريك/ة حياتك؟ ")
name = string.gsub(name," دحوو33م "," أكثر حيوان تخاف منه؟ ")
name = string.gsub(name," دحوو34م ","ما هي طريقتك في الحصول على الراحة النفسية؟ ")
name = string.gsub(name," دحوو35م ","إيموجي يعبّر عن مزاجك الحالي؟ ")
name = string.gsub(name," دحوو36م ","أكثر تغيير ترغب أن تغيّره في نفسك؟ ")
name = string.gsub(name," دحوو37م "," أكثر شيء أسعدك اليوم؟ ")
name = string.gsub(name," دحوو38م "," بماذا يتعافى المرء؟ ")
name = string.gsub(name," دحوو39م "," ما هو أفضل حافز للشخص؟ ")
name = string.gsub(name," دحوو40م "," ما الذي يشغل بالك في الفترة الحالية؟")
name = string.gsub(name," دحوو41م "," آخر شيء ندمت عليه؟ ")
name = string.gsub(name," دحوو42م "," شاركنا صورة احترافية من تصويرك؟ ")
name = string.gsub(name," دحوو43م "," تتابع انمي؟ إذا نعم ما أفضل انمي شاهدته ")
name = string.gsub(name," دحوو44م "," يرد عليك متأخر على رسالة مهمة وبكل برود، موقفك؟ ")
name = string.gsub(name," دحوو45م "," نصيحه تبدا ب -لا- ؟ ")
name = string.gsub(name," دحوو46م "," كتاب أو رواية تقرأها هذه الأيام؟ ")
name = string.gsub(name," دحوو47م "," فيلم عالق في ذهنك لا تنساه مِن روعته؟ ")
name = string.gsub(name," دحوو48م "," يوم لا يمكنك نسيانه؟ ")
name = string.gsub(name," دحوو49م "," شعورك الحالي في جملة؟ ")
name = string.gsub(name," دحوو50م "," أكثر سبب منطقي يمكن أن يجعلك تقرر الإبتعاد عن الشخص الذي تُحب؟ ")
name = string.gsub(name," دحوو51م "," كلمة لشخص بعيد؟ ")
name = string.gsub(name," دحوو52م "," صفة يطلقها عليك الشخص المفضّل؟ ")
name = string.gsub(name," دحوو53م "," أغنية عالقة في ذهنك هاليومين؟ ")
name = string.gsub(name," دحوو54م "," أكلة مستحيل أن تأكلها؟ ")
name = string.gsub(name," دحوو55م "," كيف قضيت نهارك؟ ")
name = string.gsub(name," دحوو56م "," تصرُّف ماتتحمله؟ ")
name = string.gsub(name," دحوو57م "," صفة يطلقها عليك من حولك بكثرة؟ ")
name = string.gsub(name," دحوو58م "," اسوء صفه فيك وتجاهد على تغييرها؟ ")
name = string.gsub(name," دحوو59م "," شاركنا أقوى بيت شِعر من تأليفك؟ ")
name = string.gsub(name," دحوو60م "," ماذا لو عاد معتذراً؟ ")
name = string.gsub(name," دحوو61م "," تقطع علاقتك بالشخص إذا عرفت إنه...؟ ")
name = string.gsub(name," دحوو62م "," كلام ودك يوصل للشخص المطلوب ؟ ")
name = string.gsub(name," دحوو63م "," ردة فعلك لمن يتجاهلك بالرد متعمد؟ ")
name = string.gsub(name," دحوو64م "," كم نسبة البيتوتية في شخصيتك؟ ")
name = string.gsub(name," دحوو65م "," متى تحس أنك فعلًا أنسان صبور جدًا ؟ ")
name = string.gsub(name," دحوو66م "," هل أنت من النوع الذي يواجه المشاكل أو من النوع الذي يهرب ؟ ")
name = string.gsub(name," دحوو67م "," أمنية كنت تتمناها وحققتها ؟ ")
name = string.gsub(name," دحوو68م "," تملك وسواس من شيء معين ؟ ")
name = string.gsub(name," دحوو69م "," عمرك انتقمت من أحد ؟! ")
name = string.gsub(name," دحوو70م "," متى تقرر تنسحب من أي علاقة ؟ ")
name = string.gsub(name," دحوو71م "," كلمتين تكررها دايم ؟! ")
name = string.gsub(name," دحوو72م "," افضل هديه ممكن تناسبك؟ ")
name = string.gsub(name," دحوو73م "," انت حزين اول شخص تتصل عليه؟ ")
name = string.gsub(name," دحوو74م "," موقف خلاك تحس انك مكسور ؟ ")
name = string.gsub(name," دحوو75م "," ماذا لو كانت مشاعر البشر مرئية ؟ ")
name = string.gsub(name," دحوو76م "," كم تشوف انك تستحق فرصه؟ ")
name = string.gsub(name," دحوو77م "," يهمك ظن الناس فيك ولا ؟ ")
name = string.gsub(name," دحوو78م "," اغنية عندك معاها ذكريات ")
name = string.gsub(name," دحوو79م "," موقف غير حياتك؟ ")
name = string.gsub(name," دحوو80م "," اكثر مشروب تحبه؟ ")
name = string.gsub(name," دحوو81م "," القصيدة اللي تأثر فيك؟ ")
name = string.gsub(name," دحوو82م "," متى يصبح الصديق غريب ")
name = string.gsub(name," دحوو83م "," هل وصلك رسالة غير متوقعة من شخص وأثرت فيك ؟ ")
name = string.gsub(name," دحوو84م "," وين نلقى السعاده برايك؟ ")
name = string.gsub(name," دحوو85م "," تاريخ ميلادك؟ ")
name = string.gsub(name," دحوو86م "," قهوه و لا شاي؟ ")
name = string.gsub(name," دحوو87م "," من محبّين الليل أو الصبح؟ ")
name = string.gsub(name," دحوو88م "," حيوانك المفضل؟ ")
name = string.gsub(name," دحوو89م "," كلمة غريبة ومعناها؟ ")
name = string.gsub(name," دحوو90م "," هل التعود على شخص والتحدث معه بشكل يومي يعتبر نوع من أنواع الحب؟ ")
name = string.gsub(name," دحوو91م "," كم تحتاج من وقت لتثق بشخص؟ ")
name = string.gsub(name," دحوو92م "," اشياء نفسك تجربها؟ ")
name = string.gsub(name," دحوو93م "," يومك ضاع على؟ ")
name = string.gsub(name," دحوو94م "," كل شيء يهون الا ؟ ")
name = string.gsub(name," دحوو95م "," اسم ماتحبه ؟ ")
name = string.gsub(name," دحوو96م "," وقفة إحترام للي إخترع ؟ ")
name = string.gsub(name," دحوو97م "," أقدم شيء محتفظ فيه من صغرك؟ ")
name = string.gsub(name," دحوو98م "," كلمات ماتستغني عنها بسوالفك؟ ")
name = string.gsub(name," دحوو99م "," وش الحب بنظرك؟ ")
name = string.gsub(name," دحوو100م "," حب التملك في شخصِيـتك ولا ؟ ")
name = string.gsub(name," دحوو101م "," تخطط للمستقبل ولا ؟ ")
name = string.gsub(name," دحوو102م "," موقف محرج ماتنساه ؟ ")
name = string.gsub(name," دحوو103م "," من طلاسم لهجتكم ؟ ")
name = string.gsub(name," دحوو104م "," اعترف باي حاجه ؟ ")
name = string.gsub(name," دحوو105م "," عبّر عن مودك بصوره ؟ ")
name = string.gsub(name," دحوو106م "," اسم دايم ع بالك ؟ ")
name = string.gsub(name," دحوو107م "," اشياء تفتخر انك م سويتها ؟ ")
name = string.gsub(name," دحوو108م ","  لو بكيفي كان ؟ ")
name = string.gsub(name," دحوو109م "," تحب تحتفظ بالذكريات ؟ ")
name = string.gsub(name," دحوو110م "," اغلب وقتك ضايع في؟ ")
name = string.gsub(name," دحوو111م "," اكثر كلمة تنقال لك بالبيت ؟ ")
name = string.gsub(name," دحوو112م "," كلمتك التسليكيه ؟ ")
name = string.gsub(name," دحوو113م "," تزعلك الدنيا ويرضيك ؟ ")
name = string.gsub(name," دحوو114م "," عندك فوبيا او خوف شديد من شيء معين ؟ ")
name = string.gsub(name," دحوو115م ","  غزل بلهجتك ؟ ")
name = string.gsub(name," دحوو116م "," ردة فعلك لما تنظلم من شخص ؟ ")
name = string.gsub(name," دحوو117م "," شيء تعترف انك فاشل فيه ؟ ")
name = string.gsub(name," دحوو118م "," اكثر كلمة ترفع ضغطك ؟ ")
name = string.gsub(name," دحوو119م "," نسبة جمال صوتك ؟ ")
name = string.gsub(name," دحوو120م "," كيف تتعامل مع الشخص المُتطفل ( الفضولي ) ؟ ")
name = string.gsub(name," دحوو121م "," من الاشياء اللي تجيب لك الصداع ؟ ")
name = string.gsub(name," دحوو122م "," حصلت الشخص اللي يفهمك ولا باقي ؟ ")
return '-› '..name..'  ' 
end


if MsgText[1] == 'محيبس' or MsgText[1] == 'بات' then   
Num = math.random(1,6)
redis:set(black.."GAMES"..msg.chat_id_,Num) 
TEST = [[
*➀       ➁     ➂      ➃      ➄     ➅
↓      ↓     ↓      ↓     ↓     ↓
👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊


-› اختر لأستخراج المحيبس الايد التي تحمل المحيبس 
- الفائز يحصل على { 3 } من النقاط *
]]
sendMsg(msg.chat_id_,msg.id_,TEST)   
redis:setex(black.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
if MsgText[1] == 'خمن' or MsgText[1] == 'تخمين' then   
Num = math.random(1,20)
redis:set(black.."GAMES:NUM"..msg.chat_id_,Num) 
TEST = '*\n-› اهلا بك عزيزي في لعبة التخمين :\nٴ━━━━━━━━━━\n'..'- لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n'..'- سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟*'
sendMsg(msg.chat_id_,msg.id_,TEST)
redis:setex(black.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
if (MsgText[1] == 'اسرع' or MsgText[1] == 'الاسرع') then
local NUM = math.random(10,1000)
redis:set(black..':NUM_SET:'..msg.chat_id_,(NUM * 3))
local Smiles = {'🍏','🍎','🍐',NUM,NUM,NUM,NUM,NUM,'🍊','🍋','🍌','🍉',NUM,NUM,NUM,NUM,NUM,'🍇','🍓','🍈','🍒',NUM,NUM,NUM,NUM,NUM,'🍑','🍍','🥥','🥝','🍅',NUM,NUM,NUM,NUM,NUM,'🍆','🥑','🥦','🥒',NUM,NUM,NUM,NUM,NUM,'🌶','🌽','🥕','🥔','🍠','🥐','🍞',NUM,NUM,NUM,NUM,NUM,'🥖','🥨','🧀','🥚','🍳','🥞','🥓',NUM,NUM,NUM,NUM,NUM,'🥩','🍗','🍖','🌭','🍔','🍟',NUM,NUM,NUM,NUM,NUM,'🍕','🥪','🥙','🍼','☕️','🍵',NUM,NUM,NUM,NUM,NUM,'🥤','🍶','🍺','🍻',NUM,NUM,NUM,NUM,NUM,'🏀','⚽️','🏈','⚾️','🎾','🏐',NUM,NUM,NUM,NUM,NUM,'🏉','🎱','🏓','🏸','🥅','🎰','🎮',NUM,NUM,NUM,NUM,NUM,'🎳','🎯','🎲','🎻','🎸','🎺','🥁','🎹',NUM,NUM,NUM,NUM,NUM,'🎼','🎧','🎤','🎬','🎨','🎭',NUM,NUM,NUM,NUM,NUM,'🎪','🎟','🎫','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌',NUM,NUM,NUM,NUM,NUM,'🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔','🛡','🔮','🌡','💣','📌',NUM,NUM,NUM,NUM,NUM,'📍','📓','📗','📂','📅','📪','📫','📬',NUM,NUM,NUM,NUM,NUM,'📭','⏰','📺','🎚','☎️',NUM,NUM,NUM,NUM,NUM,'📡'}
Emoji = Smiles[math.random(#Smiles)]
redis:set(black..':Set_Smile:'..msg.chat_id_,Emoji)
if tonumber(redis:get(black..':Set_Smile:'..msg.chat_id_)) == tonumber(redis:get(black..':NUM_SET:'..msg.chat_id_)) then
return '- اول من يكتب هذه العدد يفوز ؛  ››`'..(redis:get(black..':Set_Smile:'..msg.chat_id_))..'`'
else
return '️- اول من يكتب هذه السمايل يفوز ››    `'..(redis:get(black..':Set_Smile:'..msg.chat_id_))..'`'
end
end
if MsgText[1] == 'ترتيب' then
katu = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = katu[math.random(#katu)]
redis:set(black..':Set_Arg:'..msg.chat_id_,name)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ي ف ا')
name = string.gsub(name,'بزونه','ز و ب ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ث ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ا ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
return '-› اسرع واحد يرتبها {* '..name..' *} ' 
end
if MsgText[1] == 'معاني' then
katu = {'قرد','حصان','ارنب','حيه','نمله','قطه','كلب','ثور','ماعز','خروف','سلحفات','حوت','ورده','نخله','شجره','شمس','هلال','كامره','حلزون','مسدس','طياره','سياره','كرز','ركي','فروله','منزل','كره','نجمه','ساعه','راديو','باب','قارب','دجاجه','بطريق','ضفدع','بومه','نحله','ديج','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = katu[math.random(#katu)]
redis:set(black..':Set_Name_Meant:'..msg.chat_id_,name)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'حصان','🐎')
name = string.gsub(name,'ارنب','🐇')
name = string.gsub(name,'حيه','🐍')
name = string.gsub(name,'نمله','🐜')
name = string.gsub(name,'قطه','🐈')
name = string.gsub(name,'كلب','🐕')
name = string.gsub(name,'ثور','🐂')
name = string.gsub(name,'ماعز','🐐')
name = string.gsub(name,'خروف','🐏')
name = string.gsub(name,'سلحفات','🐢')
name = string.gsub(name,'حوت','🐳')
name = string.gsub(name,'ورده','🌷')
name = string.gsub(name,'نخله','🌴')
name = string.gsub(name,'شجره','🌳')
name = string.gsub(name,'شمس','🌞')
name = string.gsub(name,'هلال','🌙')
name = string.gsub(name,'كامره','📷')
name = string.gsub(name,'كامره','📹')
name = string.gsub(name,'حلزون','🐌')
name = string.gsub(name,'مسدس','🔫')
name = string.gsub(name,'طياره','🚁')
name = string.gsub(name,'سياره','🚘')
name = string.gsub(name,'كرز','🍒')
name = string.gsub(name,'ركي','🍉')
name = string.gsub(name,'فروله','🍓')
name = string.gsub(name,'منزل','🏫')
name = string.gsub(name,'كره','⚽')
name = string.gsub(name,'نجمه','🌟')
name = string.gsub(name,'ساعه','🕞')
name = string.gsub(name,'راديو','📻')
name = string.gsub(name,'باب','🚪')
name = string.gsub(name,'قارب','⛵')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديج','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
return '-› اول من يكتب معنى السمايل يفوز { '..name..' }'
end
if MsgText[1] == 'عكس' or MsgText[1] == 'العكس' or MsgText[1] == 'العكسس' then   
redis:set(black.."GAME:S"..msg.chat_id_,true) 
H1 = [[
- عكس كلمه » {مافهمت} 🧞‍♂️
]]
H2 = [[
- عكس كلمه » {جبان} 🧞‍♂️
]]
H3 =[[
- عكس كلمه » {ميت} 🧞‍♂️
]]
H4 =[[
 كلمه » {كسول} 🧞‍♂️
]]
H5 =[[
- عكس كلمه » {زين} 🧞‍♂️
]]
H6 =[[
- عكس كلمه » {عطشان} 🧞‍♂️
]]

H7 =[[
- عكس كلمه » {بارده} 🧞‍♂️
]]
H8 =[[
- عكس كلمه » {خايف} 🧞‍♂️
]]
H9 =[[
- عكس كلمه » {امام} 🧞‍♂️
]]
H11 =[[
- عكس كلمه » {خاين} 🧞‍♂️
]]
H12 =[[
- عكس كلمه » {طويل} 🧞‍♂️
]]
H13 =[[
- عكس كلمه » {صلب} 🧞‍♂️
]]
H14 =[[
- عكس كلمه » {ناعم} 🧞‍♂️
]]
H15 =[[
- عكس كلمه » {مجنون} 🧞‍♂️
]]
H16 =[[
- عكس كلمه » {غبي} 🧞‍♂️
]]
H17 =[[
- عكس كلمه » {ظلمه} 🧞‍♂️
]]
H18 =[[
- عكس كلمه » {مسموح} 🧞‍♂️
]]
H19 =[[
- عكس كلمه » {ماسمعك} 🧞‍♂️
]]

H20 =[[
- عكس كلمه » {تعال} 🧞‍♂️️
]]
HUSSEIN = {H16,H17,H18,H19,H20,H1,H2,H3,H4,H5,H6,H7,H8,H9,H11,H12,H13,H14,H15}
local SENDTEXT = HUSSEIN[math.random(#HUSSEIN)]
if SENDTEXT:find('فهمت') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'فهمت') 
elseif SENDTEXT:find('مو جبان') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'مو جبان') 
elseif SENDTEXT:find('عدل') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'عدل') 
elseif SENDTEXT:find('نشط') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'نشط') 
elseif SENDTEXT:find('مو زين') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'مو زين') 
elseif SENDTEXT:find('مو عطشان') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'مو عطشان') 
elseif SENDTEXT:find('حاره') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'حاره') 
elseif SENDTEXT:find('مو خايف') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'مو خايف') 
elseif SENDTEXT:find('خلف') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'خلف') 
elseif SENDTEXT:find('وفي') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'وفي') 
elseif SENDTEXT:find('قزم') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'قزم') 
elseif SENDTEXT:find('لين') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'لين') 
elseif SENDTEXT:find('خشن') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'خشن') 
elseif SENDTEXT:find('عاقل') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'عاقل') 
elseif SENDTEXT:find('ذكي') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'ذكي') 
elseif SENDTEXT:find('مو ظلمه') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'مو ظلمه') 
elseif SENDTEXT:find('مو مسموح') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'مو مسموح') 
elseif SENDTEXT:find('اسمعك') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'اسمعك') 
elseif SENDTEXT:find('روح') then
redis:set(black.."GAME:CHER"..msg.chat_id_,'روح') 
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'نقاطي' then 
local points = redis:get(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if points and points ~= "0" then
return '*-› عدد النقاط التي ربحتها هي » { '..points..' }\n- تسطيع بيع نقاطك ولحصول على (100) رساله مقابل كل نقطه من النقاط *\n'
else
return ' *-› ليس لديك نقاط ،\n- للحصول ؏ النقاط ،\n- ارسل الالعاب وابدأ اللعب ! *'
end
end
if MsgText[1] == 'بيع نقاطي' then
if MsgText[2] == "0" then
return '-› هناك خطأ عزيزي  \n- يجب ان يكون البيع ع الاقل 1 من النقاط . 'end
local points = redis:get(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if tonumber(MsgText[2]) > tonumber(points) then
return '-› عذرا ليس لديك النقاط بهذا العدد لبيعهن' 
end
if points == "0" then
return '-› للاسف ليس لديك النقاط \n- للحصول على النقاط العب احد الالعاب الموجوده في `قائمه الالعاب`'
else
local Total_Point = MsgText[2] * 100
redis:decrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,MsgText[2])  
redis:incrby(black..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_,Total_Point)  
return "-› تم خصم {* "..MsgText[2].." *} من نقاطك\n- تم زياده {* "..Total_Point.."* } من الرسائل \n- اصبحت رسائلك { *"..redis:get(black..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_).."* } رساله"
end
end
if MsgText[1] == 'احكام' then
redis:del(black..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) 
redis:del(black..':List_Rolet:'..msg.chat_id_)  
redis:setex(black..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_,3600,true)  
return '*【▣】 * حسناً لنلعب , ارسل عدد اللاعبين  .'
end
if MsgText[1] == 'نعم' and redis:get(black..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_) then
local list = redis:smembers(black..':List_Rolet:'..msg.chat_id_) 
if #list == 1 then 
return "【▣】 لم يكتمل العدد الكلي للاعبين" 
elseif #list == 0 then 
return "【▣】 عذراً لم تقوم باضافه اي لاعب" 
end 
local UserName = list[math.random(#list)]
GetUserName(UserName,function(arg,data)
redis:incrby(black..':User_Points:'..msg.chat_id_..data.id_,5)
end,nil)
redis:del(black..':List_Rolet:'..msg.chat_id_) 
redis:del(black..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_)
return '【▣】 تم اختيار الشخص الاتي\n【▣】 الشخص الذي سيحكم عليه {['..UserName..']}\n【▣】 نفذ الاحكام تمت مكافئتك ب خمس نقاط ' 
end
if MsgText[1] == 'الاعبين' then
local list = redis:smembers(black..':List_Rolet:'..msg.chat_id_) 
local Text = '\n*ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ*\n' 
if #list == 0 then 
return '*【▣】 * لا يوجد لاعبين هنا ' 
end 
for k, v in pairs(list) do 
Text = Text..k.."【▣】  » [" ..v.."] »\n"  
end 
return Text
end
if MsgText[1] == "الالعاب" or MsgText[1] == "اللعبه" or MsgText[1] == "العاب" or MsgText[1] == "اللعبة" then
return [[ 
【▣】 الالعاب لبوت []]..redis:get(black..':NameBot:')..[[]  ، ! 🎖
❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 ❍ [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
【▣】امثله ❍ امثله قديمه
【▣】 احكام ❍ احكام الشهيرة 
【▣】معاني ❍ معاني لسمايلات 
【▣】اسئله ❍ اسئله عامه
【▣】الغاز ❍ للعبه الالغاز 
【▣】من ❍ للعبه من اكون
【▣】روليت ❍ الروليت الشهيره
【▣】حزوره ❍ الحزورات
【▣】ترتيب ❍ ترتيب الكلمات
【▣】العكس ❍ عكس الكلمه
【▣】تخمين ❍ تخمين الكلمه 
【▣】الاسرع ❍ اسرع واحد 
【▣】محيبس ❍ محيبس الشهيره
【▣】كت تويت ❍ لعبه كت تويت الرائعة
【▣】المختلف ❍ اختلاف لسمايل

ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 ❍ [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
【▣】مـعـرف الـمـطـور  : ]]..SUDO_USER..[[
]]
end
if MsgText[1] == 'روليت' then
redis:del(black..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) 
redis:del(black..':List_Rolet:'..msg.chat_id_)  
redis:setex(black..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_,3600,true)  
return '*-›* حسننا لنلعب , ارسل عدد اللاعبين للروليت .'
end
if MsgText[1] == 'نعم' and redis:get(black..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_) then
local list = redis:smembers(black..':List_Rolet:'..msg.chat_id_) 
if #list == 1 then 
return "-› لم يكتمل العدد الكلي للاعبين .!؟" 
elseif #list == 0 then 
return "-› عذرا لم تقوم باضافه اي لاعب .؟!" 
end 
local UserName = list[math.random(#list)]
GetUserName(UserName,function(arg,data)
redis:incrby(black..':User_Points:'..msg.chat_id_..data.id_,5)
end,nil)
redis:del(black..':List_Rolet:'..msg.chat_id_) 
redis:del(black..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_)
return '-› تم اختيار الشخص الاتي\n- صاحب الحظ {['..UserName..']}\n- ربحت معنا 5 نقاط' 
end
if MsgText[1] == 'الاعبين' then
local list = redis:smembers(black..':List_Rolet:'..msg.chat_id_) 
local Text = '\n*ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ*\n' 
if #list == 0 then 
return '*-›* لا يوجد لاعبين هنا ' 
end 
for k, v in pairs(list) do 
Text = Text..k.."【▣】  » [" ..v.."] »\n"  
end 
return Text
end
if MsgText[1] == 'قائمه الالعاب' then
sendMsg(msg.chat_id_,msg.id_,[[
【▣】 الالعاب لبوت []]..redis:get(black..':NameBot:')..[[]  ، ! 🎖
【▣】 لتفعيل الالعاب او تعطيلها ارسل
【▣】 تفعـيل 【 تعطيل 】 الالعاب
❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 ❍ [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
【▣】امثله ❍ امثله قديمه
【▣】 احكام ❍ احكام الشهيرة 
【▣】معاني ❍ معاني لسمايلات 
【▣】اسئله ❍ اسئله عامه
【▣】الغاز ❍ للعبه الالغاز 
【▣】من ❍ للعبه من اكون
【▣】روليت ❍ الروليت الشهيره
【▣】حزوره ❍ الحزورات
【▣】ترتيب ❍ ترتيب الكلمات
【▣】العكس ❍ عكس الكلمه
【▣】تخمين ❍ تخمين الكلمه 
【▣】الاسرع ❍ اسرع واحد 
【▣】محيبس ❍ محيبس الشهيره
【▣】كت تويت ❍ لعبه كت تويت الرائعة
【▣】المختلف ❍ اختلاف لسمايل

ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝑆𝑂𝑈𝑅𝐶𝐸 𝐵𝐿𝐴𝐶𝐾 ❍
ــــــــــــــــــــــ❍ـــــــــــــــــــــ
❍ 𝐷𝐸𝑉 ❍ [˹ 𝐽𝐴𝐶𝐾 .](t.me/V_P_E)
ــــــــــــــــــــــ❍ـــــــــــــــــــــ 
【▣】 الـمـطـور  : ]]..SUDO_USER..[[
]])
end
end
end
end
local function procces(msg)
if msg.text and not redis:get(black..'lock_geams'..msg.chat_id_) then
if msg.text == redis:get(black..':Set_alii:'..msg.chat_id_) then -- // المختلف
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(black..':Set_alii:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*【▣】شاطر انتا صح 【▣】\n*')
end

if msg.text == redis:get(black..':Set_Amthlh:'..msg.chat_id_) then -- // امثله
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(black..':Set_Amthlh:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*【▣】شاطر انتا صح 【▣】\n*')
end

if msg.text == redis:get(black..':Set_Hzorh:'..msg.chat_id_) then -- // حزوره
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(black..':Set_Hzorh:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*【▣】شاطر انتا صح 【▣】\n*')
end


if msg.text == redis:get(black..':Set_Smile:'..msg.chat_id_) then --//  الاسرع
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(black..':Set_Smile:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*【▣】شاطر انتا صح 【▣】\n*')
end
 if msg.text == redis:get(black..':Set_Smile:'..msg.chat_id_) then --//  الغاز
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(black..':Set_Smile:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*【▣】شاطر انتا صح 【▣】\n*')
end
if msg.text == redis:get(black..':Set_Smile:'..msg.chat_id_) then --//  من اكون
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(black..':Set_Smile:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*【▣】شاطر انتا صح 【▣】\n*')
end
if msg.text == redis:get(black..':Set_alii:'..msg.chat_id_) then -- // المختلف
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(black..':Set_alii:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*【▣】شاطر انتا صح 【▣】\n*')
end 
if msg.text == redis:get(black..':Set_Hzorh:'..msg.chat_id_) then -- // حزوره
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(black..':Set_Hzorh:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*【▣】شاطر انتا صح 【▣】\n*')
end 
if msg.text == redis:get(black..':Set_Arg:'..msg.chat_id_) then -- // الترتيب
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(black..':Set_Arg:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*【▣】شاطر انتا صح 【▣】\n*')
end 
if msg.text == redis:get(black..':Set_Name_Meant:'..msg.chat_id_) then --// المعاني
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(black..':Set_Name_Meant:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*【▣】شاطر انتا صح 【▣】\n*')
end 
if msg.text:match("^(%d+)$") and redis:get(black..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_) then  --// استقبال اللعبه الدمبله
if msg.text == "1" then
Text = "*-›* لا استطيع بدء اللعبه بلاعب واحد فقط\n"
else
redis:set(black..":Number_Add:"..msg.chat_id_..msg.sender_user_id_,msg.text)  
Text = '-› تم بدء تسجيل اللسته \n- يرجى ارسال المعرفات \n- الفائز يحصل على (5) مجوهره\n- عدد الاعبين المطلوبه { *'..msg.text..'* } لاعب'
end
redis:del(black..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_)  
return sendMsg(msg.chat_id_,msg.id_,Text)    
end
if msg.text:match('^(@[%a%d_]+)$') and redis:get(black..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) then    --// استقبال الاسماء
if redis:sismember(black..':List_Rolet:'..msg.chat_id_,msg.text) then
return sendMsg(msg.chat_id_,msg.id_,'*-›* المعرف {['..msg.text..']} موجود اساسا' )
end
redis:sadd(black..':List_Rolet:'..msg.chat_id_,msg.text)
local CountAdd = redis:get(black..":Number_Add:"..msg.chat_id_..msg.sender_user_id_)
local CountAll = redis:scard(black..':List_Rolet:'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
redis:del(black..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) 
redis:setex(black..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_,1400,true)  
return sendMsg(msg.chat_id_,msg.id_,"*-›*تم ادخال المعرف { ["..msg.text.."] } \n*-*وتم اكتمال العدد الكلي \n- هل انت مستعد ؟ اجب بـ {* نعم *}")
end 
return sendMsg(msg.chat_id_,msg.id_,"*-›* تم ادخال المعرف { ["..msg.text.."] } \n- تبقى { *"..CountUser.."* } لاعبين ليكتمل العدد\n- ارسل المعرف التالي ")
end
end 
if redis:get(black.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_) then 
if msg.text:match("^(%d+)$") then
if tonumber(msg.text:match("^(%d+)$")) > 99999999990 then
sendMsg(msg.chat_id_,msg.id_,"*-› لا تستطيع اضافة اكثر من 99999999990 رساله*")
redis:del(black.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
return false  end 
local GET_IDUSER = redis:get(black..'SET:ID:USER'..msg.chat_id_)  
sendMsg(msg.chat_id_,msg.id_,"\n*-› تم اضافة { "..msg.text.." }* رساله له")
redis:incrby(black..'msgs:'..GET_IDUSER..':'..msg.chat_id_,msg.text)  
end
redis:del(black.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
end
if redis:get(black.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_) then 
if msg.text:match("^(%d+)$") then
if tonumber(msg.text:match("^(%d+)$")) > 99999999990 then
sendMsg(msg.chat_id_,msg.id_,"*-› لا تستطيع اضافة اكثر من 99999999990 نقطه*")   
redis:del(black.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_)  
return false  end 
local GET_IDUSER = redis:get(black..'SET:ID:USER:NUM'..msg.chat_id_)  
sendMsg(msg.chat_id_,msg.id_,"\n*-› تم اضافة { "..msg.text.." }* نقطه له")
redis:incrby(black..':User_Points:'..msg.chat_id_..GET_IDUSER,msg.text)  
end
redis:del(black.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_)  
end
if redis:get(black.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if msg.text:match("^(%d+)$") then
local NUM = msg.text:match("^(%d+)$")
if tonumber(NUM) > 6 then
sendMsg(msg.chat_id_,msg.id_,"*-› عذرا لا يوجد سواء { 6 } اختيارات فقط ارسل اختيارك مره اخره*")   
return false  end 
local GETNUM = redis:get(black.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
redis:del(black.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
sendMsg(msg.chat_id_,msg.id_,'*-› مبروك فزت وطلعت المحيبس بل ايد رقم { '..NUM..' }\n- لقد حصلت على { 3 }من نقاط يمكنك استبدالهن برسائل *')   
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,3)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
redis:del(black.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
sendMsg(msg.chat_id_,msg.id_,'\n*-› للاسف لقد خسرت \n- المحيبس بل ايد رقم { '..GETNUM..' }\n- حاول مره اخرى للعثور على المحيبس *')   
end
end
end
if (msg.text == redis:get(black.."GAME:CHER"..msg.chat_id_)) and redis:get(black.."GAME:S"..msg.chat_id_) then  
sendMsg(msg.chat_id_,msg.id_,'【▣】شاطر انتا صح 【▣】')     
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(black.."GAME:S"..msg.chat_id_)
redis:del(black.."GAME:CHER"..msg.chat_id_)
elseif msg.text == 'الفيل' or msg.text == 'الثور' or msg.text == 'الحصان' or msg.text == '7' or msg.text == '9' or msg.text == '8' or msg.text == 'لوين' or msg.text == 'موسكو' or msg.text == 'مانكو' or msg.text == '20' or msg.text == '30' or msg.text == '28' or msg.text == 'ترامب' or msg.text == 'اوباما' or msg.text == 'كيم جونغ' or msg.text == '50' or msg.text == '70' or msg.text == '40' or msg.text == '7' or msg.text == '3' or msg.text == '10' or msg.text == '4' or msg.text == 'الاذن' or msg.text == 'الثلاجه' or msg.text == 'الغرفه' or msg.text == '15' or msg.text == '17' or msg.text == '25' or msg.text == 'الفرات' or msg.text == 'نهر الكونغو' or msg.text == 'المسيبي' or msg.text == 'بيا بايج' or msg.text == 'لاري بيج' or msg.text == 'بيا مارك زوكيربرج' or msg.text == 'الفيل' or msg.text == 'النمر' or msg.text == 'الفهد' or msg.text == 'بانكول' or msg.text == 'نيو دلهي' or msg.text == 'بيكن' or msg.text == 'الهاتف' or msg.text == 'التلفاز' or msg.text == 'المذياع' or msg.text == 'لفرسول' or msg.text == 'تركيا' or msg.text == 'بغداد' or msg.text == 'النحاس' or msg.text == 'الحديد' or msg.text == 'الفضه' or msg.text == 'امريكا الشماليه' or msg.text == 'امريكا الجنوبيه' or msg.text == 'افريقيا' or msg.text == 'القرش' or msg.text == 'الثعلب' or msg.text == 'الكلب' or msg.text == 'للجرو' or msg.text == 'العجل' or msg.text == 'الحمار' or msg.text == '3' or msg.text == '5' or msg.text == '6' or msg.text == 'اوربا' or msg.text == 'افريقيا' or msg.text == 'امريكا الجنوبيه' or msg.text == 'افريقيا' or msg.text == 'امريكا الشماليه' or msg.text == 'اوربا' or msg.text == 'الصاروخ' or msg.text == 'المسدس' or msg.text == 'الطائرات' or msg.text == 'سيدات' or msg.text == 'قوانص' or msg.text == 'عوانس' or msg.text == 'المكارم' or msg.text == 'المبائم' or msg.text == 'المعازم' or msg.text == 'حرف الغاء' or msg.text == 'حرف الواو' or msg.text == 'حرف النون' or msg.text == 'نحاس' or msg.text == 'الماس' or msg.text == 'حديد' or msg.text == 'العمر' or msg.text == 'ساعه' or msg.text == 'الحذاء' or msg.text == 'بئر' or msg.text == 'نهر' or msg.text == 'شلال' or msg.text == 'ادم' or msg.text == 'نوح' or msg.text == 'عيسئ' or msg.text == 'الاضافر' or msg.text == 'الاسنان' or msg.text == 'الدموع' or msg.text == 'الاخلاق' or msg.text == 'الضل' or msg.text == 'حرف النون'  then
if redis:get(black.."GAME:S"..msg.chat_id_) then  
local list = {'10' , 'براسي' , 'النمل' , '32' , 'بوتين' , '30' , '11' , 'الفم' , '14' , 'النيل' , 'ستيف جوبر' , 'خديجه' , 'الاسد' , 'طوكيو' , 'الانسان' , 'لندن' , 'الزئبق' , 'اورباالدولفين' , 'المهر' , '4' , 'اسيا' , 'اسيا' , 'المنجنيق' , 'انسات' , 'العزائم' , 'حرف الام' , 'ذهب' , 'الاسم' , 'سحاب' , 'ابراهيم' , 'الشعر' , 'حرف الواو'}
for k, v in pairs(list) do 
if msg.text ~= v then
sendMsg(msg.chat_id_,msg.id_,'【▣】للاسف انتا غلط 【▣】 ')     
redis:del(black.."GAME:S"..msg.chat_id_)
redis:del(black.."GAME:CHER"..msg.chat_id_)
return false  
end
end
end
end
if (msg.text == redis:get(black.."GAME:CHER"..msg.chat_id_)) and redis:get(black.."GAME:S"..msg.chat_id_) then  
sendMsg(msg.chat_id_,msg.id_,'【▣】شاطر انتا صح 【▣】 ')     
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(black.."GAME:S"..msg.chat_id_)
redis:del(black.."GAME:CHER"..msg.chat_id_)
elseif msg.text == 'فهمت' or msg.text == 'مو جبان' or msg.text == 'عدل' or msg.text == 'نشط' or msg.text == 'مو زين' or msg.text == 'مو عطشان' or msg.text == 'حاره' or msg.text == 'مو خايف' or msg.text == 'خلف' or msg.text == 'وفي' or msg.text == 'القزم' or msg.text == 'لين' or msg.text == 'خشن' or msg.text == 'عاقل' or msg.text == 'ذكي' or msg.text == 'مو ظلمه' or msg.text == 'مو مسموح' or msg.text == 'اسمعك' or msg.text == 'روح' then
if redis:get(black.."GAME:S"..msg.chat_id_) then  
local list = {'فهمت' , 'مو جبان' , ' مو عطشان' , 'عدل' , 'نشط' , 'مو زين' , ' خاره ' , 'خلف' , 'مو خايف' , 'لين' , 'القزم' , 'وفي' , 'عاقل' , 'خشن' , 'ذكي' , 'اسمعك' , 'مو مسموح' , 'مو ظلمه'}
for k, v in pairs(list) do 
if msg.text ~= v then
sendMsg(msg.chat_id_,msg.id_,'【▣】للاسف انتا غلط 【▣】 ')     
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(black.."GAME:S"..msg.chat_id_)
redis:del(black.."GAME:CHER"..msg.chat_id_)
return false  
end
end
end
end
if (msg.text == redis:get(black.."GAME:CHER"..msg.chat_id_)) and redis:get(black.."GAME:S"..msg.chat_id_) then  
sendMsg(msg.chat_id_,msg.id_,'【▣】شاطر انتا صح 【▣】')     
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(black.."GAME:S"..msg.chat_id_)
redis:del(black.."GAME:CHER"..msg.chat_id_)
elseif msg.text == 'الهدهد' or msg.text == 'الاسد' or msg.text == 'الاسم' or msg.text == 'الصوت' or msg.text == '55' or msg.text == '30' or msg.text == 'الرمال' or msg.text == 'السحاب' or msg.text == 'موسي' or msg.text == 'عيسي' or msg.text == 'الهواء' or msg.text == 'التربه' or msg.text == 'الإسنان' or msg.text == 'الرصاص' or msg.text == 'الذهب' or msg.text == 'الفضه' or msg.text == 'لسانك' or msg.text == 'رجلك' or msg.text == 'الماء' or msg.text == 'الهواء' or msg.text == 'برب' or msg.text == 'ردب' or msg.text == 'الشمس' or msg.text == 'النحل' or msg.text == 'الضفضع' or msg.text == 'القط' or msg.text == 'نيزك' or msg.text == 'قمر' or msg.text == 'الكره الارضيه' or msg.text == 'السياره' or msg.text == 'البقال' or msg.text == 'الجزار' or msg.text == 'المنطاد' or msg.text == 'السناره' or msg.text == 'القط' or msg.text == 'الصوت' or msg.text == 'الرياح' or msg.text == 'هتلر' or msg.text == 'هابيل' or msg.text == 'المال' or msg.text == 'الحيوان' or msg.text == 'برج' or msg.text == 'علم' or msg.text == 'البطريق' or msg.text == 'الاخطابوط' or msg.text == 'المنتهي' or msg.text == 'الاوسط' or msg.text == 'القرش' or msg.text == 'الدولفين' or msg.text == 'حنكش' or msg.text == 'القلب' or msg.text == '7'  or msg.text == '8' or msg.text == 'عمتك' or msg.text == 'خالتك' then
if redis:get(black.."GAME:S"..msg.chat_id_) then  
local list = {'الهدهد' , 'الاسد' , 'الاسم' , 'الصوت' , '55' , '30' , 'الرمال' , 'السحاب' , 'موسي' , 'عيسي' , 'الهواء' , 'التربه' , 'الإسنان' , 'الرصاص' , 'الذهب' , 'الفضه' , 'لسانك' , 'رجلك' , 'الماء' , 'الهواء' , 'برب' , 'ردب' , 'الشمس' , 'النحل' , 'الضفضع' , 'القط' , 'نيزك' , 'قمر' , 'الكره الارضيه' , 'السياره' , 'البقال' , 'الجزاز' , 'المنطاد' , 'السناره' , 'الصوت' , 'الرياح' , 'الضوء' , 'هتلر' , 'هابيل' , 'المال' , 'الحيوان' , 'علم' , 'البطريق' , 'الاخطابوط' , 'المنتهي' , 'الاوسط' , 'القرش' , 'الدولفين' , 'حنكش' , 'القلب' , '7' , '8' , 'عمتك' , 'خالتك'}
for k, v in pairs(list) do 
if msg.text ~= v then
sendMsg(msg.chat_id_,msg.id_,'【▣】شاطر انتا صح 【▣】')     
redis:del(black.."GAME:S"..msg.chat_id_)
redis:del(black.."GAME:CHER"..msg.chat_id_)
return false
end
end
end
end
if (msg.text == redis:get(black.."GAME:CHER"..msg.chat_id_)) and redis:get(black.."GAME:S"..msg.chat_id_) then  
sendMsg(msg.chat_id_,msg.id_,'【▣】شاطر انتا صح 【▣】')     
redis:incrby(black..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(black.."GAME:S"..msg.chat_id_)
redis:del(black.."GAME:CHER"..msg.chat_id_)
elseif msg.text == 'احا' or msg.text == 'محمد علي' or msg.text == 'اخطابوط' or msg.text == 'سفينه' or msg.text == 'سلحفاه' or msg.text == 'ميزان' or msg.text == 'حفره' or msg.text == 'منفاخ' or msg.text == 'ساعه' or msg.text == 'زجاج' or msg.text == 'بحر' or msg.text == 'محمول' or msg.text == 'ابره' or msg.text == 'طبق' or msg.text == 'اسفنجه' or msg.text == 'ادم' or msg.text == 'سمسم' or msg.text == 'دوده' or msg.text == 'محمد الفاتح' or msg.text == 'ثلج' or msg.text == 'ثعبان' then
if redis:get(black.."GAME:S"..msg.chat_id_) then  
local list = {'محمد علي' , 'اخطابوط' , 'سفينه' , '' , 'سلحفاه' , 'ميزان' , 'حفره' , 'منفاخ' , 'ساعه' , 'زجاج' , 'بحر' , 'محمول' , 'ابره' , 'طبق' , 'اسفنجه' , 'ادم' , 'سمسم' , 'دوده' , 'محمد الفاتح' , 'ثلج' , 'ثعبان'}
for k, v in pairs(list) do 
if msg.text ~= v then
sendMsg(msg.chat_id_,msg.id_,'【▣】شاطر انتا صح 【▣】')     
redis:del(black.."GAME:S"..msg.chat_id_)
redis:del(black.."GAME:CHER"..msg.chat_id_)
return false
end
end
end
end
if redis:get(black.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if msg.text:match("^(%d+)$") then
local NUM = msg.text:match("^(%d+)$")
if tonumber(NUM) > 20 then
sendMsg(msg.chat_id_,msg.id_,"*-› عذرآ لا يمكنك تخمين عدد اكبر من ال { 20 } خمن رقم ما بين ال{ 1 و 20 } *")
return false  end 
local GETNUM = redis:get(black.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
redis:del(black..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
redis:del(black.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
redis:incrby(black..':User_Points:'..msg.chat_id_..data.id_,5)
sendMsg(msg.chat_id_,msg.id_,'*-› مبروك فزت ويانه وخمنت الرقم الصحيح\n- تم اضافة { 5 } من النقاط *')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
redis:incrby(black..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(redis:get(black..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
redis:del(black..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
redis:del(black.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
sendMsg(msg.chat_id_,msg.id_,'\n*-› اوبس لقد خسرت في اللعبه \n- حظآ اوفر في المره القادمه \n- كان الرقم الذي تم تخمينه { '..GETNUM..' }*')
else
sendMsg(msg.chat_id_,msg.id_,'\n*-› اوبس تخمينك غلط \n- ارسل رقم تخمنه مره اخره \n*')
end
end
end
end
if MsgText[1] == 'احكام' then
redis:del(black..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) 
redis:del(black..':List_Rolet:'..msg.chat_id_)  
redis:setex(black..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_,3600,true)  
return '*【▣】 * حسناً لنلعب , ارسل عدد اللاعبين  .'
end
if MsgText[1] == 'نعم' and redis:get(black..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_) then
local list = redis:smembers(black..':List_Rolet:'..msg.chat_id_) 
if #list == 1 then 
return "【▣】 لم يكتمل العدد الكلي للاعبين" 
elseif #list == 0 then 
return "【▣】 عذراً لم تقوم باضافه اي لاعب" 
end 
local UserName = list[math.random(#list)]
GetUserName(UserName,function(arg,data)
redis:incrby(black..':User_Points:'..msg.chat_id_..data.id_,5)
end,nil)
redis:del(black..':List_Rolet:'..msg.chat_id_) 
redis:del(black..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_)
return '【▣】 تم اختيار الشخص الاتي\n【▣】 الشخص الذي سيحكم عليه {['..UserName..']}\n【▣】 نفذ الاحكام تمت مكافئتك ب خمس نقاط ' 
end
if MsgText[1] == 'الاعبين' then
local list = redis:smembers(black..':List_Rolet:'..msg.chat_id_) 
local Text = '\n*ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ*\n' 
if #list == 0 then 
return '*【▣】 * لا يوجد لاعبين هنا ' 
end 
for k, v in pairs(list) do 
Text = Text..k.."【▣】  » [" ..v.."] »\n"  
end 
return Text
end

if msg.text then  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_}, function(arg,data) 
if redis:get(black.."chencher"..msg.sender_user_id_) then 
if redis:get(black.."chencher"..msg.sender_user_id_) ~= data.first_name_ then 
tahan = '['..(redis:get(black.."chencher"..msg.sender_user_id_) or '')..']'
taham = '['..data.first_name_..']'
sendMsg(msg.chat_id_,msg.id_,taha[math.random(#taha)])
end  
end
redis:set(black.."chencher"..msg.sender_user_id_, data.first_name_) 
end,nil) 
end
end
return {
black = {
"^(حزوره)$", 
"^(كت تويت)$", 
"^(المختلف)$",
"^(تويت)$",
 "^(امثله)$",
"^(نعم)$",
"^(الاعبين)$",
"^(بدء الاسئله)$",
"^(بدء الالغاز)$",
"^(اريد نصيحه)$",
"^(من)$",
"^(ختيارات)$",
"^(اسئله)$",
"^(الالعاب)$",
"^(العاب)$",
"^(اللعبه)$",
"^(اللعبة)$",
"^(محيبس)$",
"^(تخمين)$",
"^(خمن)$",
"^(بات)$",
"^(احكام)$",
"^(حكم)$",
'^(تعطيل) (.+)$',
'^(تفعيل) (.+)$',
"^(اسرع)$",
"^(الاسرع)$",
"^(الغاز)$",
"^(الالغاز)$",
"^(من اكون)$",
"^(من)$",
"^(نصيحه)$",
"^(انصحني)$",
"^(اسألني)$",
"^(اسأل)$",
"^(اسالني)$",
"^(اسال)$",
"^(بدأ الاسئله)$",
"^(غنيلي)$",
"^(غني)$",
"^(غني يا بوت)$",
"^(الحمل)$",
"^(برج الحمل)$",
"^(الثور)$",
"^(برج الثور)$",
"^(الجوزاء)$",
"^(برج الجوزاء)$",
"^(السرطان)$",
"^(برج السرطان)$",
"^(الاسد)$",
"^(برج الاسد)$",
"^(الأسد)$",
"^(برج الأسد)$",
"^(العذراء)$",
"^(برج العذراء)$",
"^(الميزان)$",
"^(برج الميزان)$",
"^(العقرب)$",
"^(برج العقرب)$",
"^(القوس)$",
"^(برج القوس)$",
"^(الجدي)$",
"^(برج الجدي)$",
"^(الجدى)$",
"^(برج الجدى)$",
"^(الدلو)$",
"^(برج الدلو)$",
"^(الحوت)$",
"^(برج الحوت)$",
"^(جريمتي)$",
"^(اخبرني جريمتي)$",
"^(أخبرني جريمتي)$",
"^(جريمتى)$",
"^(باد)$",
"^(نقاطي)$",
"^(ترتيب)$",
"^(معاني)$",
"^(عكس)$",
"^(العكس)$", 
"^(العكسس)$", 
"^(بيع نقاطي) (%d+)$",
"^(اضف رسائل) (%d+)$",
"^(اضف نقاط) (%d+)$",
"^(روليت)$",
"^(قائمه الالعاب)$",
 },
 iblack = games,
 dblack = procces,
 }
