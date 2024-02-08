<template>
    <section id="work" class="section work-section bg-gray">
        <div class="container">
            <div class="row section-heading">
                <div class="col-lg-6">
                    <h6><span>Portfolio</span></h6>
                    <h3><span>Latest Projects</span></h3>
                </div>
            </div>
            <div class="row g-4 lightbox-gallery">
                <div class="col-sm-6 col-lg-4">
                    <div class="portfolio-box">
                        <div class="portfolio-img"><a :href="$userAssetsPath+'assets/img/project-1.jpg'" class="gallery-link"><img
                                    :src="$userAssetsPath+'assets/img/project-1.jpg'" alt="image" /></a></div>
                        <div class="portfolio-info">
                            <h6>Agency Landing page</h6><span>Web/WordPress</span><a :href="$userAssetsPath+'assets/img/project-1.jpg'"
                                class="gallery-link"><i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="portfolio-box">
                        <div class="portfolio-img"><a :href="$userAssetsPath+'assets/img/project-2.jpg'" class="gallery-link"><img
                                    :src="$userAssetsPath+'assets/img/project-2.jpg'" alt="image" /></a></div>
                        <div class="portfolio-info">
                            <h6>Agency Landing page</h6><span>Web/WordPress</span><a :href="$userAssetsPath+'assets/img/project-2.jpg'"
                                class="gallery-link"><i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="portfolio-box">
                        <div class="portfolio-img"><a :href="$userAssetsPath+'assets/img/project-3.jpg'" class="gallery-link"><img
                                    :src="$userAssetsPath+'assets/img/project-3.jpg'" alt="image" /></a></div>
                        <div class="portfolio-info">
                            <h6>Agency Landing page</h6><span>Web/WordPress</span><a :href="$userAssetsPath+'assets/img/project-3.jpg'"
                                class="gallery-link"><i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="portfolio-box">
                        <div class="portfolio-img"><a :href="$userAssetsPath+'assets/img/project-4.jpg'" class="gallery-link"><img
                                    :src="$userAssetsPath+'assets/img/project-4.jpg'" alt="image" /></a></div>
                        <div class="portfolio-info">
                            <h6>Agency Landing page</h6><span>Web/WordPress</span><a :href="$userAssetsPath+'assets/img/project-4.jpg'"
                                class="gallery-link"><i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="portfolio-box">
                        <div class="portfolio-img"><a :href="$userAssetsPath+'assets/img/project-5.jpg'" class="gallery-link"><img
                                    :src="$userAssetsPath+'assets/img/project-5.jpg'" alt="image" /></a></div>
                        <div class="portfolio-info">
                            <h6>Agency Landing page</h6><span>Web/WordPress</span><a :href="$userAssetsPath+'assets/img/project-5.jpg'"
                                class="gallery-link"><i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="portfolio-box">
                        <div class="portfolio-img"><a :href="$userAssetsPath+'assets/img/project-6.jpg'" class="gallery-link"><img
                                    :src="$userAssetsPath+'assets/img/project-6.jpg'" alt="image" /></a></div>
                        <div class="portfolio-info">
                            <h6>Agency Landing page</h6><span>Web/WordPress</span><a :href="$userAssetsPath+'assets/img/project-6.jpg'"
                                class="gallery-link"><i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
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
