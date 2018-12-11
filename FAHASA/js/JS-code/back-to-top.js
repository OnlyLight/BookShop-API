$(document).ready(function () {
   $(".back-top button").click(function () {
      $("body, html").animate({scrollTop: 0}, "slow");
   });
});