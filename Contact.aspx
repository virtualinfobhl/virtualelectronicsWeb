<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7220.185823750894!2d55.275132!3d25.200089!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3e5f42816493e4a1%3A0x9991d05586e972fd!2sBoulevard%20Plaza%2C%20Tower%201%20-%20Downtown%20Dubai%20-%20Dubai%20-%20United%20Arab%20Emirates!5e0!3m2!1sen!2sin!4v1640595935092!5m2!1sen!2sin" width="1200" height="450" frameborder="0" style="border: 0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
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
                                    Suite 1702, Level 17,Boulevard Plaze Tower 1,\nDowntown, Dubai, UAE
                                </p>
                                <p>
                                    <span class="iconContact">
                                        <i class="fa fa-phone"></i>
                                    </span>
                                    Mobile No: +971 4 267 5395
                                      
                                </p>
                                <p>
                                    <span class="iconContact">
                                        <i class="fa fa-envelope-o"></i>
                                    </span>
                                    Email: info@justfindmedia.com
                                        <br>
                                    Website: <a href="https://www.justfindmedia.com/" target="_blank">www.justfindmedia.com</a> 
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

