<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/backend/commonCSS.file" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- <link rel="stylesheet" href="back_end/instantMessaging/chatroom.css" type="text/css" /> -->
<style type="text/css">

body {
	background: #F7F6F2;
	margin-left: -50px;
}

.main-content .panel {
/* 	float: right; */
	border: 2px solid #0078ae;
	border-radius: 5px;
	width: 100%;
}
/* 對話視窗 */
.main-content .message-area {
	height: 70vh;
	resize: none;
	box-sizing: border-box;
	overflow: auto;
	background-color: #ffffff;
	word-break: break-all;
}

.main-content .input-area {
	background: #30504F;
	box-shadow: inset 0 0 10px #00568c;
}

.main-content .input-area input {
	margin: 0.5em 0em 0.5em 0.5em;
}

.main-content .text-field {
	border: 0px solid grey;
	padding: 0.5em;
	box-shadow: 0 0 5px #000000;
}

.main-content h1 {
	font-size: 1.5em;
	padding: 5px;
	margin: 5px;
}

.main-content #message {
	min-width: 50%;
	max-width: 60%;
}

.main-content .statusOutput {
	background: #D1E6E6;
	text-align: center;
	color: black;
	border: 1px solid grey;
	padding: 0.5em;
	box-shadow: 0 0 5px #000000;
	width: 50%;
	margin: auto;
	border-radius: 30px;
	cursor: not-allowed;
	-webkit-user-select:none;
}

.main-content #row {
/* 	float: left; */
	width: 100%;
	heigh: 100%;
}

.main-content .column {
/* 左邊好友列表 */
  margin: 15% 0 0 0;
  width: 100%; 
  heigh: 100%;
  padding: 5%;
  margin-bottom: 5px;
  background-color: #D1E6E6;
  text-align: center;
  border-radius:40px;
  cursor: pointer;
}

.main-content ul{
  list-style: none;
  margin: 0;
  padding: 0;
}

.main-content ul li{
  display:inline-block;
  clear: both;
  padding: 20px;
  border-radius: 30px;
  margin-bottom: 2px;
  font-family: Helvetica, Arial, sans-serif;
  font-size:20px;
}

  .friend{
  float: left; 
  background: #D1E6E6;
  color: black;
  border-bottom-top-radius: 5px;
}

  .me{
  float: right; 
  background: #93FF93;
  color: black;
  border-bottom-top-radius: 5px;
}



</style>
<title>客服聊天室</title>
</head>
<body onload="connect();" onunload="disconnect();" >
<%@ include file="/backend/header.file" %> <!-- Header -->
<%@ include file="/backend/sidebar.file" %> <!-- sidebar -->
	<div class="main-content d-flex justify-content-around">
		<div class="col-3">
			<div id="row"></div>
		</div>
		<div class="col-8">
			<h3 id="statusOutput" class="statusOutput">請選擇聊天對象</h3>
			<div id="messagesArea" class="panel message-area" ></div>
			<div class="panel input-area">
				<input id="message" size=100 class="text-field" type="text" placeholder="請輸入..." onkeydown="if (event.keyCode == 13) sendMessage();" /> 
<!-- 				<input type="submit" id="sendMessage" class="button" value="Send" onclick="sendMessage();" />  -->
				<button type="submit" class="btn btn-rounded btn-secondary" onclick="sendMessage();" ><span
					class="btn-icon-start text-secondary"><i class='bx bxs-share'></i>
				</span>送出</button>
				
<!-- 				<input type="button" id="connect" class="button" value="Connect" onclick="connect();" />  -->
<!-- 				<input type="button" id="disconnect" class="button" value="離開" onclick="disconnect();" /> -->
			</div>
		</div>
	</div>
	<%@ include file="/backend/commonJS.file" %>
</body>
<script>
	var MyPoint = "/FriendWS/MEMORY客服";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	var statusOutput = document.getElementById("statusOutput");
	var messagesArea = document.getElementById("messagesArea");
	var self = 'MEMORY客服';
	var webSocket;

	function connect() {
		// create a websocket
		webSocket = new WebSocket(endPointURL);

		webSocket.onopen = function(event) {
			console.log("Connect Success!");
			document.getElementById('sendMessage').disabled = false;
			document.getElementById('connect').disabled = true;
			document.getElementById('disconnect').disabled = false;
		};

		webSocket.onmessage = function(event) {
			var jsonObj = JSON.parse(event.data);			
			if ("open" === jsonObj.type) {
				refreshFriendList(jsonObj);
			} else if ("history" === jsonObj.type) {
				messagesArea.innerHTML = '';
				var ul = document.createElement('ul');
				ul.id = "area";
				messagesArea.appendChild(ul);
				// 這行的jsonObj.message是從redis撈出跟好友的歷史訊息，再parse成JSON格式處理
				var messages = JSON.parse(jsonObj.message);
				for (var i = 0; i < messages.length; i++) {
					var historyData = JSON.parse(messages[i]);
					var showMsg = historyData.message;
					var li = document.createElement('li');
					// 根據發送者是自己還是對方來給予不同的class名, 以達到訊息左右區分
					historyData.sender === self ? li.className += 'me' : li.className += 'friend';
					li.innerHTML = showMsg;
					ul.appendChild(li);
				}
				messagesArea.scrollTop = messagesArea.scrollHeight;
			} else if ("chat" === jsonObj.type) {
				var li = document.createElement('li');
				jsonObj.sender === self ? li.className += 'me' : li.className += 'friend';
				li.innerHTML = jsonObj.message;
				console.log(li);
				document.getElementById("area").appendChild(li);
				messagesArea.scrollTop = messagesArea.scrollHeight;
			} else if ("close" === jsonObj.type) {
				refreshFriendList(jsonObj);
			}
			
		};

		webSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}
	
	function sendMessage() {
		var inputMessage = document.getElementById("message");
		var friend = statusOutput.textContent;
		var message = inputMessage.value.trim();

		if (message === "") {
			alert("Input a message");
			inputMessage.focus();
		} else if (friend === "") {
			alert("Choose a friend");
		} else {
			var jsonObj = {
				"type" : "chat",
				"sender" : self,
				"receiver" : friend,
				"message" : message
			};
			webSocket.send(JSON.stringify(jsonObj));
			inputMessage.value = "";
			inputMessage.focus();
		}
	}
	
	// 有好友上線或離線就更新列表
	function refreshFriendList(jsonObj) {
		var friends = jsonObj.users;
		var row = document.getElementById("row");
		row.innerHTML = '';
		for (var i = 0; i < friends.length; i++) {
			if (friends[i] === self) { continue; }
			row.innerHTML +='<div id=' + i + ' class="column col-12" name="friendName" value=' + friends[i] + ' ><h2>' + friends[i] + '</h2></div>';
		}
		addListener();
	}
	// 註冊列表點擊事件並抓取好友名字以取得歷史訊息
	function addListener() {
		var container = document.getElementById("row");
		container.addEventListener("click", function(e) {
			var friend = e.srcElement.textContent;
			updateFriendName(friend);
			var jsonObj = {
					"type" : "history",
					"sender" : self,
					"receiver" : friend,
					"message" : "",
				
				};
			webSocket.send(JSON.stringify(jsonObj));
		});
	}
	
	function disconnect() {
		webSocket.close();
		document.getElementById('sendMessage').disabled = true;
		document.getElementById('connect').disabled = false;
		document.getElementById('disconnect').disabled = true;
	}
	
	function updateFriendName(name) {
		statusOutput.innerHTML = name;
	}
	$("#pagename").text("客服即時通");
</script>
</html>