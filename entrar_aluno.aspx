<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="entrar_aluno.aspx.cs" Inherits="formally.entrar_aluno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Entrada Aluno</title>
    <link rel="stylesheet" href="./css/form.css" />
</head>
<body>
    <div class="entrada-arca">
        <form id="entrada" class="entrada-form" runat="server">
            <h2>Entrada</h2>
            <asp:TextBox ID="tb_aluno" type="text" placeholder="Aluno" runat="server" required = "required"></asp:TextBox>
            <asp:TextBox ID="tb_senha" type="password" placeholder="Senha" runat="server" required = "required"></asp:TextBox>
            <asp:Button ID="btn_entrar" runat="server" type="submit" Text="Entrar" OnClick="btn_entrar_Click" />
            <asp:Label ID="lbl_mensagem" runat="server" ForeColor="Red" Text="Nome ou palavra-passe errados" Visible="False"></asp:Label>
        </form>
    </div>
</body>
</html>
