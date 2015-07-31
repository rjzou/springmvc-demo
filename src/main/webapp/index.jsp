<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" http://www.w3.org/TR/html4/loose.dtd>
<html xmlns="http://www.w3.org/1999/xhtml" >
<title></title>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<script src="http://www.abelcode.com/js/jquery-1.10.2.min.js"></script>  
 <script src="http://www.abelcode.com/js/jquery.enlarge.min.js"></script>
</head>
<body>


<a href="#" id="demo1">
      <img src="http://www.abelcode.com/picture/enlarge/demo!small.jpg">
</a>


<script type="text/javascript">
$("#demo1").enlarge(
{
    // 鼠标遮罩层样式
    shadecolor: "#FFD24D",
    shadeborder: "#FF8000",
    shadeopacity: 0.5,
    cursor: "move",

    // 大图外层样式
    layerwidth: 400,
    layerheight: 300,
    layerborder: "#DDD",
    fade: true,

    // 大图尺寸
    largewidth: 1280,
    largeheight: 960
});
</script>
</body>

</html>
