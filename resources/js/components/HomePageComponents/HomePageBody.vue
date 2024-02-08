<template>
    <main class="wrapper">
        <HomeBanner></HomeBanner>
        <Services></Services>
        <Skills></Skills>
        <Portfolio></Portfolio>
        <Contact></Contact>
        <div class="right-effects"></div>
        <div class="left-effects"></div>
    </main>
</template>

<script>
import HomeBanner from './HomeBanner.vue'
import Services from './Services.vue'
import Skills from './Skills.vue'
import Portfolio from './Portfolio.vue'
import Contact from './Contact.vue'
export default {
    components: {HomeBanner, Services , Skills , Portfolio , Contact},
    data() {
        return {

        }
    },
}
</script>

<style scoped></style>
