<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="School.Students" %>


<!DOCTYPE html>
<html lang="en">
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>School</title>
	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	
	<!-- start: CSS -->
    <link href="css/form.css" rel="stylesheet" type="text/css" />
    <script src="js/amcharts.js" type="text/javascript"></script>
    <script src="js/serial.js" type="text/javascript"></script>
    <script src="js/modernizr-2.6.2.min.js" type="text/javascript"></script>
      <script src="js/Navigation.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="js/GraphQuery.js" type="text/javascript"></script>
	<link id="bootstrap-style" href="css2/bootstrap.min.css" rel="stylesheet">
	<link href="css2/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="css2/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="css2/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	<!-- end: CSS -->
   

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="css/ie.css" rel="stylesheet">
	<![endif]-->
	
	<!--[if IE 9]>
		<link id="ie9style" href="css/ie9.css" rel="stylesheet">
	<![endif]-->
		
	<!-- start: Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico">
	<!-- end: Favicon -->
	
		
		
		
</head>

<body style="background-color: #3A3A3A">
		<!-- start: Header -->
         
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="http://www.edgnome.com"><span>Edgnome</span></a>
								
				<!-- start: Header Menu -->
				<div class="nav-no-collapse header-nav">
					<ul class="nav pull-right">
						
						<!-- end: Message Dropdown -->
						
						<!-- start: User Dropdown -->
						<li class="dropdown">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="halflings-icon white user"></i> SohAib
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li class="dropdown-menu-title">
 									<span>Account Settings</span>
								</li>
								<li><a href="#"><i class="halflings-icon user"></i> Profile</a></li>
								<li><a href="#"><i class="halflings-icon off"></i> Logout</a></li>
							</ul>
						</li>
						<!-- end: User Dropdown -->
					</ul>
				</div>
				<!-- end: Header Menu -->
				
			</div>
		</div>
	</div>
	<!-- start: Header -->
	
		<div class="container-fluid-full">
		<div class="row-fluid">
				
			<!-- start: Main Menu -->
			<div id="sidebar-left" class="span2">
				<div class="nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
                        <li><a href="Students.aspx"><i class="icon-bar-chart"></i><span class="hidden-tablet"> Dashboard</span></a></li>
						<li><a href="#" onclick="toggle_forms('ProgrssStudent');"><i class="icon-bar-chart"></i><span class="hidden-tablet"> Progress</span></a></li>	
						<li><a href="#" onclick="toggle_forms('Graphs');"><i class="icon-bar-chart"></i><span class="hidden-tablet"> Graphs</span></a></li>
						<li><a href="#"><i class="icon-tasks"></i><span class="hidden-tablet"> Syllabus</span></a></li>
						<li><a href="#" onclick="toggle_forms('Assignments');"><i class="icon-eye-open"></i><span class="hidden-tablet"> Home Work</span></a></li>
						<li><a href="#" onclick="toggle_forms('Quiz');"><i class="icon-dashboard"></i><span class="hidden-tablet"> Tests</span></a></li>
                        <li><a href="#" onclick="toggle_forms('Attendance');"><i class="icon-edit"></i><span class="hidden-tablet"> Attendance</span></a></li>
						<li><a href="#" onclick="toggle_forms('Achievements');"><i class="icon-list-alt"></i><span class="hidden-tablet"> Achievements</span></a></li>
						<li><a href="#" onclick="toggle_forms('Transcript');"><i class="icon-font"></i><span class="hidden-tablet"> Transcripts</span></a></li>
                        <li>
							<a class="dropmenu" href="#"><i class="icon-folder-close-alt"></i><span class="hidden-tablet"> Issues</span><span class="label label-important"> 3 </span></a>
							<ul>
								<li><a class="submenu" href="#"onclick="toggle_forms('NewTicket');" ><i class="icon-file-alt"></i><span class="hidden-tablet"> New Issue</span></a></li>
								<li><a class="submenu" href="#" onclick="toggle_forms('PendingTickets');"><i class="icon-file-alt"></i><span class="hidden-tablet"> Pending</span></a></li>
							</ul>	
						</li>
                        <li><a href="#" onclick="toggle_forms('ShowSurvey');"><i class="icon-font"></i><span class="hidden-tablet"> Surveys</span></a></li>
					</ul>
				</div>
			</div>
			<!-- end: Main Menu -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<!-- start: Content -->
			<div id="content" class="span10">
			 <form id="form1" runat="server">
						
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="#">Home</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="#">Typography</a></li>
			</ul>

			  <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptPath="js/Navigation.js" >
    
    </asp:ScriptManager>
  
  <div id="Dashboard" class="pure-form-stacked"  style="display: block">
   <div class="row-fluid">
				
				<div class="span3 statbox purple" onTablet="span6" onDesktop="span3">
					<div><img src="images/glad.png" width="64px" height="64px" alt="images/glad.png" /> </div>
					<div class="number">32<i class="icon-arrow-up"></i></div>
					<div class="title">Simleys</div>
					<div class="footer">
						<a href="#"> read full report</a>
					</div>	
				</div>
				<div class="span3 statbox green" onTablet="span6" onDesktop="span3">
					<div><img src="images/csad.png" width="64px" height="64px" alt="images/csad.png" /></div>
					<div class="number">23<i class="icon-arrow-up"></i></div>
					<div class="title">Sad</div>
					<div class="footer">
						<a href="#"> read full report</a>
					</div>
				</div>
				<div class="span3 statbox blue noMargin" onTablet="span6" onDesktop="span3">
					<div><img src="images/3.png" width="64px" height="64px" alt="images/3.png" /></div>
					<div class="number">10<i class="icon-arrow-up"></i></div>
					<div class="title">Issues</div>
					<div class="footer">
						<a href="#"> read full report</a>
					</div>
				</div>
				<div class="span3 statbox yellow" onTablet="span6" onDesktop="span3">
					<div class="boxchart"></div>
					<div class="number">75%<i class="icon-arrow-down"></i></div>
					<div class="title">Attendance</div>
					<div class="footer">
						<a href="#"> read full report</a>
					</div>
				</div>	
				
			</div>		

            <div class="row-fluid">
				
				<div class="span8 widget blue" onTablet="span7" onDesktop="span8">
					
					<div id="stats-chart2"  style="height:282px" ></div>
					
				</div>
				
				<div class="sparkLineStats span4 widget green" onTablet="span5" onDesktop="span4">

                    <ul class="unstyled">
                        
                        <li><span class="sparkLineStats3"></span> 
                            Pageviews: 
                            <span class="number">781</span>
                        </li>
                        <li><span class="sparkLineStats4"></span>
                            Pages / Visit: 
                            <span class="number">2,19</span>
                        </li>
                        <li><span class="sparkLineStats5"></span>
                            Avg. Visit Duration: 
                            <span class="number">00:02:58</span>
                        </li>
                        <li><span class="sparkLineStats6"></span>
                            Bounce Rate: <span class="number">59,83%</span>
                        </li>
                        <li><span class="sparkLineStats7"></span>
                            % New Visits: 
                            <span class="number">70,79%</span>
                        </li>
                        <li><span class="sparkLineStats8"></span>
                            % Returning Visitor: 
                            <span class="number">29,21%</span>
                        </li>

                    </ul>
					
					<div class="clearfix"></div>

                </div><!-- End .sparkStats -->

			</div>

            <div class="row-fluid hideInIE8 circleStats">
				
				<div class="span2" onTablet="span4" onDesktop="span2">
                	<div class="circleStatsItemBox yellow">
						<div class="header">Islamiat</div>
						<span class="percent">percent</span>
						<div class="circleStat">
                    		<input type="text" value="58" class="whiteCircle" />
						</div>		
						<div class="footer">
							<span class="count">
								<span class="number">20000</span>
								<span class="unit">MB</span>
							</span>
							<span class="sep"> / </span>
							<span class="value">
								<span class="number">50000</span>
								<span class="unit">MB</span>
							</span>	
						</div>
                	</div>
				</div>

				<div class="span2" onTablet="span4" onDesktop="span2">
                	<div class="circleStatsItemBox green">
						<div class="header">Social Studies</div>
						<span class="percent">percent</span>
						<div class="circleStat">
                    		<input type="text" value="78" class="whiteCircle" />
						</div>
						<div class="footer">
							<span class="count">
								<span class="number">5000</span>
								<span class="unit">GB</span>
							</span>
							<span class="sep"> / </span>
							<span class="value">
								<span class="number">5000</span>
								<span class="unit">GB</span>
							</span>	
						</div>
                	</div>
				</div>

				<div class="span2" onTablet="span4" onDesktop="span2">
                	<div class="circleStatsItemBox greenDark">
						<div class="header">Science</div>
						<span class="percent">percent</span>
                    	<div class="circleStat">
                    		<input type="text" value="100" class="whiteCircle" />
						</div>
						<div class="footer">
							<span class="count">
								<span class="number">64</span>
								<span class="unit">GB</span>
							</span>
							<span class="sep"> / </span>
							<span class="value">
								<span class="number">64</span>
								<span class="unit">GB</span>
							</span>	
						</div>
                	</div>
				</div>

				<div class="span2 noMargin" onTablet="span4" onDesktop="span2">
                	<div class="circleStatsItemBox pink">
						<div class="header">Maths</div>
						<span class="percent">percent</span>
                    	<div class="circleStat">
                    		<input type="text" value="83" class="whiteCircle" />
						</div>
						<div class="footer">
							<span class="count">
								<span class="number">64</span>
								<span class="unit">GHz</span>
							</span>
							<span class="sep"> / </span>
							<span class="value">
								<span class="number">3.2</span>
								<span class="unit">GHz</span>
							</span>	
						</div>
                	</div>
				</div>

				<div class="span2" onTablet="span4" onDesktop="span2">
                	<div class="circleStatsItemBox orange">
						<div class="header">English</div>
						<span class="percent">percent</span>
                    	<div class="circleStat">
                    		<input type="text" value="100" class="whiteCircle" />
						</div>
						<div class="footer">
							<span class="count">
								<span class="number">64</span>
								<span class="unit">GB</span>
							</span>
							<span class="sep"> / </span>
							<span class="value">
								<span class="number">64</span>
								<span class="unit">GB</span>
							</span>	
						</div>
                	</div>
				</div>

				<div class="span2" onTablet="span4" onDesktop="span2">
                	<div class="circleStatsItemBox greenLight">
						<div class="header">Urdu</div>
						<span class="percent">percent</span>
                    	<div class="circleStat">
                    		<input type="text" value="100" class="whiteCircle" />
						</div>
						<div class="footer">
							<span class="count">
								<span class="number">64</span>
								<span class="unit">GB</span>
							</span>
							<span class="sep"> / </span>
							<span class="value">
								<span class="number">64</span>
								<span class="unit">GB</span>
							</span>	
						</div>
                	</div>
				</div>
						
			</div>	


            <div class="row-fluid">
				
				<div class="box black span4" onTablet="span6" onDesktop="span4">
					<div class="box-header">
						<h2><i class="halflings-icon white list"></i><span class="break"></span>Weekly Stat</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<ul class="dashboard-list metro">
							<li>
								<a href="#">
									<i class="icon-arrow-up green"></i>                               
									<strong>92</strong>
									New Comments                                    
								</a>
							</li>
						  <li>
							<a href="#">
							  <i class="icon-arrow-down red"></i>
							  <strong>15</strong>
							  New Registrations
							</a>
						  </li>
						  <li>
							<a href="#">
							  <i class="icon-minus blue"></i>
							  <strong>36</strong>
							  New Articles                                    
							</a>
						  </li>
						  <li>
							<a href="#">
							  <i class="icon-comment yellow"></i>
							  <strong>45</strong>
							  User reviews                                    
							</a>
						  </li>
						  <li>
							<a href="#">
							  <i class="icon-arrow-up green"></i>                               
							  <strong>112</strong>
							  New Comments                                    
							</a>
						  </li>
						  <li>
							<a href="#">
							  <i class="icon-arrow-down red"></i>
							  <strong>31</strong>
							  New Registrations
							</a>
						  </li>
						  <li>
							<a href="#">
							  <i class="icon-minus blue"></i>
							  <strong>93</strong>
							  New Articles                                    
							</a>
						  </li>
						  <li>
							<a href="#">
							  <i class="icon-comment yellow"></i>
							  <strong>256</strong>
							  User reviews                                    
							</a>
						  </li>
						</ul>
					</div>
				</div><!--/span-->
				
				<div class="box black span4" onTablet="span6" onDesktop="span4">
					<div class="box-header">
						<h2><i class="halflings-icon white user"></i><span class="break"></span>Last Users</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<ul class="dashboard-list metro">
							<li class="green">
								<a href="#">
									<img class="avatar" alt="Dennis Ji" src="img/avatar.jpg">
								</a>
								<strong>Name:</strong> Dennis Ji<br>
								<strong>Since:</strong> Jul 25, 2012 11:09<br>
								<strong>Status:</strong> Approved             
							</li>
							<li class="yellow">
								<a href="#">
									<img class="avatar" alt="Dennis Ji" src="img/avatar.jpg">
								</a>
								<strong>Name:</strong> Dennis Ji<br>
								<strong>Since:</strong> Jul 25, 2012 11:09<br>
								<strong>Status:</strong> Pending                                
							</li>
							<li class="red">
								<a href="#">
									<img class="avatar" alt="Dennis Ji" src="img/avatar.jpg">
								</a>
								<strong>Name:</strong> Dennis Ji<br>
								<strong>Since:</strong> Jul 25, 2012 11:09<br>
								<strong>Status:</strong> Banned                                  
							</li>
							<li class="blue">
								<a href="#">
									<img class="avatar" alt="Dennis Ji" src="img/avatar.jpg">
								</a>
								<strong>Name:</strong> Dennis Ji<br>
								<strong>Since:</strong> Jul 25, 2012 11:09<br>
								<strong>Status:</strong> Updated                                 
							</li>
						</ul>
					</div>
				</div><!--/span-->
				
				<div class="box black span4 noMargin" onTablet="span12" onDesktop="span4">
					<div class="box-header">
						<h2><i class="halflings-icon white check"></i><span class="break"></span>To Do List</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<div class="todo metro">
							<ul class="todo-list">
								<li class="red">
									<a class="action icon-check-empty" href="#"></a>	
									Windows Phone 8 App 
									<strong>today</strong>
								</li>
								<li class="red">
									<a class="action icon-check-empty" href="#"></a>
									New frontend layout
									<strong>today</strong>
								</li>
								<li class="yellow">
									<a class="action icon-check-empty" href="#"></a>
									Hire developers
									<strong>tommorow</strong>
								</li>
								<li class="yellow">
									<a class="action icon-check-empty" href="#"></a>
									Windows Phone 8 App
									<strong>tommorow</strong>
								</li>
								<li class="green">
									<a class="action icon-check-empty" href="#"></a>
									New frontend layout
									<strong>this week</strong>
								</li>
								<li class="green">
									<a class="action icon-check-empty" href="#"></a>
									Hire developers
									<strong>this week</strong>
								</li>
								<li class="blue">
									<a class="action icon-check-empty" href="#"></a>
									New frontend layout
									<strong>this month</strong>
								</li>
								<li class="blue">
									<a class="action icon-check-empty" href="#"></a>
									Hire developers
									<strong>this month</strong>
								</li>
							</ul>
						</div>	
					</div>
				</div>
			
			</div>

   </div>

   <div id="Graphs"  class="pure-form pure-form-stacked form1 " 
    style="display: none">
    <fieldset>
    <div class="row-fluid sortable">
    <div class="box span12">
	<div class="box-header">
    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Graphs</h2>				
	</div>
    <div class="box-content">
   <div class="pure-u-1-2">
   <input type="button" class="pure-button pure-button-primary" value="Show Graph" onclick="showGraph(this.value)" />
   <div id="chartdiv" style="width: 400px; height: 300px;"></div>
   </div>
   </div>
   </div>
   </div>
   </fieldset>
   </div>

    

    <div id="ProgrssStudent"  class="pure-form pure-form-stacked form1 " 
    style="display: none">
    <fieldset>
    <div class="row-fluid sortable">
    <div class="box span12">
	<div class="box-header">
    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Progress</h2>				
	</div>
    <div class="box-content">
    <div class="pure-g-r">
    <div class="pure-u-1-2">
      <label for="last-name">Class</label>
      <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="SELECT [className] FROM [Class]"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList3" data-rel="chosen" runat="server" 
            DataSourceID="SqlDataSource5" DataTextField="className">
        </asp:DropDownList>
    </div>
     <div class="pure-u-1-2">
      <label for="last-name">Exam Type</label>
      <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
             ConnectionString="<%$ ConnectionStrings:school %>" 
             SelectCommand="SELECT [examType] FROM [ExamType]"></asp:SqlDataSource>
         <asp:DropDownList ID="DropDownList4" data-rel="chosen" runat="server" 
             DataSourceID="SqlDataSource6" DataTextField="examType">
         </asp:DropDownList>
    </div>
    </div>
     <div class="pure-u-1-2">
        <button id="Button4"   type="submit" class="pure-button pure-button-primary" runat="server" onserverclick="ShowMarks" style="margin-top: 0.4cm;">Show Marks</button>
    </div>
    <br />
    <br />
   
        <asp:GridView ID="GridView7" runat="server" CssClass="gridview" GridLines="None" Width="100%" 
            AutoGenerateColumns="True">
        </asp:GridView>
   </div>
   </div><!--/span-->
   </div><!--/row-->
   </fieldset>
   </div>

    <div id="Achievements"  class="pure-form pure-form-stacked form1 " 
    style="display: none">
    <fieldset>
     <div class="row-fluid sortable">
    <div class="box span12">
	<div class="box-header">
    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Achivements & Recommendations</h2>				
	</div>
    <div class="box-content">
    <div class="pure-g-r">
    <div class="pure-u-1-2">
      <label for="last-name">From Date</label>
      <asp:TextBox ID="MinDate" runat="server" type="date" value="yyyy-MM-dd"></asp:TextBox>
    </div>
     <div class="pure-u-1-2">
      <label for="last-name">To Date</label>
      <asp:TextBox ID="MaxDate" runat="server" type="date" value="yyyy-MM-dd"></asp:TextBox>
    </div>
    </div>
    <div class="pure-u-1-2">
        <button id="Button1"   type="submit" class="pure-button pure-button-primary" runat="server" onserverclick="ShowAptitude" style="margin-top: 0.4cm;">Show</button>
    </div>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="spSelectStudentAppitude" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="studentId" SessionField="School" Type="String" />
                <asp:ControlParameter ControlID="MinDate" DbType="Date" Name="minDate" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="MaxDate" DbType="Date" Name="maxDate" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
          <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            CssClass="gridview" GridLines="None" DataSourceID="SqlDataSource2" Width="100%">
              <Columns>
               <asp:BoundField DataField="Teacher Name" HeaderText="Teacher Name" 
                      SortExpression="Teacher Name" ReadOnly="True" />
                  <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:d}" 
                      SortExpression="Date" />
                      <asp:BoundField DataField="Student Appitude" HeaderText="Student Appitude" 
                      SortExpression="Student Appitude" />
                  <asp:BoundField DataField="Student Attitude" HeaderText="Student Attitude" 
                      SortExpression="Student Attitude" />
                  <asp:BoundField DataField="Teacher Recommendation" 
                      HeaderText="Teacher Recommendation" SortExpression="Teacher Recommendation" />
              </Columns>
         </asp:GridView>
         </div>
         </div>
         </div>
   </fieldset>
    </div>  
    <div id="BioData"  class="pure-form pure-form-stacked form1 " 
    style="display: none">
    <fieldset>
   <legend>
    Bio Data
   </legend>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="spSlectPersonalInfoDetails" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="pKId" SessionField="School" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" 
            AutoGenerateRows="False" DataKeyNames="pKId" DataSourceID="SqlDataSource1" 
            CellPadding="4" CssClass="gridview" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
            <EditRowStyle BackColor="#7C6F57" />
            <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="pKId" HeaderText="Student ID" ReadOnly="True" 
                    SortExpression="pKId" />
                <asp:BoundField DataField="name" HeaderText="Student Name" ReadOnly="True" 
                    SortExpression="name" />
                <asp:BoundField DataField="passCode" HeaderText="Password" 
                    SortExpression="passCode" />
                <asp:BoundField DataField="phone" HeaderText="Phone No" SortExpression="phone" />
                <asp:BoundField DataField="emergencyContact" HeaderText="emergencyContact" 
                    SortExpression="emergencyContact" />
                <asp:BoundField DataField="cellNo" HeaderText="Cell No" 
                    SortExpression="cellNo" />
                <asp:TemplateField HeaderText="Gender" SortExpression="gender">
                <ItemTemplate><%# (Boolean.Parse(Eval("gender").ToString())) ? "Female" : "Male" %></ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="eMail" HeaderText="Email" SortExpression="eMail" />
                <asp:TemplateField HeaderText="Status" SortExpression="isActive">
                <ItemTemplate><%# (Boolean.Parse(Eval("isActive").ToString())) ? "Active" : "In Active"%></ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="enrollmentDate" HeaderText="Enrollment Date" DataFormatString="{0:d}"
                    SortExpression="enrollmentDate" />
                <asp:BoundField DataField="dOB" HeaderText="Date Of Birth" DataFormatString="{0:d}" SortExpression="dOB" />
                <asp:BoundField DataField="address1" HeaderText="Address 1" 
                    SortExpression="address1" />
                <asp:BoundField DataField="address2" HeaderText="Address 2" 
                    SortExpression="address2" />
                <asp:BoundField DataField="address3" HeaderText="Address 3" 
                    SortExpression="address3" />
                <asp:BoundField DataField="fileName" HeaderText="File Name" 
                    SortExpression="fileName" Visible="False" />
            </Fields>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:DetailsView>
   </fieldset>
    </div>  

    <div id="Assignments"  class="pure-form pure-form-stacked form1 " 
    style="display: none">
    <fieldset>
     <div class="row-fluid sortable">
    <div class="box span12">
	<div class="box-header">
    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Home Work</h2>				
	</div>
    <div class="box-content">
    <br />
        <asp:GridView ID="GridView1" runat="server" GridLines="None" CssClass="gridview" Width="100%" 
            AutoGenerateColumns="False" onrowcommand="GridView1_RowCommand">
         <Columns>
               <asp:TemplateField HeaderText="Subject">
               <ItemTemplate>
                   <asp:Label ID="Subject" runat="server" Text='<%#Eval("Subject") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
           <asp:TemplateField HeaderText="Upload Date">
               <ItemTemplate>
                   <asp:Label ID="UploadDate" runat="server" Text='<%#Eval("Upload Date") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
            <asp:TemplateField HeaderText="File Name">
               <ItemTemplate>
                   <asp:Label ID="FileName" runat="server" Text='<%#Eval("File Name") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
            <asp:TemplateField HeaderText="Home Work">
               <ItemTemplate>
                   <asp:Label ID="Test" runat="server" Text='<%#Eval("Assignment") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
               <asp:TemplateField HeaderText="Submit">
                   <ItemTemplate>
                       <asp:ImageButton ID="ImageButton1" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Submit"  runat="server" ImageUrl="~/images/s.png" />
                   </ItemTemplate>
               </asp:TemplateField>
           </Columns>
        </asp:GridView>
        </div>
        </div>
        </div>
   </fieldset>
    </div>
  
    <div id="Quiz"  class="pure-form pure-form-stacked form1 " 
    style="display: none">
    <fieldset>
     <div class="row-fluid sortable">
    <div class="box span12">
	<div class="box-header">
    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Tests</h2>				
	</div>
    <div class="box-content">
    <br />
     
         <asp:GridView ID="GridView3" runat="server" GridLines="None" CssClass="gridview" Width="100%" AutoGenerateColumns="False">
          <Columns>
               <asp:TemplateField HeaderText="Subject">
               <ItemTemplate>
                   <asp:Label ID="Subject" runat="server" Text='<%#Eval("Subject") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
           <asp:TemplateField HeaderText="Upload Date">
               <ItemTemplate>
                   <asp:Label ID="UploadDate" runat="server" Text='<%#Eval("Upload Date") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
            <asp:TemplateField HeaderText="File Name" Visible="False">
               <ItemTemplate>
                   <asp:Label ID="FileName" runat="server" Text='<%#Eval("File Name") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
            <asp:TemplateField HeaderText="Test">
               <ItemTemplate>
                   <asp:Label ID="Test" runat="server" Text='<%#Eval("Assignment") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
           </Columns>
        </asp:GridView>
        </div>
        </div>
        </div>
   </fieldset>
    
    </div>
   
    <div id="LoadAttendance"  class="pure-form pure-form-stacked form1 " 
    style="display: none">
    <fieldset>
     <div class="row-fluid sortable">
    <div class="box span12">
	<div class="box-header">
    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Attendance</h2>				
	</div>
    <div class="box-content">
    <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="spShowCMAttandus" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="iAm" SessionField="School" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
         <asp:GridView ID="GridView5" runat="server" GridLines="None" CssClass="gridview" Width="100%" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
          <Columns>
               <asp:BoundField DataField="Subject" HeaderText="Subject" 
                   SortExpression="Subject" />
               <asp:BoundField DataField="Smilies" HeaderText="Smilies" 
                   SortExpression="Smilies" ReadOnly="True" />
               <asp:BoundField DataField="Sad" HeaderText="Sad" 
                   SortExpression="Sad" ReadOnly="True" />
               <asp:BoundField DataField="Presents" HeaderText="Presents" 
                   SortExpression="Presents" ReadOnly="True" />
               <asp:BoundField DataField="Absents" HeaderText="Absents" ReadOnly="True" 
                   SortExpression="Absents" />
           </Columns>
        </asp:GridView>
        </div>
        </div>
        </div>
   </fieldset>
    </div>  
    
     <div id="Attendance"  class="pure-form pure-form-stacked form1 " 
    style="display: none">
    <fieldset>
     <div class="row-fluid sortable">
    <div class="box span12">
	<div class="box-header">
    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Attendance</h2>				
	</div>
    <div class="box-content">
     <div class="pure-g-r">
    <div class="pure-u-1-2">
      <label for="last-name">Month</label>
        <asp:DropDownList ID="DropDownList1" data-rel="chosen" runat="server">
            <asp:ListItem>January</asp:ListItem>
            <asp:ListItem> February</asp:ListItem>
            <asp:ListItem>March</asp:ListItem>
            <asp:ListItem> April</asp:ListItem>
            <asp:ListItem>May</asp:ListItem>
            <asp:ListItem>June</asp:ListItem>
            <asp:ListItem>July</asp:ListItem>
            <asp:ListItem>August</asp:ListItem>
            <asp:ListItem>September</asp:ListItem>
            <asp:ListItem>October </asp:ListItem>
            <asp:ListItem>November</asp:ListItem>
            <asp:ListItem>December</asp:ListItem>
        </asp:DropDownList>
    </div>
     <div class="pure-u-1-2">
      <label for="last-name">Subject</label>
       <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
             ConnectionString="<%$ ConnectionStrings:school %>" 
             SelectCommand="SELECT [subjectName] FROM [Subjects]"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList2" data-rel="chosen" runat="server" 
             DataSourceID="SqlDataSource7" DataTextField="subjectName">
        </asp:DropDownList>
    </div>
    </div>
    <div class="pure-u-1-2">
        <button id="Button3"   type="submit" class="pure-button pure-button-primary" runat="server" onserverclick="ShowAttendance" style="margin-top: 0.4cm;">Show</button>
    </div>
    <br />
    <br />
     
        <asp:GridView ID="GridView4" runat="server" GridLines="None" CssClass="gridview" Width="100%" AutoGenerateColumns="False">
        <Columns>
               <asp:BoundField DataField="Date" HeaderText="Attendance" ReadOnly="True" DataFormatString="{0:d}"
                    SortExpression="Date" />
           <asp:TemplateField HeaderText="Attendance Day">
               <ItemTemplate>
                   <asp:Label ID="Day" runat="server" Text='<%#Eval("Day") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
             <asp:TemplateField HeaderText="Attendance" SortExpression="Status">
                <ItemTemplate><%# (Boolean.Parse(Eval("Status").ToString())) ? "Present" : "Absent"%></ItemTemplate>
                </asp:TemplateField>
           </Columns>
        </asp:GridView>
        </div>
        </div>
        </div>
   </fieldset>
    </div>  
    
 
     <div id="Transcript"  class="pure-form pure-form-stacked form1 " 
    style="display: none">
    <fieldset>
    <div class="row-fluid sortable">
    <div class="box span12">
	<div class="box-header">
    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Transcript</h2>				
	</div>
    <div class="box-content">
    <br />
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="spShowTranscript" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="iAm" SessionField="School" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
         <asp:GridView ID="GridView6" GridLines="None" runat="server" CssClass="gridview" Width="100%" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
          <Columns>
               <asp:BoundField DataField="class" HeaderText="Class" 
                   SortExpression="class" />
               <asp:BoundField DataField="Subjects" HeaderText="Subject" 
                   SortExpression="Subjects" />
               <asp:BoundField DataField="Grade" HeaderText="Grade" 
                   SortExpression="Grade" />
               <asp:BoundField DataField="Year" HeaderText="Year" 
                   SortExpression="Year" ReadOnly="True" />
           </Columns>
        </asp:GridView>
        </div>
        </div>
        </div>
   </fieldset>
    </div>  


    <div id="ShowSurvey"  class="pure-form pure-form-stacked form1 " style="display: none">
    <fieldset>
    <div class="row-fluid sortable">
    <div class="box span12">
	<div class="box-header">
    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Surveys</h2>				
	</div>
    <div class="box-content">
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="spShowSurvey" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="iAm" SessionField="School" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
          <asp:GridView ID="GridView8" GridLines="None" runat="server" AutoGenerateColumns="False" 
            CssClass="gridview" DataSourceID="SqlDataSource8" Width="100%" 
            AllowPaging="True" onpageindexchanged="GridView8_PageIndexChanged" 
            DataKeyNames="surveyid,type" onrowcommand="GridView8_RowCommand" 
            CellSpacing="-1">
              <Columns>
               <asp:BoundField DataField="surveyid" HeaderText="surveyid" 
                      SortExpression="surveyid" InsertVisible="False" ReadOnly="True" Visible="False" />
                  <asp:BoundField DataField="Survey Name" HeaderText="Survey Name" 
                      SortExpression="Survey Name" />
                   <asp:BoundField DataField="Survey Date" HeaderText="Survey Date" DataFormatString="{0:d}"
                      SortExpression="Survey Date" />
       
                  <asp:TemplateField HeaderText="Type Of Survey" SortExpression="type">
               <ItemTemplate>
                   <asp:Label ID="type" runat="server" Text='<%# (Boolean.Parse(Eval("type").ToString())) ? "Rating" : "Yes/No"%>'></asp:Label>
               </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Status" SortExpression="Active">
                <ItemTemplate><%# (Boolean.Parse(Eval("Active").ToString())) ? "Active" : "In Active"%></ItemTemplate>
               </asp:TemplateField>
                  <asp:BoundField DataField="Audiance" HeaderText="Audiance" 
                      SortExpression="Audiance" />
                  <asp:TemplateField HeaderText="Show Survey">
                      <ItemTemplate>
                          <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="show" ImageUrl="~/images/pencil_03.png" />
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
         </asp:GridView>
         </div>
         </div>
         </div>
    </fieldset>
        
     </div>

     <div id="sFillSurvey"  class="pure-form pure-form-stacked form1 " style="display: none">
    <fieldset>
    <div class="row-fluid sortable">
    <div class="box span12">
	<div class="box-header">
    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Fill Survey</h2>				
	</div>
    <div class="box-content">
      <div class="pure-g-r">
        <button id="Button5" type="button"   class="pure-button pure-button-primary"  runat="server" onserverclick="SubmitSurvey" style="margin-top: 0.4cm;">Submit Survey</button>
        <button id="Button6" type="button"   class="pure-button pure-button-primary" onclick="sCloseShowSurvey();toggle_forms('ShowSurvey');return true;";  style="margin-top: 0.4cm; margin-left: 0.4cm;">Close</button>
          </div>
          <br />
        <asp:Panel ID="Panel4" runat="server" Visible="False">
      <asp:GridView ID="GridView9" GridLines="None" runat="server" CssClass="gridview" Width="100%" 
            AutoGenerateColumns="False">
          <Columns>
              <asp:TemplateField HeaderText="Question No">
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%#Eval("questionId") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Question">
                  <ItemTemplate>
                      <asp:Label ID="Label2" runat="server" Text='<%#Eval("question") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Answer">
                  <ItemTemplate>
                      <asp:CheckBox ID="CheckBox1" runat="server" />
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
       </asp:GridView>
       </asp:Panel>
        <asp:Panel ID="Panel3" runat="server" Visible="False">
      <asp:GridView ID="GridView10" GridLines="None" runat="server" CssClass="gridview" Width="100%" 
            AutoGenerateColumns="False">
           <Columns>
               <asp:TemplateField HeaderText="Question No">
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%#Eval("questionId") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Question">
                  <ItemTemplate>
                      <asp:Label ID="Label2" runat="server" Text='<%#Eval("question") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Answer">
                  <ItemTemplate>
                      <asp:DropDownList ID="DropDownList4" runat="server" CssClass="gridview" 
                          Width="100%">
                          <asp:ListItem Enabled="False">Select Rating</asp:ListItem>
                          <asp:ListItem>Strongly Agree</asp:ListItem>
                          <asp:ListItem>Agree</asp:ListItem>
                          <asp:ListItem>Neutral</asp:ListItem>
                          <asp:ListItem>Disagree</asp:ListItem>
                          <asp:ListItem>Strongly Disagree</asp:ListItem>
                      </asp:DropDownList>
                  </ItemTemplate>
              </asp:TemplateField>
           </Columns>
       </asp:GridView>
         </asp:Panel>
       </div>
       </div>
       </div>
     
       </fieldset>
        
     </div>
     
 <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<ContentTemplate>
