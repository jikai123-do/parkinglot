/*导航切换*/
window.onload = function () {
    $(".menu ul li a").click(function () {
        if ($(this).has("tab")) {
            $(this).addClass("tab").parent().siblings().find("a").removeClass("tab");
        }
    })
};
