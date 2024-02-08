<template>
    <Header></Header>
    <HomeBody></HomeBody>
    <Footer></Footer>
</template>

<script>
    import Header from '../components/HomePageComponents/Header.vue'
    import HomeBody from '../components/homepagecomponents/homepagebody.vue'
    import Footer from '../components/HomePageComponents/Footer.vue'
    export default {
        components: {Header, HomeBody, Footer},
        data() {
            return {

            }
        },
        created() {
            // console.log(this.$path);
        },
    }
</script>

<style scoped>

</style>
