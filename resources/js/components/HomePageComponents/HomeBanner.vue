<template>
    <section id="home" class="home-section">
        <div class="effect-1"><img :src="$userAssetsPath+'assets/img/effect-1.svg'" class="svg" alt="image" /></div>
        <div class="effect-2"><img :src="$userAssetsPath+'assets/img/effect-2.svg'" class="svg" alt="image" /></div>
        <div class="container">
            <div class="row min-vh-100 align-items-center">
                <div class="col-lg-6 pe-xl-5 py-5">
                    <div class="home-intro one-page-nav">
                        <h6><span>Hello.</span></h6>
                        <h1>We Have <br />Design<br />Experience</h1>
                        <p>I design and develop services for customers of all sizes, specializing in creating
                            stylish, modern websites, web services and online stores.</p>
                        <div class="btn-bar"><a class="px-btn px-btn-theme" href="#contactus">Let’s Talk</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="home-image"><img :src="$userAssetsPath+'assets/img/home-banner.png'" alt="image" /></div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
export default {
    data() {
        return {

        }
    },
}
</script>

<style scoped></style>
