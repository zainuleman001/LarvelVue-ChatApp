import { createRouter, createWebHistory } from "vue-router";
import Home from "./screens/Home.vue";
import Login from "./screens/Login.vue";
import Logout from "./screens/Logout.vue";
import Register from "./screens/Register.vue";
import AfterSocialCallBack from "./screens/AfterSocialCallBack.vue";
import Dashboard from "./screens/AdminScreens/Dashboard.vue";
import Profile from "./screens/AdminScreens/Profile.vue";
import AddUser from "./screens/AdminScreens/AddUser.vue";
import UsersList from "./screens/AdminScreens/UsersList.vue";
import CodeVerification from "./screens/CodeVerification.vue";
import ForgetPassword from "./screens/ForgetPassword.vue";
import axios from "axios";

async function guard(to, from, next, check) {
    let isAuthenticated =
        localStorage.getItem("token") && localStorage.getItem("user")
            ? true
            : false;
    if (check) {
        if (isAuthenticated) {
            // More Secure but a little bit slow
            // try {
            //     const response = await axios.post(
            //         `${window.location.origin}/api/check-token`
            //     );
            //     next();
            // } catch (error) {
            //     localStorage.removeItem("user");
            //     localStorage.removeItem("token");
            //     window.location.href = "/admin/login";
            // }

            // less secure but fast
            next();
        } else {
            localStorage.removeItem("user");
            localStorage.removeItem("token");
            window.location.href = "/admin/login";
        }
    } else {
        if (
            (to.name === "login" ||
                to.name === "register" ||
                to.name === "verifyCode" ||
                to.name === "VerifyEmail" ||
                to.name === "forgotPassword") &&
            isAuthenticated
        ) {
            window.location.href = "/admin/dashboard";
        } else {
            next();
        }
    }
}
const routes = [
    {
        path: "/",
        component: Home,
    },

    // Authentication Routes Starts Below
    {
        path: "/admin/login",
        name: "login",
        component: Login,
        beforeEnter: (to, from, next) => {
            guard(to, from, next, false);
        },
    },
    {
        path: "/admin/register",
        name: "register",
        component: Register,
        beforeEnter: (to, from, next) => {
            guard(to, from, next, false);
        },
    },
    {
        path: "/admin/verify-code",
        name: "verifyCode",
        component: CodeVerification,
        beforeEnter: (to, from, next) => {
            guard(to, from, next, false);
        },
    },
    {
        path: "/admin/forget-password",
        name: "forgotPassword",
        component: ForgetPassword,
        beforeEnter: (to, from, next) => {
            guard(to, from, next, false);
        },
    },
    {
        path: "/admin/afterSocialCallBack",
        name: "afterSocialCallBack",
        component: AfterSocialCallBack,
        beforeEnter: (to, from, next) => {
            guard(to, from, next, false);
        },
    },

    // Admin Routes Starts Below
    {
        path: "/admin/dashboard",
        name: "dashboard",
        component: Dashboard,
        beforeEnter: (to, from, next) => {
            guard(to, from, next, true);
        },
    },
    {
        path: "/admin/profile",
        name: "profile",
        component: Profile,
        beforeEnter: (to, from, next) => {
            guard(to, from, next, true);
        },
    },
    {
        path: "/admin/add-user",
        name: "AddUser",
        component: AddUser,
        beforeEnter: (to, from, next) => {
            guard(to, from, next, true);
        },
    },
    {
        path: "/admin/users-list",
        name: "UsersList",
        component: UsersList,
        beforeEnter: (to, from, next) => {
            guard(to, from, next, true);
        },
    },
    {
        path: "/admin/logout",
        name: "logout",
        component: Logout,
        beforeEnter: (to, from, next) => {
            guard(to, from, next, true);
        },
    },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;
