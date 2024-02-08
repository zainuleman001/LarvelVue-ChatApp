import "./bootstrap.js";
import { createApp } from "vue";
import UserApp from "./layout/UserApp.vue";
import AdminApp from "./layout/AdminApp.vue";
import router from "./routes.js";
import VueAxios from "vue-axios";
import axios from "axios";
import mixins from "./mixins.js";
import { Notyf } from "notyf";
import vue3GoogleLogin from "vue3-google-login";
import "notyf/notyf.min.css";

let app = null;
if (window.location.pathname.includes("admin")) {
    app = createApp(AdminApp);
} else {
    app = createApp(UserApp);
}
const basePath = "//127.0.0.1:8000";
const global = app.config.globalProperties;
global.$appUrl = `${basePath}/`;
global.$apiUrl = `${basePath}/api/`;
global.$publicPath = `${basePath}/`;
global.$userAssetsPath = `${basePath}/UserAssets/`;
global.$adminAssetsPath = `${basePath}/AdminAssets/`;
global.$path = window.location.pathname;
global.$notyf = new Notyf({
    duration: 6000,
    position: {
        x: "right",
        y: "top",
    },
});
app.use(vue3GoogleLogin, {
    clientId: "447737389276-7irqpguqnharmdl8917kn5qspl5cgk5m.apps.googleusercontent.com",
});
app.use(router);
app.use(VueAxios, axios);
app.mixin(mixins);
app.mount("#app");
