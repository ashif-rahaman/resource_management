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
        <spring:url value="/web-resources/js/menuremover.js" var="menuJs"/>
        <spring:url value="/web-resources/js/notification.js" var="notificationJs"/>
        <spring:url value="/web-resources/images/loading.gif" var="loading"/>
        <spring:url value="/web-resources/images/logo.png" var="logo"/>

        <link href="${css}" rel="stylesheet" type="text/css"/>
        <link href="${w3BlueDarkTheme}" rel="stylesheet" type="text/css"/>
        <script src="${js}" type="text/javascript"></script>
        <script src="${complaintAddJs}" type="text/javascript"></script>
        <script src="${menuJs}" type="text/javascript"></script>
        <script src="${notificationJs}" type="text/javascript"></script>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaints</title>
    </head>
    <body onload="setMenu(); getOwnPendingComplaints(); countComplaint(); countRequisition()" class="w3-theme-l3" style="font-family: 'Lato', 'sans-serif';">

        <div>
            <div class="w3-theme-d3 w3-row" style="height: 50px">

                <!--navigation ber-->

                <div class="navbar-menu w3-left">
                    <img src="${logo}" height="45px" style="margin-left: 20%">
                </div>

                <div class="navbar-menu w3-right w3-large" style="height: 100%">
                    <a class="w3-button w3-round-small w3-theme-l2" style="text-decoration: none; height: 100%" href="complaints">
                        Complaints
                        <span id="complaintNotification" class="w3-badge w3-red"></span>
                    </a>
                    <a class="w3-button" style="text-decoration: none;height: 100%" href="requisitions">
                        Requisitions
                        <span id="requisitionNotification" class="w3-badge w3-red"></span>
                    </a>
                    <a class="w3-button" style="text-decoration: none;height: 100%" href="forum">Forum</a>
                    <div class="w3-dropdown-hover" style="padding-right: 20px">
                        <img src="" id="menuImage" class="w3-circle" style="width: 30px;height: 30px" alt="#">
                        <div class="w3-theme-d3 w3-dropdown-content w3-bar-block w3-card-4" style="left: -110px">
                            <a href="profile" class="w3-bar-item w3-button">Profile</a>
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
                        <a class="w3-button side-menu w3-theme-l2" style="text-decoration: none; text-align: left; width: 100%; padding-left: 20%" href="#" onclick="changeOwn(true); getComplaints(); changeSideMenuColor(this)">My Complaints</a>
                        <a id="incomingComplaints" class="w3-button side-menu" style="text-decoration: none; text-align: left; width: 100%; padding-left: 20%" href="#" onclick="changeOwn(false); getComplaints(); changeSideMenuColor(this)">Incoming Complaints</a>
                        <a id="statistics"   class="w3-button" style="text-decoration: none;text-align: left; width: 100%; padding-left: 20%" href="statistics">Statistics</a>
                        <a id="manageHr"     class="w3-button" style="text-decoration: none;text-align: left; width: 100%; padding-left: 20%" href="hr">Manage Human Resources</a>
                        <a id="manageOffice" class="w3-button" style="text-decoration: none;text-align: left; width: 100%; padding-left: 20%" href="office">Manage Office Resources</a>

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
                                        <input id="remarks" class="w3-large w3-input w3-round-small w3-light-gray" type="text" ><br>
                                        <button onclick="addComplaint()" class="w3-input w3-green w3-round-small w3-hover-light-green">Submit Complaint</button>
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

                    <img id="loading" src="${loading}" height="300px" style="display: none; margin-left: auto; margin-right: auto; margin-top: 10%; margin-bottom: 10%">

                    <h2 id="noContent" style="display: none;margin-top: 15%; margin-bottom: 30%; text-align: center">No Complaints Available</h2>

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
