<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title>CSS样式+js图片旋转</title>
</head>
<body style="background-color: #dc5b45;">
<br><br>
<div style="margin: 0px auto; text-align: center; width: 980px;">
    <img id="img" src="./fxlogo.png" />
</div>
</body>
<script type="text/javascript">
    function getName(){ //获取浏览器名
        if(navigator.userAgent.indexOf("MSIE")>0) { return "MSIE";}
        if(isFirefox=navigator.userAgent.indexOf("Firefox")>0){return "Firefox";}
        if(isSafari=navigator.userAgent.indexOf("Safari")>0) { return "Safari";}
        if(isCamino=navigator.userAgent.indexOf("Camino")>0){return "Camino";}
        if(isMozilla=navigator.userAgent.indexOf("Gecko/")>0){return "Gecko";}
    }
    var version = getName(),CssCode;
    if(version == 'MSIE'){ CssCode = '-ms-';}
    if(version == 'Firefox'){ CssCode = '-moz-';}
    if(version == 'Safari'){ CssCode = '-webkit-';} //chrome 一样
    if(version != 'MSIE' && version != 'Firefox' && version != 'Safari'){ CssCode = '-o-';}//Opera
    var Du = 0;
    function fransform(){
        Du++;
        var Objnode = document.getElementById('img');
        Objnode.setAttribute('style',''+CssCode+'transform:rotate('+ Du +'deg); '+CssCode+'transform-origin: 50% 50%;');
        if(Du == 360){ Du = 0; }
    }
    setInterval(fransform,1);
</script>
</html>