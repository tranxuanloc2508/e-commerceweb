

'use strict';
function addToCart(productId) {

    fetch(`/mavenproject2/api/cart/${productId}`).then(res => res.json()).then(function(data){
       let counter = document.getElementById("cart-counter")
      counter.innerText = data
//   })
    })

}
function addCart(productId) {
    $.ajax({
        url: "/mavenproject2/api/cart",
        type: "POST",
        data: {
            "productId": productId,
            "num": 1
        },
        success: function (data) {
            var a = $(".product-count").text();
            a = a === "" ? 0 : parseInt(a);
            $(".product-count").text(a + 1);
        },
        error: function (jqXHR) {
            alert(jqXHR);
            
        }
        
    });
}
 function hamDropdown() {
     document.querySelector(".noidung_dropdown").classList.toggle("hienThi");
 }
  window.onclick = function(e) {
   if (!e.target.matches('.nut_dropdown')) {
   var noiDungDropdown = document.querySelector(".noidung_dropdown");
     if (noiDungDropdown.classList.contains('hienThi')) {
       noiDungDropdown.classList.remove('hienThi');
     }
   }
 }
 $(function() {
  var Accordion = function(el, multiple) {
    this.el = el || {};
    this.multiple = multiple || false;

    // Variables privadas
    var links = this.el.find('.link');
    // Evento
    links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
  }

  Accordion.prototype.dropdown = function(e) {
    var $el = e.data.el;
      $this = $(this),
      $next = $this.next();

    $next.slideToggle();
    $this.parent().toggleClass('open');

    if (!e.data.multiple) {
      $el.find('.submenu').not($next).slideUp().parent().removeClass('open');
    };
  } 

  var accordion = new Accordion($('#accordion'), false);
});
//function addToCart(id, name,price){
//    event.preventDefault()
//    
//     fetch("/mavenproject2/api/cart",{
//       method: "post",
//       body:JSON.stringify({
//           "productId":id,
//           "name":name,
//           "price":price,
//           "count":obj.value,
//           "image":""
//       }),
//       headers:{
//           "Content-type":"application/json"
//       }
//   }).then(function(res){
//       return res.json()
//       
//   }).then(function(data){
//       let counter = document.getElementById("cart-counter")
//      counter.innerText = data
//   })
//}

function updateCart(obj,productId){
   fetch("/mavenproject2/api/cart",{
       method: "put",
       body:JSON.stringify({
           "productId":productId,
           "name":"",
           "price":0,
           "count":obj.value,
           "image":""
       }),
       headers:{
           "Content-type":"application/json"
       }
   }).then(function(res){
       return res.json()
   }).then(function (data){
      let counter = document.getElementById("cart-counter")
      counter.innerText = data.count
//        let counter = document.getElementById("amountCart")
//      counter.innerText = data.amount
       location.reload()
   })
}
function deleteCart(productId){
   if(confirm("Bạn có chắc chắn muốn xóa?") == true){
        fetch(`/mavenproject2/api/cart/${productId}`,{
        method: "delete"
    }).then (function(res){
        return res.json()
    }).then(function(data){
         let counter = document.getElementById("cart-counter")
      counter.innerText = data.count
//        let counter = document.getElementById("amountCart")
//      counter.innerText = data.amount
      location.reload()
//       let row = document.getElementById(`product${c.productId}`)
//      row.style.display = "none"
    })
   }
}

