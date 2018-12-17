$(document).ready(function () {
    $("#dangnhap, #dangnhap-xs").click(function () {
       $("#modal-client").modal();
    });

    $(".danhmucsach-item", this).hide();
    $(".danhmucsach").click(function () {
        $(".danhmucsach-item").slideToggle();
    })

    $(".dropdown").hover(
        function () {
            $(".drop-left, .drop-vanhoc, .drop-top-100", this).fadeToggle(500)
        }
    );

    $(".btn1").click(function () {
        $(".drop-sapxep").slideToggle();
    });
    $(".btn2").click(function () {
        $(".drop-sanpham").slideToggle();
    });
    $(".btn3").click(function () {
        $(".drop-sapxep1").slideToggle();
    });
    $(".btn4").click(function () {
        $(".drop-sanpham1").slideToggle();
    });
    $(".drop-khoa").click(function () {
        $(".drop-menu-khoa").slideToggle(600);
    });
});