<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <!--  Title -->
    <title>ZE Portfolio</title>
    <!--  Required Meta Tag -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="handheldfriendly" content="true" />
    <meta name="MobileOptimized" content="width" />
    <meta name="description" content="Mordenize" />
    <meta name="author" content="" />
    <meta name="keywords" content="Mordenize" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!--  Favicon -->
    {{-- <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('uploads/apple-touch-icon.png') }}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('uploads/favicon-32x32.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('uploads/favicon-16x16.png') }}"> --}}
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="{{ asset('AdminAssets/dist/libs/owl.carousel/dist/assets/owl.carousel.min.css') }}">

    <!-- Core Css -->
    <link id="themeColors" rel="stylesheet" href="{{ asset('AdminAssets/dist/css/style.min.css') }}" />
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>


    <style>
        .marginTop {
            margin-top: 60px;
        }
    </style>
</head>

<body>
    <!-- Body Wrapper -->
    <div class="page-wrapper show-sidebar" id="main-wrapper" data-layout="vertical" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        <div id="app">
            <app-component></app-component>
        </div>
        <script src="{{ mix('js/app.js') }}"></script>
    </div>

    <!-- Import Js Files -->
    <script src="{{ asset('AdminAssets/dist/libs/simplebar/dist/simplebar.min.js') }}"></script>
    <script src="{{ asset('AdminAssets/dist/libs/bootstrap/dist/js/bootstrap.bundle.min.js') }}"></script>
    <!-- core files -->
    <script src="{{ asset('AdminAssets/dist/js/app.min.js') }}"></script>
    <script src="{{ asset('AdminAssets/dist/js/app.init.js') }}"></script>
    <script src="{{ asset('AdminAssets/dist/js/app-style-switcher.js') }}"></script>
    <script src="{{ asset('AdminAssets/dist/js/sidebarmenu.js') }}"></script>
    <script src="{{ asset('AdminAssets/dist/js/custom.js') }}"></script>
    <!-- current page js files -->
    {{-- <script src="{{ asset('AdminAssets/dist/js/dashboard2.js') }}"></script> --}}

    <!-- ---------------------------------------------- -->
    <script>
        $(document).ready(function() {
            $(document).on('click', '#headerCollapse', function() {
                var pageWrapper = $(".page-wrapper");
                if (pageWrapper.hasClass("show-sidebar")) {
                    pageWrapper.removeClass("show-sidebar").addClass("mini-sidebar");
                    pageWrapper.attr("data-sidebartype", "mini-sidebar");
                } else {
                    pageWrapper.removeClass("mini-sidebar").addClass("show-sidebar");
                    pageWrapper.attr("data-sidebartype", "full");
                }
            });
            // Toggle sidebar when clicking .sidebarCollapse button
            $(document).on('click', '#sidebarCollapse', function() {
                var pageWrapper = $(".page-wrapper");
                pageWrapper.removeClass("show-sidebar").addClass("mini-sidebar");
                pageWrapper.attr("data-sidebartype", "mini-sidebar");
            });
        });
    </script>

</body>

<!-- Mirrored from demos.adminmart.com/premium/bootstrap/modernize-bootstrap/package/html/main/index2.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 12 May 2023 13:29:22 GMT -->

</html>
