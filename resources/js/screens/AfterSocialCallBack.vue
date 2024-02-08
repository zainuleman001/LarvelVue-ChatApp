<template></template>
<script>
export default {
    data() {
        return {
        }
    },
    methods: {
        async handleResponse(data) {
            if (data && data.message && data.token && data.user) {
                this.noti('success', data.message);
                localStorage.setItem('user', JSON.stringify(data.user))
                localStorage.setItem('token', data.token)
                window.location.href = '/admin/dashboard';
            } else{
                this.noti('error', 'Couldn\'t login due to some error');
                this.$router.push('/admin/login');
            }
        },
    },
    mounted() {
        this.handleResponse(JSON.parse(this.$route.query.data));
    },
}
</script>
<style scoped></style>
