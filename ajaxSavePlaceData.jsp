<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>

<%@include file="00_constants.jsp"%>
<%@include file="00_utility.jsp"%>

<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");
response.setHeader("Pragma","no-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0); 

out.clear();	//注意，一定要有out.clear();，要不然client端無法解析XML，會認為XML格式有問題

/*********************開始做事吧*********************/

//String	sType		= "";
String	sLogPerson	= "";
String	sLogPlace	= "";
String	ss			= "";
//JSON	json		= null;


sLogPerson	= request.getParameter("logperson");
sLogPlace	= request.getParameter("logplace");
/*
if (beEmpty(sType)){
	ss = ComposeXMLResponse(gcResultCodeParametersNotEnough, gcResultTextParametersNotEnough, "");
	//json = new XMLSerializer().read( ss );
	//out.println(json.toString());
	out.println(ss);
	return;
}
*/

//writeToFile(sType);

Hashtable	ht					= new Hashtable();
String		sResultCode			= gcResultCodeSuccess;
String		sResultText			= gcResultTextSuccess;
String		s[][]				= null;
int			iColCount			= 0;
String		sSQL				= "";
int			i					= 0;
int			j					= 0;

sSQL = "insert into jungkuo_log (logtime, logperson, logplace) values (sysdate, '" + sLogPerson + "', '" + sLogPlace + "')";
ht = execSQLOnDB(sSQL);
sResultCode = ht.get("ResultCode").toString();
sResultText = ht.get("ResultText").toString();

/*
if (sResultCode.equals(gcResultCodeSuccess)){	//成功
	String sEmailSubject = "";
	String sEmailBody = "";
	if (sApprove.equals("1")){
		sEmailSubject = "MyVIBO APP 訊息簽核完成通知";
		sEmailBody = "您的訊息已簽核完成，目前狀態為已上線，訊息編號：" + sMessageId + "<br>您可至<a href='https://vshop.vibo.com.tw/myviboadmin/index.html'>MyVIBO APP後台管理系統</a>觀看此訊息!";
	}else{
		sEmailSubject = "MyVIBO APP 訊息退回通知";
		sEmailBody = "您的訊息已被退回，目前狀態為未上線，訊息編號：" + sMessageId + "<br>您可至<a href='https://vshop.vibo.com.tw/myviboadmin/index.html'>MyVIBO APP後台管理系統</a>觀看此訊息!";
	}
	sendHTMLMail(gcDefaultEmailSMTPServer, gcDefaultEmailFromAddress, gcDefaultEmailFromName, getManagerMailList(), sEmailSubject, sEmailBody);
}
*/

out.println(ComposeXMLResponse(sResultCode, sResultText, ""));


%>