<div id="NewTicket" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
    <div class="row-fluid sortable">
    <div class="box span12">
	<div class="box-header">
    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>New Issue</h2>				
	</div>
    <div class="box-content">
        <div class="pure-g-r">
            <div class="pure-u-1-2">
                <label for="last-name">Created For</label>
                <asp:TextBox ID="IcreatedFor" type="text" runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="ValidateTicket" ControlToValidate="IcreatedFor" ErrorMessage="Required" CssClass="validator"/>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Issue</label>
                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="10cm" 
                    Height="2cm"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ValidateTicket" ControlToValidate="TextBox1" ErrorMessage="Required" CssClass="validator"/>
            </div>
        </div>
       <div class="pure-u-1-2">
        <button id="Button7"   type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateTicket" onserverclick="AddTicket" style="margin-top: 0.4cm;">Add Ticket</button>
         </div>
         <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
    
    <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
        ConnectionString="<%$ ConnectionStrings:school %>" 
        
        SelectCommand="SELECT [generatedBy], [generatedFor], [issue], [status], [issueDate], [issueId] FROM [issue] WHERE ([generatedBy] = @generatedBy)">
        <SelectParameters>
            <asp:SessionParameter Name="generatedBy" SessionField="School" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
<br />
<asp:GridView ID="GridView11" runat="server" AutoGenerateColumns="False" GridLines="None"
        DataSourceID="SqlDataSource9" CssClass="gridview" Width="100%" 
        onselectedindexchanged="GridView11_SelectedIndexChanged" 
        DataKeyNames="issueId" onrowcommand="GridView11_RowCommand" 
        AllowPaging="True" onpageindexchanged="GridView11_PageIndexChanged">
    <Columns>
    <asp:TemplateField HeaderText="View Details">
               <ItemTemplate>
                   
                  <asp:ImageButton ID="updateButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  runat="server" ImageUrl="~/Images/pencil_03.png" CommandName="show"  />
                   
               </ItemTemplate>
           </asp:TemplateField>
        <asp:BoundField DataField="issueId" HeaderText="Issue ID" 
            SortExpression="issueId" />
        <asp:BoundField DataField="generatedBy" HeaderText="generatedBy" 
            SortExpression="generatedBy" Visible="False" />
        <asp:BoundField DataField="generatedFor" HeaderText="Generated For" 
            SortExpression="generatedFor" />
        <asp:TemplateField HeaderText="Issue">
               <ItemTemplate>
                   <asp:Label ID="pKId" runat="server" Text='<%#Eval("issue").ToString().Length>20? (Eval("issue") as string).Substring(0,20)+"..." : Eval("issue") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
       <asp:TemplateField HeaderText="Status" SortExpression="Active">
                <ItemTemplate><%# (Boolean.Parse(Eval("status").ToString())) ? "Active" : "In Active"%></ItemTemplate>
               </asp:TemplateField>
        <asp:BoundField DataField="issueDate" HeaderText="IssueDate" DataFormatString="{0:d}"
            SortExpression="issueDate" />
    </Columns>
