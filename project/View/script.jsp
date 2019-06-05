<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon shortcut" href="icon/logo.png">
<title>Bán bảo hiểm trực tuyến</title>
</head>
<body>
 <!-- Custom-JavaScript-File-Links -->

<!-- Default-JavaScript --><script src="js/jquery-2.2.3.js"></script>
<script src="js/modernizr.custom.js"></script>
    <!-- Custom-JavaScript-File-Links -->

    <!-- cart-js -->
    <script src="js/minicart.js"></script>
    <script>
        w3l.render();

        w3l.cart.on('w3agile_checkout', function (evt) {
            var items, len, i;

            if (this.subtotal() > 0) {
                items = this.items();

                for (i = 0, len = items.length; i < len; i++) { 
                }
            }
        });
    </script>  
    <!-- //cart-js --> 
        <!-- Shopping-Cart-JavaScript -->

        <!-- Header-Slider-JavaScript-Files -->
            <script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
            <script type='text/javascript' src='js/fluid_dg.min.js'></script>
            <script>jQuery(document).ready(function(){
                    jQuery(function(){
                        jQuery('#fluid_dg_wrap_4').fluid_dg({
                            height: 'auto',
                            loader: 'bar',
                            pagination: false,
                            thumbnails: true,
                            hover: false,
                            opacityOnGrid: false,
                            imagePath: '',
                            time: 4000,
                            transPeriod: 2000,
                        });
                    });
                })
            </script>
        <!-- //Header-Slider-JavaScript-Files -->

        <!-- Dropdown-Menu-JavaScript -->
            <script>
                $(document).ready(function(){
                    $(".dropdown").hover(
                        function() {
                            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
                            $(this).toggleClass('open');
                        },
                        function() {
                            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
                            $(this).toggleClass('open');
                        }
                    );
                });
            </script>
        <!-- //Dropdown-Menu-JavaScript -->

        <!-- Pricing-Popup-Box-JavaScript -->
            <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
            <script>
                $(document).ready(function() {
                    $('.popup-with-zoom-anim').magnificPopup({
                        type: 'inline',
                        fixedContentPos: false,
                        fixedBgPos: true,
                        overflowY: 'auto',
                        closeBtnInside: true,
                        preloader: false,
                        midClick: true,
                        removalDelay: 300,
                        mainClass: 'my-mfp-zoom-in'
                    });
                });
            </script>
        <!-- //Pricing-Popup-Box-JavaScript -->

        <!-- Model-Slider-JavaScript-Files -->
            <script src="js/jquery.film_roll.js"></script>
            <script>
                (function() {
                    jQuery(function() {
                        this.film_rolls || (this.film_rolls = []);
                        this.film_rolls['film_roll_1'] = new FilmRoll({
                            container: '#film_roll_1',
                            height: 560
                        });
                        return true;
                    });
                }).call(this);
            </script>
        <!-- //Model-Slider-JavaScript-Files -->

    <!-- //Custom-JavaScript-File-Links -->



        <!-- Bootstrap-JavaScript --> <script src="js/bootstrap.js"></script>
</body>
</html>