using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace formally
{
    public partial class entrar_aluno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_entrar_Click(object sender, EventArgs e)
        {

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["formallyConnectionString"].ConnectionString);
            SqlCommand myCommand = new SqlCommand();

            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.CommandText = "entrada_aluno";
            myCommand.Connection = myConn;
            myCommand.Parameters.AddWithValue("@aluno", tb_aluno.Text);
            myCommand.Parameters.AddWithValue("@pw", EncryptString(tb_senha.Text));
            // myCommand.Parameters.AddWithValue("@pw", tb_senha.Text);
            // myCommand.Parameters.AddWithValue("@codPerfil", 1);
            // myCommand.Parameters.AddWithValue("@email", tb_email.Text);
            // myCommand.Parameters.AddWithValue("@email", tb_email.Text);

            SqlParameter valor = new SqlParameter();
            valor.ParameterName = "@retorno";
            valor.Direction = ParameterDirection.Output;
            valor.SqlDbType = SqlDbType.Int;
            myCommand.Parameters.Add(valor);

            SqlParameter valor2 = new SqlParameter();
            valor2.ParameterName = "@retorno_estado";
            valor2.Direction = ParameterDirection.Output;
            valor2.SqlDbType = SqlDbType.VarChar;
            valor2.Size = 32;
            myCommand.Parameters.Add(valor2);

            myConn.Open();
            myCommand.ExecuteNonQuery();
            int respostaSP = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);
            System.Diagnostics.Debug.WriteLine(respostaSP);
            myConn.Close();
            if (respostaSP == 1)
            {
                // lbl_mensagem.Text = "Utilizador inserido com sucesso";

                // MailMessage email = new MailMessage();
                // SmtpClient servidor = new SmtpClient();

                /* try
                {
                    email.From = new MailAddress("antmn2marques@gmail.com");
                    email.To.Add(tb_email.Text);
                    email.Subject = "Ativação de conta";

                    email.IsBodyHtml = true;
                    email.Body = $"Obrigado pelo registo, para ativar a conta clique " +
                        $"<a href='https://localhost:44323/ativacao.aspx?util={EncryptString(tb_utilizador.Text)}'>aqui</a>";

                    //                    servidor.Host = "smtp.gmail.com";
                    //                    servidor.Port = 587;
                    servidor.Host = "localhost";
                    servidor.Port = 1025;
                    servidor.Credentials = new NetworkCredential("", "");
                    //                    servidor.Credentials = new NetworkCredential("antmn2marques@gmail.com", "equd wboe araf dkoy");
                    //                    servidor.EnableSsl = true;
                    servidor.EnableSsl = false;
                    servidor.Send(email);
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                } */

                lbl_mensagem.Text = "Entrada autorizada";
            }
            else if (respostaSP == 2)
            {
                lbl_mensagem.Text = "Utilizador desativado";
            }
            else
            {
                lbl_mensagem.Text = "Nome ou senha errados hummm";
            }


        }


        public static string EncryptString(string Message)
        {
            string Passphrase = "formally";
            byte[] Results;
            System.Text.UTF8Encoding UTF8 = new System.Text.UTF8Encoding();
            // Step 1. We hash the passphrase using MD5
            // We use the MD5 hash generator as the result is a 128 bit byte array
            // which is a valid length for the TripleDES encoder we use below
            MD5CryptoServiceProvider HashProvider = new MD5CryptoServiceProvider();
            byte[] TDESKey = HashProvider.ComputeHash(UTF8.GetBytes(Passphrase));
            // Step 2. Create a new TripleDESCryptoServiceProvider object
            TripleDESCryptoServiceProvider TDESAlgorithm = new TripleDESCryptoServiceProvider();
            // Step 3. Setup the encoder
            TDESAlgorithm.Key = TDESKey;
            TDESAlgorithm.Mode = CipherMode.ECB;
            TDESAlgorithm.Padding = PaddingMode.PKCS7;
            // Step 4. Convert the input string to a byte[]
            byte[] DataToEncrypt = UTF8.GetBytes(Message);
            // Step 5. Attempt to encrypt the string
            try
            {
                ICryptoTransform Encryptor = TDESAlgorithm.CreateEncryptor();
                Results = Encryptor.TransformFinalBlock(DataToEncrypt, 0, DataToEncrypt.Length);
            }
            finally
            {
                // Clear the TripleDes and Hashprovider services of any sensitive information
                TDESAlgorithm.Clear();
                HashProvider.Clear();
            }
            // Step 6. Return the encrypted string as a base64 encoded string
            string enc = Convert.ToBase64String(Results);
            enc = enc.Replace("+", "KKK");
            enc = enc.Replace("/", "JJJ");
            enc = enc.Replace("\\", "III");
            return enc;
        }

    }
}