<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentSection.ascx.cs" Inherits="School.usercontrols.StudentSection" %>
<link href="../css/form.css" rel="stylesheet" type="text/css" />
<script src="../js/Navigation.js" type="text/javascript"></script>

 <div id="StudentSection" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <legend style="font-size: medium">
      Add Students
      </legend>

        <div class="pure-g-r">
             <div class="pure-u-1-2">
                <label for="last-name">Student ID</label>
                <input id="SID" type="text" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ValidateStudent" ControlToValidate="SID" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="pure-u-1-2">
              <label for="last-name">Password</label>
                <input id="SPassword" type="password" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ValidateStudent" ControlToValidate="SPassword" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="pure-u-1-2">
              <label for="last-name">First Name </label>
                <input id="SFirstName" type="text" runat="server" />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ValidateStudent" ControlToValidate="SFirstName" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>

            <div class="pure-u-1-2">
                <label for="last-name">Middle Name</label>
                <input id="SMiddleName" type="text" runat="server" />
                <br />
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Last Name</label>
                <input id="SLastName" type="text" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ValidateStudent" ControlToValidate="SLastName" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Phone No</label>
                <input id="SPhoneNo" type="text" runat="server" />
                <br />
            </div>
             <div class="pure-u-1-2">
                <label for="last-name">Mobile No</label>
                <input id="SMobNo" type="text" runat="server" />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="ValidateStudent" ControlToValidate="SMobNo" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Emergency Contact</label>
                <input id="SEmergency" type="text" autocomplete="off"   runat="server"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="ValidateStudent" ControlToValidate="SEmergency" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
             <div class="pure-u-1-2">
                <label for="email">Email</label>
                <input id="SEmail" type="text" autocomplete="off" placeholder="ex. name@domain.com" runat="server"/>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="ValidateStudent" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="SEmail" ErrorMessage="Invalid Email Format" CssClass="validator"></asp:RegularExpressionValidator>
            </div>
             <div class="pure-u-1-2">
                
                <label for="last-name">Enrollment Date</label>
              <asp:TextBox ID="SEnrollmentDate" runat="server" type="date" value="yyyy-MM-dd"> 
              </asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="ValidateStudent" ControlToValidate="SEnrollmentDate" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Date Of Birth</label>
                <asp:TextBox ID="SDateOfBirth"  runat="server" type="date" value="yyyy-MM-dd">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="ValidateStudent" ControlToValidate="SDateOfBirth"  ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
             <div class="pure-u-1-2">
                <label for="state">Gender</label>
                 <asp:DropDownList ID="SGender"  runat="server">
              <asp:ListItem >Male</asp:ListItem>
              <asp:ListItem >Female</asp:ListItem>
             </asp:DropDownList>
               <br />
            </div>
            <div class="pure-u-1-2">
                <label for="state">Type Of User</label>
             <asp:DropDownList ID="STypeOfUser"  runat="server">
              <asp:ListItem >Student</asp:ListItem>
             </asp:DropDownList>
             <br />
            </div>
             <div class="pure-u-1-2">
                <label for="last-name">Address 1</label>
                <input id="SAddress1" type="text" runat="server" />
                  <br />
            </div>
              <div class="pure-u-1-2">
                <label for="last-name">Address 2</label>
                <input id="SAddress2" type="text" runat="server" />
                  <br />
            </div>
           <div class="pure-u-1-2">
                <label for="last-name">Address 3</label>
                <input id="SAddress3" type="text" runat="server" />
                  <br />
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Upload File</label>
                 <asp:FileUpload ID="FileUpload1" runat="server" />
                   <br />
            </div> 
        </div>

        <label for="terms" class="pure-checkbox">
          <asp:CheckBox ID="SIsActive" runat="server" />   Is Active
        </label>
        <label for="terms" class="pure-checkbox">
          <asp:CheckBox ID="IsNew" runat="server" />   Is New
        </label>
        <button id="Button1"  type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateStudent" onserverclick="AddStudent">Add Student</button>
        <asp:Label ID="Label2" runat="server"></asp:Label>
    </fieldset>
   </div>

   <div id="ShowStudents" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <legend style="font-size: medium">
      Students
      </legend>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:school %>" 
        
        SelectCommand="spSlectPersonalInfo" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="pKId" SessionField="School" Type="String" />
            <asp:Parameter DefaultValue="Student" Name="userType" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView3" runat="server" DataKeyNames="pKId" 
        CssClass="gridview" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" 
        Width="90%" AllowPaging="True" AutoGenerateSelectButton="True" 
            onpageindexchanged="GridView3_PageIndexChanged" 
            onselectedindexchanged="GridView3_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="pKId" HeaderText="Student ID" ReadOnly="True" 
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="spSlectPersonalInfoDetails" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView3" Name="pKId" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="60%" 
            AutoGenerateRows="False" DataKeyNames="pKId" DataSourceID="SqlDataSource2" 
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

 <div id="AssignStudentClass" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
   <legend style="font-size: medium">
   Assign Student Class & Section
   </legend>

        <div class="pure-g-r">
            <div class="pure-u-1-2">
              <label for="last-name">Student ID</label>
                 <input id="SchoolID" type="text" runat="server">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ValidateStudentClass" ControlToValidate="SchoolID" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator> 
            </div>

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
            <label for="last-name">Year</label>
            <asp:TextBox ID="Year" runat="server" type="date" value="yyyy-MM-dd"> 
            </asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="ValidateStudentClass" ControlToValidate="Year" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator> 
            </div>      
        </div>
        <br />
        <button id="Button3" type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateStudentClass" onserverclick="AssignStudent">Assign</button>
    </fieldset>
    <br />
    <br />
     <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
         ConnectionString="<%$ ConnectionStrings:school %>" 
         SelectCommand="spSelectStudent" SelectCommandType="StoredProcedure">
         <SelectParameters>
             <asp:SessionParameter Name="iAm" SessionField="School" Type="String" />
         </SelectParameters>
     </asp:SqlDataSource>
    
     <asp:GridView ID="GridView1" runat="server" CssClass="gridview" Width="70%" 
         AllowPaging="True" AutoGenerateColumns="False" 
         DataSourceID="SqlDataSource6" onpageindexchanged="GridView1_PageIndexChanged">
         <Columns>
             <asp:BoundField DataField="School ID" HeaderText="School ID" 
                 SortExpression="School ID" />
             <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                 SortExpression="Name" />
             <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
             <asp:BoundField DataField="Section" HeaderText="Section" 
                 SortExpression="Section" />
         </Columns>
     </asp:GridView>
  
              
   </div>

   </ContentTemplate>
</asp:UpdatePanel>

<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
<ContentTemplate>

 <div id="Promotions" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
   <legend style="font-size: medium">
   Promotions
   </legend>

        <div class="pure-g-r"> 
        <div class="pure-u-1-2">     
        <button id="Button2" type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="Promotions" onserverclick="Promotions">Promote</button>
        </div>
        <br />
        <div class="pure-u-1-2">
        <label for="last-name">Year</label>
        <asp:TextBox ID="Year2" runat="server" type="date" value="yyyy-MM-dd"> 
        </asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="Promotions" ControlToValidate="Year2" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator> 
        </div>      
        </div>    
    </fieldset>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource5" runat="server"></asp:SqlDataSource>
   
  
              
   </div>

   </ContentTemplate>
</asp:UpdatePanel>

