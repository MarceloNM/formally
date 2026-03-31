<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inserir_aluno.aspx.cs" Inherits="formally.inserir_aluno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Novo Formando</title>
    <link rel="stylesheet" href="./css/form.css" />
</head>
<body>
    <div class="entrada-arca">
        <form id="entrada" class="entrada-form" runat="server">
            <h2>Novo formando</h2>
            <asp:TextBox ID="tb_aluno" type="text" placeholder="Aluno" runat="server" required = "required"></asp:TextBox>
            <asp:TextBox ID="tb_idade" type="text" placeholder="Idade" runat="server" required = "required"></asp:TextBox>
            <asp:TextBox ID="tb_email" type="text" placeholder="Email" runat="server" required = "required"></asp:TextBox>
            <asp:TextBox ID="tb_senha" type="password" placeholder="Senha" runat="server" required = "required"></asp:TextBox>
            <asp:Button ID="btn_novo" runat="server" type="submit" Text="Inserir" OnClick="btn_novo_Click" />
            <asp:Label ID="lbl_mensagem" runat="server" ForeColor="Red" Text="Nome ou palavra-passe errados" Visible="False"></asp:Label>
        </form>
    </div>
</body>
</html>
