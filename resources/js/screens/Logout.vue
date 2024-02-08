<template>

</template>

<script>
export default {
    data() {
    },
    methods: {

    },
    mounted() {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        this.$router.push('/admin/login');
    },
}
</script>


<style scoped></style>