</asp:GridView>
</div>
</div>
</div>
</fieldset>
   </div>
   </ContentTemplate>
</asp:UpdatePanel>

   <div id="sPopTicket"  class="pure-form pure-form-stacked form1 ">
    <fieldset>

      <div class="row-fluid sortable">
    <div class="box span12">
	<div class="box-header">
    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Issue Detail</h2>				
	</div>
    <div class="box-content">

        <div class="pure-g-r">
             <div class="pure-u-1-2">
                <label for="last-name">Issue</label>
                <textarea id="TextArea1" cols="10" rows="10" runat="server" wrap="soft" 
                     style="width: 10cm" readonly="readonly"></textarea>
                
            </div>
           
        </div>
         <div class="pure-u-1-2">
         <button id="Button8" type="button" class="pure-button pure-button-primary" onclick="sCloseTicket();toggle_forms('PendingTickets');return true;";  style="margin-top: 0.4cm;">Close</button>
         </div>
         </div>
         </div>
         </div>
    </fieldset>

     </div>


     <div id="PendingTickets"  class="pure-form pure-form-stacked form1 " 
    style="display: none">
    <fieldset>
      <div class="row-fluid sortable">
    <div class="box span12">
	<div class="box-header">
    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Pending Issues</h2>				
	</div>
    <div class="box-content">
        <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="spSelectPendingIssues" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="pKId" SessionField="School" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
          <asp:GridView ID="GridView12" runat="server" GridLines="None" AutoGenerateColumns="False" 
            CssClass="gridview" DataSourceID="SqlDataSource10" Width="100%" 
            onrowcommand="GridView12_RowCommand" DataKeyNames="issueId" 
            AllowPaging="True" onpageindexchanged="GridView12_PageIndexChanged">
              <Columns>
               <asp:BoundField DataField="issueId" HeaderText="Issue ID" 
                      SortExpression="issueId" />
                  <asp:TemplateField HeaderText="Issue">
               <ItemTemplate>
                   <asp:Label ID="pKId" runat="server" Text='<%#Eval("issue").ToString().Length>20? (Eval("issue") as string).Substring(0,20)+"..." : Eval("issue") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
                  <asp:BoundField DataField="generatedBy" HeaderText="Generated By" 
                      SortExpression="generatedBy" />
                      <asp:TemplateField HeaderText="Reply">
               <ItemTemplate>
                   
                  <asp:ImageButton ID="reply" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  runat="server" ImageUrl="~/images/s.png" CommandName="reply"  />
                   
               </ItemTemplate>
           </asp:TemplateField>
              </Columns>
         </asp:GridView>
         </div>
         </div>
         </div>
    </fieldset>
        
     </div>

      <div id="sTicketReply"  class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <div class="row-fluid sortable">
    <div class="box span12">
	<div class="box-header">
    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Issue Reply</h2>				
	</div>
    <div class="box-content">

        <div class="pure-g-r">
             <div class="pure-u-1-2">
                <label for="last-name">Issue</label>
                <textarea id="TextArea2" cols="10" rows="10" runat="server" wrap="soft" 
                     style="width: 10cm" Height="4.7cm" readonly="readonly"></textarea>
                
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Reply</label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="10cm" 
                    Height="4.7cm"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ValidateTicketReply" ControlToValidate="TextBox2" ErrorMessage="Required" CssClass="validator"/>

            </div>
             <div class="pure-u-1-2">
             <asp:Label ID="Label7" runat="server" Text=""></asp:Label>         
             </div>
        </div>
         <div class="pure-u-1-2">
         
           <button id="Button9"   type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateTicketReply" onserverclick="TicketReply" style="margin-top: 0.4cm;">Reply</button>
           <button id="Button10" type="button" class="pure-button pure-button-primary" onclick="sCloseTicketReply(); toggle_forms('PendingTickets');return true;";  style="margin-top: 0.4cm;">Close</button>
         </div>
          <div class="pure-u-1-2">
                <asp:TextBox ID="TextBox3" type="text" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox ID="TextBox4" type="text" runat="server" Visible="False"></asp:TextBox>
            </div>
          </div>
          </div>
          </div>
    </fieldset>

     </div> 
    
    
    
    <div id="mask">

     </div>
     
               
				
				
				</form>	
					
				</div><!--/span-->
				
				
			
			</div><!--/row-->
    

	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		<!--/#content.span10-->
		<!--/fluid-row-->
	
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a>
			<a href="#" class="btn btn-primary">Save changes</a>
		</div>
	</div>
	
	<div class="clearfix"></div>
	
	<footer style="max-height:25px !important;">

		<p>
			<span style="text-align:left;float:left">&copy; 2013 <a href="http://www.edgnome.com">Edgnome</a></span>
			
		</p>
        
	</footer>
	
	<!-- start: JavaScript-->

		<script src="js2/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="js2/jquery-migrate-1.0.0.min.js" type="text/javascript"></script>
	
		<script src="js2/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
	
		<script src="js2/jquery.ui.touch-punch.js" type="text/javascript"></script>
	
		<script src="js2/modernizr.js" type="text/javascript"></script>
	
		<script src="js2/bootstrap.min.js" type="text/javascript"></script>
	
		<script src="js2/jquery.cookie.js" type="text/javascript"></script>
	
		<script src='js2/fullcalendar.min.js' type="text/javascript"></script>
	
		<script src='js2/jquery.dataTables.min.js' type="text/javascript"></script>

		<script src="js2/excanvas.js" type="text/javascript"></script>
	<script src="js2/jquery.flot.js" type="text/javascript"></script>
	<script src="js2/jquery.flot.pie.js" type="text/javascript"></script>
	<script src="js2/jquery.flot.stack.js" type="text/javascript"></script>
	<script src="js2/jquery.flot.resize.min.js" type="text/javascript"></script>
	
		<script src="js2/jquery.chosen.min.js" type="text/javascript"></script>
	
		<script src="js2/jquery.uniform.min.js" type="text/javascript"></script>
		
		<script src="js2/jquery.cleditor.min.js" type="text/javascript"></script>
	
		<script src="js2/jquery.noty.js" type="text/javascript"></script>
	
		<script src="js2/jquery.elfinder.min.js" type="text/javascript"></script>
	
		<script src="js2/jquery.raty.min.js" type="text/javascript"></script>
	
		<script src="js2/jquery.iphone.toggle.js" type="text/javascript"></script>
	
		<script src="js2/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
	
		<script src="js2/jquery.gritter.min.js" type="text/javascript"></script>
	
		<script src="js2/jquery.imagesloaded.js" type="text/javascript"></script>
	
		<script src="js2/jquery.masonry.min.js" type="text/javascript"></script>
	
		<script src="js2/jquery.knob.modified.js" type="text/javascript"></script>
	
		<script src="js2/jquery.sparkline.min.js" type="text/javascript"></script>
	
		<script src="js2/counter.js" type="text/javascript"></script>
	
		<script src="js2/retina.js" type="text/javascript"></script>

		<script src="js2/custom.js" type="text/javascript"></script>
	<!-- end: JavaScript-->
	
</body>
</html>
