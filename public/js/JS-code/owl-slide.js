$(document).ready(function () {
    // $(document).on('owlCarousel','.owl-carousel', function(){
	// 	// console.log($(this).val());
	// 	deleteNX($(this).val());
	// });
    $('.owl-carousel').owlCarousel({
        loop:true,
        margin:20,
        nav:false,
        responsive:{
            0:{
                items:2
            },
            500:{
                items:3
            },
            768:{
                items:4
            },
            992:{
                items:5
            },
            1200:{
                items:6
            }
        }
    });
});