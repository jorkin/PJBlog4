<%
define(function(require, exports, module){
	if ( config.plugin.deleteCategory("category") ){
		config.plugin.deleteThemeFiles(["links.asp", "js/links.js"]);
		config.plugin.deleteStyleFiles(["links.css","linkxlogo.jpg"]);
	}
});
%>