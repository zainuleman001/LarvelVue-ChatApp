<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<!-- Mirrored from boston-react.vercel.app/ by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 19 Nov 2023 18:03:46 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->

<head>
    <meta charSet="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <meta name="next-head-count" content="2" />
    <meta charSet="utf-8" />
    <meta name="author" content="themepaa" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="keywords" content="Boston - Portfolio Template" />
    <meta name="description" content="Boston - Portfolio Template" />
    <title>My Portfolio</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <link href="{{ asset('UserAssets/assets/css/style.css') }}" rel="stylesheet" />
    <link rel="stylesheet" href="{{ asset('UserAssets/_next/static/css/edf78eb35ad78f40.css') }}" data-n-g="" />
    <noscript data-n-css=""></noscript>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
</head>

<body>
    <div id="__next">
        <div id="app">
            <app-component></app-component>
        </div>
        <script src="{{ mix('js/app.js') }}"></script>
    </div>
    <script>
        $(document).ready(function() {
            // Check the URL hash on page load
            var hash = window.location.hash;
            // If the hash exists and corresponds to a nav-link, add the "active" class
            if (hash && $('.navbar-nav a[href="' + hash + '"]').length) {
                $('.navbar-nav a[href="' + hash + '"]').addClass('active');
                $('html, body').animate({
                    scrollTop: $(hash).offset().top
                }, 800);
            }
            // Cache the navigation links and sections
            var navLinks = $('nav a');
            var sections = $('section');

            $(window).scroll(function() {
                // Get the current vertical position of the scroll bar
                var currentPosition = $(this).scrollTop();

                // Check each section's position and update the navigation accordingly
                sections.each(function() {
                    var top = $(this).offset().top - 50; // Adjust this value based on your layout
                    var bottom = top + $(this).outerHeight();

                    if (currentPosition >= top && currentPosition <= bottom) {
                        navLinks.removeClass('active');
                        $('a[href="#' + $(this).attr('id') + '"]').addClass('active');
                    }
                });
            });
        });
    </script>


</body>

</html>
