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
//= require social-share-button
//= require social-share-button/wechat
//= require bootstrap
//= require masonry/jquery.masonry
//= require_tree .


$(window).scroll(function () {
  /*===== Welcome#index - 首頁導航列變化 =====*/
	if ($(this).scrollTop() > 125) {
		$('#navbar').addClass('show_bgcolor')
	} else {
		$('#navbar').removeClass('show_bgcolor')
	}

  /*===== Welcome#index - 回到頁面頂端 =====*/
  if ($(this).scrollTop() > 2500) {
    $(".goTop").fadeIn(100); //按钮出现时间（画面下移）
  } else {
    $(".goTop").fadeOut(200); //按钮消失时间（画面上移）
  }

  $(".goTop").click(
    function() {
      $('html,body').animate({
          scrollTop: 0
      }, 700);
    });
})


/*===== Products#show - 變更顯示圖片 =====*/
$(document).on('mouseover', '.list-image', function () {
  var src_other = $(this).attr('src') //抓取小圖圖片路徑
  var src_main = src_other.toString().replace("other", "main") //更改圖片路徑

  $('.main-image').attr('src', src_main) //變更大圖圖片路徑

  $('.list-image').removeClass('list-image-active') //其他圖片移除鎖定狀態
  $(this).addClass('list-image-active') //當前圖片新增鎖定狀態
})


/*===== Products#show - 調整購買數量 =====*/
$(document).on('turbolinks:load', function() {
  /*===== 增加購買數量 =====*/
  $("#quantity-up").click(function(e) {
    var num = parseInt($("#quantity").val());
    var numMax = $("#quantity").attr("max");
    if (num < numMax) {
      $("#quantity").val(num += 1);
    }
    e.preventDefault();
  });

  /*===== 減少購買數量 =====*/
  $("#quantity-down").click(function(e) {
    var num = parseInt($("#quantity").val());
    if (num > 1) {
      $("#quantity").val(num -= 1);
    }
    e.preventDefault();
  });

  /*===== 確認購買數量（不能超出庫存數量） =====*/
  $("#quantity").blur(function(e) {
    var num = parseInt($(this).val());
    var numMax = $(this).attr("max");
    if (num > numMax) {
      num = numMax;
    }
    $(this).val(num);
    e.preventDefault();
  });


  /*===== 確認購買數量（不能超出庫存數量） =====*/
  $(".cart-quantity-input").blur(function(e) {
    var num = parseInt($(this).val());
    var numMax = $(this).attr("max");
    if (num > numMax) {
      num = numMax;
    }
    $(this).val(num);
    e.preventDefault();

    var id = $(this).attr("id");
    $.ajax({
      type: "PATCH",
      url: "/cart_items/"+id,
        dataType:'json',
        data:{
          quantity: num
        },
    });

    window.location.reload();
  });
});
