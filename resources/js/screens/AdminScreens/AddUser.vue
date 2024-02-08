<template>
    <Sidebar></Sidebar>
    <Header></Header>
    <div class="body-wrapper">
        <ScreenLoader v-if="userId && screenLoading" />
        <div class="container-fluid" v-else>
            <div class="widget-content searchable-container list">
                <div class="card card-body">
                    <div class="d-flex justify-content-between align-items-center mb-9">
                        <form class="position-relative">
                            <h3 class="text-center mb-4"> {{ userId ? '' : 'Add New User' }} </h3>
                        </form>
                        <router-link to="/admin/users-list" id="btn-add-contact"
                            class="btn btn-info d-flex align-items-center">
                            <i class="ti ti-users text-white me-1 fs-5"></i> List All Users
                        </router-link>
                    </div>
                    <section class="vh-100" v-if="userId">

                        <div class="container h-100">
                            <div class="row d-flex justify-content-center align-items-start h-100">
                                <div class="col-md-12 col-xl-4">

                                    <div class="card" style="border-radius: 15px;">
                                        <div class="card-body text-center">
                                            <div class="mt-3 mb-4">
                                                <a :href="response.image && response.image != '' ? $publicPath + response.image : $adminAssetsPath + 'dist/images/profile/user-1.jpg'" target="_blank" rel="noopener noreferrer">
                                                    <img :src="response.image && response.image != '' ? $publicPath + response.image : $adminAssetsPath + 'dist/images/profile/user-1.jpg'"
                                                    class="rounded-circle img-fluid" style="width: 100px;" />
                                                </a>
                                            </div>
                                            <h4 class="mb-2">{{response.name}}</h4>
                                            <p class="text-muted mb-4">{{response.email}}<span class="mx-2">|</span> <a
                                                    href="#!">{{response.email_verified_at?'Verified':'Unverified'}}</a></p>

                                            <!-- <button type="button" class="btn btn-primary btn-rounded btn-lg">
                                                Message now
                                            </button>
                                            <div class="d-flex justify-content-between text-center mt-5 mb-2">
                                                <div>
                                                    <p class="mb-2 h5">8471</p>
                                                    <p class="text-muted mb-0">Wallets Balance</p>
                                                </div>
                                                <div class="px-3">
                                                    <p class="mb-2 h5">8512</p>
                                                    <p class="text-muted mb-0">Income amounts</p>
                                                </div>
                                                <div>
                                                    <p class="mb-2 h5">4751</p>
                                                    <p class="text-muted mb-0">Total Transactions</p>
                                                </div>
                                            </div> -->
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </section>

                    <form v-else>
                        <div class="row justify-content-center">
                            <div class="mb-3 col-md-6">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control required" id="name" placeholder="Name"
                                    v-model="data.name" name="name">
                                <small class="text-danger rquiredError">This field required</small>
                            </div>
                            <div class="mb-3 col-md-6">
                                <label for="email" class="form-label">Email address</label>
                                <input type="text" class="form-control required" id="email" placeholder="Email"
                                    v-model="data.email" name="email">
                                <small class="text-danger rquiredError">This field required</small>
                            </div>
                            <div class="mb-3 col-md-6">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control required" id="password" placeholder="Password"
                                    v-model="data.password" name="password">
                                <small class="text-danger rquiredError">This field required</small>
                            </div>
                            <div class="mb-3 col-md-6">
                                <label for="password_confirmation" class="form-label">Confirm Password</label>
                                <input type="password" class="form-control required" id="password_confirmation"
                                    placeholder="confirm Password" v-model="data.password_confirmation"
                                    name="password_confirmation">
                                <small class="text-danger rquiredError">This field required</small>
                                <small class="text-danger" v-if="!password_matching">Password Not Matching</small>
                            </div>

                            <div class="my-3 col-12 px-5 form-check">
                                <input type="checkbox" class="form-check-input" id="verified" v-model="data.email_status">
                                <label class="form-check-label" for="verified">Email Status Verified? </label>
                            </div>
                            <button v-if="loading" class="btn btn-primary w-100 py-8 mb-4 rounded-2" type="button" disabled>
                                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                <span class="visually-hidden">Loading...</span>
                            </button>
                            <button v-else type="button" class="btn btn-primary" @click="addUser">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Header from '../../components/AdminPageComponents/DashboardHeader.vue'
import Sidebar from '../../components/AdminPageComponents/SideBar.vue'
import ScreenLoader from '../../components/AdminPageComponents/ScreenLoader.vue'
export default {
    components: { Header, Sidebar, ScreenLoader },
    data() {
        return {
            userId: null,
            data: {
                name: '',
                email: '',
                password: '',
                password_confirmation: '',
                email_status: false,
            },
            response: {

            },
            password_matching: true,
            loading: false,
            screenLoading: false,
        }
    },
    methods: {
        async getUser(id) {
            try {
                this.screenLoading = true;
                const response = await this.axios.get(`${this.$apiUrl}get-user?id=${id}`);
                this.response = response.data.user
                this.screenLoading = false;
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
        },
        async addUser() {
            if (this.requiredValidation()) {
                if (this.data.password == this.data.password_confirmation) {
                    this.password_matching = true;
                    this.loading = true;
                    try {
                        const response = await this.axios.post(`${this.$apiUrl}add-user`, this.data);
                        this.noti('success', response.data.message);
                        this.resetForm();
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
        resetForm() {
            this.data.name = '';
            this.data.email = '';
            this.data.password = '';
            this.data.password_confirmation = '';
            this.data.email_status = false;
        }
    },
    mounted() {
        $('.rquiredError').hide();
        if (this.$route.query.id) {
            this.userId = this.$route.query.id;
            this.getUser(this.$route.query.id);
        }
    },
}
</script>

<style scoped></style>
