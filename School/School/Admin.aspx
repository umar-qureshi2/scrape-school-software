<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master.Master" CodeBehind="Admin.aspx.cs" Inherits="School.Class" %>

<%@ Register src="usercontrols/showBranch.ascx" tagname="showBranch" tagprefix="uc1" %>

<%@ Register src="usercontrols/AddClassSection.ascx" tagname="AddClassSection" tagprefix="uc2" %>

<%@ Register src="usercontrols/TicketsSection.ascx" tagname="TicketsSection" tagprefix="uc3" %>

<%@ Register src="usercontrols/TecherSection.ascx" tagname="TecherSection" tagprefix="uc4" %>

<%@ Register src="usercontrols/StudentSection.ascx" tagname="StudentSection" tagprefix="uc5" %>

<%@ Register src="usercontrols/ExamDate.ascx" tagname="ExamDate" tagprefix="uc6" %>

<%@ Register src="usercontrols/Survey.ascx" tagname="Survey" tagprefix="uc7" %>

<asp:Content ID="Content2" ContentPlaceHolderID="actions" runat="server">      
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="forms" runat="server">
    
    
    
   
    
    
    
    <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptPath="js/Navigation.js" >
    
    </asp:ScriptManager>

    <div id="foo"  style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
     <legend style="font-size: medium">
      Add Branch
      </legend>

        <div class="pure-g-r">
            <div class="pure-u-1-2">
                <label for="last-name">Campus Name</label>
                <input id="CampusName" type="text" runat="server"/> 
                <asp:RequiredFieldValidator ID="RCampusName" runat="server" ValidationGroup="RBranch" ControlToValidate="CampusName" ErrorMessage="Required" CssClass="validator"    />
                
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Address</label>
                <input id="address" type="text" runat="server"/> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RBranch" ControlToValidate="address" ErrorMessage="Required" CssClass="validator"   />
            </div>
             
            <div class="pure-u-1-2">
                <label for="last-name">Zip Code</label>
                <input id="ZipCode" type="text" autocomplete="off"  runat="server"/> 
                <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="RBranch" Operator="DataTypeCheck" Type="Integer" ControlToValidate="ZipCode" ErrorMessage="Not a valid Zip Code" CssClass="validator" />
            </div>
             <div class="pure-u-1-2">
                <label for="last-name">City Name</label>
                <input id="CityName" type="text" autocomplete="off"  runat="server"/>
            </div>
             <div class="pure-u-1-2">
                <label for="email">Email</label>
                <input id="CEmail" type="text" autocomplete="off"   runat="server"/> 
                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationGroup="RBranch" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="CEmail" ErrorMessage="Invalid Email Format" CssClass="validator"></asp:RegularExpressionValidator>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Phone No 1</label>
                <input id="Phone1" type="text" autocomplete="off"  runat="server"/>
                <br /> 
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Phone No 2</label>
                <input id="Phone2" type="text" autocomplete="off"  runat="server"/>
                <br /> 
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Phone No 3</label>
                <input id="Phone3" type="text" autocomplete="off"  runat="server"/>
                <br /> 
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Principal Name</label>
                <input id="PrincipalName" type="text" autocomplete="off"  runat="server"/>
                <br />
            </div>
        </div>
        <label for="terms" class="pure-checkbox">
          <asp:CheckBox ID="CCheck" runat="server" /> Is Active
        </label>
         <div class="pure-u-1-2">
        <button type="button" class="pure-button pure-button-primary" runat="server" ValidationGroup="RBranch"   onserverclick="AddBranch" style="margin-top: 0.4cm;">Add Branch</button>
         </div>
         <asp:Label ID="Clabel" runat="server"></asp:Label>
    </fieldset>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="Data Source=(local);Initial Catalog=school;Integrated Security=True" 
            ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
   </div>
   
   <uc7:Survey ID="Survey1" runat="server" />
   <uc6:ExamDate ID="ExamDate1" runat="server" />
   <uc5:StudentSection ID="StudentSection1" runat="server" />
   <uc4:TecherSection ID="TecherSection1" runat="server" />
   <uc3:TicketsSection ID="TicketsSection1" runat="server" />
   <uc2:AddClassSection ID="AddClassSection1" runat="server" />           
   <uc1:showBranch ID="showBranch1" runat="server" />    
   
   <div id="admin" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <legend style="font-size: medium">
      Assign Admins
      </legend>

        <div class="pure-g-r">
            <div class="pure-u-1-2">
              <label for="last-name">Admin ID </label>
                <input id="AID" type="text" autocomplete="off"  runat="server"/>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ValidateAdmins" ControlToValidate="AID" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Password</label>
                <input id="APassword" type="password" autocomplete="off"  runat="server"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ValidateAdmins" ControlToValidate="APassword" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="pure-u-1-2">
              <label for="last-name">First Name </label>
                <input id="AFirstName" type="text" autocomplete="off"  runat="server"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ValidateAdmins" ControlToValidate="AFirstName" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>

            <div class="pure-u-1-2">
                <label for="last-name">Middle Name</label>
                <input id="AMiddleName" type="text" autocomplete="off"  runat="server"/>
                <br />
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Last Name</label>
                <input id="ALastName" type="text" autocomplete="off"  runat="server"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ValidateAdmins" ControlToValidate="ALastName" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>

            <div class="pure-u-1-2">
                <label for="last-name">Phone No</label>
                <input id="APhoneNo" type="text" autocomplete="off"  runat="server"/>
                <br />
            </div>
             <div class="pure-u-1-2">
                <label for="last-name">Mobile No</label>
                <input id="AMobNo" type="text" autocomplete="off"   runat="server"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="ValidateAdmins" ControlToValidate="AMobNo" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
             <div class="pure-u-1-2">
                <label for="last-name">Emergency Contact</label>
                <input id="AEmergency" type="text" autocomplete="off"   runat="server"/>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="ValidateAdmins" ControlToValidate="AEmergency" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
              <div class="pure-u-1-2">
                <label for="email">Email</label>
                <input id="AEmail" type="text" autocomplete="off" placeholder="ex. name@domain.com" runat="server"/>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="ValidateAdmins" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="AEmail" ErrorMessage="Invalid Email Format" CssClass="validator"></asp:RegularExpressionValidator>
            </div>
             <div class="pure-u-1-2">
                <label for="last-name">Enrollment Date</label>
              <asp:TextBox ID="AEnrollmentDate" runat="server" type="date" value="yyyy-MM-dd"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="ValidateAdmins" ControlToValidate="AEnrollmentDate" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
             <br />
             <div class="pure-u-1-2">
            
                <label for="last-name">Date Of Birth</label>
                <asp:TextBox ID="ADateOfBirth"  runat="server" type="date" value="yyyy-MM-dd">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="ValidateAdmins" ControlToValidate="ADateOfBirth"  ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
           <div class="pure-u-1-2">
                <label for="state">Gender</label>
                 <asp:DropDownList ID="DropDownList2"  runat="server">
              <asp:ListItem >Male</asp:ListItem>
              <asp:ListItem >Female</asp:ListItem>
             </asp:DropDownList>
               <br />
            </div>
            <div class="pure-u-1-2">
                <label for="state">Type Of User</label>
             <asp:DropDownList ID="DropDownList1"  runat="server">
              <asp:ListItem >admin</asp:ListItem>
             </asp:DropDownList>
                  <br />
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Address 1</label>
                <input id="AAdress1" type="text" autocomplete="off"  runat="server"/>
                <br />
            </div>
             <div class="pure-u-1-2">
                <label for="last-name">Address 2</label>
                <input id="AAdress2" type="text" autocomplete="off"  runat="server"/>
                <br />                                          
            </div>
             <div class="pure-u-1-2">
                <label for="last-name">Address 3</label>
                <input id="AAdress3" type="text" autocomplete="off"  runat="server"/>
                <br />
            </div>
             <div class="pure-u-1-2">
                <label for="last-name">Upload File</label>
                 <asp:FileUpload ID="FileUpload1" runat="server" />
                 <br />
            </div>     
           
        </div>

        <label for="terms" class="pure-checkbox">
          <asp:CheckBox ID="IsActive" runat="server" />   Is Active
        </label>
        <label for="terms" class="pure-checkbox">
          <asp:CheckBox ID="IsNew" runat="server" />   Is New
        </label>

        <button type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateAdmins" onserverclick="AdminAssign">Assign</button>    
    </fieldset>
   </div>
   <div id="ShowAdmins" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <legend style="font-size: medium">
      Admins
      </legend>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:school %>" 
        
        SelectCommand="spSlectPersonalInfo" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="pKId" SessionField="School" Type="String" />
            <asp:Parameter DefaultValue="Admin" Name="userType" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView3" runat="server" DataKeyNames="pKId" 
        CssClass="gridview" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" 
        Width="90%" AllowPaging="True" AutoGenerateSelectButton="True" 
            onpageindexchanged="GridView3_PageIndexChanged" 
            onselectedindexchanged="GridView3_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="pKId" HeaderText="Admin ID" ReadOnly="True" 
                SortExpression="pKId" />
            <asp:BoundField DataField="name" HeaderText="Name" ReadOnly="True" 
                SortExpression="name" />
            <asp:BoundField DataField="emergencyContact" HeaderText="Emergency Contact" 
                SortExpression="emergencyContact" />
            <asp:BoundField DataField="cellNo" HeaderText="Cell No" 
                SortExpression="cellNo" />
            <asp:TemplateField HeaderText="Gender" SortExpression="gender">
             <ItemTemplate><%# (Boolean.Parse(Eval("gender").ToString())) ? "Female" : "Male" %></ItemTemplate>
           </asp:TemplateField>
            <asp:BoundField DataField="eMail" HeaderText="Email" SortExpression="eMail" />
            <asp:TemplateField HeaderText="Is Active" SortExpression="isActive">
             <ItemTemplate><%# (Boolean.Parse(Eval("isActive").ToString())) ? "Active" : "In Active"%></ItemTemplate>
           </asp:TemplateField>
            <asp:BoundField DataField="address1" HeaderText="Address" 
                SortExpression="address1" />
            <asp:BoundField DataField="enrollmentDate" HeaderText="Enrollment Date" DataFormatString="{0:d}"
                SortExpression="enrollmentDate" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="spSlectPersonalInfoDetails" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView3" Name="pKId" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="60%" 
            AutoGenerateRows="False" DataKeyNames="pKId" DataSourceID="SqlDataSource5" 
            CellPadding="4" CssClass="gridview" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
            <EditRowStyle BackColor="#7C6F57" />
            <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="pKId" HeaderText="Admin ID" ReadOnly="True" 
                    SortExpression="pKId" />
                <asp:BoundField DataField="name" HeaderText="Admin Name" ReadOnly="True" 
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
                    SortExpression="fileName" />
                <asp:TemplateField HeaderText="File Download" SortExpression="recordFile">
                 <ItemTemplate>
                 <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" 
                 OnClick="lnkDownload_Click"></asp:LinkButton>
                 </ItemTemplate>
                </asp:TemplateField>
            </Fields>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:DetailsView>

    </fieldset >
    </div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div id="AddClasses" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <legend style="font-size: medium">
    Add Classes
      </legend>
        
        
        <div class="pure-g-r">
             <div class="pure-u-1-2">
                <label for="state">Class ID</label>
                 <input id="ClassId" type="text" runat="server">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="ValidateClass" ControlToValidate="ClassId" ErrorMessage="Required" CssClass="validator"/>
            </div>

            <div class="pure-u-1-2">
                <label for="last-name">Class Name</label>
                <input id="ClassName" type="text" runat="server">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="ValidateClass" ControlToValidate="ClassName" ErrorMessage="Required" CssClass="validator"/>
            </div>
        </div>
       <div class="pure-u-1-2">
        <button id="Button1" type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateClass" onserverclick="AddClass" style="margin-top: 0.4cm;">Add Class</button>
         </div>
         <div class="pure-u-1-2">
         <br />
         <asp:Label ID="ClassLabel" runat="server" Text=""></asp:Label>
         </div>
         <br />
         <br />
        <asp:SqlDataSource ID="SClasses" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
        <asp:GridView ID="GClasses" runat="server" CssClass="gridview" 
            DataSourceID="SClasses"  AutoGenerateColumns="False" DataKeyNames="classId" 
            Width="50%" AllowPaging="True" 
            onpageindexchanged="GClasses_PageIndexChanged1">
            <Columns>
                <asp:BoundField DataField="classId" HeaderText="Class ID" ReadOnly="True" 
                    SortExpression="classId" />
                <asp:BoundField DataField="className" HeaderText="Class Name" 
                    SortExpression="className" />
            </Columns>
        </asp:GridView>
         
    </fieldset>
   </div>
   </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div id="AddSections" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <legend style="font-size: medium">
    Add Sections
      </legend>
        
        
        <div class="pure-g-r">
            <div class="pure-u-1-2">
                <label for="last-name">Section Name</label>
                <input id="SectionName" type="text" runat="server">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="ValidateSection" ControlToValidate="SectionName" ErrorMessage="Required" CssClass="validator"/>
            </div>
        </div>
       <div class="pure-u-1-2">
        <button id="Button2" type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateSection" onserverclick="AddSection" style="margin-top: 0.4cm;">Add Section</button>
         </div>
         <div class="pure-u-1-2">
         <br />
         <asp:Label ID="SectionLabel" runat="server" Text=""></asp:Label>
         </div>
         <br />
         <br />
        <asp:SqlDataSource ID="SSections" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="SELECT [sectionName] FROM [Section]"></asp:SqlDataSource>
        <asp:GridView ID="GSections" runat="server" CssClass="gridview" 
            DataSourceID="SSections" AutoGenerateColumns="False" 
            Width="20%" onpageindexchanging="GSections_PageIndexChanging" 
            AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="sectionName" HeaderText="Section Name" 
                    SortExpression="sectionName" />
            </Columns>
        </asp:GridView>
         
    </fieldset>
   </div>
   </ContentTemplate>
    </asp:UpdatePanel>
    
  
    <div id="ShowStudents"  style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
     <legend style="font-size: medium">
      Students
      </legend>
      </fieldset>
      
        
      </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
   

       <div id="ExamType" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
   <legend style="font-size: medium">
   Add Exam Types
   </legend>

        <div class="pure-g-r">
            <div class="pure-u-1-2">
              <label for="last-name">Exam ID</label>
                 <input id="ExamID" type="text" runat="server"> 
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="ValidateExam" ControlToValidate="ExamID" ErrorMessage="Required" CssClass="validator"/>
            </div>

            <div class="pure-u-1-2">
                <label for="last-name">Exam Name</label>
                <input id="ExamName" type="text" runat="server">
            </div>      
        </div>
        <br />
        <button id="Button3" type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateExam" onserverclick="AddExam">Add Exam</button>
    </fieldset>
    <br />
    <br />
   <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
               ConnectionString="<%$ ConnectionStrings:school %>" 
               SelectCommand="SELECT * FROM [ExamType]"></asp:SqlDataSource>
           <asp:GridView ID="GridView1" runat="server" 
               DataSourceID="SqlDataSource2" 
               onselectedindexchanged="GridView1_SelectedIndexChanged" Width="40%" 
               AutoGenerateColumns="False" DataKeyNames="examTypeId" CssClass="gridview" 
               onpageindexchanging="GridView1_PageIndexChanging" AllowPaging="True">
               <Columns>
                   <asp:BoundField DataField="examTypeId" HeaderText="Exam ID" ReadOnly="True" 
                       SortExpression="examTypeId" />
                   <asp:BoundField DataField="examType" HeaderText="Exam Name" 
                       SortExpression="examType" />
               </Columns>
               
           </asp:GridView>
   
   </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    

   <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
