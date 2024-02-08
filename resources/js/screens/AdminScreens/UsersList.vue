<template>
    <Sidebar></Sidebar>
    <Header></Header>
    <div class="body-wrapper">
        <ScreenLoader v-if="screenLoading" />
        <div class="container-fluid" v-else>
            <div class="widget-content searchable-container list">
                <!-- --------------------- start Contact ---------------- -->
                <!-- <div class="card card-body">

                </div> -->
                <div class="card card-body">
                    <div class="d-flex justify-content-between align-items-center mb-9">
                        <form class="position-relative">
                            <input type="text" class="form-control search-chat py-2 ps-5" id="text-srh"
                                placeholder="Search in Users" v-model="searchFilter" @input="paginateUsers(1)">
                            <i
                                class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
                        </form>
                        <router-link to="/admin/add-user" id="btn-add-contact"
                            class="btn btn-info d-flex align-items-center">
                            <i class="ti ti-users text-white me-1 fs-5"></i> Add New User
                        </router-link>
                    </div>
                    <div class="table-responsive">
                        <table class="table search-table align-middle text-nowrap">
                            <thead class="header-item">
                                <tr>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- start row -->
                                <tr class="search-items" v-for="user in paginnatedUsers" :key="user.id">
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img :src="user.image && user.image != '' ? $publicPath + user.image : $adminAssetsPath + 'dist/images/profile/user-1.jpg'"
                                                alt="avatar" class="rounded-circle" width="35">
                                            <div class="ms-3">
                                                <div class="user-meta-info">
                                                    <h6 class="user-name mb-0" :data-name="user.name">{{ user.name }}</h6>
                                                    <span class="user-work fs-3">{{ user.type }}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="usr-email-addr">{{ user.email }}</span>
                                    </td>
                                    <td>
                                        <span class="usr-location">{{ user.email_verified_at ? 'Verified' : 'Not Verified'}}</span>
                                    </td>
                                    <td>
                                        <div class="action-btn">
                                            <router-link :to="'/admin/add-user?id=' + user.id" class="text-dark edit">
                                                <i class="ti ti-eye fs-5"></i>
                                            </router-link>
                                            <a @click="deleteUser(user.id)" class="pointer text-dark delete ms-2">
                                                <i class="ti ti-trash fs-5"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="d-flex align-items-center justify-content-end py-1">
                            <p class="mb-0 fs-2">Rows per page:</p>
                            <select class="form-select w-auto ms-0 ms-sm-2 me-8 me-sm-4 py-1 pe-7 ps-2 border-0"
                                v-model="usersPerPage" @change="paginateUsers(1)" aria-label="Default select example">
                                <option value="2">2</option>
                                <option value="5">5</option>
                                <option value="10">10</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                                <option value="500">500</option>
                                <option value="1000">1000</option>
                                <option :value="users.length">all</option>
                            </select>
                            <p class="mb-0 fs-2">{{ 1 + startIndex }}–{{ endingIndex }} of {{ filteredUsers.length }}</p>
                            <nav aria-label="...">
                                <ul class="pagination justify-content-center mb-0 ms-8 ms-sm-9">
                                    <li :class="'page-item p-1 ' + (startIndex == 0 ? 'pointer-event-none' : '')"
                                        @click="previousPage">
                                        <a class="page-link border-0 rounded-circle text-dark fs-6 round-32 d-flex align-items-center justify-content-center"
                                            href="#"><i
                                                :class="'ti ti-chevron-left ' + (startIndex == 0 ? 'text-muted' : '')"></i></a>
                                    </li>
                                    <li :class="'page-item p-1 ' + (endingIndex == filteredUsers.length ? 'pointer-event-none' : '')"
                                        @click="nextPage">
                                        <a class="page-link border-0 rounded-circle text-dark fs-6 round-32 d-flex align-items-center justify-content-center"
                                            href="#"><i
                                                :class="'ti ti-chevron-right ' + (endingIndex == filteredUsers.length ? 'text-muted' : '')"></i></a>
                                    </li>
                                </ul>
                            </nav>
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
import ScreenLoader from '../../components/AdminPageComponents/ScreenLoader.vue'
export default {
    components: { Header, Sidebar, ScreenLoader },
    data() {
        return {
            screenLoading: false,
            users: [],
            paginnatedUsers: [],
            filteredUsers: [],
            selectedPage: 1,
            usersPerPage: 10,
            totalPages: 1,
            startIndex: 0,
            endingIndex: 9,
            searchFilter: '',
        }
    },
    methods: {
        async getAllUsers() {
            this.screenLoading = true;
            const response = await this.axios.get(`${this.$apiUrl}get-all-users-except-auth`);
            this.users = response.data.users;
            this.paginateUsers(this.selectedPage);
            this.screenLoading = false;
        },
        async deleteUser(id) {
            try {
                this.screenLoading = true;
                const response = await this.axios.post(`${this.$apiUrl}delete-user?id=${id}`);
                this.noti('success', response.data.message);
                this.getAllUsers();
            } catch (error) {
                this.noti('error', error.response.data.message+' <br> <br>'+error.message);
                this.screenLoading = false;
            }
        },
        nextPage() {
            if (this.endingIndex < this.filteredUsers.length) {
                this.selectedPage++;
                this.paginateUsers(this.selectedPage)
            }
        },
        previousPage() {
            if (this.startIndex > 0) {
                this.selectedPage--;
                this.paginateUsers(this.selectedPage)
            }
        },
        paginateUsers(currentPage) {
            this.filteredUsers = this.users;
            if (this.searchFilter != '') {
                this.filteredUsers = this.users.filter(user => {
                    // Check if user name, email, or type contains the searchFilter
                    return (
                        user.name.toLowerCase().includes(this.searchFilter.toLowerCase()) ||
                        user.email.toLowerCase().includes(this.searchFilter.toLowerCase()) ||
                        user.type.toLowerCase().includes(this.searchFilter.toLowerCase())
                    );
                });
            }
            this.selectedPage = currentPage
            this.totalPages = Math.ceil(this.filteredUsers.length / this.usersPerPage)
            this.startIndex = parseInt((this.selectedPage - 1) * this.usersPerPage);
            this.endingIndex = parseInt(this.startIndex + parseInt(this.usersPerPage));
            if (this.endingIndex > this.filteredUsers.length) {
                this.endingIndex = this.filteredUsers.length;
            }
            this.paginnatedUsers = this.filteredUsers.slice(this.startIndex, this.endingIndex);
        },
    },
    mounted() {
        this.getAllUsers();
    },
}
</script>

<style scoped>
.d-list-item {
    display: list-item;
}

.pointer-event-none {
    pointer-events: none;
}
.pointer {
    cursor: pointer;
}
</style>
