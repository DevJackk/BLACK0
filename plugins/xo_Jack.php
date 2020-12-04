<?php

define('BOT_TOKEN', ''); //1470530491:AAGJNqVNaCB-XBihN6UWlI3EkK3ppvEiV7c

define('API_URL', 'https://api.telegram.org/bot'.BOT_TOKEN.'/');

function apiRequestWebhook($method, $parameters) {

if (!is_string($method)) {

error_log("Method name must be a string\n");

return false;

}

if (!$parameters) {

$parameters = array();

} else if (!is_array($parameters)) {

error_log("Parameters must be an array\n");

return false;

}

$parameters["method"] = $method;

header("Content-Type: application/json");

echo json_encode($parameters);

return true;

}

function exec_curl_request($handle) {

$response = curl_exec($handle);

if ($response === false) {

$errno = curl_errno($handle);

$error = curl_error($handle);

error_log("Curl returned error $errno: $error\n");

curl_close($handle);

return false;

}

$http_code = intval(curl_getinfo($handle, CURLINFO_HTTP_CODE));

curl_close($handle);

if ($http_code >= 500) {

// do not wat to DDOS server if something goes wrong

sleep(10);

return false;

} else if ($http_code != 200) {

$response = json_decode($response, true);

error_log("Request has failed with error {$response['error_code']}: {$response['description']}\n");

if ($http_code == 401) {

throw new Exception('Invalid access token provided');

}

return false;

} else {

$response = json_decode($response, true);

if (isset($response['description'])) {

error_log("Request was successfull: {$response['description']}\n");

}

$response = $response['result'];

}

return $response;

}

function apiRequest($method, $parameters) {

if (!is_string($method)) {

error_log("Method name must be a string\n");

return false;

}

if (!$parameters) {

$parameters = array();

} else if (!is_array($parameters)) {

error_log("Parameters must be an array\n");

return false;

}

foreach ($parameters as $key => &$val) {

// encoding to JSON array parameters, for example reply_markup

if (!is_numeric($val) && !is_string($val)) {

$val = json_encode($val);

}

}

$url = API_URL.$method.'?'.http_build_query($parameters);

$handle = curl_init($url);

curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);

curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 5);

curl_setopt($handle, CURLOPT_TIMEOUT, 60);

return exec_curl_request($handle);

}

function apiRequestJson($method, $parameters) {

if (!is_string($method)) {

error_log("Method name must be a string\n");

return false;

}

if (!$parameters) {

$parameters = array();

} else if (!is_array($parameters)) {

error_log("Parameters must be an array\n");

return false;

}

$parameters["method"] = $method;

$handle = curl_init(API_URL);

curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);

curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 5);

curl_setopt($handle, CURLOPT_TIMEOUT, 60);

curl_setopt($handle, CURLOPT_POSTFIELDS, json_encode($parameters));

curl_setopt($handle, CURLOPT_HTTPHEADER, array("Content-Type: application/json"));

return exec_curl_request($handle);

}

function Win($table){

	$mos=true;

	for($i=0;$i<3;$i++){

		for($j=0;$j<3;$j++){

			if($table[0][0]["text"]==" ") {$mos==false;break;}

		}

	}

	if($table[0][0]["text"]==$table[0][1]["text"]&&$table[0][1]["text"]==$table[0][2]["text"]&&$table[0][0]["text"]!=" ") $win=$table[0][0]["text"];

	else if($table[1][0]["text"]==$table[1][1]["text"]&&$table[1][1]["text"]==$table[1][2]["text"]&&$table[1][0]["text"]!=" ") $win=$table[1][0]["text"];

	else if($table[2][0]["text"]==$table[2][1]["text"]&&$table[2][1]["text"]==$table[2][2]["text"]&&$table[2][0]["text"]!=" ") $win=$table[2][0]["text"];

	

	else if($table[0][0]["text"]==$table[1][0]["text"]&&$table[0][0]["text"]==$table[2][0]["text"]&&$table[0][0]["text"]!=" ") $win=$table[0][0]["text"];

	else if($table[0][1]["text"]==$table[1][1]["text"]&&$table[0][1]["text"]==$table[2][1]["text"]&&$table[0][1]["text"]!=" ") $win=$table[0][1]["text"];

	else if($table[0][2]["text"]==$table[1][2]["text"]&&$table[0][2]["text"]==$table[2][2]["text"]&&$table[0][2]["text"]!=" ") $win=$table[0][2]["text"];

	

	else if($table[0][0]["text"]==$table[1][1]["text"]&&$table[0][0]["text"]==$table[2][2]["text"]&&$table[0][0]["text"]!=" ") $win=$table[0][0]["text"];

	else if($table[0][2]["text"]==$table[1][1]["text"]&&$table[0][2]["text"]==$table[2][0]["text"]&&$table[0][2]["text"]!=" ") $win=$table[0][2]["text"];

	

	if (isset($win)) return $win;

	else return false;

}

