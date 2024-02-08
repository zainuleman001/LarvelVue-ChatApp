<template>
    <Sidebar></Sidebar>
    <Header></Header>
    <div class="body-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 d-flex align-items-stretch">
                    <div class="card w-100 bg-light-info overflow-hidden shadow-none">
                        <div class="card-body position-relative">
                            <div class="row">
                                <div class="col-sm-7">
                                    <div class="d-flex align-items-center mb-7">
                                        <div class="rounded-circle overflow-hidden me-6">
                                            <!-- <img src="../../dist/images/profile/user-1.jpg" alt="" width="40"
                                            height="40"> -->
                                        </div>
                                        <!-- <h5 class="fw-semibold mb-0 fs-5">Welcome back {{ Auth::user()->name }}!</h5> -->
                                    </div>
                                    <!-- <div class="d-flex align-items-center">
                                        <div class="border-end pe-4 border-muted border-opacity-10">
                                            <h3 class="mb-1 fw-semibold fs-8 d-flex align-content-center">
                                                {{-- ${{ $total_donations }} --}}
                                                <i class="ti ti-arrow-up-right fs-5 lh-base text-success"></i>
                                            </h3>
                                            <p class="mb-0 text-dark">Total Donations receieved</p>
                                        </div>
                                        <div class="ps-4">
                                            <h3 class="mb-1 fw-semibold fs-8 d-flex align-content-center">
                                                {{-- ${{ $total_expenses }} --}}
                                                <i class="ti ti-arrow-up-right fs-5 lh-base text-danger"></i>
                                            </h3>
                                            <p class="mb-0 text-dark">Total Expenses</p>
                                        </div>
                                    </div> -->
                                </div>
                                <div class="col-sm-5">
                                    <div class="welcome-bg-img mb-n7 text-end">
                                        <img src="https://demos.adminmart.com/premium/bootstrap/modernize-bootstrap/package/dist/images/backgrounds/welcome-bg.svg"
                                            alt="" class="img-fluid">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <div class="col-12 my-5">
                    <div class="row">
                        <div class="col-sm-6 col-lg-3 d-flex align-items-stretch">
                            <div class="card w-100">
                                <div class="card-body p-4">
                                    {{-- <h4 class="fw-semibold">${{ $thisMonthExpenses }}</h4> --}}
                                    <p class="mb-1 fs-3">Current Month Expenses</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3 d-flex align-items-stretch">
                            <div class="card w-100">
                                <div class="card-body p-4">
                                    {{-- <h4 class="fw-semibold">${{ $thisMonthDonations }}</h4> --}}
                                    <p class="mb-1 fs-3">Current Month Donations</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3 d-flex align-items-stretch">
                            <div class="card w-100">
                                <div class="card-body p-4">
                                    {{-- <h4 class="fw-semibold">${{ $lastMonthExpenses }}</h4> --}}
                                    <p class="mb-1 fs-3">Previous Month Expenses</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3 d-flex align-items-stretch">
                            <div class="card w-100">
                                <div class="card-body p-4">
                                    {{-- <h4 class="fw-semibold">${{ $previousMonthDonations }}</h4> --}}
                                    <p class="mb-1 fs-3">Previous Month Donations</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
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

        }
    },
}
</script>

<style scoped></style>
