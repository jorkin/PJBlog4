<!--#include file="config.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta property="qc:admins" content="04426474743633" />
<title>无标题文档</title>
</head>

<body>
<%
require("status");

if ( config.user.login === true ){
	console.log('您已登入 <a href="server/logout.asp">退出登入</a>');
}else{
	var oauth = require("server/oAuth/qq/oauth"),
		fn = require("fn");
		
	console.log('<a href="' + oauth.url("100299901", "http://lols.cc/server/oauth.asp?type=qq&dir=" + escape( fn.localSite() )) + '">登入</a>');
}

//require(["XML"], function(xml){
//	var _object = xml.load("1.xml");
//	var x = xml("t c", _object.root, _object.object);
//	
//	x.first().create("evio").html("<span>evio is good</span>");
//
//	x.save("2.xml");
//
////	for ( var i = 0 ; i < x.length ; i++ ){
////		console.push(xml.type(x[i]) + "<br />");
////	}
//	//console.debug();
//});

//require(["PACKAGE"], function(package){
//	package.merge(".", "3.xml", function(name){
//		return name.replace(/^\.\//, "");
//	});
//	package.separate("3.xml", "test");
//});

require(["openDataBase", "cache"], function(base, cache){
	if (base === true && cache !== null){
		var arr = cache.load("global");
		console.push(arr);
		console.debug();
	}else{
		console.push("cache handle file not be ready.");
		console.debug();
	}
});

%>
<form action="server/upload.asp" method="post" enctype="multipart/form-data" accept-charset="ascii" onsubmit="document.charset='ascii';">
<input type="file" name="file" value="" />
<input type="file" name="file2" value="" />
<input type="text" name="file3" value="沈赟杰" />
<input type="submit" value="submit" />
</form>
</body>
</html>
