<template>
    <section id="contactus" class="section contactus-section bg-gray">
        <div class="container">
            <div class="row section-heading">
                <div class="col-lg-6">
                    <h6><span>Contact</span></h6>
                    <h3><span>Let&#x27;s Discuss Project</span></h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="contact-form">
                        <h6>Get in touch</h6>
                        <p class="lead">Our friendly team would love to hear from you.</p>
                        <form id="contact-form">
                            <div class="row gx-3 gy-4">
                                <div class="col-md-6">
                                    <div class="form-group"><label class="form-label">First name</label><input name="name"
                                            id="name" placeholder="Name *" class="form-control " type="text" value="" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group"><label class="form-label">Your Email</label><input name="email"
                                            id="email" placeholder="Email *" class="form-control " type="email" value="" />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group"><label class="form-label">Subject</label><input name="subject"
                                            id="subject" placeholder="Subject *" class="form-control " type="text"
                                            value="" /></div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group"><label class="form-label">Your
                                            message</label><textarea name="message" id="message"
                                            placeholder="Your message *" rows="3" class="form-control "></textarea></div>
                                    <span id="suce_message" class="text-success" style="display:none">Message Sent
                                        Successfully</span>
                                </div>
                                <div class="col-md-12">
                                    <div class="send"><button class="px-btn px-btn-theme2" type="submit" value="Send">
                                            <!-- -->Send Message</button></div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-5 ms-auto col-xl-4 pt-5 pt-lg-0">
                    <ul class="contact-infos">
                        <li>
                            <div class="icon"><i class="fas fa-envelope"></i></div>
                            <div class="col">
                                <h5>Phone</h5>
                                <p>+01 123 654 8096</p>
                            </div>
                        </li>
                        <li>
                            <div class="icon"><i class="fas fa-phone-alt"></i></div>
                            <div class="col">
                                <h5>Mail</h5>
                                <p>info@domainname.com</p>
                            </div>
                        </li>
                        <li>
                            <div class="icon"><i class="fas fa-map-marker-alt"></i></div>
                            <div class="col">
                                <h5>Visit My Studio</h5>
                                <p>Warnwe Park Streetperrine, FL 33157 New York City</p>
                            </div>
                        </li>
                    </ul>
                    <div class="text-center pt-5"><img :src="$userAssetsPath+'assets/img/contact.svg'" class="svg" alt="image" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
export default {
    data() {
        return {

        }
    },
}
</script>

<style scoped></style>
