
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
	Surewin
</div>


<!--  notification button to tigger the counter
		<div class="notif">notify me</div>
    <div class="notif-bot-cnt"></div>
    -->
</head>