function pay(){
    if(confirm("Bạn chắc chắn muốn mua hàng?")== true){
        fetch("/mavenproject2/api/pay",{
            method: "post"
        }).then(function (res){
            return res.json();
        }).then(function(code){
            console.info(code);
            location.reload();
        })
    
    }
}
// add comment
function addComment(productId,userId){
     event.preventDefault();
 
     fetch(`/mavenproject2/api/add-comment/${userId}`,{
       method: "post",
       body:JSON.stringify({
           "content":document.getElementById("contentId").value,
           "productId": productId
       }),
       headers:{
           "Content-type":"application/json"
       }
   }).then(function(res){
       console.info(res)
       
       return res.json();
       
   }).then(function(data){
       console.info(data);
       let area = document.getElementById("commentArea");
        area.innerHTML = `
                     <div class="commented-section mt-4"class="d-flex flex-row add-comment-section mt-4 mb-4"><img class="img-fluid img-responsive rounded-circle mr-2" src="https://i.imgur.com/qdiP4DB.jpg" width="38">
                        <div class="d-flex flex-row align-items-center commented-user mt-3">
                            <span class="dot mb-2">${data.user.username}</span>
                            <i class=" mb-2 ml-4">${moment(data.createdDate).fromNow()}</i>
                        </div>
                        <div class="comment-text-sm"><span>${data.content}</span></div>                  
                    </div>
                    ` + area.innerHTML;
     
   })

}
/// Alert add comment
function show_alert() {
  alert("Bạn chưa đăng nhập!");
}
(function ($) {

    /*------------------
     Preloader
     --------------------*/
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloder").delay(200).fadeOut("slow");

        /*------------------
         Gallery filter
         --------------------*/
        $('.featured__controls li').on('click', function () {
            $('.featured__controls li').removeClass('active');
            $(this).addClass('active');
        });
        if ($('.featured__filter').length > 0) {
            var containerEl = document.querySelector('.featured__filter');
            var mixer = mixitup(containerEl);
        }
    });

    /*------------------
     Background Set
     --------------------*/
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });

    //Humberger Menu
    $(".humberger__open").on('click', function () {
        $(".humberger__menu__wrapper").addClass("show__humberger__menu__wrapper");
        $(".humberger__menu__overlay").addClass("active");
        $("body").addClass("over_hid");
    });

    $(".humberger__menu__overlay").on('click', function () {
        $(".humberger__menu__wrapper").removeClass("show__humberger__menu__wrapper");
        $(".humberger__menu__overlay").removeClass("active");
        $("body").removeClass("over_hid");
    });

    /*------------------
     Navigation
     --------------------*/
    $(".mobile-menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
    });

    /*-----------------------
     Categories Slider
     ------------------------*/
    $(".categories__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 4,
        dots: false,
        nav: true,
        navText: ["<span class='fa fa-angle-left'><span/>", "<span class='fa fa-angle-right'><span/>"],
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        responsive: {

            0: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 3,
            },

            992: {
                items: 4,
            }
        }
    });


    $('.hero__categories__all').on('click', function () {
        $('.hero__categories ul').slideToggle(400);
    });

    /*--------------------------
     Latest Product Slider
     ----------------------------*/
    $(".latest-product__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        dots: false,
        nav: true,
        navText: ["<span class='fa fa-angle-left'><span/>", "<span class='fa fa-angle-right'><span/>"],
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*-----------------------------
     Product Discount Slider
     -------------------------------*/
    $(".product__discount__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 3,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        responsive: {

            320: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 2,
            },

            992: {
                items: 3,
            }
        }
    });

    /*---------------------------------
     Product Details Pic Slider
     ----------------------------------*/
    $(".product__details__pic__slider").owlCarousel({
        loop: true,
        margin: 20,
        items: 4,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*-----------------------
     Price Range Slider
     ------------------------ */
    var rangeSlider = $(".price-range"),
            minamount = $("#minamount"),
            maxamount = $("#maxamount"),
            minPrice = rangeSlider.data('min'),
            maxPrice = rangeSlider.data('max');
    rangeSlider.slider({
        range: true,
        min: minPrice,
        max: maxPrice,
        values: [minPrice, maxPrice],
        slide: function (event, ui) {
            minamount.val('$' + ui.values[0]);
            maxamount.val('$' + ui.values[1]);
        }
    });
    minamount.val('$' + rangeSlider.slider("values", 0));
    maxamount.val('$' + rangeSlider.slider("values", 1));

    /*--------------------------
     Select
     ----------------------------*/
    $("select").niceSelect();

    /*------------------
     Single Product
     --------------------*/
    
    var proQty = $('.pro-qty');
    proQty.prepend('<span class="dec qtybtn">-</span>');
    proQty.append('<span class="inc qtybtn">+</span>');
    proQty.on('click', '.qtybtn', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        $button.parent().find('input').val(newVal);
    });

})(jQuery);