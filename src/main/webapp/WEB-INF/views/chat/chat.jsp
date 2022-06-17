<%@ page import="yw.basket.dto.UserDTO" %>
<%@ page import="yw.basket.dto.ChatDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 김용우
  Date: 2022-06-17
  Time: 오후 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    UserDTO uDTO = (UserDTO) request.getAttribute("uDTO");
    if(uDTO == null) {
        uDTO = new UserDTO();
    }
    String userId = uDTO.getUserId();
    String userName = uDTO.getUserName();

    List<ChatDTO> chatList = (List<ChatDTO>) request.getAttribute("chatList");
    if(chatList == null) {
        chatList = new ArrayList<>();
    }
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Spring Boot WebSocket Chat Application</title>
    <link rel="stylesheet" href="/css/main.css" />
</head>
<body>

<%--<div id="username-page">--%>
<%--    <div class="username-page-container">--%>
<%--        <h1 class="title">이름을 입력하세요</h1>--%>
<%--        <form id="usernameForm" name="usernameForm">--%>
<%--            <div class="form-group">--%>
<%--                <input type="text" id="name" placeholder="Username" autocomplete="off" class="form-control" />--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <button type="submit" class="accent username-submit">채팅 시작하기</button>--%>
<%--            </div>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</div>--%>

<div id="chat-page" class="">
    <div class="chat-container">
        <div class="chat-header">
            <h2>Basket Chat</h2>
        </div>
        <div class="connecting">
            연결중...
        </div>
        <ul id="messageArea">

        </ul>
        <form id="messageForm" name="messageForm">
            <div class="form-group">
                <div class="input-group clearfix">
                    <input type="text" id="message" placeholder="Type a message..." autocomplete="off" class="form-control"/>
                    <button type="submit" class="primary">보내기</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
    // let usernamePage = document.querySelector('#username-page');
    let chatPage = document.querySelector('#chat-page');
    let usernameForm = document.querySelector('#usernameForm');
    let messageForm = document.querySelector('#messageForm');
    let messageInput = document.querySelector('#message');
    let messageArea = document.querySelector('#messageArea');
    let connectingElement = document.querySelector('.connecting');

    let stompClient = null;
    let username = "<%= userName%>";
    let userId = "<%=userId%>";

    let colors = [
        '#2196F3', '#32c787', '#00BCD4', '#ff5652',
        '#ffc107', '#ff85af', '#FF9800', '#39bbb0'
    ];

    // function connect(event) {
    //     username = document.querySelector('#name').value.trim();
    //
    //     if(username) {
    //         usernamePage.classList.add('hidden');
    //         chatPage.classList.remove('hidden');
    //
    //         let socket = new SockJS('/ws');
    //         stompClient = Stomp.over(socket);
    //
    //         stompClient.connect({}, onConnected, onError);
    //     }
    //     event.preventDefault();
    // }

    window.onload = function() {
        let socket = new SockJS('/ws');
        stompClient = Stomp.over(socket);

        stompClient.connect({}, onConnected, onError);

        <%
            for(ChatDTO cDTO : chatList) {
                String senderName = cDTO.getChatName();
                String message = cDTO.getChatContents();
        %>
            messageElement = document.createElement('li');

            messageElement.classList.add('chat-message');

            avatarElement = document.createElement('i');
            avatarText = document.createTextNode('<%=senderName%>'[0]);
            avatarElement.appendChild(avatarText);
            avatarElement.style['background-color'] = getAvatarColor('<%=senderName%>');

            messageElement.appendChild(avatarElement);

            usernameElement = document.createElement('span');
            usernameText = document.createTextNode('<%=senderName%>');
            usernameElement.appendChild(usernameText);
            messageElement.appendChild(usernameElement);

            textElement = document.createElement('p');
            messageText = document.createTextNode('<%=message%>');
            textElement.appendChild(messageText);

            messageElement.appendChild(textElement);

            messageArea.appendChild(messageElement);
        <%
            }
        %>
    }

    window.addEventListener('beforeunload', function() {
        let chatMessage = {
            senderId: userId,
            sender: username,
            content: username + '님이 퇴장하셨습니다.',
            type: 'LEAVE'
        };
        stompClient.send("/app/chat.leftUser", {}, JSON.stringify(chatMessage));

    });


    function onConnected() {
        // Subscribe to the Public Topic
        stompClient.subscribe('/topic/public', onMessageReceived);

        // Tell your username to the server
        stompClient.send("/app/chat.addUser",
            {},
            JSON.stringify({senderId: userId, sender: username, content: username + '님이 입장하였습니다.', type: 'JOIN'})
        )

        connectingElement.classList.add('hidden');
    }


    function onError(error) {
        connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
        connectingElement.style.color = 'red';
    }


    function sendMessage(event) {
        let messageContent = messageInput.value.trim();
        if(messageContent && stompClient) {
            let chatMessage = {
                senderId: userId,
                sender: username,
                content: messageInput.value,
                type: 'CHAT'
            };
            stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(chatMessage));
            messageInput.value = '';
        }
        event.preventDefault();
    }


    function onMessageReceived(payload) {
        let message = JSON.parse(payload.body);

        let messageElement = document.createElement('li');

        if(message.type === 'JOIN') {
            messageElement.classList.add('event-message');
            message.content = message.sender + ' joined!';
        } else if (message.type === 'LEAVE') {
            messageElement.classList.add('event-message');
            message.content = message.sender + ' left!';
        } else {
            messageElement.classList.add('chat-message');

            let avatarElement = document.createElement('i');
            let avatarText = document.createTextNode(message.sender[0]);
            avatarElement.appendChild(avatarText);
            avatarElement.style['background-color'] = getAvatarColor(message.sender);

            messageElement.appendChild(avatarElement);

            let usernameElement = document.createElement('span');
            let usernameText = document.createTextNode(message.sender);
            usernameElement.appendChild(usernameText);
            messageElement.appendChild(usernameElement);
        }

        let textElement = document.createElement('p');
        let messageText = document.createTextNode(message.content);
        textElement.appendChild(messageText);

        messageElement.appendChild(textElement);

        messageArea.appendChild(messageElement);
        messageArea.scrollTop = messageArea.scrollHeight;
    }


    function getAvatarColor(messageSender) {
        let hash = 0;
        for (let i = 0; i < messageSender.length; i++) {
            hash = 31 * hash + messageSender.charCodeAt(i);
        }
        let index = Math.abs(hash % colors.length);
        return colors[index];
    }

    // usernameForm.addEventListener('submit', connect, true)
    messageForm.addEventListener('submit', sendMessage, true)
</script>
</body>
</html>
