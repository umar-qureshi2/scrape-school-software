<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExamDate.ascx.cs" Inherits="School.usercontrols.ExamDate" %>
<link href="../css/form.css" rel="stylesheet" type="text/css" />
<script src="../js/Navigation.js" type="text/javascript"></script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<ContentTemplate>
  <div id="ExamDate" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
   <legend style="font-size: medium">
   Add Exam Schedule
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
             <div class="pure-u-1-2">
                <label for="last-name">Exam ID</label>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:school %>" 
                    SelectCommand="SELECT [examTypeId] FROM [ExamType]">
                </asp:SqlDataSource>
                  <asp:DropDownList ID="DropDownList4" runat="server" 
                    DataSourceID="SqlDataSource5" DataTextField="examTypeId" 
                    DataValueField="examTypeId">
                </asp:DropDownList>
            </div>
            <div class="pure-u-1-2">
                <label for="last-name">Exam Date</label>
                <asp:TextBox ID="EDate" type="date" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="ValidateExamDate" ControlToValidate="EDate" ErrorMessage="Required" CssClass="validator"/>
                
            </div>
             <div class="pure-u-1-2">
                <label for="last-name">Total Marks</label>
                <input id="TotalMarks" type="text" runat="server">
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ValidateExamDate" ControlToValidate="TotalMarks" ErrorMessage="Required" CssClass="validator"/>
            </div>
                  
        </div>
        <button id="Button3" type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateExamDate" onserverclick="AddExamDate">Add Exam</button>
    </fieldset>
    <br />
    
   <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
               ConnectionString="<%$ ConnectionStrings:school %>" 
               
          SelectCommand="SELECT [SubjectId], [examTypeId], [examDate], [totalMarks] FROM [Exams]"></asp:SqlDataSource>
           <asp:GridView ID="GridView1" runat="server" 
               DataSourceID="SqlDataSource2" 
               onselectedindexchanged="GridView1_SelectedIndexChanged" Width="40%" 
               AutoGenerateColumns="False" DataKeyNames="SubjectId,examDate" 
          CssClass="gridview" AllowPaging="True" 
          onpageindexchanged="GridView1_PageIndexChanged">
               <Columns>
                   <asp:BoundField DataField="SubjectId" HeaderText="Subject ID" ReadOnly="True" 
                       SortExpression="SubjectId" />
                   <asp:BoundField DataField="examTypeId" HeaderText="Exam Type ID" 
                       SortExpression="examTypeId" />
                   <asp:BoundField DataField="examDate" HeaderText="Exam Date" ReadOnly="True" DataFormatString="{0:d}"
                       SortExpression="examDate" />
                   <asp:BoundField DataField="totalMarks" HeaderText="Total Marks" 
                       SortExpression="totalMarks" />
               </Columns>
               
           </asp:GridView>
   
   </div>
   </ContentTemplate>
</asp:UpdatePanel>
