<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>The Title</title>

        <link type="text/css" rel="stylesheet" href="bootstrap/css/style.css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    </head>
 
    <body>
    
     <script>
        $(function(){ 
            var thetitle = $('title').text();
            $('.notif').click(function(){

                var countNotif = parseInt($('.counter').text());    
                var newcountNotif = ++countNotif;
                $('#msg-icon').removeClass('msg-icon').addClass('msg-iconh');
                $('.counter').text(newcountNotif).show();
                $('title').text('('+newcountNotif+') '+thetitle);

                 jQuery('<div/>', {
                    id: 'notif-bot',
                    class : 'notif-bot alert alert-info',
                    text: 'You just got a notification!'
                    }).appendTo('.notif-bot-cnt')
                        .delay(5000)
                        .fadeOut();
            });

            $('#msg-icon').click(function(){
                $('this').removeClass('msg-iconh').addClass('msg-icon');
                $('.counter').text('0').hide();
                $('.notif-bot').hide();
                $('title').text(thetitle);
            })
        });
     </script>

     <div class="fb-bar">
        <div id="msg-icon" class="msg-icon">
            <id class="counter" style="display:none">0</id>
        </div>

     </div>
        
    <div class="notif">notify me</div>
    <div class="notif-bot-cnt"></div>

</body>
</html>