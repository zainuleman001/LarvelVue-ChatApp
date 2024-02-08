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
                                <a href="" class="text-nowrap logo-img text-center d-block mb-5 w-100">
                                    <img :src="$userAssetsPath + 'assets/img/logo.svg'" width="180" alt="">
                                </a>
                                <div class="row">
                                    <div class="col-6 mb-2 mb-sm-0"  @click="loginWithSocial('google')">
                                        <a class="btn btn-white text-dark border fw-normal d-flex align-items-center justify-content-center rounded-2 py-8"
                                            href="javascript:void(0)" role="button">
                                            <img src="https://demos.adminmart.com/premium/bootstrap/modernize-bootstrap/package/dist/images/svgs/google-icon.svg"
                                                alt="" class="img-fluid me-2" width="18" height="18">
                                                Google
                                        </a>
                                    </div>
                                    <div class="col-6"  @click="loginWithSocial('facebook')">
                                        <a class="btn btn-white text-dark border fw-normal d-flex align-items-center justify-content-center rounded-2 py-8"
                                            href="javascript:void(0)" role="button">
                                            <img src="https://demos.adminmart.com/premium/bootstrap/modernize-bootstrap/package/dist/images/svgs/facebook-icon.svg"
                                                alt="" class="img-fluid me-2" width="18" height="18">
                                                FaceBook
                                        </a>
                                    </div>
                                </div>
                                <div class="position-relative text-center my-4">
                                    <p class="mb-0 fs-4 px-3 d-inline-block bg-white z-index-5 position-relative">or sign Up
                                        with</p>
                                    <span
                                        class="border-top w-100 position-absolute top-50 start-50 translate-middle"></span>
                                </div>
                                <form action="#" method="POST">
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Name</label>
                                        <input type="text" class="form-control required" id="name" v-model="data.name"
                                            name="name">
                                        <small class="text-danger rquiredError">This field required</small>
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email address</label>
                                        <input type="text" class="form-control required" id="email" v-model="data.email"
                                            name="email">
                                        <small class="text-danger rquiredError">This field required</small>
                                    </div>
                                    <div class="mb-4">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" class="form-control required" id="password"
                                            v-model="data.password" name="password">
                                        <small class="text-danger rquiredError">This field required</small>
                                    </div>
                                    <div class="mb-4">
                                        <label for="password_confirmation" class="form-label">Confirm Password</label>
                                        <input type="password" class="form-control required" id="password_confirmation"
                                            v-model="data.password_confirmation" name="password_confirmation">
                                        <small class="text-danger rquiredError">This field required</small>
                                        <small class="text-danger" v-if="!password_matching">Password Not Matching</small>
                                    </div>
                                    <button v-if="loading" class="btn btn-primary w-100 py-8 mb-4 rounded-2" type="button" disabled>
                                        <span class="spinner-border spinner-border-sm" role="status"
                                            aria-hidden="true"></span>
                                        <span class="visually-hidden">Loading...</span>
                                    </button>
                                    <button v-else type="button" @click="registerUser"
                                        class="btn btn-primary w-100 py-8 mb-4 rounded-2">Sign Up</button>
                                </form>
                                <div class="d-flex align-items-center">
                                    <p class="fs-4 mb-0 text-dark">Already have an Account?</p>
                                    <router-link class="text-primary fw-medium ms-2" to="/admin/login">Sign In</router-link>
                                </div>
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
            data: {
                name: '',
                email: '',
                password: '',
                password_confirmation: '',
            },
            password_matching: true,
            loading: false,

        }
    },
    methods: {
        async registerUser() {
            if (this.requiredValidation()) {
                if (this.data.password == this.data.password_confirmation) {
                    this.password_matching = true;
                    this.loading = true;
                    try {
                        const response = await this.axios.post(`${this.$apiUrl}register`, this.data);
                        this.noti('success', response.data.message);
                        this.$router.push({
                            path: '/admin/verify-code',
                            query: { email: response.data.user.email }
                        });
                    } catch (error) {
                        if (error.response && error.response.data) {
                            const errorMessages = error.response.data.errors;
                            for (const field in errorMessages) {
                                if (errorMessages.hasOwnProperty(field)) {
                                    // Iterate through each error message for the current field
                                    for (const errorMessage of errorMessages[field]) {
                                        this.$notyf.error(errorMessage)
                                    }
                                }
                            }
                        } else {
                            console.error(error);
                            this.noti('error', 'An error occurred.');
                        }
                    }
                    this.loading = false;
                } else {
                    this.password_matching = false;
                }
            }
        },
        loginWithSocial(provider) {
            window.location.href = '/login/' + provider;
        },
    },
    mounted() {
        $('.rquiredError').hide();
        // this.noti('success', 'Your message has been Receieved');

    },
}
</script>

<style scoped></style>
