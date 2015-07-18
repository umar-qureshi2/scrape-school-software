<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UpdateMarksGrades.ascx.cs" Inherits="School.usercontrols.UpdateMarksGrades" %>
<link href="../css/form.css" rel="stylesheet" type="text/css" />
<script src="../js/Navigation.js" type="text/javascript"></script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<ContentTemplate>
   <div id="UpdateMarks" style="display:block" class="pure-form pure-form-stacked form1 ">
    <fieldset>
   <legend style="font-size: medium">
   Update Marks
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
            runat="server" onserverclick="UpdateMarks" visible="False">Update Marks</button>
    </fieldset>
     <div class="pure-u-1-2">
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:school %>" 
                SelectCommand="SELECT [examDate] FROM [Exams]"></asp:SqlDataSource>
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                <label for="last-name">Exam Date</label>
                </asp:Panel>
            <asp:DropDownList ID="DropDownList4" runat="server" DataTextFormatString="{0:d}"
                DataSourceID="SqlDataSource4" DataTextField="examDate" 
                DataValueField="examDate" Visible="False">
            </asp:DropDownList>
             
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
               <asp:TemplateField HeaderText="Marks">
                   <ItemTemplate>
                       <asp:TextBox ID="Marks" runat="server" Width="50px" Height="8px"></asp:TextBox>      
                   </ItemTemplate>
                   <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Is Present">
               <ItemTemplate>
                   <asp:CheckBox ID="Status" runat="server" />
               </ItemTemplate>
           </asp:TemplateField>
           </Columns>
       </asp:GridView>
   </div>
   </ContentTemplate>
</asp:UpdatePanel>

<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
<ContentTemplate>
   <div id="UpdateGrade" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
   <legend style="font-size: medium">
   Update Grades
   </legend>

        <div class="pure-g-r">
        <div class="pure-u-1-2">
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:school %>" 
                SelectCommand="SELECT [className] FROM [Class]"></asp:SqlDataSource>
                <label for="last-name">Class</label>
            <asp:DropDownList ID="DropDownList5" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="className" 
                DataValueField="className" >
            </asp:DropDownList>
                </div>

                 <div class="pure-u-1-2">
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                ConnectionString="<%$ ConnectionStrings:school %>" 
                SelectCommand="SELECT [sectionName] FROM [Section]"></asp:SqlDataSource>
                <label for="last-name">Section</label>
            <asp:DropDownList ID="DropDownList6" runat="server" 
                DataSourceID="SqlDataSource2" DataTextField="sectionName" 
                DataValueField="sectionName">
            </asp:DropDownList>
                </div>
                
                <div class="pure-u-1-2">
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                ConnectionString="<%$ ConnectionStrings:school %>" 
                SelectCommand="SELECT [subjectName] FROM [Subjects]"></asp:SqlDataSource>
                <label for="last-name">Subject</label>
            <asp:DropDownList ID="DropDownList7" runat="server" 
                DataSourceID="SqlDataSource3" DataTextField="subjectName" 
                DataValueField="subjectName">
            </asp:DropDownList>
                </div>
        </div>
        <br />
        <button id="Button2" type="submit" class="pure-button pure-button-primary" runat="server" onserverclick="ShowRecords2">Show Records</button>
        <button id="Button3" type="submit" class="pure-button pure-button-primary" 
            runat="server" onserverclick="UpdateGrades" visible="False">Update Grades</button>
    </fieldset>
    <br />
     <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
           ConnectionString="<%$ ConnectionStrings:school %>" 
           SelectCommand="spSelectSectionStudents" 
           SelectCommandType="StoredProcedure">
         <SelectParameters>
             <asp:ControlParameter ControlID="DropDownList7" Name="subjectName" 
                 PropertyName="SelectedValue" Type="String" />
             <asp:ControlParameter ControlID="DropDownList6" Name="sectionName" 
                 PropertyName="SelectedValue" Type="String" />
             <asp:ControlParameter ControlID="DropDownList5" Name="className" 
                 PropertyName="SelectedValue" Type="String" />
             <asp:SessionParameter Name="teacher" SessionField="School" Type="String" />
         </SelectParameters>
       </asp:SqlDataSource>
    <br />
    
   
       <asp:GridView ID="GridView1" runat="server" CssClass="gridview" 
           DataSourceID="SqlDataSource10" Width="40%" AutoGenerateColumns="False">
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
               <asp:TemplateField HeaderText="Grade">
                   <ItemTemplate>
                       <asp:TextBox ID="Grade" runat="server" Width="50px" Height="8px"></asp:TextBox>      
                   </ItemTemplate>
                   <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
               </asp:TemplateField>
           </Columns>
       </asp:GridView>
   </div>
   </ContentTemplate>
</asp:UpdatePanel>