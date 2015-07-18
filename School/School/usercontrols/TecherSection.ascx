<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TecherSection.ascx.cs" Inherits="School.usercontrols.TecherSection" %>

<link href="../css/form.css" rel="stylesheet" type="text/css" />
<script src="../js/Navigation.js" type="text/javascript"></script>
<div id="TAttendance"  class="pure-form pure-form-stacked form1 "  style="display:none">
   <fieldset>
   <legend style="font-size: medium">
    Update Attendance
   </legend>
   <div class="pure-g-r">
            <div class="pure-u-1-2">
              <label for="last-name">Date</label>
              <asp:TextBox ID="Date" runat="server" type="date" value="yyyy-MM-dd"> 
              </asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ValidateTeacherAttendance" ControlToValidate="Date"  ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            </div>
             <div class="pure-u-1-2">
        <button id="Button1" type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateTeacherAttendance" onserverclick="UpdateAttendance" style="margin-top: 0.4cm;">Update</button>
         </div>
       <asp:Label ID="AttendanceLabel" runat="server" Text=""></asp:Label>

   </fieldset>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:school %>" 
        SelectCommand="spSlectCampusTeachers" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="pKId" SessionField="School" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

   <asp:GridView ID="GridView1" runat="server" CssClass="gridview" 
        AutoGenerateColumns="False" DataKeyNames="pKId" 
        DataSourceID="SqlDataSource1" Width="50%" AllowPaging="True" 
        onpageindexchanged="GridView1_PageIndexChanged">
       <Columns>
            <asp:TemplateField HeaderText="Teacher ID">
               <ItemTemplate>
                   <asp:Label ID="pKId" runat="server" Text='<%#Eval("pKId") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
           <asp:TemplateField HeaderText="Teacher Name">
               <ItemTemplate>
                   <asp:Label ID="FName" runat="server" Text='<%#Eval("name") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
          <asp:TemplateField HeaderText="Status">
               <ItemTemplate>
                   <asp:CheckBox ID="Status" runat="server" type="checkbox"/>
               </ItemTemplate>
           </asp:TemplateField>
       </Columns>
       </asp:GridView>
    