function getChat($chat_id){

	$json=file_get_contents('https://api.telegram.org/bot'.BOT_TOKEN."/getChat?chat_id=".$chat_id);

	$data=json_decode($json,true);

	return $data["result"]["first_name"];

}

function processMessage($message) {

// process incoming message

$message_id = $message['message_id'];

$chat_id = $message['chat']['id'];

if (isset($message['text'])) {

// incoming text message

$text = $message['text'];

if (strpos($text, "/start") === 0) {

apiRequestJson("sendMessage", array('chat_id' => $chat_id, "text" => "لبدأ 😊\nيجب عليك 😻الضغط على زر العب☺️ \n\n[تابع قناةالبوت☺️❤️](https://t.me/joinchat/BLACK_TEAM_1)","parse_mode"=>"MARKDOWN","disable_web_page_preview"=>"true",'reply_markup' => array(

"inline_keyboard"=>array(

			 array(array("text"=>"تابع قناة البوت","url"=>"t.me/imhii")),

			 array(array("text"=>"لعب ⭕️❌","switch_inline_query"=>md5(date("YMDms"))),array("text"=>"","callback_data"=>"m"))

			)

		)));

} 

}

}

function inlineMessage($inline){

	$id=$inline['id'];

	$chat_id=$inline['from']['id'];

	$query=$inline['query'];

	

	//apiRequest("sendMessage",array("chat_id"=>261203340,"text"=>json_encode($inline['from'])));

	apiRequest("answerInlineQuery",array("inline_query_id"=>$id,"results"=>array(array("type"=>"article","id"=>$query,"title"=>"لعب❌⭕️","input_message_content"=>array("message_text"=>"`لتبدأ باللعب`❤️\n_اضغط على الزر_😊👇\n*واستمتع بالعب*😻 \n[تابع جديدنا على التليكرام](https://t.me/joinchat/BLACK_TEAM_1)","parse_mode"=>"MARKDOWN","disable_web_page_preview"=>false),

	 "reply_markup"=>array(

	 "inline_keyboard"=>array(

			 array(array("text"=>"لعب!","callback_data"=>"play_".$chat_id))

			)

		)

	))));

	exit;

	

}

