// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require masonry/jquery.masonry
//= require_tree .


/*===== Go Top 回到顶端 =====*/
function goTop(min_height) {
  $(".goTop").click(
    function() {
      $('html,body').animate({
          scrollTop: 0
      }, 700);
    });
  min_height=min_height?min_height:2500; //按钮出现高度（画面下移）
  $(window).scroll(function() {
    var s = $(window).scrollTop();
    if (s > min_height) {
        $(".goTop").fadeIn(100); //按钮出现时间（画面下移）
    } else {
        $(".goTop").fadeOut(200); //按钮消失时间（画面上移）
    }
  });
}

$(function() {
  goTop();
});


/*===== 图片随机排列 =====*/
$(function(){
  var $pins = $('#pins');
  $pins.imagesLoaded(function(){
    $pins.masonry({
      itemSelector : '.box',
      isFitWidth: true,
    });
  });
});


// navbar
$(window).scroll(function () {
	var $navbar = $('#navbar')
	if ($(this).scrollTop() > 125) {
		$('#navbar').addClass('show_bgcolor')
	} else {
		$('#navbar').removeClass('show_bgcolor')
	}
})


$(function(){
    $('#intro').on('slide.bs.click', function () {
        alert("当调用 slide 实例方法时立即触发该事件。");
    });
});
