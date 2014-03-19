<%@page import="model.*, java.util.*"%>
<%
	
	String errorMsg = request.getParameter("errMsg");
	if(errorMsg == null){
		errorMsg = "";
	}

	user normalUser = (user)session.getAttribute("authenticated");
		
	if (normalUser == null) {
			response.sendRedirect("mainPage.jsp");
			return;
	}	
%>

<!DOCTYPE html>

<html>

<%@include file="common/header.jsp"%>

<head>
<!--  
<script type="text/javascript">(function() {
  var streaming = false,
      video        = document.querySelector('#video'),
      canvas       = document.querySelector('#canvas'),
      photo        = document.querySelector('#photo'),
      startbutton  = document.querySelector('#startbutton'),
      width = "300",
      height = "200";

  navigator.getMedia = ( navigator.getUserMedia ||
                         navigator.webkitGetUserMedia ||
                         navigator.mozGetUserMedia ||
                         navigator.msGetUserMedia);

  navigator.getMedia(
    {
      video: true,
      audio: false
    },
    function(stream) {
      if (navigator.mozGetUserMedia) {
        video.mozSrcObject = stream;
      } else {
        var vendorURL = window.URL || window.webkitURL;
        video.src = vendorURL.createObjectURL(stream);
      }
      video.play();
    },
    function(err) {
      console.log("An error occured! " + err);
    }
  );

  video.addEventListener('canplay', function(ev){
    if (!streaming) {
      height = video.videoHeight / (video.videoWidth/width);
      video.setAttribute('width', width);
      video.setAttribute('height', height);
      canvas.setAttribute('width', width);
      canvas.setAttribute('height', height);
      streaming = true;
    }
  }, false);

  function takepicture() {
    canvas.width = width;
    canvas.height = height;
    canvas.getContext('2d').drawImage(video, 0, 0, width, height);
    var data = canvas.toDataURL('image/png');
    photo.setAttribute('src', data);
  }

  startbutton.addEventListener('click', function(ev){
      takepicture();
    ev.preventDefault();
  }, false);

})();</script>
-->
</head>
<body>


<div class="container" style=" width: 100%; height: 100%;" align = "center">
	<!-- sound system -->
	<!--  
	<embed height="1" width="1" src="media/cameraShutter.mp3" type="audio/mpeg">
	-->
	<object height="1" width="1" data="media/cameraShutter.mp3"></object>
	
	<img border="0" src="/image/4D.gif" width="280" height="400">
	</br>
	<button type="button" id="startbutton" style=" width: 100px; height: 50px;" class="btn btn-default btn-info btn-lg" onclick="window.location='/Match-Main.jsp';">Back</button>
	<button type="button" style=" width: 100px; height: 50px;" class="btn btn-default btn-success btn-lg" onclick="window.location='/Match-captured4D.jsp';">Submit</button>

</div>

</body>
</html>