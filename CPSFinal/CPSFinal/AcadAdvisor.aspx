﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcadAdvisor.aspx.cs" Inherits="AchieversCPS.AcadAdvisor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <!--Setting the viewport-->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>UHCL - SCE Candidate Plan of Study</title>
    <!-- Custom CSS -->
    <link href="css/acadadvisorpage3.css" rel="stylesheet" />
    <link href="css/acadadvisorfooter2.css" rel="stylesheet" />
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
    <!--<link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />-->
    <!--JavaScript-->
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <!--Google Material Design
    <script src="Content/mdl-v1.1.2/material.min.js"></script>
    <link href="Content/mdl-v1.1.2/material.min.css" rel="stylesheet" />-->
    <!-- Google fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <link href="https://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Alegreya:400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet" type="text/css" />
    <!--Font Awesome-->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style2 {
            width: 189px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse" style="color: white">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">University of Houston Clear Lake</a>
                </div>
                <div class="navbar-collapse collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li><a class="active" href="https://www.uhcl.edu/eservices/" target="_blank">E-Services</a></li>
                        <li><a class="active" href="https://saprd.my.uh.edu/psc/saprd/EMPLOYEE/HRMS/c/UHS_CL_CUSTOM.CLASS_SEARCH.GBL" target="_blank">Class Schedule</a></li>
                        <li><a class="active" href="https://webmail.uhcl.edu/owa/auth/logon.aspx?replaceCurrent=1&url=https%3a%2f%2fwebmail.uhcl.edu%2fowa%2f" target="_blank">Webmail</a></li>
                        <li><a class="active" href="https://blackboard.uhcl.edu/" target="_blank">Blackboard</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <div class="heading">
            Welcome
            <asp:Label ID="sgnName" runat="server" Text="Name"></asp:Label>
            <asp:Button ID="sgnButton" runat="server" Text="SignOut" CssClass="sgn" OnClick="sgnButton_Click" />
        </div>
        <br />
        <br />
        <br />
        <div>
            <div class="menubuttons" style="float: left">
                <asp:Button ID="generateForm" runat="server" Text="Generate Form" CssClass="btn btn-secondary btn-lg" OnClick="generateForm_Click" Width="272px" /><br />
                <br />
                <asp:Button ID="auditCPS" runat="server" Text="Audit CPS" CssClass="btn btn-secondary btn-lg" Width="272px" OnClick="auditCPS_Click" /><br />
                <br />
                <asp:Button ID="modifyCPS" runat="server" Text="Modify CPS" CssClass="btn btn-secondary btn-lg" Width="272px" OnClick="modifyCPS_Click" /><br />
                <br />
                <asp:Button ID="addCatalog" runat="server" Text="Add Catalog/Course" CssClass="btn btn-secondary btn-lg" OnClick="addCatalog_Click" Width="272px" />
            </div>
        </div>

        <div id="ClassPanel">

            <!-- GENERATE FORM PANEL -->

            <asp:Panel ID="generateformpanel" Visible="false" runat="server" CssClass="panel gen">
                <div class="accordian panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Generate CPS Form
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            In this page you can generate new cps forms for the students based on the student enrollment year and semester    
                        </div>
                    </div>
                </div>
                <br />
                <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lbl_semester" runat="server" Text="Semester"></asp:Label>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lbl_year" runat="server" Text="Year"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="ddlSem" runat="server">
                                <asp:ListItem>Spring</asp:ListItem>
                                <asp:ListItem>Summer</asp:ListItem>
                                <asp:ListItem>Fall</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txt_year" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txt_year" MinimumValue="1965" ErrorMessage="Enter a year between 1965 and today" Display="Dynamic" OnInit="RangeValidator1_Init">*</asp:RangeValidator>
                        </td>
                        <td>&nbsp;<asp:Button ID="btn_viewStudentList" runat="server" CssClass="viewbtn" Text="View Student List" OnClick="btn_viewStudentList_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:GridView ID="grdAllStudents" runat="server" CssClass="table">
                                <Columns>
                                    <asp:HyperLinkField DataTextField="studentId" DataNavigateUrlFields="studentId" DataNavigateUrlFormatString="NewStudentPage.aspx?sid={0}" HeaderText="View Student" SortExpression="studentId" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <!-- Panel AddCourse/catalog-->
            <asp:Panel ID="pnlCatalog" Visible="false" runat="server" CssClass="panel">
                <table>
                    <tr>
                        <td>
                            <asp:RadioButton ID="rdoAddCatalog" runat="server" AutoPostBack="true" CssClass="panel-body" OnCheckedChanged="rdoAddCatalog_CheckedChanged" Text="Add Catalog" />
                        </td>
                        <td>
                            <asp:RadioButton ID="rdoAddCourse" AutoPostBack="true" runat="server" CssClass="panel-body" Text="Add Course" OnCheckedChanged="rdoAddCourse_CheckedChanged" />
                        </td>
                    </tr>
                </table>



                <!-- ADD CATALOG PANEL -->
                <asp:Panel ID="AddCatalogPanel" Visible="false" runat="server" CssClass="panel">
                    <div class="accordian panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Add Catalog
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body">
                                In this page you can download, modify and upload the UHCL academic catalog for the current year.  
                            </div>
                        </div>
                    </div>
                    <br />
                    <asp:Label ID="lblCatalog" runat="server" Text="Download the current academic year catalog"></asp:Label><br />
                    <br />

                    <asp:Button ID="btnDownload" runat="server" Text="Download Catalog" CssClass="butn" OnClick="btnDownload_Click" />
                    <br />
                    <br />
                    <p>Upload the modified academic calender catalog</p>
                    <br />
                    <asp:FileUpload ID="FileUpload1" CssClass="butn" runat="server" />
                    <br />
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="butn" OnClick="btnUpload_Click1" />
                </asp:Panel>

                <!-- Add Course Panel-->
                <asp:Panel ID="pnlAddCourse" Visible="false" runat="server" CssClass="panel">
                    <div class="accordian panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Add Course
                                </a>
                            </h4>
                        </div>

                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                In this page you can add new course for the current year.  
                            </div>
                        </div>
                    </div>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblDeptName" runat="server" Text="Department Name:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDept" runat="server" ValidationGroup="grp2">
                                    <asp:ListItem Value="ACCT">Accounting</asp:ListItem>
                                    <asp:ListItem Value="ADSU">Administration and Supervision</asp:ListItem>
                                    <asp:ListItem Value="AFSC">AFSC</asp:ListItem>
                                    <asp:ListItem Value="ANTH">Anthropology</asp:ListItem>
                                    <asp:ListItem Value="ARTS">Arts</asp:ListItem>
                                    <asp:ListItem Value="ASTR">Astronomy and Space Science</asp:ListItem>
                                    <asp:ListItem Value="BAPA">Business and Public Administration</asp:ListItem>
                                    <asp:ListItem Value="BIOL">Biology</asp:ListItem>
                                    <asp:ListItem Value="BIOT">Biotechnology</asp:ListItem>
                                    <asp:ListItem Value="BSCI">Behavioral Sciences</asp:ListItem>
                                    <asp:ListItem Value="CENG">Computer Engineering</asp:ListItem>
                                    <asp:ListItem Value="CHEM">Chemistry</asp:ListItem>
                                    <asp:ListItem Value="CINF">Computer Information Systems</asp:ListItem>
                                    <asp:ListItem Value="COMM">Communication</asp:ListItem>
                                    <asp:ListItem Value="COUN">Counseling</asp:ListItem>
                                    <asp:ListItem Value="CRCL">Cross-Cultural Studies</asp:ListItem>
                                    <asp:ListItem Value="CRIM">Criminology</asp:ListItem>
                                    <asp:ListItem Value="CSCI">Computer Science</asp:ListItem>
                                    <asp:ListItem Value="DMST">Digital Media Studies</asp:ListItem>
                                    <asp:ListItem Value="DSCI">Decision Sciences</asp:ListItem>
                                    <asp:ListItem Value="ECED">Early Childhood Education</asp:ListItem>
                                    <asp:ListItem Value="ECON">Economics</asp:ListItem>
                                    <asp:ListItem Value="EDCI">Education in Curriculum and Instruction</asp:ListItem>
                                    <asp:ListItem Value="EDLS">Educational Leadership</asp:ListItem>
                                    <asp:ListItem Value="EDUC">Education</asp:ListItem>
                                    <asp:ListItem Value="EENG">EENG</asp:ListItem>
                                    <asp:ListItem Value="EMGT">Engineering Management</asp:ListItem>
                                    <asp:ListItem Value="ENGR">ENGR</asp:ListItem>
                                    <asp:ListItem Value="ENSC">Environmental Science</asp:ListItem>
                                    <asp:ListItem Value="ENVR">Environmental Management</asp:ListItem>
                                    <asp:ListItem Value="EXHS">Fitness and Human Performance</asp:ListItem>
                                    <asp:ListItem Value="FINC">Finance</asp:ListItem>
                                    <asp:ListItem Value="GAME">GAME</asp:ListItem>
                                    <asp:ListItem Value="GEOG">Geography</asp:ListItem>
                                    <asp:ListItem Value="GEOL">Geology</asp:ListItem>
                                    <asp:ListItem Value="HADM">Healthcare Administration</asp:ListItem>
                                    <asp:ListItem Value="HIST">History</asp:ListItem>
                                    <asp:ListItem Value="HLTH">Health</asp:ListItem>
                                    <asp:ListItem Value="HMRS">Human Resource Management</asp:ListItem>
                                    <asp:ListItem Value="HUMN">Humanities</asp:ListItem>
                                    <asp:ListItem Value="INDH">Industrial Hygiene and Safety</asp:ListItem>
                                    <asp:ListItem Value="INST">Instructional Technology</asp:ListItem>
                                    <asp:ListItem Value="ISAM">Information Systems Administration and Management</asp:ListItem>
                                    <asp:ListItem Value="ITEC">ITEC</asp:ListItem>
                                    <asp:ListItem Value="LEGL">Legal Studies</asp:ListItem>
                                    <asp:ListItem Value="LITR">Literature</asp:ListItem>
                                    <asp:ListItem Value="LLAS">LLAS</asp:ListItem>
                                    <asp:ListItem Value="LLLS">LLLS</asp:ListItem>
                                    <asp:ListItem Value="MATH">Mathematics</asp:ListItem>
                                    <asp:ListItem Value="MENG">MENG</asp:ListItem>
                                    <asp:ListItem Value="MGMT">Management</asp:ListItem>
                                    <asp:ListItem Value="MKTG">Marketing</asp:ListItem>
                                    <asp:ListItem Value="MSCI">MSCI</asp:ListItem>
                                    <asp:ListItem Value="NCBI">NCBI</asp:ListItem>
                                    <asp:ListItem Value="NCBM">NCBM</asp:ListItem>
                                    <asp:ListItem Value="NCBR">NCBR</asp:ListItem>
                                    <asp:ListItem Value="NCBW">NCBW</asp:ListItem>
                                    <asp:ListItem Value="NURS">NURS</asp:ListItem>
                                    <asp:ListItem Value="PHIL">Philosophy</asp:ListItem>
                                    <asp:ListItem Value="PHYS">Physics</asp:ListItem>
                                    <asp:ListItem Value="POLS">POLS</asp:ListItem>
                                    <asp:ListItem Value="PPRM">PPRM</asp:ListItem>
                                    <asp:ListItem Value="PSLD">PSLD</asp:ListItem>
                                    <asp:ListItem Value="PSYC">Psychology</asp:ListItem>
                                    <asp:ListItem Value="SENG">Systems Engineering</asp:ListItem>
                                    <asp:ListItem Value="SILC">Studies in Language and Culture</asp:ListItem>
                                    <asp:ListItem Value="SOCI">Sociology</asp:ListItem>
                                    <asp:ListItem Value="SPAN">Spanish</asp:ListItem>
                                    <asp:ListItem Value="SPED">Special Education</asp:ListItem>
                                    <asp:ListItem Value="STAT">Statistics</asp:ListItem>
                                    <asp:ListItem Value="SWEN">Software Engineering</asp:ListItem>
                                    <asp:ListItem Value="SWRK">SWRK</asp:ListItem>
                                    <asp:ListItem Value="TCED">Teacher Education</asp:ListItem>
                                    <asp:ListItem Value="UHCL">UHCL</asp:ListItem>
                                    <asp:ListItem Value="WGST">Women's and Gender Studies</asp:ListItem>
                                    <asp:ListItem Value="WRIT">Writing</asp:ListItem>

                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblRubric" runat="server" Text="Course Rubric:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlRubric" runat="server" ValidationGroup="grp2">
                                    <asp:ListItem Value="ACCT">Accounting</asp:ListItem>
                                    <asp:ListItem Value="ADSU">Administration and Supervision</asp:ListItem>
                                    <asp:ListItem Value="AFSC">AFSC</asp:ListItem>
                                    <asp:ListItem Value="ANTH">Anthropology</asp:ListItem>
                                    <asp:ListItem Value="ARTS">Arts</asp:ListItem>
                                    <asp:ListItem Value="ASTR">Astronomy and Space Science</asp:ListItem>
                                    <asp:ListItem Value="BAPA">Business and Public Administration</asp:ListItem>
                                    <asp:ListItem Value="BIOL">Biology</asp:ListItem>
                                    <asp:ListItem Value="BIOT">Biotechnology</asp:ListItem>
                                    <asp:ListItem Value="BSCI">Behavioral Sciences</asp:ListItem>
                                    <asp:ListItem Value="CENG">Computer Engineering</asp:ListItem>
                                    <asp:ListItem Value="CHEM">Chemistry</asp:ListItem>
                                    <asp:ListItem Value="CINF">Computer Information Systems</asp:ListItem>
                                    <asp:ListItem Value="COMM">Communication</asp:ListItem>
                                    <asp:ListItem Value="COUN">Counseling</asp:ListItem>
                                    <asp:ListItem Value="CRCL">Cross-Cultural Studies</asp:ListItem>
                                    <asp:ListItem Value="CRIM">Criminology</asp:ListItem>
                                    <asp:ListItem Value="CSCI">Computer Science</asp:ListItem>
                                    <asp:ListItem Value="DMST">Digital Media Studies</asp:ListItem>
                                    <asp:ListItem Value="DSCI">Decision Sciences</asp:ListItem>
                                    <asp:ListItem Value="ECED">Early Childhood Education</asp:ListItem>
                                    <asp:ListItem Value="ECON">Economics</asp:ListItem>
                                    <asp:ListItem Value="EDCI">Education in Curriculum and Instruction</asp:ListItem>
                                    <asp:ListItem Value="EDLS">Educational Leadership</asp:ListItem>
                                    <asp:ListItem Value="EDUC">Education</asp:ListItem>
                                    <asp:ListItem Value="EENG">EENG</asp:ListItem>
                                    <asp:ListItem Value="EMGT">Engineering Management</asp:ListItem>
                                    <asp:ListItem Value="ENGR">ENGR</asp:ListItem>
                                    <asp:ListItem Value="ENSC">Environmental Science</asp:ListItem>
                                    <asp:ListItem Value="ENVR">Environmental Management</asp:ListItem>
                                    <asp:ListItem Value="EXHS">Fitness and Human Performance</asp:ListItem>
                                    <asp:ListItem Value="FINC">Finance</asp:ListItem>
                                    <asp:ListItem Value="GAME">GAME</asp:ListItem>
                                    <asp:ListItem Value="GEOG">Geography</asp:ListItem>
                                    <asp:ListItem Value="GEOL">Geology</asp:ListItem>
                                    <asp:ListItem Value="HADM">Healthcare Administration</asp:ListItem>
                                    <asp:ListItem Value="HIST">History</asp:ListItem>
                                    <asp:ListItem Value="HLTH">Health</asp:ListItem>
                                    <asp:ListItem Value="HMRS">Human Resource Management</asp:ListItem>
                                    <asp:ListItem Value="HUMN">Humanities</asp:ListItem>
                                    <asp:ListItem Value="INDH">Industrial Hygiene and Safety</asp:ListItem>
                                    <asp:ListItem Value="INST">Instructional Technology</asp:ListItem>
                                    <asp:ListItem Value="ISAM">Information Systems Administration and Management</asp:ListItem>
                                    <asp:ListItem Value="ITEC">ITEC</asp:ListItem>
                                    <asp:ListItem Value="LEGL">Legal Studies</asp:ListItem>
                                    <asp:ListItem Value="LITR">Literature</asp:ListItem>
                                    <asp:ListItem Value="LLAS">LLAS</asp:ListItem>
                                    <asp:ListItem Value="LLLS">LLLS</asp:ListItem>
                                    <asp:ListItem Value="MATH">Mathematics</asp:ListItem>
                                    <asp:ListItem Value="MENG">MENG</asp:ListItem>
                                    <asp:ListItem Value="MGMT">Management</asp:ListItem>
                                    <asp:ListItem Value="MKTG">Marketing</asp:ListItem>
                                    <asp:ListItem Value="MSCI">MSCI</asp:ListItem>
                                    <asp:ListItem Value="NCBI">NCBI</asp:ListItem>
                                    <asp:ListItem Value="NCBM">NCBM</asp:ListItem>
                                    <asp:ListItem Value="NCBR">NCBR</asp:ListItem>
                                    <asp:ListItem Value="NCBW">NCBW</asp:ListItem>
                                    <asp:ListItem Value="NURS">NURS</asp:ListItem>
                                    <asp:ListItem Value="PHIL">Philosophy</asp:ListItem>
                                    <asp:ListItem Value="PHYS">Physics</asp:ListItem>
                                    <asp:ListItem Value="POLS">POLS</asp:ListItem>
                                    <asp:ListItem Value="PPRM">PPRM</asp:ListItem>
                                    <asp:ListItem Value="PSLD">PSLD</asp:ListItem>
                                    <asp:ListItem Value="PSYC">Psychology</asp:ListItem>
                                    <asp:ListItem Value="SENG">Systems Engineering</asp:ListItem>
                                    <asp:ListItem Value="SILC">Studies in Language and Culture</asp:ListItem>
                                    <asp:ListItem Value="SOCI">Sociology</asp:ListItem>
                                    <asp:ListItem Value="SPAN">Spanish</asp:ListItem>
                                    <asp:ListItem Value="SPED">Special Education</asp:ListItem>
                                    <asp:ListItem Value="STAT">Statistics</asp:ListItem>
                                    <asp:ListItem Value="SWEN">Software Engineering</asp:ListItem>
                                    <asp:ListItem Value="SWRK">SWRK</asp:ListItem>
                                    <asp:ListItem Value="TCED">Teacher Education</asp:ListItem>
                                    <asp:ListItem Value="UHCL">UHCL</asp:ListItem>
                                    <asp:ListItem Value="WGST">Women's and Gender Studies</asp:ListItem>
                                    <asp:ListItem Value="WRIT">Writing</asp:ListItem>

                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCoursseNumber" runat="server" Text="Course Number:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNumber" MaxLength="4" runat="server" ValidationGroup="grp2"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtNumber" ValidationExpression="\d{4}" ValidationGroup="grp2" runat="server" ErrorMessage="Only Numbers allowed"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCourseName" runat="server" Text="Course Name:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCourseName" runat="server" ValidationGroup="grp2"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="grp2" ControlToValidate="txtCourseName" ErrorMessage="Input Needed"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCourseType" runat="server" Text="Course Type:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlCourseType" runat="server" ValidationGroup="grp2">
                                    <asp:ListItem Value="CORE">Core</asp:ListItem>
                                    <asp:ListItem Value="ELEC">Elective</asp:ListItem>
                                    <asp:ListItem Value="FOUN">Foundation</asp:ListItem>
                                    <asp:ListItem Value="RESRCH">Research</asp:ListItem>
                                    <asp:ListItem Value="RELEC">Required Elective</asp:ListItem>
                                    <asp:ListItem Value="CAPS">Capstone</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblUnits" runat="server" Text="Units:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlUnits" runat="server">
                                    <asp:ListItem>0</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnAddCourse" runat="server" CssClass="btn" ValidationGroup="grp2" Text="Add Course" OnClick="btnAddCourse_Click" />
                            </td>
                            <td>
                                <asp:Button ID="BtnReset" runat="server" CssClass="btn" Text="Reset" OnClick="BtnReset_Click" />
                            </td>
                        </tr>
                    </table>

                </asp:Panel>
            </asp:Panel>
        </div>

        <footer>
            <!--Contact me-->
            <div class="page" id="contact me">
                <div class="content">
                    <h4 id="cnt">Contact</h4>
                    <h4 id="sce">College of Science and Engineering</h4>
                    <div>
                        <span id="add">Bayou Building 3611
                        2700 Bay Area Blvd, Box 415
                        Houston, TX 77058-1002
                        </span>
                    </div>
                    <div>
                        <span id="ph">Phone: 281-283-3700</span>
                        <span id="ph1">Advising: 281-283-3711</span>
                    </div>
                    <div>
                        <span id="mail">cseadvising@uhcl.edu</span>
                    </div>
                    <ul class="social">
                        <li><a href="https://www.facebook.com/UHClearLake" target="_blank"><i class="fa fa-facebook-square fa-lg"></i></a></li>
                        <li><a href="https://twitter.com/UHClearLake" target="_blank"><i class="fa fa-twitter-square fa-lg"></i></a></li>
                        <li><a href="https://www.instagram.com/UHClearLake/" target="_blank"><i class="fa fa-instagram fa-lg"></i></a></li>
                    </ul>
                    <span id="copy">&copy; 2017 University of Houston Clear Lake</span>
                </div>
                <!--content div-->
            </div>
            <!--Contact me div-->
        </footer>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </form>
</body>
</html>
