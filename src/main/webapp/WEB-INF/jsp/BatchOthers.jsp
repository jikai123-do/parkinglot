<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link href="../../Content/css/blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../Content/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="../../Content/js/layout.js"></script>
    <script type="text/javascript" src="../../Content/js/menu.js"></script>
    <script src="../Content/js/format.js"></script>
    <script type="text/javascript" src="../../Content/js/index.js"></script>
    <style>
        .m_ip ul li {
            background: url("../../Content/images/ip_icon.png") no-repeat;
        }
    </style>
</head>
<body>
    <div class="right">
        <div class="renew">
            <ul>
                <li style="margin-top:15px"><span>钱包支付密码：</span><input type="password" id="paypwd" placeholder="请输入支付密码"></li>
                <p><a href="javascript:" style="width:100px">其他支付方式：</a><a href="javascript:;" onclick="WechatPay()"><img src="/Content/images/wecat_icon.png" /></a><a href="javascript:;" onclick="Alipay()"><img src="/Content/images/zf_icon.png" /></a><a href="javascript:;" onclick="UnionPay()"><img src="/Content/images/yhk_icon.png" /></a></p>
                <li style="margin:15px 0 15px 0">
                    <a href="javascript:;" id="cancel">取&nbsp;&nbsp;消</a>
                    <a href="javascript:;" id="topay" onclick="pay()">确&nbsp;&nbsp;认</a>
                </li>
            </ul>
        </div>
        <div class="m_ip">
            <ul>
                <li><a href="javascript:;" onclick="IndexPage()">当前位置：首页</a><a href="javascript:;">>></a><a href="javascript:;" onclick="PService()">停车服务</a><a href="javascript:;">>></a><a href="javascript:;">代理补缴</a></li>
            </ul>
        </div>
        <form action="/ParkingService/BatchOthers" method="post" id="othersForm" role="form">
            <div class="my" style="height:430px; position:relative;">
                <p><input type="text" placeholder="请输入手机号或车牌号" id="phoneOrPlate" value="" class="phnumb" /><input type="button" name="search" onclick="find()" value="查询" class="valueclick" /></p>
                <input type="hidden" name="usercode" />
                <input type="hidden" name="plate" />
                <input type="hidden" name="length" />
                <input type="hidden" id="contents" value="" />
                <div>
                    <table class="tablelist">
                        <thead>
                            <tr>
                                <th>欠费编号</th>
                                <th>泊位编号</th>
                                <th>停车地点</th>
                                <th>所在片区</th>
                                <th>欠费金额（元）</th>
                                <th>订单生成</th>
                                <th style="border-right:none">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                                <input type="hidden" id="others" value="0" />
                        </tbody>
                    </table>
                </div>
                <div style="position:absolute; right:0; bottom:0" class="pagin">
                    <ul class="bot">
                        <li class="bot1">共计<span id="spanPageTotal">0</span>页，每页<span id="perpage">0</span>条记录</li>
                        <li class="bot2" style="width:100px">,当前页<span id="spanPageNum">0/0</span><input type="hidden" id="tempPageIndex" name="tempPageIndex" /></li>
                        <li style="width:60px"><a href="javascript:void(0);" onclick="SetPageIndex('first')"><<首页 </a></li>
                        <li class="line">|</li>
                        <li style="width:60px"><a href="javascript:void(0);" onclick="SetPageIndex('last')">上一页</a></li>
                        <li class="line">|</li>
                        <li style="width:60px"><a href="javascript:void(0);" onclick="SetPageIndex('next')">下一页</a></li>
                        <li class="line">|</li>
                        <li style="width:60px"><a href="javascript:void(0);" onclick="SetPageIndex('end')">尾页>></a></li>
                    </ul>
                </div>
            </div>
        </form>
    </div>
