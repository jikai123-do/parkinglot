

function menuOver(obj) {
    for (var i = 0; i < 5; i++) {
        if (i == parseInt(obj)) {
            document.getElementById("item" + obj).style.display = 'block';
            document.getElementById("ban").style.display = 'none';

        } else {
            document.getElementById("item" + i).style.display = 'none';
        }
    }
};

/*信息公告*/
$(document).ready(function (e) {
    //  定时器开始
    var $key = 0;  // 大的全局变量  我们看做是一把钥匙
    var timer = setInterval(autoplay, 2000); //这个定时器的名称是timer
    function autoplay() {
        $("#banner ul").stop().animate({ top: -$key * 358 }, 500)
        $("ol li").eq($key).addClass("current").siblings().removeClass();
        $key++;
        if ($key > 2) {
            $key = 0;
        }
    }
    $("#banner").hover( //鼠标放到大盒子上  定时器会停止 鼠标离开 定时器继续
	   function () {
	       clearInterval(timer);
	   },
	   function () {
	       clearInterval(timer);  //多年的经验  要想开启定时器，首先清除定时器
	       timer = setInterval(autoplay, 2000);//开启定时器
	   });
    $(window).scroll(function (e) {  // 测试滚动条滚动
        var $topvalue = $(document).scrollTop();// 检测滚动条滚动了多少
        if ($topvalue > 709) {
        }
    });
})



function getCookie(name)//取cookies函数       
{
    var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
    if (arr != null) return unescape(arr[2]); return null;
}

function setCookie(name, value)//两个参数，一个是cookie的名字，一个是值
{
    var Days = 300; //此 cookie 将被保存 30 天
    var exp = new Date();    //new Date("December 31, 9998");
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}

function delCookie(name)//删除cookie
{
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

var format = function (time, format) {  //转化毫秒格式时间
    var t = new Date(time);
    var tf = function (i) { return (i < 10 ? '0' : '') + i };
    return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function (a) {
        switch (a) {
            case 'yyyy':
                return tf(t.getFullYear());
                break;
            case 'MM':
                return tf(t.getMonth() + 1);
                break;
            case 'mm':
                return tf(t.getMinutes());
                break;
            case 'dd':
                return tf(t.getDate());
                break;
            case 'HH':
                return tf(t.getHours());
                break;
            case 'ss':
                return tf(t.getSeconds());
                break;
        }
    })
}
function PService() {
    window.top.parent.location.reload();
}