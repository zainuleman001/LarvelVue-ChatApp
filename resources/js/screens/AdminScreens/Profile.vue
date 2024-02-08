<template>
    <Sidebar></Sidebar>
    <Header></Header>
    <div class="body-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 my-5">
                    <div class="row">
                        <div class="col-sm-6 d-flex align-items-stretch">
                            <div class="card w-100">
                                <div class="card-body p-4">
                                    <!-- {{-- <h4 class="fw-semibold">${{ $lastMonthExpenses }}</h4> --}} -->
                                    <h4 class="mb-4">Personal Detail</h4>
                                    <div class="row justify-content-center">
                                        <div class="mb-3 col-md-6">
                                            <label for="name" class="form-label">Name</label>
                                            <input type="text" class="form-control" id="name" placeholder="Name"
                                                v-model="personalDetail.name" name="name">
                                        </div>
                                        <div class="mb-3 col-md-6">
                                            <label for="email" class="form-label">Email address</label>
                                            <input type="text" class="form-control" id="email" placeholder="Email"
                                                v-model="personalDetail.email" name="email">
                                        </div>
                                        <button v-if="personalDetailLoading"
                                            class="btn btn-primary w-100 py-8 mb-4 rounded-2" type="button" disabled>
                                            <span class="spinner-border spinner-border-sm" role="status"
                                                aria-hidden="true"></span>
                                            <span class="visually-hidden">Loading...</span>
                                        </button>
                                        <button v-else type="button" class="btn btn-primary"
                                            @click="updatePersonalDetail">Update</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 d-flex align-items-stretch">
                            <div class="card w-100">
                                <div class="card-body p-4">
                                    <!-- {{-- <h4 class="fw-semibold">${{ $previousMonthDonations }}</h4> --}} -->
                                    <h4 class="mb-4">Change Password</h4>
                                    <div class="row justify-content-center">
                                        <div class="mb-3 col-md-6">
                                            <label for="password" class="form-label">Password</label>
                                            <input type="password" class="form-control" id="password" placeholder="Password"
                                                v-model="data.password" name="password">
                                        </div>
                                        <div class="mb-3 col-md-6">
                                            <label for="password_confirmation" class="form-label">Confirm Password</label>
                                            <input type="password" class="form-control" id="password_confirmation"
                                                placeholder="confirm Password" v-model="data.password_confirmation"
                                                name="password_confirmation">
                                            <small class="text-danger" v-if="!password_matching">Password Not
                                                Matching</small>
                                        </div>
                                        <button v-if="passwrodUpdateLoading"
                                            class="btn btn-primary w-100 py-8 mb-4 rounded-2" type="button" disabled>
                                            <span class="spinner-border spinner-border-sm" role="status"
                                                aria-hidden="true"></span>
                                            <span class="visually-hidden">Loading...</span>
                                        </button>
                                        <button v-else type="button" class="btn btn-primary"
                                            @click="updatePassword">Update</button>
                                    </div>

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
import Header from '../../components/AdminPageComponents/DashboardHeader.vue'
import Sidebar from '../../components/AdminPageComponents/SideBar.vue'
export default {
    components: { Header, Sidebar },
    data() {
        return {
            personalDetail: {
                name: '',
                email: '',
            },
            data: {
                password: '',
                password_confirmation: '',
            },
            password_matching: true,
            personalDetailLoading: false,
            passwrodUpdateLoading: false,
        }
    },
    methods: {
        async updatePersonalDetail() {
            this.personalDetailLoading = true;
            try {
                const response = await this.axios.post(`${this.$apiUrl}update-user-detail`, this.personalDetail);
                this.noti('success', response.data.message);

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
            this.getUser();
            this.personalDetailLoading = false;
        },
        async updatePassword() {
            if (this.data.password == this.data.password_confirmation) {
                this.password_matching = true;
                this.passwrodUpdateLoading = true;
                try {
                    const response = await this.axios.post(`${this.$apiUrl}change-password`, this.data);
                    this.noti('success', response.data.message);
                    this.resetPasswordForm();
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
                this.passwrodUpdateLoading = false;
            } else {
                this.password_matching = false;
            }
        },
        async getUser() {
            try {
                const response = await this.axios.post(`${this.$apiUrl}get-auth-user`);
                this.personalDetail.name = response.data.user.name;
                this.personalDetail.email = response.data.user.email;
            } catch (error) {
                this.noti('error', error.message + (error.response.data.message ? ' <br> <br>' + error.response.data.message : ''));
            }
        },
        resetPasswordForm() {
            this.data.password = '';
            this.data.password_confirmation = '';
        }
    },
    mounted() {
        this.getUser();
    },
}
</script>

<style scoped></style>