</div>


  <div id="TeacherSection" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <legend style="font-size: medium">
      Add Teachers
      </legend>

        <div class="pure-g-r">
        <div class="pure-u-1-2">
              <label for="last-name">Teacher ID</label>
                <input id="TID" type="text" runat="server" />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ValidateTeacher" ControlToValidate="TID" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="pure-u-1-2">
              <label for="last-name">Password</label>
                <input id="TPassword" type="password" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ValidateTeacher" ControlToValidate="TPassword" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="pure-u-1-2">
              <label for="last-name">First Name </label>
                <input id="TFirstName" type="text" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ValidateTeacher" ControlToValidate="TFirstName" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>

            <div class="pure-u-1-2">
                <label for="last-name">Middle Name</label>
                <input id="TMiddleName" type="text" runat="server" />
                 <br />
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Last Name</label>
                <input id="TLastName" type="text" runat="server" />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ValidateTeacher" ControlToValidate="TLastName" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Phone No</label>
                <input id="TPhoneNo" type="text" runat="server" />
                 <br />
            </div>
             <div class="pure-u-1-2">
                <label for="last-name">Mobile No</label>
                <input id="TMobNo" type="text" runat="server" />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="ValidateTeacher" ControlToValidate="TMobNo" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Emergency Contact</label>
                <input id="TEmergency" type="text" autocomplete="off"   runat="server"/>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="ValidateTeacher" ControlToValidate="TEmergency" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
              <div class="pure-u-1-2">
                <label for="email">Email</label>
                <input id="TEmail" type="text" autocomplete="off" placeholder="ex. name@domain.com" runat="server"/>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="ValidateTeacher" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TEmail" ErrorMessage="Invalid Email Format" CssClass="validator"></asp:RegularExpressionValidator>
            </div>
              <div class="pure-u-1-2">
                
                <label for="last-name">Enrollment Date</label>
              <asp:TextBox ID="TEnrollmentDate" runat="server" type="date" value="yyyy-MM-dd"> 
              </asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="ValidateTeacher" ControlToValidate="TEnrollmentDate" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
             <div class="pure-u-1-2">
                <label for="last-name">Date Of Birth</label>
                
                <asp:TextBox ID="TDateOfBirth"  runat="server" type="date" value="yyyy-MM-dd">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="ValidateTeacher" ControlToValidate="TDateOfBirth"  ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="pure-u-1-2">
                <label for="state">Gender</label>
                 <asp:DropDownList ID="TGender"  runat="server">
              <asp:ListItem >Male</asp:ListItem>
              <asp:ListItem >Female</asp:ListItem>
             </asp:DropDownList>
              <br />
            </div>
             <div class="pure-u-1-2">
                <label for="state">Type Of User</label>
             <asp:DropDownList ID="TTypeOfUser"  runat="server">
              <asp:ListItem >Teacher</asp:ListItem>
             </asp:DropDownList>
                 <br />
            </div>
           
              <div class="pure-u-1-2">
                <label for="last-name">Address 1</label>
                <input id="TAddress1" type="text" runat="server" />
                 <br />
            </div>
              <div class="pure-u-1-2">
                <label for="last-name">Address 2</label>
                <input id="TAddress2" type="text" runat="server" />
                 <br />
            </div>
              <div class="pure-u-1-2">
                <label for="last-name">Address 3</label>
                <input id="TAddress3" type="text" runat="server" />
                 <br />
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Upload File</label>
                 <asp:FileUpload ID="FileUpload1" runat="server" />
                  <br />
            </div>   
        </div>

        <label for="terms" class="pure-checkbox">
          <asp:CheckBox ID="TIsActive" runat="server" />Is Active
        </label>
        <label for="terms" class="pure-checkbox">
          <asp:CheckBox ID="IsNew" runat="server" />   Is New
        </label>

        <button id="Button2"  type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateTeacher" onserverclick="AddTeacher">Add Teacher</button>
    </fieldset>
   </div>
    <div id="ShowTeachers" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <legend style="font-size: medium">
      Teachers
      </legend>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:school %>" 
        
        SelectCommand="spSlectPersonalInfo" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="pKId" SessionField="School" Type="String" />
            <asp:Parameter DefaultValue="Teacher" Name="userType" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView3" runat="server" DataKeyNames="pKId" 
        CssClass="gridview" AutoGenerateColumns="False" DataSourceID="SqlDataSource7" 
        Width="90%" AllowPaging="True" AutoGenerateSelectButton="True" 
            onpageindexchanged="GridView3_PageIndexChanged" 
            onselectedindexchanged="GridView3_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="pKId" HeaderText="Teacher ID" ReadOnly="True" 
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
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="spSlectPersonalInfoDetails" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView3" Name="pKId" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="60%" 
            AutoGenerateRows="False" DataKeyNames="pKId" DataSourceID="SqlDataSource8" 
            CellPadding="4" CssClass="gridview" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
            <EditRowStyle BackColor="#7C6F57" />
            <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="pKId" HeaderText="Teacher ID" ReadOnly="True" 
                    SortExpression="pKId" />
                <asp:BoundField DataField="name" HeaderText="Teacher Name" ReadOnly="True" 
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
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<ContentTemplate>
   <div id="AssignCourses" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <legend style="font-size: medium">
      Assign Courses
      </legend>

        <div class="pure-g-r">
            <div class="pure-u-1-2">
              <label for="last-name">Teacher Name</label>
               <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
                    SelectCommand="SELECT [pKId] FROM [PersonalInfo] WHERE ([userType] = @userType)">
                   <SelectParameters>
                       <asp:Parameter DefaultValue="Teacher" Name="userType" Type="String" />
                   </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="TeacherDropDown"  runat="server" 
                    DataSourceID="SqlDataSource3" DataTextField="pKId" 
                    DataValueField="pKId">
              <asp:ListItem ></asp:ListItem>
             </asp:DropDownList>
            </div>

           <div class="pure-u-1-2">
               <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            
                    SelectCommand="SELECT [className] FROM [Class]">
                </asp:SqlDataSource>
                <label for="state">Class</label>
             <asp:DropDownList ID="ClassDropDown"  runat="server"
             DataSourceID="SqlDataSource4" DataTextField="className" 
                   DataValueField="className">
              <asp:ListItem ></asp:ListItem>
             </asp:DropDownList>
                
            </div>
            <div class="pure-u-1-2">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            
                    SelectCommand="SELECT [sectionName] FROM [Section]">
                </asp:SqlDataSource>

                <label for="last-name">Section</label>
                <asp:DropDownList ID="SectionDropDown"  runat="server"
                 DataSourceID="SqlDataSource2" DataTextField="sectionName" 
                    DataValueField="sectionName">
              <asp:ListItem ></asp:ListItem>
             </asp:DropDownList>
            </div>
            <div class="pure-u-1-2">
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="SELECT [subjectName] FROM [Subjects]">
                </asp:SqlDataSource>

                <label for="last-name">Subject Name</label>
                <asp:DropDownList ID="SubjectDropDown"  runat="server"
                 DataSourceID="SqlDataSource5" DataTextField="subjectName" 
                    DataValueField="subjectName">
              <asp:ListItem ></asp:ListItem>
             </asp:DropDownList>
            </div>
        </div>
       <div class="pure-u-1-2">
        <button id="Button3"  type="submit" class="pure-button pure-button-primary" runat="server" onserverclick="AssignTeacher" style="margin-top: 0.4cm;">Assign Teacher</button>
         </div>
         <br />
         <br />
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="SELECT [subjectId], [teacher] FROM [SectionSubject]"></asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" CssClass="gridview" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource6" Width="30%" 
            AllowPaging="True" onpageindexchanged="GridView2_PageIndexChanged">
            <Columns>
                <asp:BoundField DataField="subjectId" HeaderText="Subject ID" 
                    SortExpression="subjectId" />
                <asp:BoundField DataField="teacher" HeaderText="Teacher ID" 
                    SortExpression="teacher" />
            </Columns>
        </asp:GridView>

    </fieldset>
   </div>

   </ContentTemplate>
</asp:UpdatePanel>
   