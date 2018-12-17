$(document).ready(function () {
    $(".drop-left", this).hide();

    $(".dropdown").hover(
        function () {
            $(".drop-vanhoc, .drop-top-100", this).fadeToggle(500)
        }
    );

    $("#dangnhap, #dangnhap-xs").click( function () {
        $("#modal-client").modal();
    })

    $(".carousel-control", this).hide();
    $("#slide-top, #slide-2, #slide-3, #slide-4, #slide-5, #slide-6").hover(
        function () {
            $(".carousel-control", this).fadeToggle();
        }
    );
});