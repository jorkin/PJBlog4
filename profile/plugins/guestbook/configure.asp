<%
define(function(){
});
%>

<div class="ui-table ui-table-custom">
<table cellspacing="0" class="table">
<!-- cellspacing='0' is important, must stay -->
<tbody>
	<tr>
		<th width="30">编号</th>
		<th width="100">用户名</th>
		<th width="100">邮箱</th>
		<th width="250">留言内容</th>
		<th width="80">时间</th>
		<th width="80">IP</th>
		<th width="80">网址</th>
		<th width="30">审核</th>
		<th width="30">管理</th>
	</tr>
	<!-- Table Header -->
<%
var dbo = require("DBO"),
	connecte = require("openDataBase"),
	__date = require("DATE"),
	_page = http.get("page"),
	_p = http.get("p"),
	_id = http.get("id"),
	_top=config.plugin.setting.top?Number(config.plugin.setting.top)||10:10,
	_date=config.plugin.setting.date?config.plugin.setting.date||"y-m-d h:i:s":"y-m-d h:i:s",
	pageInfo = [];
	if (_page.length === 0)
	{
		_page = 1;
	}
	else{
		_page = Number(_page);
	}
	if ( _page < 1 ){
		_page = 1;
	}
	if ( connecte === true ){
		var categoryBeyondArray = {};
		dbo.trave({
			conn: config.conn,
			sql: "Select * From blog_guestbook Order By id DESC",
			callback: function(rs){
				if ( !(rs.Bof || rs.Eof) ){
					pageInfo = this.serverPage(_page, _top, function(i){
						var even = "";
						if ( (i + 1) % 2 === 0 ){
							even = ' class="even"';
						}
%>
	<tr<%=even%>>
		<td><%=this("id").value%></td>
		<td><%=this("bookusername").value%></td>
		<td><%=this("bookusermail").value%></td>
		<td><%=this("bookcontent").value%></td>
		<td><%=__date.format(this("bookposttime").value,_date)%></td>
		<td><%=this("bookpostip").value%></td>	
		<td><%=this("bookwebsite").value%></td>
		<td><a href="javascript:;" data-id="<%=this("id").value%>" class="action-aduit"><%if (this("bookaduit").value === true){%><span style="color:#0000FF">√</span><%}else{%><span style="color:#FF0000">×</span><%}%></a></td>
		<td><a href="javascript:;" data-id="<%=this("id").value%>" class="action-del">删除</a></td>
	</tr>
<%	
					});
				}else{
%>
	<tr><td colspan="9">亲,PJ需要用心来经营，快来叫你们朋友来抢楼吧。</td></tr>
<%
				}
			}
		});
	}else{
%>
	<tr><td colspan="9">数据库连接失败，请检查数据库连接配置文件。</td></tr>
<%		
	}
%>
</tbody>
</table>
</div>
<%
	if ( pageInfo.length > 0 ){
		if ( pageInfo[3] > 1 ){
			console.log('<div class="pagebar fn-clear"><span class="fn-left join"></span>');
			var fns = require.async("fn"),
				pages = fns.pageAnalyze(pageInfo[2], pageInfo[3], 9);
				
			fns.pageOut(pages, function(i, isCurrent){
				if ( isCurrent === true ){
					console.log('<span class="fn-left pages">' + i + '</span>');
				}else{
					console.log('<a href="?p=article&page=' + i + '&c=' + _cate + '" class="fn-left pages">' + i + '</a>');
				}
			});
			console.log('</div>');
		}
	}
%>
<%
//});
//console.log(JSON.stringify(config.plugin));
%>
<script type="text/javascript">
var foler = '<%=config.plugin.folder%>';
</script>
<link rel="stylesheet" href="<%=config.plugin.folder%>/system.css" type="text/css" />
