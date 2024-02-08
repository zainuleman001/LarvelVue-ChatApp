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
                                <form v-if="showFormType.mail">
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="text" placeholder="Enter your email" class="form-control"
                                            v-model="data.email" id="email" name="email">
                                    </div>
                                    <button v-if="loading" class="btn btn-primary w-100 py-8 mb-4 rounded-2" type="button"
                                        disabled>
                                        <span class="spinner-border spinner-border-sm" role="status"
                                            aria-hidden="true"></span>
                                        <span class="visually-hidden">Loading...</span>
                                    </button>
                                    <button v-else type="button" @click="sendVerificationCode"
                                        class="btn btn-primary w-100 py-8 mb-4 rounded-2">Next</button>
                                </form>

                                <div v-if="showFormType.code">
                                    <div class="mb-5 text-center">
                                        <p>We sent a verification code to <span class="fw-bolder mx-1">({{ data.email
                                        }}).</span> Enter that
                                            code from the email in
                                            the field below.</p>
                                    </div>
                                    <form method="post">
                                        <div class="mb-3">
                                            <label for="code" class="form-label">Type your 6 digits security code </label>
                                            <input type="text" class="form-control" id="code" name="code"
                                                v-model="data.code">
                                        </div>
                                        <button v-if="loading" class="btn btn-primary w-100 py-8 mb-4 rounded-2"
                                            type="button" disabled>
                                            <span class="spinner-border spinner-border-sm" role="status"
                                                aria-hidden="true"></span>
                                            <span class="visually-hidden">Loading...</span>
                                        </button>
                                        <button v-else type="button" @click="verifyCode"
                                            class="btn btn-primary w-100 py-8 mb-4">Verify
                                            My
                                            Account</button>
                                    </form>
                                </div>

                                <div v-if="showFormType.password">
                                    <form>
                                        <div class="mb-4">
                                            <label for="password" class="form-label">Password</label>
                                            <input type="password" class="form-control" id="password"
                                                v-model="data.password" name="password">
                                        </div>
                                        <div class="mb-4">
                                            <label for="password_confirmation" class="form-label">Confirm Password</label>
                                            <input type="password" class="form-control" id="password_confirmation"
                                                v-model="data.password_confirmation" name="password_confirmation">
                                        </div>
                                        <button v-if="loading" class="btn btn-primary w-100 py-8 mb-4 rounded-2"
                                            type="button" disabled>
                                            <span class="spinner-border spinner-border-sm" role="status"
                                                aria-hidden="true"></span>
                                            <span class="visually-hidden">Loading...</span>
                                        </button>
                                        <button v-else type="button" @click="changePassword"
                                            class="btn btn-primary w-100 py-8 mb-4 rounded-2">Change Password</button>
                                    </form>
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
            token: '',
            showFormType: {
                mail: true,
                code: false,
                password: false,
            },
            data: {
                email: '',
                code: '',
                password: '',
                password_confirmation: '',
            },
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
                    this.token = `Bearer ${response.data.token}`;
                    this.changeFormTo('password');
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
        async sendVerificationCode() {
            try {
                const response = await this.axios.post(`${this.$apiUrl}send-verification-code-to-email`, this.data);
                this.noti('success', response.data.message);
                this.changeFormTo('code');
            } catch (error) {
                this.noti('error', error.response.data.message);
            }
        },
        async changePassword() {
            const headers = {
                Authorization: this.token // Include the token in the "Authorization" header
            };
            try {
                const response = await this.axios.post(`${this.$apiUrl}change-password`, this.data, { headers });
                this.noti('success', response.data.message);
                this.$router.push({
                    'path': '/admin/login'
                });
            } catch (error) {
                this.noti('error', error.response.data.message);
            }
        },
        changeFormTo(formtype) {
            this.showFormType = {
                mail: false,
                code: false,
                password: false,
            };
            this.showFormType[formtype] = true;
        }
    },
    mounted() {
        $('.rquiredError').hide();
    },
}
</script>

<style scoped></style>
