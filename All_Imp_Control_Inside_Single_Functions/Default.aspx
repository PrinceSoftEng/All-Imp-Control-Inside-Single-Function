<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="All_Imp_Control_Inside_Single_Functions.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        table {
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid black;
            padding: 5px
        }

        tr:nth-child(even) {
            background-color: #f2f2f2
        }

        tr:hover {
            background-color: #d0dd7a
        }

        .container {
            display: flex;
            flex-direction: row;
            align-items:start;
        }

        .control {
            margin: 0px;
            padding:50px;
            border: 0px solid #ccc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="control">
                <b>
                    <asp:Label ID="lblDropDownList" runat="server" Text="DropDownList:"></asp:Label></b>
                <asp:DropDownList ID="ddlEmployee" runat="server"></asp:DropDownList><br />
            </div>
            <div class="control">
                <b>
                    <asp:Label ID="lblCheckboxlist" runat="server" Text="Checkboxlist:"></asp:Label></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CheckBoxList ID="chkEmployee" runat="server"></asp:CheckBoxList>
            </div>
            <div class="control">
                <b>
                    <asp:Label ID="lblRadioButtonList" runat="server" Text="RadioButtonList:"></asp:Label></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButtonList ID="rblEmployee" runat="server"></asp:RadioButtonList>
            </div>
        </div>
        <hr />
        <div>
            <b>
                <asp:Label ID="lblGridView" runat="server" Text="GridView:"></asp:Label></b>
            <asp:GridView ID="gvEmployee" runat="server"></asp:GridView>
        </div>
        <br />
        <div>
            <b>
                <asp:Label ID="lblRepeater" runat="server" Text="Repeater:"></asp:Label></b>
            <asp:Repeater ID="rptEmployee" runat="server">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th>Id</th>
                            <th>First Name</th>
                            <th>Middle Name</th>
                            <th>Last Name</th>
                            <th>Email Id</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblId" runat="server" Text='<%#Eval("Id") %>'></asp:Label></td>
                        <td>
                            <asp:Label ID="lblFName" runat="server" Text='<%#Eval("FName") %>'></asp:Label></td>
                        <td>
                            <asp:Label ID="lblMName" runat="server" Text='<%#Eval("MName") %>'></asp:Label></td>
                        <td>
                            <asp:Label ID="lblLName" runat="server" Text='<%#Eval("LName") %>'></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEmailId" runat="server" Text='<%#Eval("EmailId") %>'></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>

    </form>
</body>
</html>
