<template>
    <!-- Header Start -->
    <div class="body-wrapper">
        <header class="app-header">
            <nav class="navbar navbar-expand-lg navbar-light">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link sidebartoggler nav-icon-hover ms-n3" id="headerCollapse">
                            <i class="ti ti-menu-2"></i>
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-center">
                    <li class="nav-item dropdown">
                        <a class="nav-link pe-0" href="#" @click="toggleDropdown">
                            <div class="d-flex align-items-center">
                                <div class="user-profile-img">
                                    <img :src=" user.image && user.image != '' ? $publicPath + user.image : $adminAssetsPath + 'dist/images/profile/user-1.jpg'" class="rounded-circle"
                                        width="35" height="35" alt="">
                                </div>
                            </div>
                        </a>
                        <div class="dropdown-menu content-dd dropdown-menu-end dropdown-menu-animate-up show"
                            v-if="isDropdownOpen" aria-labelledby="drop1">
                            <div class="profile-dropdown position-relative">
                                <div class="py-3 px-7 pb-0">
                                    <h5 class="mb-0 fs-5 fw-semibold">User Profile</h5>
                                </div>
                                <div class="d-flex align-items-center py-9 mx-7 border-bottom">
                                    <img :src=" user.image && user.image != '' ? $publicPath + user.image : $adminAssetsPath + 'dist/images/profile/user-1.jpg'" class="rounded-circle" width="80"
                                        height="80" alt="">
                                    <div class="ms-3">
                                        <h5 class="mb-1 fs-3">{{user.name}}</h5>
                                        <p class="mb-0 d-flex text-dark align-items-center gap-2">
                                            <i class="ti ti-mail fs-4"></i> {{user.email}}
                                        </p>
                                    </div>
                                </div>
                                <div class="message-body">
                                    <router-link to="/admin/profile" class="py-8 px-7 mt-8 d-flex align-items-center">
                                        <span
                                            class="d-flex align-items-center justify-content-center bg-light rounded-1 p-6">
                                            <img src="https://demos.adminmart.com/premium/bootstrap/modernize-bootstrap/package/dist/images/svgs/icon-account.svg"
                                                alt="" width="24" height="24">
                                        </span>
                                        <div class="w-75 d-inline-block v-middle ps-3">
                                            <h6 class="mb-1 bg-hover-primary fw-semibold"> My Profile
                                            </h6>
                                            <span class="d-block text-dark">Account Settings</span>
                                        </div>
                                    </router-link>
                                </div>
                                <div class="d-grid py-4 px-7 pt-8">
                                    <router-link to="/admin/logout" class="btn btn-outline-primary">Log
                                        Out</router-link>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </nav>
        </header>
    </div>
    <!-- Header End -->
</template>
<script>
export default {
    data() {
        return {
            user: {},
            isDropdownOpen: false
        };
    },
    methods: {
        toggleDropdown() {
            this.isDropdownOpen = !this.isDropdownOpen;
        }
    },
    mounted() {
        this.user = JSON.parse(localStorage.getItem('user'));
    },
};
</script>


<style scoped>
.dropdown-menu {
    right: 0px;
}
</style>