function callbackMessage($callback){

	 $user_id= $_GET['user'];

	 $callback_id=$callback['id'];

	 $chat_id=$callback['message']['chat']['id'];

	 $pv_id=$callback['from']['id'];

	 $data=$callback['data'];

	 $message_id=$callback['inline_message_id'];

$text=$callback['message']['text'];

	 if(strpos($data, "play") === 0){

		 $data=explode("_",$data);

		 if($data[1]==$pv_id){

			 apiRequest("answerCallbackQuery",array('callback_query_id'=>$callback_id,'text'=>"لتبدا بالعب 😊\nيجب على عليك😻الضغط على زر العب☺️",'show_alert'=>false));

		 exit;

		 }

		 else{

			 $Player1=$data[1]; $P1Name=getChat($Player1);

			 $Player2=$pv_id; $P2Name=getChat($Player2);

			 //

			 for($i=0;$i<3;$i++){

				 for($j=0;$j<3;$j++){

					 $Tab[$i][$j]["text"]=" ";

					 $Tab[$i][$j]["callback_data"]=$i.".".$j."_0.0.0.0.0.0.0.0.0_".$Player1.".".$Player2."_1_0";

				 }

			 }

			 $Tab[3][0]["text"]="تابع قناة البوت";

			 $Tab[3][0]["url"]="t.me/imhii";

			 

			 apiRequest("editMessageText",array("inline_message_id"=>$message_id,"text"=>"لقد بدأت اللعبه \n\nأول لاعب😻 :$P1Name(❌)\n ثاني لاعب😍:$P2Name(⭕️)\n\n الان دورك $P1Name(❌) صديقي☺ \n\n[تابع قناة البوت ☺️🌸](https://t.me/joinchat/BLACK_TEAM_1)️","parse_mode"=>"MARKDOWN","disable_web_page_preview"=>"true","reply_markup"=>array(

			 "inline_keyboard"=>$Tab 

			 )));

			 exit;

		 }

	 }

	 else if($data=="Left"){

		 apiRequest("editMessageText",array("inline_message_id"=>$message_id,"text"=>"لقد انتهت اللعبه😁👍."," reply_markup"=>array(

			"inline_keyboard"=>$Tab 

		 ))); 

		 exit;

	 }

	 else if($data=="end"){

		 $Tab=json_decode($row['Tab'],true);

		 $message_id=$message_id;

	

		 

		 apiRequest("editMessageText",array("inline_message_id"=>$message_id,"text"=>"لقد انتهت اللعبه😁👍.","reply_markup"=>array(

			"inline_keyboard"=>$Tab 

		 ))); 

		 exit;

	 }

	 else{

		 //apiRequest("sendMessage",array("chat_id"=>261203340,"text"=>$data));

		 $data=explode("_",$data);

		 $a=explode(".",$data[0]);

		 $i=$a[0]; $j=$a[1];

		 $table=explode(".",$data[1]);

		 $Players=explode(".",$data[2]);

		 

		 //Turn

		 if((int)$data[3]==1) $Turn=$Players[0];

		 else if((int)$data[3]==2) $Turn=$Players[1];

		 

		 //Turn

	 

		 if($pv_id==$Turn){

			 $Player1=$Players[0]; $P1Name=getChat($Player1);

			 $Player2=$Players[1]; $P2Name=getChat($Player2);

			 

			 $Num=(int)$data[4]+1;

			 //NextTurn

			 if($pv_id==$Player1) {

				$NextTurn=$Player2;

				$NextTurnNum=2;

				$Emoji="❌";

				$NextEmoji="⭕️";

			 }

			 else {

				$NextTurn=$Player1;

				$NextTurnNum=1;

				$Emoji="⭕️";

				$NextEmoji="❌";

			 }

			 //TabComplete

			 $n=0;

			 for($ii=0;$ii<3;$ii++){

				 for($jj=0;$jj<3;$jj++){

					if((int)$table[$n]==1) $Tab[$ii][$jj]["text"]="❌"; 

					else if((int)$table[$n]==2) $Tab[$ii][$jj]["text"]="⭕️"; 

					else if((int)$table[$n]==0) $Tab[$ii][$jj]["text"]=" "; 

					$n++; 

				 }

			 }

			 

			 //Tab End

			 //NextTurn

			 

			 if($Tab[$i][$j]["text"]!=" ") apiRequest("answerCallbackQuery",array('callback_query_id'=>$callback_id,'text'=>"يمكنك تحديد الزر المطلوب",'show_alert'=>false));

			 else{

				 $Tab[$i][$j]["text"]=$Emoji;

//

				 $n=0;

for($i=0;$i<3;$i++){

					 for($j=0;$j<3;$j++){

						 if($Tab[$i][$j]["text"]=="❌") $table[$n]=1; 

						 else if($Tab[$i][$j]["text"]=="⭕️") $table[$n]=2; 

						 else if($Tab[$i][$j]["text"]==" ") $table[$n]=0;

						 $n++;

					 }

				 }

//				 

				 if(Win($Tab)=="⭕️"||Win($Tab)=="❌") {

						

						if(Win($Tab)=="⭕️") $winner=getChat($Player2);

						else if(Win($Tab)=="❌") $winner=getChat($Player1);

						$n=0;

for($ii=0;$ii<3;$ii++){

							for($jj=0;$jj<3;$jj++){

								$Tab[$ii][$jj]["callback_data"]="end";

								$n++;

							}

						}

						

					 apiRequest("editMessageText",array("inline_message_id"=>$message_id,"text"=>"اللاعب الاول😻 :$P1Name(❌)\n اللاعب الثاني😍 $P2Name(⭕️)\n\الفائز🙈😻".$winner."(".Win($Tab).")\n\n[تابع قناة البوت ☺️🌸](https://t.me/joinchat/BLACK_TEAM_1)","parse_mode"=>"MARKDOWN","disable_web_page_preview"=>"true","reply_markup"=>array(

			 "inline_keyboard"=>$Tab 

			 ))); 

					 exit;

				 }

					else if($Num>=9) {

/*$Tab[3][0]["text"]=" انتهت اللعبه";

		 $Tab[3][0]["callback_data"]="end";*/

						

						$n=0;

for($ii=0;$ii<3;$ii++){

							for($jj=0;$jj<3;$jj++){

								$Tab[$ii][$jj]["callback_data"]="end";

								$n++;

							}

						}

						

					 apiRequest("editMessageText",array("inline_message_id"=>$message_id,"text"=>"اللاعب الاول😊 :$P1Name(❌)\n اللاعب الثاني😊:$P2Name(⭕️)\n\المبارات تعادل😁👋!\n\n[تابع قناة البوت☺️🌸](https://t.me/joinchat/BLACK_TEAM_1)","parse_mode"=>"MARKDOWN","disable_web_page_preview"=>"true","reply_markup"=>array(

			 "inline_keyboard"=>$Tab 

			 ))); 

					 exit;

				 }

				 else{

				 //apiRequest("sendMessage",array("chat_id"=>261203340,"text"=>Win($Tab)));

						//$winner=Win($Tab);

//apiRequest("answerCallbackQuery",array('callback_query_id'=>$callback_id,'text'=>Win($Tab),'show_alert'=>false));						

						

				 //Tab

						$n=0;

for($ii=0;$ii<3;$ii++){

							for($jj=0;$jj<3;$jj++){

								$Tab[$ii][$jj]["callback_data"]=$ii.".".$jj."_".implode(".",$table)."_".$Player1.".".$Player2."_".$NextTurnNum."_".$Num;

								$n++;

							}

						}

						

					 $Tab[3][0]["text"]="تابع قناة البوت";

			 $Tab[3][0]["url"]="t.me/imhii";

//apiRequest("sendMessage",array("chat_id"=>261203340,"text"=>json_encode($Tab)));						

						//Tab

						

						$NextTurn=getChat($NextTurn);

				 apiRequest("editMessageText",array("inline_message_id"=>$message_id,"text"=>"اللاعب الاول☺️ :$P1Name(❌)\اللاعب الثاني😊 :$P2Name(⭕️)\n\n الدور لك $NextTurn($NextEmoji) صديقي😻.\n\[تابع قناة البوت ☺️🌸](https://t.me/joinchat/BLACK_TEAM_1)","parse_mode"=>"MARKDOWN","disable_web_page_preview"=>"true","reply_markup"=>array(

			 "inline_keyboard"=>$Tab 

			 )));

					 exit;

				 }

			}

		}

		else{

		 apiRequest("answerCallbackQuery",array('callback_query_id'=>$callback_id,'text'=>"مو دورك لتلعب😜.",'show_alert'=>false));

			exit;

		}

	}

	 //apiRequest("sendMessage",array("chat_id"=>261203340,"text"=>$data));

}

define('WEBHOOK_URL', 'https://my-site.example.com/secret-path-for-webhooks/');

if (php_sapi_name() == 'cli') {

// if run from console, set or delete webhook

apiRequest('setWebhook', array('url' => isset($argv[1]) && $argv[1] == 'delete' ? '' : WEBHOOK_URL));

exit;

}

$content = file_get_contents("php://input");

$update = json_decode($content, true);

if (!$update) {

// receive wrong update, must not happen

exit;

}

if (isset($update["message"])) {

processMessage($update["message"]);

}

else if(isset($update["inline_query"])){

	inlineMessage($update["inline_query"]);

}

else if(isset($update["callback_query"])){

	callbackMessage($update["callback_query"]);

}