<ContentTemplate>

     <div id="Courses" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <legend style="font-size: medium">
      Add Courses
      </legend>

        <div class="pure-g-r">
            <div class="pure-u-1-2">
              <label for="last-name">Course Id</label>
                <input id="CourseId" type="text" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="ValidateCourse" ControlToValidate="CourseId" ErrorMessage="Required" CssClass="validator"/>
            </div>

            <div class="pure-u-1-2">
                <label for="last-name">Course Name</label>
                <input id="CourseName" type="text" runat="server" />
            </div>
        </div>
       <div class="pure-u-1-2">
        <button id="Button4" type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateCourse" onserverclick="AddCourse" style="margin-top: 0.4cm;">Add Course</button>
         </div>
         <br />
         <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="SELECT * FROM [Subjects]">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            CssClass="gridview" DataKeyNames="subjectId" DataSourceID="SqlDataSource3" 
            Width="50%" onrowcommand="GridView2_RowCommand" 
            onpageindexchanging="GridView2_PageIndexChanging" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="subjectId" HeaderText="Subject ID" ReadOnly="True" 
                    SortExpression="subjectId" />
                <asp:BoundField DataField="subjectName" HeaderText="Subject Name" 
                    SortExpression="subjectName" />
                     <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server"  CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Delete" ImageUrl="~/images/del_03.png" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </fieldset>
   </div>

   </ContentTemplate>
