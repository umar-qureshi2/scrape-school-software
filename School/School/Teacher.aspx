<%@ Page  Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="School.test" %>
<%@ Register src="usercontrols/attendance.ascx" tagname="attendance" tagprefix="uc1" %>
<%@ Register src="usercontrols/UpdateMarksGrades.ascx" tagname="UpdateMarksGrades" tagprefix="uc2" %>
<%@ Register src="usercontrols/TicketsSection.ascx" tagname="TicketsSection" tagprefix="uc3" %>
<%@ Register src="usercontrols/Survey.ascx" tagname="Survey" tagprefix="uc4" %>
<asp:Content ID="Content2" ContentPlaceHolderID="actions" runat="server">

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script src="js/Navigation.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="forms" runat="server">
     
    
     
     <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptPath="js/Navigation.js" >
    
    </asp:ScriptManager>
    <div id="Evaluation"   class="pure-form pure-form-stacked form1 " style="display:none">
    <fieldset>
      <legend style="font-size: medium">
      Student Evaluation
      </legend>

        <div class="pure-g-r">
         <div class="pure-u-1-2">
              <label for="last-name">Student ID </label>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:school %>" 
                SelectCommand="SELECT [pKId] FROM [PersonalInfo] WHERE ([userType] = @userType)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="student" Name="userType" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:DropDownList ID="EDropDown" runat="server" 
                DataSourceID="SqlDataSource2" DataTextField="pKId">
            </asp:DropDownList>
             </div>
             <div class="pure-u-1-1">
                <label for="last-name">Student Aptitude</label>
                <input id="EAptitude" type="text" runat="server" style="width: 10cm">
            </div>
            <div class="pure-u-1-1">
                <label for="last-name">Student Attitude</label>
                <input id="EAttitude" type="text" runat="server" style="width: 10cm">
            </div>
            <div class="pure-u-1-1">
                <label for="last-name">Recommendations</label>
                <input id="ERecommendation" type="text" runat="server" style="width: 10cm">
            </div>
             </div>
         <div class="pure-u-1-2">
        

        <button id="Button1" type="submit" class="pure-button pure-button-primary" runat="server" onserverclick="ADDEvaluation" style="margin-top: 0.4cm;">Add Evaluation</button>
         </div>
        <div class="pure-u-1-1">
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
         
    </fieldset>
      </div>
   <uc4:Survey ID="Survey1" runat="server" />
  <uc3:TicketsSection ID="TicketsSection1" runat="server" />
   <uc1:attendance ID="attendance1" runat="server" />   
   <uc2:UpdateMarksGrades ID="UpdateMarksGrades1" runat="server" />  
   <div id="AssignHomeWork" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
   <legend style="font-size: medium">
   Assign Home Work
   </legend>

        <div class="pure-g-r">
            <div class="pure-u-1-2">
              <label for="last-name">Class</label>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:school %>" 
                    SelectCommand="SELECT [className] FROM [Class]">
              </asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="className" 
                    DataValueField="className">
                </asp:DropDownList>
               
            </div>

            <div class="pure-u-1-2">
                <label for="last-name">Section</label>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:school %>" 
                    SelectCommand="SELECT [sectionName] FROM [Section]">
                </asp:SqlDataSource>
                  <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="SqlDataSource3" DataTextField="sectionName" 
                    DataValueField="sectionName">
                </asp:DropDownList>
            </div>
              <div class="pure-u-1-2">
                <label for="last-name">Subject</label>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:school %>" 
                    SelectCommand="SELECT [subjectName] FROM [Subjects]">
                </asp:SqlDataSource>
                  <asp:DropDownList ID="DropDownList3" runat="server" 
                    DataSourceID="SqlDataSource4" DataTextField="subjectName" 
                    DataValueField="subjectName">
                </asp:DropDownList>
            </div>
            <div class="pure-u-1-1">
                <label for="last-name">Home Work</label>
                <textarea id="TextArea1" cols="10" rows="10" runat="server" wrap="soft" 
                     style="width: 10cm"></textarea>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="ValidateHomeWork" ControlToValidate="TextArea1" ErrorMessage="Required" CssClass="validator"/>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">File Upload</label>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </div>
             
        </div>
        <br />
        <button id="Button2" type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateHomeWork" onserverclick="AssignHomeWork">Assign Home Work</button>
    </fieldset>
   </div>
    <div id="UpcomingTest" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
   <legend style="font-size: medium">
   Upcoming Tests
   </legend>

        <div class="pure-g-r">
            <div class="pure-u-1-2">
              <label for="last-name">Class</label>
                <asp:DropDownList ID="DropDownList4" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="className" 
                    DataValueField="className">
                </asp:DropDownList>
               
            </div>

            <div class="pure-u-1-2">
                <label for="last-name">Section</label>
                  <asp:DropDownList ID="DropDownList5" runat="server" 
                    DataSourceID="SqlDataSource3" DataTextField="sectionName" 
                    DataValueField="sectionName">
                </asp:DropDownList>
            </div>
              <div class="pure-u-1-2">
                <label for="last-name">Subject</label>
                  <asp:DropDownList ID="DropDownList6" runat="server" 
                    DataSourceID="SqlDataSource4" DataTextField="subjectName" 
                    DataValueField="subjectName">
                </asp:DropDownList>
            </div>
            <div class="pure-u-1-1">
                <label for="last-name">Test</label>
                <textarea id="TextArea2" cols="10" rows="10" runat="server" wrap="soft" 
                     style="width: 10cm"></textarea>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ValidateTest" ControlToValidate="TextArea2" ErrorMessage="Required" CssClass="validator"/>
            </div>     
        </div>
        <br />
        <button id="Button3" type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateTest" onserverclick="AssignTest">Update Test</button>
    </fieldset>
   </div>

   <div id="CourseProgress" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
   <legend style="font-size: medium">
   Update Course Plan
   </legend>

        <div class="pure-g-r">
        <div class="pure-u-1-2">
              <label for="last-name">Class</label>
                <asp:DropDownList ID="DropDownList8" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="className" 
                    DataValueField="className">
                </asp:DropDownList>
               
            </div>

            <div class="pure-u-1-2">
                <label for="last-name">Section</label>
                  <asp:DropDownList ID="DropDownList10" runat="server" 
                    DataSourceID="SqlDataSource3" DataTextField="sectionName" 
                    DataValueField="sectionName">
                </asp:DropDownList>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Subject</label>
                  <asp:DropDownList ID="DropDownList9" runat="server" 
                    DataSourceID="SqlDataSource4" DataTextField="subjectName" 
                    DataValueField="subjectName">
                </asp:DropDownList>
            </div>
            <div class="pure-u-1-2">
              <label for="last-name">Week</label>
              <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:school %>" 
                    SelectCommand="SELECT [partition] FROM [ProgressMethod]">
              </asp:SqlDataSource>

                <asp:DropDownList ID="DropDownList7" runat="server" 
                    DataSourceID="SqlDataSource5" DataTextField="partition" 
                    DataValueField="partition">
                </asp:DropDownList>
               
            </div>

            <div class="pure-u-1-2">
                <label for="last-name">Goal</label>
                 <input id="Goal" type="text" runat="server">
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ValidateCoursePlan" ControlToValidate="Goal" ErrorMessage="Required" CssClass="validator"/>
            </div>
              
                
        </div>
        <br />
        <button id="Button4" type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateCoursePlan" onserverclick="UpdateCoursePlan">Update Course Plan</button>
    </fieldset>
    <br />
     <div class="pure-u-1-2">
     <label for="last-name">Progress</label>
     </div>
    <div id="progressBar"><div></div></div>
    <br />
    
   <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
           ConnectionString="<%$ ConnectionStrings:school %>" 
           SelectCommand="SELECT [progressId], [subjectId], [Goal], [year] FROM [coursePlan]"></asp:SqlDataSource>
       <asp:GridView ID="GridView1" runat="server" CssClass="gridview" 
           DataSourceID="SqlDataSource6" Width="40%">
       </asp:GridView>
   </div>



</asp:Content>