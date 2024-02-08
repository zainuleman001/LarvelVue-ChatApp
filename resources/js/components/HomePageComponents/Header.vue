<template>
    <header class="main-header">
        <nav class="navbar header-nav navbar-expand-lg one-page-nav">
            <div class="container">
                <a class="navbar-brand" href="#"><img :src="$userAssetsPath + 'assets/img/logo.svg'" class="svg"
                        alt="image" /></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    <span class="navbar-toggler-icon"></span>
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li><a class="nav-link" href="#home"><span>Home</span></a></li>
                        <li><a class="nav-link" href="#services"><span>Services</span></a></li>
                        <li><a class="nav-link" href="#skill"><span>Skills</span></a></li>
                        <li><a class="nav-link" href="#work"><span>Portfolio</span></a></li>
                        <li><a class="nav-link" href="#contactus"><span>Contact</span></a></li>
                    </ul>
                </div>

                <div class="ms-auto d-none d-lg-block">
                    <a class="px-btn px-btn-theme2" href="#contactus">Contact Now</a>
                </div>
            </div>
        </nav>
    </header>
</template>

<script>
export default {
    data() {
        return {

        }
    },
    created() {
        $(document).ready(function () {
            $('#navbarToggle').click(function () {
                $('#navbarNav').toggleClass('show');
            });
        });
    },

}
</script>

<style scoped>
@media (max-width: 991.98px) {
    .main-header .navbar-nav>li>.nav-link.active span {
        width: 100%;
        display: block;
        padding: 5px;
        padding-left: 20px;
        margin: 10px 0px;
        font-size: 18px;
        color: white;
    }
}
</style>
