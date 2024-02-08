<template>
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-sidebartype="full" data-sidebar-position="fixed"
        data-header-position="fixed">
        <div
            class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
            <div class="d-flex align-items-center justify-content-center w-100">
                <div class="row justify-content-center w-100">
                    <div class="col-md-8 col-lg-6 col-xxl-3">
                        <div class="card mb-0">
                            <div class="card-body">
                                <a href="/" class="text-nowrap logo-img text-center d-block mb-5 w-100">
                                    <img :src="$userAssetsPath + 'assets/img/logo.svg'" width="180" alt="">
                                </a>
                                <div class="mb-5 text-center">
                                    <p>We sent a verification code to <span class="fw-bolder mx-1">({{this.data.email}}).</span> Enter that
                                        code from the email in
                                        the field below.</p>
                                </div>
                                <form action="" method="post">
                                    <div class="mb-3">
                                        <label for="code" class="form-label">Type your 6 digits security code </label>
                                        <input type="text" class="form-control required" id="code" name="code"
                                            v-model="data.code">
                                        <small class="text-danger rquiredError">This field required</small>
                                    </div>
                                    <button v-if="loading" class="btn btn-primary w-100 py-8 mb-4 rounded-2" type="button" disabled>
                                        <span class="spinner-border spinner-border-sm" role="status"
                                            aria-hidden="true"></span>
                                        <span class="visually-hidden">Loading...</span>
                                    </button>
                                    <button v-else type="button" @click="verifyCode" class="btn btn-primary w-100 py-8 mb-4">Verify
                                        My
                                        Account</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            data: {},
            loading: false,
        }
    },
    methods: {
        async verifyCode() {
            if (this.requiredValidation()) {
                this.loading = true;
                try {
                    const response = await this.axios.post(`${this.$apiUrl}verify-code`, this.data);
                    this.noti('success', response.data.message);
                    localStorage.setItem('user', JSON.stringify(response.data.user))
                    localStorage.setItem('token', response.data.token)
                    this.$router.push({
                        path: '/admin/dashboard',
                    });
                } catch (error) {
                    if (error.response && error.response.data && error.response.data.errors) {
                        const errorMessages = error.response.data.errors;
                        for (const field in errorMessages) {
                            if (errorMessages.hasOwnProperty(field)) {
                                for (const errorMessage of errorMessages[field]) {
                                    this.$notyf.error(errorMessage)
                                }
                            }
                        }
                    } else {
                        this.noti('error', error.response.data.message);
                    }
                }
                this.loading = false;
            }
        },
        async checkUnVerifiedUserExist(data) {
            try {
                const response = await this.axios.post(`${this.$apiUrl}check-unverified-user`, data);
                if (!response.data.status) {
                    this.noti('error', 'Invalid Email');
                    this.$router.push({
                        path: '/admin/register',
                    });
                }
            } catch (error) {
                this.noti('error', 'An error occurred.');
                this.$router.push({
                    path: '/admin/register',
                });
            }
        }
    },
    mounted() {
        $('.rquiredError').hide();
        this.checkUnVerifiedUserExist({ 'email': this.$route.query.email });
        this.data.email = this.$route.query.email;
    },
}
</script>

<style scoped></style>
