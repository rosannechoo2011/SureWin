<%@page import="model.*, java.util.*"%>

<%
String notification = request.getParameter("notification");
if(notification == null || notification.equals("")){
notification = "";
}
%>

<head>
<meta http-equiv="content-type" content="text/html;charset=iso-8859-1" />
<meta name="author" content="www.frebsite.nl" />
<meta name="viewport"
	content="width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes" />

<title>SureWin</title>

<link type="text/css" rel="stylesheet" href="responsive/css/demo.css" />
<link type="text/css" rel="stylesheet"
	href="responsive/css/jquery.mmenu.all.css" />
<style type="text/css">
.mm-menu li.img a {
	font-size: 16px;
}

.mm-menu li.img a img {
	float: left;
	margin: -5px 10px -5px 0;
}

.mm-menu li.img a small {
	font-size: 12px;
}
</style>

<!-- Jquery core CSS -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/hammer.js/1.0.5/jquery.hammer.min.js"></script>
<script type="text/javascript"
	src="responsive/js/jquery.mmenu.min.all.js"></script>

<!-- Bootstrap core CSS -->
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- this is for the notification -->
<link type="text/css" rel="stylesheet" href="bootstrap/css/style.css">

<!-- Bootstrap core JS -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>



<!-- Javascript for left and right menu -->
<script type="text/javascript">
	//	The menu on the left
	$(function() {
		$('nav#menu-left').mmenu();
	});

	//	The menu on the right
	$(function() {

		var $menu = $('nav#menu-right');

		$menu.mmenu({
			position : 'right',
			classes : 'mm-light',
			dragOpen : true,
			labels : {
				fixed : !$.mmenu.support.touch
			},
			header : {
				add : true,
				update : true,
				title : 'Notification'
			}
		});

		//	Click a menu-item
		var $confirm = $('#confirmation');
		$menu.find('li a').not('.mm-subopen').not('.mm-subclose').bind(
				'click.example',
				function(e) {
					e.preventDefault();
					$confirm.show().text(
							'You clicked "' + $.trim($(this).text()) + '"');
					$('#menu-right').trigger('close');
				});
	});
</script>

<!-- Javascript for notification -->
<script>
	$(function() {
		var thetitle = $('title').text();
		$('.notif').click(function() {

			var countNotif = parseInt($('.counter').text());
			var newcountNotif = ++countNotif;
			$('#msg-icon').removeClass('msg-icon').addClass('msg-iconh');
			$('.counter').text(newcountNotif).show();
			$('title').text('(' + newcountNotif + ') ' + thetitle);

			jQuery('<div/>', {
				id : 'notif-bot',
				class : 'notif-bot alert alert-info',
				text : 'You just got a notification!'
			}).appendTo('.notif-bot-cnt').delay(5000).fadeOut();
		});

		$('#msg-icon').click(function() {
			$('this').removeClass('msg-iconh').addClass('msg-icon');
			$('.counter').text('1').hide();
			$('.notif-bot').hide();
			$('title').text(thetitle);
		})
	});
</script>

<!-- Navigation bar -->
<div id="header">
	<a href="#menu-left"></a> SureWin <a href="#menu-right"
		class="friends right">
	
		<%
		//there is notification
		if(!notification.equals("")){
		%>
		<img src="image/notification_icon2_new.png" width="60" height="60" align="top">	
		<%}else{ %>
		<img src="image/notification_icon2.png" width="40" height="30" align="top">		
		<%} %>
	<!-- 	<img src="image/notification_icon2_!.png" width="60" height="60" align="top">		
	
		<div id="msg-icon" class="msg-icon">
			<id class="counter" style="display:none">1</id>
		</div>
		 -->
	</a>
</div>

<nav id="menu-left">
	<ul>
		<li class="Selected"><a href="User-MainPage.jsp"><img src="image/Rosanne.png" width="60" height="60"> Rosanne Choo</a></li>
		<li><a href="Bet-enter4DDetails.jsp">4D Betting</a></li>
		<li><a href="Match-Main.jsp">4D Match</a></li>
		<li><a href="Result-mainPage.jsp">4D Results</a></li>
		<li><a href="Dashboard-Odds.jsp">4D Results analytics</a></li>
		<li><a href="LuckyScratch-CameraView.jsp">4D Number generator</a></li>
		<li><a href="User-Settings.jsp">Account setting</a></li>
		<li><a href="processLogout.do">Logout</a></li>
	</ul>
</nav>
<nav id="menu-right">
	<% 
	user normalUser2 = (user)session.getAttribute("authenticated");
		
	if (normalUser2 == null) {
			response.sendRedirect("mainPage.jsp");
			return;
	}
	notificationDataManager nDM = new notificationDataManager();
	ArrayList aList = (ArrayList)nDM.retrieveAllUserNotification(normalUser2.getUsername());
	%>
	<ul>
	<%for(int i=0;i<aList.size();i++){ 
		notification noti = (notification)aList.get(i);
	%>
		<li><a href="index.html"><%= noti.getMessage()%></a></li>
		
		<%} %>
	</ul>
</nav>

<!--  notification button to tigger the counter
		<div class="notif">notify me</div>
    <div class="notif-bot-cnt"></div>
    -->
</head>
