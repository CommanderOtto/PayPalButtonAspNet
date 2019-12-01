using System;
using System.Threading.Tasks;

//1. Import the PayPal SDK client that was created in `Set up Server-Side SDK`.
using BraintreeHttp;
using PayPalCheckoutSdk.Core;
using PayPalCheckoutSdk.Orders;
using System.Web.Script.Services;
using System.Threading;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace PaypalTutorial
{
    public partial class OttosTest2ClientSide : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [System.Web.Services.WebMethod]
        public static void SaveInDatabase(string orderId, string orderstatus, string accountinfoemail, string accountholdername, string paypalaccountid, string address, string address2, string city, string state, string country, string postal, string productid, string productdescription, string productquantity, string amountvalue, string amountcurrencycode, string purchasedate, string paymentstatus, string paymentid, bool debug = false)
        {
            bool debugoutput = debug;

            //4.A) OrderId
            Console.WriteLine("Order Id: {0}", orderId);
            string OrderId = orderId;       
            string OrderStatus = orderstatus;
            string AccountInfoEmail = accountinfoemail;
            string AccountHolderName = accountholdername;
            string PaypalAccountId = paypalaccountid;
            string Address1 = address;
            string Address2 = address2;
            string City = city;
            string State = state;
            string Country = country;
            string Postal = postal;
            string ProductId = productid;
            string ProductDescription = productdescription;
            string ProductQuantity = productquantity;
            string AmountValue = amountvalue;
            string AmountCurrencyCode = amountcurrencycode;
            string PurchaseDate = purchasedate;
            string PaymentId = paymentid;
            string PaymentStatus = paymentstatus;

            //connect to the database
            string cs = WebConfigurationManager.ConnectionStrings["EcommerceDatabaseConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //insert in db
            string sql = "INSERT INTO [ORDERS](PaypalOrderId, OrderStatus, AccountInfoEmail, AccountHolderName, PayPalAccountId, Address1, Address2, City, State, Country, Postal, ProductId, ProductDescription, ProductQuantity, AmountValue, AmountCurrencyCode, PurchaseDate, PaymentStatus, PaymentId) values('" + OrderId + "', '" + OrderStatus + "', '" + AccountInfoEmail + "', '" + AccountHolderName + "', '" + PaypalAccountId + "', '" + Address1 + "','" + Address2 + "', '" + City + "', '" + State + "', '" + Country + "', '" + Postal + "', '" + ProductId + "', '" + ProductDescription + "', '" + ProductQuantity + "', '" + AmountValue + "', '" + AmountCurrencyCode + "', '" + PurchaseDate + "', '" + PaymentStatus + "', '" + PaymentId + "');";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.ExecuteNonQuery();
            con.Close();

            //return "Database Operation Complete";
        }
    }
}