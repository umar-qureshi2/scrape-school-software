<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="showBranch.ascx.cs" Inherits="School.usercontrols.showBranch" %>
 
 
 <link href="../css/form.css" media="all" rel="stylesheet" type="text/css" />
<script src="../js/my.js" type="text/javascript"></script>


<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>

   <div id="ShowBraches"  class="pure-form pure-form-stacked form1 " style="display: none"  >
   <fieldset>
   <legend style="font-size: medium">
    Branches
   </legend>
   </fieldset>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:school %>" 
    
           SelectCommand="SELECT [campusId], [campusName], [address], [zipCode], [phone1], [phone2], [phone3], [principal], [email] FROM [Campus] WHERE ([isActive] = @isActive)">
       <SelectParameters>
           <asp:Parameter DefaultValue="true" Name="isActive" Type="Boolean" />
       </SelectParameters>
       </asp:SqlDataSource>
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="campusId" DataSourceID="SqlDataSource1"  
     CssClass="gridview" onrowcommand="GridView1_RowCommand" AllowPaging="True" PageSize="5" 
           onselectedindexchanged="GridView1_SelectedIndexChanged1" 
           onpageindexchanged="GridView1_PageIndexChanged">
   <Columns>
        <asp:BoundField DataField="campusId" HeaderText="Campus ID" ReadOnly="True" 
            SortExpression="campusId" />
        <asp:BoundField DataField="campusName" HeaderText="Campus Name" 
            SortExpression="campusName" />
        <asp:BoundField DataField="address" HeaderText="Address" 
            SortExpression="address" />
        <asp:BoundField DataField="zipCode" HeaderText="Zip Code" 
            SortExpression="zipCode" />
        <asp:BoundField DataField="phone1" HeaderText="Phone No 1" 
            SortExpression="phone1" />
        <asp:BoundField DataField="phone2" HeaderText="Phone No 2" 
            SortExpression="phone2" />
        <asp:BoundField DataField="phone3" HeaderText="Phone No 3" 
            SortExpression="phone3" />
        <asp:BoundField DataField="principal" HeaderText="Principal Name" 
            SortExpression="principal" />
        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email">
        </asp:BoundField>
        <asp:TemplateField HeaderText="Update">
   <ItemTemplate>
            
   <asp:ImageButton ID="updateButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  runat="server" ImageUrl="~/Images/pencil_03.png" CommandName="UpdateCampus"  />
                
   </ItemTemplate>
   </asp:TemplateField>
       
   <asp:TemplateField HeaderText="Delete">
   <ItemTemplate>
   <asp:ImageButton ID="ImageButton2"  CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server" ImageUrl="~/Images/del_03.png" CommandName="DeleteCampus"  />
                  
   </ItemTemplate>
   </asp:TemplateField>
   </Columns>
</asp:GridView>
<br />
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
    AutoGenerateSelectButton="True" CssClass="gridview" DataKeyNames="pKId" 
    DataSourceID="SqlDataSource2">
    <Columns>
        <asp:BoundField DataField="pKId" HeaderText="ID" InsertVisible="False" 
            ReadOnly="True" SortExpression="pKId" />
        <asp:BoundField DataField="firstName" HeaderText="First Name" 
            SortExpression="firstName" />
        <asp:BoundField DataField="phone" HeaderText="Phone No" SortExpression="phone" />
        <asp:BoundField DataField="eMail" HeaderText="Email" SortExpression="eMail" />
        <asp:BoundField DataField="enrollmentDate" HeaderText="Enrollment Date" 
            SortExpression="enrollmentDate" />
        <asp:BoundField DataField="dOB" HeaderText="Date Of Birth" SortExpression="dOB" />
        <asp:BoundField DataField="gender" HeaderText="Gender" 
            SortExpression="gender" />
        <asp:BoundField DataField="campusId" HeaderText="Campus ID" 
            SortExpression="campusId" />
        <asp:CheckBoxField DataField="isActive" HeaderText="Is Active" 
            SortExpression="isActive" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:school %>" 
    SelectCommand="SELECT [pKId], [firstName], [phone], [eMail], [enrollmentDate], [dOB], [gender], [campusId], [isActive] FROM [PersonalInfo] WHERE (([campusId] = @campusId) AND ([userType] = @userType))">
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" Name="campusId" 
            PropertyName="SelectedValue" Type="Int32" />
        <asp:Parameter DefaultValue="teacher" Name="userType" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>

 </div>
 </ContentTemplate>
</asp:UpdatePanel>
  <div id="UpdateBranch"  class="pure-form pure-form-stacked form1 ">
    <fieldset>
     <legend style="font-size: medium">
      Update Branch
      </legend>

        <div class="pure-g-r">
             <div class="pure-u-1-2">
                <label for="last-name">Campus Name</label>
                <input id="UCampusName" type="text"   runat="server"/>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Address</label>
                <input id="Uaddress" type="text" autocomplete="off"  runat="server"/>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Zip Code</label>
                <input id="UZipCode" type="text" autocomplete="off"  runat="server"/>
            </div>
            <div class="pure-u-1-2">
                <label for="email">Email</label>
                <input id="UEmail" type="text" autocomplete="off"   runat="server"/>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Phone No 1</label>
                <input id="UPhone1" type="text" autocomplete="off"  runat="server"/>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Phone No 2</label>
                <input id="UPhone2" type="text" autocomplete="off"  runat="server"/>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Phone No 3</label>
                <input id="UPhone3" type="text" autocomplete="off"  runat="server"/>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Principal Name</label>
                <input id="UPrincipalName" type="text" autocomplete="off"  runat="server"/>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">City Name</label>
                <input id="CityName" type="text" autocomplete="off"  runat="server"/>
            </div>
        </div>
        <label for="terms" class="pure-checkbox">
          <asp:CheckBox ID="UCheck" runat="server" /> Is Active
        </label>
         <div class="pure-u-1-2">
        <button id="Button1" type="button" class="pure-button pure-button-primary" runat="server"   onserverclick="UpdateBranch" style="margin-top: 0.4cm;">Update Branch</button>
         <button id="Button2" type="button" class="pure-button pure-button-primary" onclick="CloseCampuses()";  style="margin-top: 0.4cm;">Cancel Update</button>
         </div>
    </fieldset>

     </div>

     <div id="mask">

     </div>

     <div id="DeleteConfirm" class="pure-form pure-form-stacked form1 " >
     <p style="text-align: center">
                Are You Sure, You want to delete the record!!!</p>
                <br /><br />
                <div class="pure-u-1-2" style="margin-left: 3cm">
        <button id="Button3" type="button" class="pure-button pure-button-primary" runat="server"   onserverclick="DeleteBranch"    style="margin-top: 0.4cm;">Yes</button>
         <button id="Button4" type="button" class="pure-button pure-button-primary" onclick="CloseDelete()";  style="margin-top: 0.4cm;">No</button>
         </div>
     
     </div>
