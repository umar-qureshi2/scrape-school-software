<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="calendar.ascx.cs" Inherits="School.usercontrols.calendar" %>
<link href="../css2/form.css" media="all" rel="stylesheet" type="text/css" />
<head>
    <!-- start: Meta -->
    <meta charset="utf-8">
    <title>Bootstrap Metro Dashboard by Dennis Ji for ARM demo</title>
    <meta name="description" content="Bootstrap Metro Dashboard">
    <meta name="author" content="Dennis Ji">
    <meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <!-- end: Meta -->
    <!-- start: Mobile Specific -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- end: Mobile Specific -->
    <!-- start: CSS -->
    <link id="bootstrap-style" href="css2/bootstrap.min.css" rel="stylesheet">
    <link href="css2/bootstrap-responsive.min.css" rel="stylesheet">
    <link id="base-style" href="css2/style.css" rel="stylesheet">
    <link id="base-style-responsive" href="css2/style-responsive.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&amp;subset=latin,cyrillic-ext,latin-ext"
        rel="stylesheet" type="text/css">
    <!-- end: CSS -->
    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="css2/ie.css" rel="stylesheet">
	<![endif]-->
    <!--[if IE 9]>
		<link id="ie9style" href="css2/ie9.css" rel="stylesheet">
	<![endif]-->
    <!-- start: Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- end: Favicon -->
    <style type="text/css">
        .jqstooltip
        {
            position: absolute;
            left: 0px;
            top: 0px;
            visibility: hidden;
            background: rgb(0, 0, 0) transparent;
            background-color: rgba(0,0,0,0.6);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);
            -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
            color: white;
            font: 10px arial, san serif;
            text-align: left;
            white-space: nowrap;
            padding: 5px;
            border: 1px solid white;
            z-index: 10000;
        }
        .jqsfield
        {
            color: white;
            font: 10px arial, san serif;
            text-align: left;
        }
    </style>
</head>
<body>
<style>
    .calendarHead
    {
        border-bottom-width:1px;
    }
</style>
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
        BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="12pt" 
        ForeColor="Black" Height="500px" NextPrevFormat="FullMonth" Width="500px" OnVisibleMonthChanged="Calendar1_VisibleMonthChanged">
        <DayHeaderStyle Font-Bold="True" Font-Size="11pt" />
        <NextPrevStyle Font-Bold="True" Font-Size="10pt" ForeColor="#333333" 
            VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="0px" 
            Font-Bold="True" Font-Size="12pt" ForeColor="#333399" CssClass="calendarHead" />
        <TodayDayStyle BackColor="#CCCCCC" />
        <OtherMonthDayStyle Font-Size="10pt" />
    </asp:Calendar>
</body>