</asp:UpdatePanel>


 
     <div id="SMS" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <legend style="font-size: medium">
      SMS
     </legend>
      <iframe src="sms.html" width="auto" height="800px" style="margin-left: -50px; margin-top: -30px;">
 </iframe>


    </fieldset>
   </div>

   <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div id="Announcemnt" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <legend style="font-size: medium">
    New Announcement
      </legend>
        
        
        <div class="pure-g-r">
            <div class="pure-u-1-2">
                <label for="last-name">Announcement</label>
                <input id="note" type="text" runat="server">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ValidationGroup="ValidateNote" ControlToValidate="note" ErrorMessage="Required" CssClass="validator"/>
            </div>
        </div>
       <div class="pure-u-1-2">
        <button id="Button5" type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateNote" onserverclick="AddNote" style="margin-top: 0.4cm;">Add Announcement</button>
         </div>
         <div class="pure-u-1-2">
         <br />
         <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
         </div>
         <br />
         <br />
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="SELECT [sectionName] FROM [Section]"></asp:SqlDataSource>
        <asp:GridView ID="GridView4" runat="server" CssClass="gridview" 
            DataSourceID="SSections" AutoGenerateColumns="False" 
            Width="20%" onpageindexchanging="GSections_PageIndexChanging" 
            AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="sectionName" HeaderText="Section Name" 
                    SortExpression="sectionName" />
            </Columns>
        </asp:GridView>
         
    </fieldset>
   </div>
   </ContentTemplate>
    </asp:UpdatePanel>


    
</asp:Content>