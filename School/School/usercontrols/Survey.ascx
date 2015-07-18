<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Survey.ascx.cs" Inherits="School.usercontrols.Survey" %>
<link href="../css/form.css" rel="stylesheet" type="text/css" />
<script src="../js/Navigation.js" type="text/javascript"></script>
<div id="NewSurvey" style="display:none" class="pure-form pure-form-stacked form1 ">
    <fieldset>
      <legend style="font-size: medium">
      New Survey
      </legend>
      <asp:Panel ID="Panel2" runat="server" Visible="True">
        <div class="pure-g-r">
        <div class="pure-u-1-1">
        <label for="last-name">Type Of Survey</label>
        <asp:RadioButtonList id="RadioButtonList1" runat="server">
        <asp:ListItem value="0">Yes/No</asp:ListItem>
        <asp:ListItem value="1">Rating</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        </div>
        <div class="pure-g-r" style="margin-top: 0.7cm">
        <div class="pure-u-1-2">
              <label for="last-name">Survey Name</label>
                <input id="ASurveyName" type="text" runat="server">
            </div>

             <div class="pure-u-1-2">
                <label for="state">Survey For</label>
                 <asp:DropDownList ID="DropDownList3"  runat="server">
              <asp:ListItem >Teacher</asp:ListItem>
              <asp:ListItem >Student</asp:ListItem>
             </asp:DropDownList>
            </div>
          <div class="pure-u-1-2">
        <button id="Button5" type="button"   class="pure-button pure-button-primary"  runat="server" onserverclick="AddSurvey" style="margin-top: 0.4cm;">Add Survey</button>
         </div>
        </asp:Panel>
          <asp:Panel ID="Panel1" runat="server" Visible="False">
             <div class="pure-u-1-1">
                <label for="last-name">Question No 1</label>
                <input id="AQuestion1" type="text" style="width: 10cm" runat="server">
            </div>
             <div class="pure-u-1-1">
                <label for="last-name">Question No 2</label>
                <input id="AQuestion2" type="text" style="width: 10cm" runat="server">
            </div>
             <div class="pure-u-1-1">
                <label for="last-name">Question No 3</label>
                <input id="AQuestion3" type="text" style="width: 10cm" runat="server">
            </div>
             <div class="pure-u-1-1">
                <label for="last-name">Question No 4</label>
                <input id="AQuestion4" type="text" style="width: 10cm" runat="server">
            </div>
             <div class="pure-u-1-1">
                <label for="last-name">Question No 5</label>
                <input id="AQuestion5" type="text" style="width: 10cm" runat="server">
            </div>
             <div class="pure-u-1-1">
                <label for="last-name">Question No 6</label>
                <input id="AQuestion6" type="text" style="width: 10cm" runat="server">
            </div>
             <div class="pure-u-1-1">
                <label for="last-name">Question No 7</label>
                <input id="AQuestion7" type="text" style="width: 10cm" runat="server">
            </div>
             <div class="pure-u-1-1">
                <label for="last-name">Question No 8</label>
                <input id="AQuestion8" type="text" style="width: 10cm" runat="server">
            </div>
             <div class="pure-u-1-1">
                <label for="last-name">Question No 9</label>
                <input id="AQuestion9" type="text" style="width: 10cm" runat="server">
            </div>
             <div class="pure-u-1-1">
                <label for="last-name">Question No 10</label>
                <input id="AQuestion10" type="text" style="width: 10cm" runat="server">
            </div>
            <div class="pure-u-1-2">
        <button id="Button6" type="button"   class="pure-button pure-button-primary"  runat="server" onserverclick="GenerateSurvey" style="margin-top: 0.4cm;">Generate Survey</button>
         </div>
             </asp:Panel>
          </div>
    </fieldset>
   </div>

   <div id="ShowSurvey"  class="pure-form pure-form-stacked form1 " 
    style="display: none">
    <fieldset>
     <legend style="font-size: medium">
      Surveys
      </legend>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:school %>" 
            SelectCommand="spShowSurvey" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="iAm" SessionField="School" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
          <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            CssClass="gridview" DataSourceID="SqlDataSource2" Width="80%" 
            AllowPaging="True" onpageindexchanged="GridView2_PageIndexChanged" 
            DataKeyNames="surveyid,type" onrowcommand="GridView2_RowCommand" 
            CellSpacing="-1">
              <Columns>
               <asp:BoundField DataField="surveyid" HeaderText="surveyid" 
                      SortExpression="surveyid" InsertVisible="False" ReadOnly="True" Visible="False" />
                  <asp:BoundField DataField="Survey Name" HeaderText="Survey Name" 
                      SortExpression="Survey Name" />
                   <asp:BoundField DataField="Survey Date" HeaderText="Survey Date" DataFormatString="{0:d}"
                      SortExpression="Survey Date" />
       
                  <asp:TemplateField HeaderText="Type Of Survey" SortExpression="type">
               <ItemTemplate>
                   <asp:Label ID="type" runat="server" Text='<%# (Boolean.Parse(Eval("type").ToString())) ? "Rating" : "Yes/No"%>'></asp:Label>
               </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Status" SortExpression="Active">
                <ItemTemplate><%# (Boolean.Parse(Eval("Active").ToString())) ? "Active" : "In Active"%></ItemTemplate>
               </asp:TemplateField>
                  <asp:BoundField DataField="Audiance" HeaderText="Audiance" 
                      SortExpression="Audiance" />
                  <asp:TemplateField HeaderText="Show Survey">
                      <ItemTemplate>
                          <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="show" ImageUrl="~/images/pencil_03.png" />
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
         </asp:GridView>
    </fieldset>
        
     </div>

     <div id="FillSurvey"  class="pure-form pure-form-stacked form1 " 
    style="display: none">
    <fieldset>
     <legend style="font-size: medium">
     Fill Survey
      </legend>
      <div class="pure-g-r">
        <button id="Button1" type="button"   class="pure-button pure-button-primary"  runat="server" onserverclick="SubmitSurvey" style="margin-top: 0.4cm;">Submit Survey</button>
        <button id="Button2" type="button"   class="pure-button pure-button-primary" onclick="CloseShowSurvey()";  style="margin-top: 0.4cm;">Close</button>
          </div>
          <br />
        <asp:Panel ID="Panel4" runat="server" Visible="False">
      <asp:GridView ID="GridView1" runat="server" CssClass="gridview" Width="80%" 
            AutoGenerateColumns="False">
          <Columns>
              <asp:TemplateField HeaderText="Question No">
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%#Eval("questionId") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Question">
                  <ItemTemplate>
                      <asp:Label ID="Label2" runat="server" Text='<%#Eval("question") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Answer">
                  <ItemTemplate>
                      <asp:CheckBox ID="CheckBox1" runat="server" />
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
       </asp:GridView>
       </asp:Panel>
        <asp:Panel ID="Panel3" runat="server" Visible="False">
       <asp:GridView ID="GridView3" runat="server" CssClass="gridview" Width="100%" 
            AutoGenerateColumns="False">
           <Columns>
               <asp:TemplateField HeaderText="Question No">
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%#Eval("questionId") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Question">
                  <ItemTemplate>
                      <asp:Label ID="Label2" runat="server" Text='<%#Eval("question") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Answer">
                  <ItemTemplate>
                      <asp:DropDownList ID="DropDownList4" runat="server" CssClass="gridview">
                          <asp:ListItem Enabled="False">Select Rating</asp:ListItem>
                          <asp:ListItem>Strongly Agree</asp:ListItem>
                          <asp:ListItem>Agree</asp:ListItem>
                          <asp:ListItem>Neutral</asp:ListItem>
                          <asp:ListItem>Disagree</asp:ListItem>
                          <asp:ListItem>Strongly Disagree</asp:ListItem>
                      </asp:DropDownList>
                  </ItemTemplate>
              </asp:TemplateField>
           </Columns>
       </asp:GridView>
       </asp:Panel>
       </fieldset>
        
     </div>
     <div id="mask">

     </div>
