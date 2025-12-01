<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section class="main_contact_area">
            <div class="breadcrumbs">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="container-inner">
                                <ul>
                                    <li class="home">
                                        <a href="Index.aspx">Home</a>
                                        <span>
                                            <i class="fa fa-angle-right"></i>
                                        </span>
                                    </li>
                                    <li class="category3">
                                        <strong>contact </strong>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row contact-content-area">
                        <h2>Customer service -<strong> Contact us</strong></h2>
                        <div class="contact-baner">
                            <div class="contact-text">
                                <h2>Contact info</h2>
                                <p>get in touch</p>
                            </div>
                        </div>
                    </div>
                    <div class="row contact-map">
                        <h3>We are located</h3>
                     <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3605.8201783903287!2d74.6358925146073!3d25.3438144838282!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3968c235646d347b%3A0x4784f6e2e8595fbe!2sFriends%20Mobile%20%26%20Electronics!5e0!3m2!1sen!2sin!4v1585222798043!5m2!1sen!2sin" width="1200" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                    </div>
                    <div class="contact-from-atea">
                        <div class="form-and-info">
                            <div class="col-sm-5 col-md-4 npl">
                                <div class="contactDetails contactHead">
                                    <h3>CONTACT Info</h3>
                                    <p>
                                        <span class="iconContact">
                                            <i class="fa fa-map-marker"></i>
                                        </span>
                                        G 16-17,Mangalam Plaza, Rishya Shring Circle, 311001, Garib Nawaz Colony, Bhawani Nagar, Shastri Nagar

                                        <br>
                                      Bhilwara Rajasthan
                                    </p>
                                    <p>
                                        <span class="iconContact">
                                            <i class="fa fa-phone"></i>
                                        </span>
                                        Mobile No: 9829796177
                                      
                                    </p>
                                    <p>
                                        <span class="iconContact">
                                            <i class="fa fa-envelope-o"></i>
                                        </span>
                                        Email: info@virtualinfosystems.com
                                        <br>
                                        Website: www.Virtualelectronics.com
                                    </p>
                                </div>
                              
                            </div>
                            <div class="col-sm-7 col-md-8 npr">
                                <div class="contactfrom">
                                    <h1>message</h1>
                                    <form class="">
                                        <div class="col-md-6 npl">
                                            <input id="InputName" class="form-control" type="text" placeholder="Full name" required="">
                                        </div>
                                        <div class="col-md-6 contactemail npr">
                                            <input id="InputEmail" class="form-control" type="email" placeholder="Email" required="">
                                        </div>
                                        <div class="col-md-12 np">
                                            <textarea class="form-control" rows="8" placeholder="Massage" required=""></textarea>
                                        </div>
                                        <button class="btn btnContact" type="submit">send message</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
</asp:Content>

