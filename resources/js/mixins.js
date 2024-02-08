import { Notyf } from 'notyf';
import 'notyf/notyf.min.css';
const notyf = new Notyf({
    duration: 6000,
    position: {
        x: 'right',
        y: 'top',
    },
})
export default {
    data() {
        return {

        }
    },
    methods: {
        noti(type, message) {
            const notyf = new Notyf();
            notyf.open({
                message: message,
                type: type,
                position: { x: 'right', y: 'top' },
                ripple: true,
                duration: 5000,
            });
        },
        requiredValidation() {
            $('.rquiredError').hide();
            // Check if required fields are filled
            var isValid = true;
            $('.required').each(function () {
                if ($(this).val() === "") {
                    $(this).next('.rquiredError').show();
                    isValid = false;
                }
            });

            // If any required field is empty, stop further execution
            if (!isValid) {
                return false;
            } else {
                return true
            }
        },
        // async getAdminSettings() {
        //     var adminSetting = {};
        //     try {
        //         const response = await this.axios.get(`${this.$apiUrl}get/adminSetting`);
        //         adminSetting = response.data.adminSetting;
        //         return adminSetting;
        //     } catch (error) {
        //         console.log('Error in your mixin file while getting admin setting: ' + error);
        //     }
        // },
        isObjectEmpty(object){
            return Object.keys(object).length === 0;
        },
        logout(){
            localStorage.removeItem('user');
            localStorage.removeItem('token');
            window.location.href = "/admin/login";
        }
    },
}
