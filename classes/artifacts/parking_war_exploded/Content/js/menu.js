$(function () {
    //菜单隐藏展开
    var tabs_i = 0
    $('.tab_menu').click(function () {
        var _self = $(this);
        var j = $('.tab_menu').index(_self);
        if (tabs_i == j) return false; tabs_i = j;
        $('.tab_menu span').each(function (e) {
            if (e == tabs_i) {
                $('span', _self).removeClass('v01').addClass('v02');
            } else {
                $(this).removeClass('v02').addClass('v01');
            }
        });
        $('.menu2').slideUp().eq(tabs_i).slideDown();
    });
})
$(function () {
    $(".menu2 p a").click(function () {
        if ($(this).has("tab2")) {
            $(this).addClass("tab2").parent().siblings().find("a").removeClass("tab2");
        }
    })
})