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
                                <div class="row">
                                    <div class="col-6 my-3 mb-2 mb-sm-0" @click="loginWithSocial('google')">
                                        <a class="btn btn-white text-dark border fw-normal d-flex align-items-center justify-content-center rounded-2 py-8"
                                            href="javascript:void(0)" role="button">
                                            <img src="https://demos.adminmart.com/premium/bootstrap/modernize-bootstrap/package/dist/images/svgs/google-icon.svg"
                                                alt="" class="img-fluid me-2" width="18" height="18">
                                            Google
                                        </a>
                                    </div>
                                    <div class="col-6 my-3" @click="loginWithSocial('facebook')">
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
                                <form method="POST">
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="text" class="form-control required" v-model="data.email" id="email"
                                            name="email">
                                        <small class="text-danger rquiredError">This field required</small>
                                    </div>
                                    <div class="mb-4">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" class="form-control required" v-model="data.password"
                                            id="password" name="password">
                                        <small class="text-danger rquiredError">This field required</small>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="form-check">
                                            <input class="form-check-input primary" type="checkbox" id="rememberMe">
                                            <label class="form-check-label text-dark" for="rememberMe">
                                                Remeber this Device
                                            </label>
                                        </div>
                                        <router-link class="text-primary fw-medium" to="/admin/forget-password">Forgot Password ?</router-link>
                                    </div>
                                    <button v-if="loading" class="btn btn-primary w-100 py-8 mb-4 rounded-2" type="button"
                                        disabled>
                                        <span class="spinner-border spinner-border-sm" role="status"
                                            aria-hidden="true"></span>
                                        <span class="visually-hidden">Loading...</span>
                                    </button>
                                    <button v-else type="button" @click="login"
                                        class="btn btn-primary w-100 py-8 mb-4 rounded-2">Sign In</button>
                                    <div class="my-1">
                                        <p class="text-center">Don't have Account? <router-link
                                                to="/admin/register">Create</router-link></p>
                                    </div>
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
        async login() {
            if (this.requiredValidation()) {
                this.loading = true;
                try {
                    const response = await this.axios.post(`${this.$apiUrl}login`, this.data);
                    this.setRememberMe();
                    this.noti('success', response.data.message);
                    if (response.data.status == 'verified') {
                        localStorage.setItem('user', JSON.stringify(response.data.user))
                        localStorage.setItem('token', response.data.token)
                        window.location.href = '/admin/dashboard';
                    } else {
                        this.$router.push({
                            path: '/admin/verify-code',
                            query: { email: response.data.user.email }
                        });
                    }
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
        setRememberMe() {
            // Get the "Remember Me" checkbox status
            var rememberMe = $('#rememberMe').is(':checked');
            var email = this.data.email;
            var password = this.data.password;
            // If "Remember Me" is checked, set a localStorage item
            if (rememberMe) {
                localStorage.setItem('rememberMe', 'true');
                localStorage.setItem('email', email);
                localStorage.setItem('password', password);
            } else {
                // If not checked, remove the localStorage item
                localStorage.removeItem('rememberMe');
                localStorage.removeItem('email');
                localStorage.removeItem('password');
            }
        },
        getRememberMe() {
            // Check if "Remember Me" cookie is set and update the checkbox accordingly
            if (localStorage.getItem('rememberMe') === 'true') {
                $('#rememberMe').prop('checked', true);
                var email = localStorage.getItem('email');
                var password = localStorage.getItem('password');
                this.data.email = email;
                this.data.password = password;
            } else {
                $('#rememberMe').prop('checked', false);
            }
        },
        loginWithSocial(provider) {
            window.location.href = '/login/' + provider;
        },
    },
    mounted() {
        $('.rquiredError').hide();
        this.getRememberMe();
    },
}
</script>


<style scoped></style>
