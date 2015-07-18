<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddClassSection.ascx.cs" Inherits="School.usercontrols.AddClassSection" %>
<link href="../css/form.css" rel="stylesheet" type="text/css" />
<script src="../js/Navigation.js" type="text/javascript"></script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<ContentTemplate>


<div id="ClassAndSection" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <legend style="font-size: medium">
    Add Class And Sections
      </legend>

        <div class="pure-g-r">
             <div class="pure-u-1-2">
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:school %>" 
                     SelectCommand="SELECT [className] FROM [Class]"></asp:SqlDataSource>

                <label for="state">Class Name</label>
                <asp:DropDownList ID="ClassDropDown" runat="server" DataSourceID="SqlDataSource2" DataTextField="className">
                </asp:DropDownList>
            </div>

            <div class="pure-u-1-2">
             <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:school %>" 
                     SelectCommand="SELECT [sectionName] FROM [Section]"></asp:SqlDataSource>
                <label for="last-name">Section Name</label>
                <asp:DropDownList ID="SectionDropDown" runat="server" DataSourceID="SqlDataSource6" DataTextField="sectionName">
                </asp:DropDownList>
            </div>
            
        </div>
        
       <div class="pure-u-1-2">
        <button id="Button1" type="submit" class="pure-button pure-button-primary" runat="server" onserverclick="ClassAndSection" style="margin-top: 0.4cm;">Add Class & Section</button>
         </div>
         <div class="pure-u-1-2">
         <br />
         <asp:Label ID="ClassSectionLabel" runat="server" Text=""></asp:Label>
         </div>
         <br />
         <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="spSelectCampusDetails" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="pKId" SessionField="School" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
       

        <asp:GridView ID="GridView1" runat="server" CssClass="gridview" Width="70%" 
            AutoGenerateColumns="False" 
            onrowcommand="GridView1_RowCommand" DataKeyNames="CCSec" 
            DataSourceID="SqlDataSource3" 
            onpageindexchanged="GridView1_PageIndexChanged" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="campusName" HeaderText="Campus Name" 
                    SortExpression="campusName" />
                <asp:BoundField DataField="className" HeaderText="Class Name" 
                    SortExpression="className" />
                <asp:BoundField DataField="sectionName" HeaderText="Section Name" 
                    SortExpression="sectionName" />
                <asp:BoundField DataField="CCSec" HeaderText="CCSec" InsertVisible="False" 
                    ReadOnly="True" SortExpression="CCSec" Visible="False" />
                     <asp:TemplateField HeaderText="Delete">
   <ItemTemplate>
   <asp:ImageButton ID="ImageButton2"  CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server" ImageUrl="~/Images/del_03.png" CommandName="Delete"  />
                  
   </ItemTemplate>
   </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </fieldset>
   </div>
   </ContentTemplate>
   </asp:UpdatePanel>

    <div id="DeleteConfirm" class="pure-form pure-form-stacked form1 " >
     <p style="text-align: center">
                Are You Sure, You want to delete the record!!!</p>
                <br /><br />
                <div class="pure-u-1-2" style="margin-left: 3cm">
        <button id="Button3" type="button" class="pure-button pure-button-primary" runat="server"   onserverclick="Delete"    style="margin-top: 0.4cm;">Yes</button>
         <button id="Button4" type="button" class="pure-button pure-button-primary" onclick="CloseDelete()";  style="margin-top: 0.4cm;">No</button>
         </div>
     
     </div>