</body>
<script>
    var tempPageIndex = 0;//当前页  从0起，0是第1页
    var strPageTotal = 0;//总页数
    var strPageSize = 6;//每页的条数

    //设置分页时跳转的页码
    function SetPageIndex(obj) {
        if (obj == "first") {
            if (tempPageIndex == 0) {
                return false;
            } else {
                tempPageIndex = 0;
            }
        }
        else if (obj == "last") {
            tempPageIndex--;
            if (tempPageIndex == -1) {
                tempPageIndex = 0;
                return false;
            }
        }
        else if (obj == "next") {
            tempPageIndex++;
            if (tempPageIndex > (strPageTotal-1)) {
                tempPageIndex = strPageTotal-1;
                return false;
            }
        }
        else if (obj == "end") {
            tempPageIndex = strPageTotal-1;
        } else {
            tempPageIndex = -1;
        }
        $("#tempPageIndex").val(tempPageIndex);//给 当前页的隐藏域 赋值
        var reg = /^[0-9]*$/;
        if ($("#contents").val()!="") {
            var str = $("#contents").val();
            if (reg.test(str)) {
                $("input[name=usercode]").val(str);
            }
            else {
                $("input[name=plate]").val(str);
            }
            $("input[name=length]").val(strPageSize);
            $("#othersForm").submit();//提交表单
        }
    }

    $(function () {
        if ($("#others").val()!="0")
        {
            for (var i = 0; i < parseInt($("#others").val()); i++) {  //把时间从毫秒转换成时间格式
                $(".tablelist tbody tr td:nth-last-child(2)").eq(i).text(format(parseInt($(".tablelist tbody tr td:nth-last-child(2)").eq(i).text()), 'yyyy-MM-dd HH:mm:ss').substring(0, 19));
            }
            strPageTotal = Math.ceil(parseInt($("#iTotal").val())/strPageSize);//总页数
            $("#spanPageTotal").html(strPageTotal);//给 共计*页 赋值
            if (strPageTotal!=0) {
                $("#perpage").html(strPageSize);
                $("#spanPageNum").html((0+1) + "/" + strPageTotal);  //当前页 0/0
            }
        }
    });

    function find() {
        var reg = /^[0-9]*$/;
        var str = $("#phoneOrPlate").val();
        if (str == "") {
            alert("请输入手机号或车牌！");
            return false;
        }else if (reg.test(str)) {
            $("input[name=usercode]").val(str);
        }
        else {
            $("input[name=plate]").val(str);
        }
        $("input[name=length]").val(strPageSize);
        $("input[name=tempPageIndex]").val(tempPageIndex);
        $("#othersForm").submit();
    }

    function IndexPage(){  //二级导航跳转
        parent.top.location.href="/HomePage/Index";
    }

    $("#cancel").on('click', function () {
        $(".renew").fadeOut("fast");
        $("#mask").css("display", "none" );
        $("#paypwd").val("");  //清空密码
    })

    function singleShowWin(obj){
        if(confirm("确认补交￥"+$(obj).parent().siblings().eq(4).text()+"吗？"))
        {
            //显示续费窗口
            $("body").append("<div id='mask'></div>");
            $("#mask").addClass("mask").fadeIn("slow");
            $(".renew").fadeIn("slow");
            $("#topay").attr("name","single");

            $("[name='ids']").val($(obj).attr("id"));
            $("[name='amount']").val($(obj).parent().siblings().eq(4).text());
        }
    }

    function teamShowWin(obj){
        if($(obj).parent().parent().siblings("tr").length==0){
            alert("未找到欠费记录！");
            return false;
        }
        if(confirm("确认补交￥"+$(obj).parent().siblings().children().text()+"吗？"))
        {
            //显示续费窗口
            $("body").append("<div id='mask'></div>");
            $("#mask").addClass("mask").fadeIn("slow");
            $(".renew").fadeIn("slow");
            $("#topay").attr("name","team");

            var ids="";
            $("[name='ida']").each(function(){
                ids+=$(this).attr("id")+",";
            })
            ids=ids.substring(0,ids.length-1);
            $("[name='ids']").val(ids);
            $("[name='amount']").val($(obj).parent().siblings().children().text());
        }
    }

    function pay(){
        if($("#paypwd").val()==""){
            alert("请输入支付密码！");
        }else{
            var reg = /^[0-9]*$/;
            var str = $("#phoneOrPlate").val();
            if (reg.test(str)) {
                $("input[name=usercode]").val(str);
            }
            else {
                $("input[name=plate]").val(str);
            }
            $("[name='paypwd']").val($("#paypwd").val());
            $("[name='batchmode']").val("钱包");

            $(".renew").fadeOut("fast");
            $("#mask").css({ display: 'none' });
            $("#paypwd").val("");  //清空密码

            $("#othersForm").submit();//提交表单
        }
    }

    $("body").keydown(function () {//回车提交事件
        if (event.keyCode == "13") {//keyCode=13是回车键
            $(".valueclick").click();
        }
    });

    function Alipay(){  //支付宝支付
        $("input[name=usercode]").val("1");
        $("[name='batchmode']").val("支付宝");
        $("#othersForm").submit();
    }

    function WechatPay(){  //微信支付
        $("input[name=usercode]").val("1");
        $("[name='batchmode']").val("微信");
        $("#othersForm").submit();
    }

    function UnionPay(){  //银联支付
        $("input[name=usercode]").val("1");
        $("[name='batchmode']").val("银联");
        $("#othersForm").submit();
    }
</script>
</html>
