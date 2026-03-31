<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gerir_alunos.aspx.cs" Inherits="formally.gerir_alunos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbl_gestao_alunos" runat="server" Text="Gestão de Formandos"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                    <asp:BoundField DataField="id_acao" HeaderText="id_acao" SortExpression="id_acao" />
                    <asp:BoundField DataField="numero" HeaderText="numero" SortExpression="numero" />
                    <asp:BoundField DataField="idade" HeaderText="idade" SortExpression="idade" />
                    <asp:BoundField DataField="id_anterior" HeaderText="id_anterior" SortExpression="id_anterior" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="cod_estado" HeaderText="cod_estado" SortExpression="cod_estado" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:formallyConnectionString %>" DeleteCommand="DELETE FROM [formando] WHERE [id] = @id" InsertCommand="INSERT INTO [formando] ([nome], [id_acao], [numero], [idade], [id_anterior], [email], [cod_estado]) VALUES (@nome, @id_acao, @numero, @idade, @id_anterior, @email, @cod_estado)" SelectCommand="SELECT [id], [nome], [id_acao], [numero], [idade], [id_anterior], [email], [cod_estado] FROM [formando]" UpdateCommand="UPDATE [formando] SET [nome] = @nome, [id_acao] = @id_acao, [numero] = @numero, [idade] = @idade, [id_anterior] = @id_anterior, [email] = @email, [cod_estado] = @cod_estado WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="id_acao" Type="Int32" />
                    <asp:Parameter Name="numero" Type="String" />
                    <asp:Parameter Name="idade" Type="Int32" />
                    <asp:Parameter Name="id_anterior" Type="Int32" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="cod_estado" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="id_acao" Type="Int32" />
                    <asp:Parameter Name="numero" Type="String" />
                    <asp:Parameter Name="idade" Type="Int32" />
                    <asp:Parameter Name="id_anterior" Type="Int32" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="cod_estado" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
