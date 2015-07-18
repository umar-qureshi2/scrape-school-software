<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TicketsSection.ascx.cs" Inherits="School.usercontrols.Tickets" %>
<link href="../css/form.css" rel="stylesheet" type="text/css" />
<script src="../js/Navigation.js" type="text/javascript"></script>
<script src="../js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="../js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="../js/jquery.autocomplete.js" type="text/javascript"></script>
<link href="../css/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%=IcreatedFor.ClientID%>").autocomplete('../Handler1.ashx');
    });      
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<ContentTemplate>
<div id="NewTicket" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <legend style="font-size: medium">
      New Ticket
      </legend>
        <div class="pure-g-r">
            
            <div class="pure-u-1-1">
                <label for="last-name">Created For</label>
                <asp:TextBox ID="IcreatedFor" type="text" runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="ValidateTicket" ControlToValidate="IcreatedFor" ErrorMessage="Required" CssClass="validator"/>
            </div>
            <div class="pure-u-1-1">
                <label for="last-name">Issue</label>
                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="10cm" 
                    Height="2cm"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ValidateTicket" ControlToValidate="TextBox1" ErrorMessage="Required" CssClass="validator"/>
            </div>
        </div>
       <div class="pure-u-1-2">
        <button id="Button1"   type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateTicket" onserverclick="AddTicket" style="margin-top: 0.4cm;">Add Ticket</button>
         </div>
         <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    </fieldset>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:school %>" 
        
        SelectCommand="SELECT [generatedBy], [generatedFor], [issue], [status], [issueDate], [issueId] FROM [issue] WHERE ([generatedBy] = @generatedBy)">
        <SelectParameters>
            <asp:SessionParameter Name="generatedBy" SessionField="School" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" CssClass="gridview" Width="80%" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        DataKeyNames="issueId" onrowcommand="GridView1_RowCommand" 
        AllowPaging="True" onpageindexchanged="GridView1_PageIndexChanged">
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
   </ContentTemplate>
</asp:UpdatePanel>

   <div id="mask">

     </div>
   <div id="PopTicket"  class="pure-form pure-form-stacked form1 ">
    <fieldset>
     <legend style="font-size: medium">
      Ticket Detail
      </legend>

        <div class="pure-g-r">
             <div class="pure-u-1-2">
                <label for="last-name">Issue</label>
                <textarea id="TextArea1" cols="10" rows="10" runat="server" wrap="soft" 
                     style="width: 10cm"></textarea>
                
            </div>
           
        </div>
         <div class="pure-u-1-2">
         <button id="Button3" type="button" class="pure-button pure-button-primary" onclick="CloseTicket()";  style="margin-top: 0.4cm;">Close</button>
         </div>
    </fieldset>

     </div>


     <div id="PendingTickets"  class="pure-form pure-form-stacked form1 " 
    style="display: none">
    <fieldset>
     <legend style="font-size: medium">
      Pending Tickets
      </legend>
      <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="spSelectPendingIssues" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="pKId" SessionField="School" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
          <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            CssClass="gridview" DataSourceID="SqlDataSource2" Width="70%" 
            onrowcommand="GridView2_RowCommand" DataKeyNames="issueId" 
            AllowPaging="True" onpageindexchanged="GridView2_PageIndexChanged">
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
    </fieldset>
        
     </div>

      <div id="TicketReply"  class="pure-form pure-form-stacked form1 ">
    <fieldset>
     <legend style="font-size: medium">
      Issue Reply
      </legend>

        <div class="pure-g-r">
             <div class="pure-u-1-1">
                <label for="last-name">Issue</label>
                <textarea id="TextArea2" cols="10" rows="10" runat="server" wrap="soft" 
                     style="width: 10cm"></textarea>
                
            </div>
            <div class="pure-u-1-1">
                <label for="last-name">Reply</label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="10cm" 
                    Height="2cm"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ValidateTicketReply" ControlToValidate="TextBox2" ErrorMessage="Required" CssClass="validator"/>

            </div>
             <div class="pure-u-1-1">
             <asp:Label ID="Label1" runat="server" Text=""></asp:Label>         
             </div>
        </div>
         <div class="pure-u-1-2">
         
           <button id="Button4"   type="submit" class="pure-button pure-button-primary" runat="server" ValidationGroup="ValidateTicketReply" onserverclick="TicketReply" style="margin-top: 0.4cm;">Reply</button>
           <button id="Button2" type="button" class="pure-button pure-button-primary" onclick="CloseTicketReply()";  style="margin-top: 0.4cm;">Close</button>
         </div>
          <div class="pure-u-1-2">
                <asp:TextBox ID="TextBox3" type="text" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox ID="TextBox4" type="text" runat="server" Visible="False"></asp:TextBox>
            </div>
          
    </fieldset>

     </div>



