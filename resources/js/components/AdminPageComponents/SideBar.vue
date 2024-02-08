<template>
    <!-- Sidebar Start -->
    <aside class="left-sidebar">
        <!-- Sidebar scroll-->
        <div>
            <div class="brand-logo d-flex align-items-center justify-content-between">
                <router-link to="/admin/dashboard" class="text-nowrap logo-img">
                    <img :src="$userAssetsPath+'assets/img/logo.svg'" class="dark-logo" width="180" alt="" />
                </router-link>
                <div class="close-btn d-lg-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                    <i class="ti ti-x fs-8"></i>
                </div>
            </div>
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav scroll-sidebar" data-simplebar>
                <ul id="sidebarnav">
                    <!-- ============================= -->
                    <!-- Home -->
                    <!-- ============================= -->
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Home</span>
                    </li>
                    <!-- =================== -->
                    <!-- Dashboard -->
                    <!-- =================== -->
                    <li class="sidebar-item">
                        <router-link :class="'sidebar-link ' + (currentPath=='/admin/dashboard'?'active':'')" to="/admin/dashboard" aria-expanded="false">
                            <span>
                                <i class="ti ti-aperture"></i>
                            </span>
                            <span class="hide-menu">Dashboard</span>
                        </router-link>
                    </li>
                    <li class="sidebar-item">
                        <router-link :class="'sidebar-link ' + (currentPath=='/admin/users-list'?'active':'')" to="/admin/users-list" aria-expanded="false">
                            <span>
                                <i class="ti ti-users"></i>
                            </span>
                            <span class="hide-menu">Users List</span>
                        </router-link>
                    </li>
                    <!-- ============================= -->
                    <!-- Apps -->
                    <!-- ============================= -->
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Settings</span>
                    </li>

                    <li class="sidebar-item">
                        <router-link :class="'sidebar-link ' + (currentPath=='/admin/profile'?'active':'')" to="/admin/profile" aria-expanded="false">
                            <span>
                                <i class="ti ti-user-circle"></i>
                            </span>
                            <span class="hide-menu">User Profile</span>
                        </router-link>
                    </li>
                </ul>
            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <!-- Sidebar End -->
</template>

<script>
export default {
    data() {
        return {
            currentPath: '',
        }
    },
    mounted() {
        this.currentPath = window.location.pathname;
    },
}
</script>

<style lang="scss" scoped></style>
