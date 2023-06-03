<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.ProductSell" %>
<%@ page import="com.chengxusheji.po.ProductOrder" %>
<%@ page import="com.chengxusheji.po.ProductClass" %>
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取所有的productClassObj信息
    List<ProductClass> productClassList = (List<ProductClass>)request.getAttribute("productClassList");
    //获取所有的userObj信息
    List<UserInfo> userInfoList = (List<UserInfo>)request.getAttribute("userInfoList");
    ProductSell productSell = (ProductSell)request.getAttribute("productSell");
    List<ProductOrder> productOrderList = (ArrayList<ProductOrder>)request.getAttribute("productOrderList");

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <TITLE>宠物预售-<%=productSell.getProductName() %></TITLE>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/animate.css" rel="stylesheet"> 
</head>
<body style="margin-top:70px;"> 
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
	<ul class="breadcrumb">
  		<li><a href="<%=basePath %>index.jsp">首页</a></li>
  		<li><a href="<%=basePath %>ProductSell/frontlist">宠物预售信息</a></li>
  		<li class="active">详情查看</li>
	</ul>
	
	<div class="row bottom15"> 
		<div class="col-md-12 col-xs-10 text-left bold"> 
			<!--- 百度分享代码开始 -->
			<div class="bdsharebuttonbox" style="margin-bottom:8px;"><span style="float:left;text-align:right;font-weight:bold">如果你对本页面感兴趣可以分享到：</span><span><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></span></div>
			<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
			<!--- 百度分享代码结束 -->  
		</div> 
	</div>
	
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">出售id:</div>
		<div class="col-md-10 col-xs-6"><%=productSell.getSellId()%></div>
	</div>
	
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">宠物主图:</div>
		<div class="col-md-10 col-xs-6"><img class="img-responsive" src="<%=basePath %><%=productSell.getProductPhoto() %>"  border="0px"/></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">宠物名称:</div>
		<div class="col-md-10 col-xs-6"><%=productSell.getProductName()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">宠物类别:</div>
		<div class="col-md-10 col-xs-6"><%=productSell.getProductClassObj().getProductClassName() %></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">交易地点:</div>
		<div class="col-md-10 col-xs-6"><%=productSell.getPublish()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">宠物品种:</div>
		<div class="col-md-10 col-xs-6"><%=productSell.getAuthor()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">出售价格:</div>
		<div class="col-md-10 col-xs-6"><%=productSell.getSellPrice()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">宠物年龄:</div>
		<div class="col-md-10 col-xs-6"><%=productSell.getXjcd()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">出售说明:</div>
		<div class="col-md-10 col-xs-6"><%=productSell.getSellDesc()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">发布用户:</div>
		<div class="col-md-10 col-xs-6"><%=productSell.getUserObj().getName() %></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">用户发布时间:</div>
		<div class="col-md-10 col-xs-6"><%=productSell.getAddTime()%></div>
	</div>
	<div class="row bottom15">
		<div class="col-md-2 col-xs-4"></div>
		<div class="col-md-6 col-xs-6">
			<a href="<%=basePath %>ProductOrder/productOrder_frontUserAdd.jsp?sellId=<%=productSell.getSellId() %>" class="btn btn-primary">我想买</a>
			<button onclick="history.back();" class="btn btn-info">返回</button>
		</div>
	</div>
	
	
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold"></div>
		<div class="col-md-8 col-xs-7">
			<% for(ProductOrder productOrder: productOrderList) { %>
			<div class="row" style="margin-top: 20px;">
				<div class="col-md-2 col-xs-3">
					<div class="row text-center"><img src="<%=basePath %><%=productOrder.getUserObj().getUserPhoto() %>" style="border: none;width:60px;height:60px;border-radius: 50%;" /></div>
					<div class="row text-center" style="margin: 5px 0px;"><%=productOrder.getUserObj().getUser_name() %></div>
				</div>
				<div class="col-md-7 col-xs-5"><font color="red">出价:¥<%=productOrder.getPrice() %></font>&nbsp;&nbsp;<%=productOrder.getOrderMemo() %></div>
				<div class="col-md-3 col-xs-4" ><%=productOrder.getAddTime() %></div>
			</div>
		
			<% } %>
		 
		</div>
	</div>
	
	
</div> 
<jsp:include page="../footer.jsp"></jsp:include>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script>
var basePath = "<%=basePath%>";
$(function(){
        /*小屏幕导航点击关闭菜单*/
        $('.navbar-collapse a').click(function(){
            $('.navbar-collapse').collapse('hide');
        });
        new WOW().init();
 })
 </script> 
</body>
</html>

