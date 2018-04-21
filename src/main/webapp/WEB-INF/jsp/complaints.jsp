<%--
    Document   : myComplaints
    Created on : Apr 14, 2018, 1:32:01 PM
    Author     : ariful
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <spring:url value="/web-resources/css/w3.css" var="css"/>
        <spring:url value="/web-resources/css/w3-theme-blue-grey.css" var="w3BlueDarkTheme"/>
        <spring:url value="/web-resources/images/akash.jpg" var="img"/>
        <spring:url value="/web-resources/js/myComplaintsJS.js" var="js" />
        <spring:url value="/web-resources/js/complaintadd.js" var="complaintAddJs" />


        <link href="${css}" rel="stylesheet" type="text/css"/>
        <link href="${w3BlueDarkTheme}" rel="stylesheet" type="text/css"/>
        <script src="${js}" type="text/javascript"></script>
        <script src="${complaintAddJs}" type="text/javascript"></script>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaints</title>
    </head>
    <body onload="getOwnPendingComplaints()" class="w3-theme-l3" style="font-family: 'Lato', 'sans-serif';">

        <div>
            <div class="w3-theme-d3 w3-row" style="height: 50px">

                <!--navigation ber-->

                <div class="navbar-menu w3-right w3-large" style="height: 100%">
                    <a class="w3-button" style="text-decoration: none;" href="complaints">Complaints</a>
                    <a class="w3-button" style="text-decoration: none;" href="requisitions">Requisitions</a>
                    <a class="w3-button" style="text-decoration: none;" href="#">Leave</a>
                    <a class="w3-button" style="text-decoration: none;" href="forum">Forum</a>
                    <div class="w3-dropdown-hover" style="padding-right: 20px">
                        <img src="${img}" class="w3-circle" style="width: 30px;height: 30px" alt="#">
                        <div class="w3-theme-d3 w3-dropdown-content w3-bar-block w3-card-4" style="left: -110px">
                            <a href="#" class="w3-bar-item w3-button">View Profile</a>
                            <a href="#" class="w3-bar-item w3-button">Edit Profile</a>
                            <a href="logout" class="w3-bar-item w3-button">Logout</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="w3-row">

                <!--Left div-->
                <div class="w3-theme-d1 w3-col" style="width: 20%; height: 500px;margin-right: 1%">

                    <div>

                        <a class="w3-button"style="text-align: left; width: 100%; padding-left: 20%">
                            <span onclick="document.getElementById('id01').style.display = 'block'; getTags()">Add Complaint</span>
                        </a>
                        <a class="w3-button" style="text-decoration: none; text-align: left; width: 100%; padding-left: 20%" href="#" onclick="changeOwn(true); getPandingComplaints()">My Complaints</a><br>
                        <a class="w3-button" style="text-decoration: none; text-align: left; width: 100%; padding-left: 20%" href="#" onclick="changeOwn(false); getPandingComplaints()">Incoming Complaints</a><br>
                        <a class="w3-button" style="text-decoration: none;text-align: left; width: 100%; padding-left: 20%" href="admin/statistics">Statistics</a>
                        <a class="w3-button" style="text-decoration: none;text-align: left; width: 100%; padding-left: 20%" href="admin/hr">Manage Human Resources</a>
                        <a class="w3-button" style="text-decoration: none;text-align: left; width: 100%; padding-left: 20%" href="admin/office">Manage Office Resources</a>

                    </div>

                    <!--<##Pop up window-->
                    <div class="w3-container">

                        <div id="id01" class="w3-modal">
                            <div class="w3-modal-content" style="margin-left: 25%;width: 50%">
                                <div class="w3-container w3-theme-l3">
                                    <span onclick="document.getElementById('id01').style.display = 'none'" class="w3-button w3-large w3-red w3-display-topright">&times;</span>
                                    <div class=" w3-margin w3-large" style="padding-top: 10px">

                                        <label>Select a complaint type</label><br>
                                        <select id="tagList" class="w3-input w3-round-small" style="margin-bottom: 15px">

                                            <!--options will be placed by js-->

                                        </select>

                                        <label>Describe your complaint</label>
                                        <textarea id="complaintContent" class="w3-large w3-round-small w3-light-gray w3-input" style="resize: vertical; height: 150px; width: 100%;" required="true" placeholder="Write your comlaint here..."></textarea> <br>

                                        <label class="">Remarks(If any)</label>
                                        <input name="remarks" class="w3-large w3-input w3-round-small w3-light-gray" type="text" ><br>
                                        <button class="w3-input w3-green w3-round-small w3-hover-light-green">Submit Complaint</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Right div-->
                <div class="w3-theme-l2 w3-col" style="width: 79%">

                    <!--Tabs-->
                    <div class="w3-bar w3-col w3-theme-d1" style="width:50%">
                        <button class="w3-bar-item w3-button tablink w3-theme-d2" style="width: 50%" onclick="changeTab(event, 'pending'); getPandingComplaints()">Pending</button>
                        <button class="w3-bar-item w3-button tablink" style="width: 50%" onclick="changeTab(event, 'solved'); getSolvedComplaints()">Solved</button>
                    </div>

                    <!--pending tab-->
                    <div id="pending" class="w3-container w3-border tab" style="display:block;">

                        <!--Pending Complaints-->

                    </div>

                    <!--solved tab-->
                    <div id="solved" class="w3-container w3-border tab" style="display:none">

                        <!--Solved Complaints-->

                    </div>
                </div>


            </div>
        </div>

    </body>
</html>
