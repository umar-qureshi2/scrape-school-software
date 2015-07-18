<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="attendance.ascx.cs" Inherits="School.usercontrols.attendance" %>
<link href="../css/form.css" media="all" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    function toggleSmiley(id) {
        var image = id;
        image.src = image.getAttribute('src') == 'a.png' ? 's.png' : 'a.png';
        var naam = image.getAttribute('id');
        naam = naam.split('_');
        naam = naam[naam.length - 1];
        document.getElementById('forms_attendance1_GridView2_Status1_' + naam).checked = image.getAttribute('src') == 'a.png' ? false : true;
    }
    function imageLoad(image) {
        var naam = image.getAttribute('id');
        naam = naam.split('_');
        naam = naam[naam.length - 1];
        image.src = document.getElementById('forms_attendance1_GridView2_Statu1_' + naam).checked ? 'a.png' : 's.png';
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<ContentTemplate>
<div id="SAttendance"  class="pure-form pure-form-stacked form1 "  style="display:none">
   <fieldset>
   <legend style="font-size: medium">
    Update Attendance
   </legend>
         <div class="pure-g-r">
        <div class="pure-u-1-2">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:school %>" 
                SelectCommand="SELECT [className] FROM [Class]"></asp:SqlDataSource>
                <label for="last-name">Class</label>
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="className" 
                DataValueField="className" >
            </asp:DropDownList>
                </div>

                 <div class="pure-u-1-2">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:school %>" 
                SelectCommand="SELECT [sectionName] FROM [Section]"></asp:SqlDataSource>
                <label for="last-name">Section</label>
            <asp:DropDownList ID="DropDownList2" runat="server" 
                DataSourceID="SqlDataSource2" DataTextField="sectionName" 
                DataValueField="sectionName">
            </asp:DropDownList>
                </div>
                
                <div class="pure-u-1-2">
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:school %>" 
                SelectCommand="SELECT [subjectName] FROM [Subjects]"></asp:SqlDataSource>
                <label for="last-name">Subject</label>
            <asp:DropDownList ID="DropDownList3" runat="server" 
                DataSourceID="SqlDataSource3" DataTextField="subjectName" 
                DataValueField="subjectName">
            </asp:DropDownList>
                </div>
        </div>
        <br />
        <button id="Button5" type="submit" class="pure-button pure-button-primary" runat="server" onserverclick="ShowRecords">Show Records</button>
        <button id="Button1" type="submit" class="pure-button pure-button-primary" 
            runat="server" onserverclick="UpdateAttendance" visible="False">Update Attendance</button>
   </fieldset>
                <div class="pure-u-1-2">
                    <asp:Panel ID="Panel1" runat="server" Visible="False">
                <label for="last-name">Attendance Date</label>
                <asp:TextBox ID="TextBox1" type="date" runat="server"></asp:TextBox>
                </asp:Panel>
                </div>
                <br />
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
           ConnectionString="<%$ ConnectionStrings:school %>" 
           SelectCommand="spSelectSectionStudents" 
           SelectCommandType="StoredProcedure">
         <SelectParameters>
             <asp:ControlParameter ControlID="DropDownList3" Name="subjectName" 
                 PropertyName="SelectedValue" Type="String" />
             <asp:ControlParameter ControlID="DropDownList2" Name="sectionName" 
                 PropertyName="SelectedValue" Type="String" />
             <asp:ControlParameter ControlID="DropDownList1" Name="className" 
                 PropertyName="SelectedValue" Type="String" />
             <asp:SessionParameter Name="teacher" SessionField="School" Type="String" />
         </SelectParameters>
       </asp:SqlDataSource>
    <br />
    
   
       <asp:GridView ID="GridView2" runat="server" CssClass="gridview" 
           DataSourceID="SqlDataSource8" Width="40%" AutoGenerateColumns="False">
           <Columns>
               <asp:TemplateField HeaderText="Student ID">
               <ItemTemplate>
                   <asp:Label ID="SchoolID" runat="server" Text='<%#Eval("School ID") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
           <asp:TemplateField HeaderText="Student Name">
               <ItemTemplate>
                   <asp:Label ID="StudentName" runat="server" Text='<%#Eval("Student Name") %>'></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
               <asp:TemplateField HeaderText="Attendance">
                   <ItemTemplate>
                   <asp:CheckBox ID="Status" runat="server" />       
                   </ItemTemplate>
                   <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Remarks">
               <ItemTemplate>
                   <asp:Image ID="Ismiley" runat="server" ImageUrl="~/a.png" onclick="toggleSmiley(this);"  />
                   <asp:CheckBox ID="Status1" runat="server" Style="display:none;" type="checkbox"/>
               </ItemTemplate>
           </asp:TemplateField>
           </Columns>
       </asp:GridView>
</div>
</ContentTemplate>
</asp:UpdatePanel>