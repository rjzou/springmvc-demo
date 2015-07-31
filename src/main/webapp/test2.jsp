<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Enlarge.js - ABELCODE</title>
        <meta name="keywords" content="Enlarge, Enlarge.js, JavaScript 插件, 图片放大, 放大镜, 局部放大"/>
        <meta name="description" content="Enlarge 是一个基于 jQuery 的插件，可以非常方便地实现图放大镜的效果，适用于大多数商品类网站，例如在线商城、电子商务、企业产品介绍等。"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="http://www.abelcode.com/style/common.css">
        <link rel="stylesheet" type="text/css" href="http://www.abelcode.com/style/prettify.css">
        <link rel="stylesheet" type="text/css" href="http://www.abelcode.com/style/page-enlarge.css">
        <style type = "text/css">
/*水平翻转*/
.flipx {
    -moz-transform:scaleX(-1);
    -webkit-transform:scaleX(-1);
    -o-transform:scaleX(-1);
    transform:scaleX(-1);
    filter:FlipH();
}
/*垂直翻转*/
.flipy {
    -moz-transform:scaleY(-1);
    -webkit-transform:scaleY(-1);
    -o-transform:scaleY(-1);
    transform:scaleY(-1);
    filter:FlipV();
}
/*顺时针旋转90度*/
.rotate90 {
   filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=1);
   -moz-transform: rotate(90deg);
   -o-transform: rotate(90deg);
   -webkit-transform: rotate(90deg);
   transform: rotate(90deg);
   width:500px;
   height:500px;
}
/*顺时针旋转180度*/
.rotate180 {
   filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=2);
   -moz-transform: rotate(180deg);
   -o-transform: rotate(180deg);
   -webkit-transform: rotate(180deg);
   transform: rotate(180deg);
}
/*顺时针旋转270度*/
.rotate270 {
   filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
   -moz-transform: rotate(270deg);
   -o-transform: rotate(270deg);
   -webkit-transform: rotate(270deg);
   transform: rotate(270deg);
}
</style>
    </head>
    <body>
    	<div id="wrap">
        	<div id="nav">
            	<h1 id="logo">
                	<a href="http://www.abelcode.com/" title="Code by Abel">ABELCODE</a>
                </h1>
                <ul id="menu">
                	<li class="active"><a href="http://www.abelcode.com/" title="项目、作品">项目、作品</a></li><li><a href="http://www.abelcode.com/about/" title="关于、联系">关于、联系</a></li>
                </ul>
            </div>
            <div id="content">
                <div class="item">
                    <h2>演示：</h2>
                    <div class="entry">
                    	<div class="enlarge-demo">
                        	<a href="http://www.abelcode.com/picture/enlarge/demo.jpg" id="demo1">
                            	<img id="Imgbox" src="http://www.abelcode.com/picture/enlarge/demo!small.jpg">
                            </a>
                            <p>将鼠标移到图片上试试 :)</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <h2>使用</h2>
                    <div class="entry">
                    	<input type="button" value="向右旋转" onclick="test();">
                    </div>
                </div>
            </div>
        </div>
        <script src="http://www.abelcode.com/js/jquery-1.10.2.min.js"></script>
        <script src="http://www.abelcode.com/js/prettify.js"></script>
        <script src="http://www.abelcode.com/js/jquery.enlarge.min.js"></script>
        <script src="http://www.abelcode.com/js/page-enlarge.js"></script>
        
         <script type="text/javascript">
      	function test(){
            $('#Imgbox').attr('class', 'rotate90');
        }
        </script>
    </body>
</html>