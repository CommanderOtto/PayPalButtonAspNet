<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OttosTest2ClientSide.aspx.cs" Inherits="PaypalTutorial.OttosTest2ClientSide" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--PAYPAL META--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <%--PAYPAL META--%>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <%--PAYPAL SCRIPT--%>
            <script src="https://www.paypal.com/sdk/js?client-id=AYp2qRvPEt8X0EaTRO3C1Gtc3EvQ8nMhf7KUYag976aAZxVNZE3d7FA7ZfooVXuYl-BApyTpLf4s1Es0"></script>
            <%--PAYPAL SCRIPT--%>


            <%--AJAX SCRIPT--%>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <%--AJAX SCRIPT--%>


            <%---- SMART PAYMENTS BUTTON -----------------------------------%>
            <div id="paypal-button-container"></div>

            <script>
            paypal.Buttons({
                createOrder: function(data, actions) {
                    // Set up the transaction
                    return actions.order.create({
                        intent: 'CAPTURE',
                        payer: {
                            name: {
                                given_name: 'Bartolomé',
                                surname: 'de las Casas'
                            },
                            email_address: 'barto@hotmail.com'
                        },
                        purchase_units: [{
                            amount: {
                                value: '0.01',
                                currency_code: 'USD',
                                breakdown: {
                                    item_total: {currency_code:'USD', value:'0.01'}
                                }
                            },
                            description: 'Order made at CompanyName',
                            custom_id: '1',                           
                            items: [{
                                name: 'A Sample Item',
                                unit_amount: {value: '0.01', currency_code: 'USD'},
			                    quantity: '1',
			                    description: 'A Sample Item'
		                    }]
                        }]
                    });
                },
                onApprove: function (data, actions) {
                    // Capture the funds from the transaction
                    return actions.order.capture().then(function (details) {
                        // Show a success message to your buyer
                        alert('Transaction completed by ' + details.payer.name.given_name);

                        /*
                          Retrieving the order details is a separate process from capturing the payment. 
                          From here, we can save the details in the database.

                          Other Notes:
                          1. Fetch method is an API for AJAX, and it allows me to send a POST request to
                          a page (ottotest2.aspx/saveindatabase). In that method, I will do database operations.
                      
                          2. In the headers section, I am specifying I am sending json data.

                          3. In the body section, I am specifying what data variables I am sending.

                          4. THEN, run the "res" anonymous response function. THEN, run the details function

                        */                   

                        //return fetch('https://api.sandbox.paypal.com/v2/checkout/orders/64E949259B4737421', {
                        //    method: 'get',
                        //    headers: {
                        //        'Content-Type': 'application/json',
                        //        'Authorization': 'Bearer A21AAE1qz5CpAXe_wK3n02s2eTBlye9cd8Z5oBIBbUr08hraBXPaF5L6pR2xexC4KIURFCI8mRkWd7S415RbtEsV5C5QxFfgQ'
                        //    }
                        //});
                        
                        return fetch('OttosTest2ClientSide.aspx/SaveInDatabase', {
                            method: "post",
                            headers: {
                                'content-type': 'application/json'
                            },
                            body: JSON.stringify({
                                orderId: data.orderID,
                                orderstatus: details.status,
                                accountinfoemail: details.payer.email_address,
                                accountholdername: details.purchase_units[0].shipping.name.full_name,
                                paypalaccountid: details.payer.payer_id,
                                address: details.purchase_units[0].shipping.address.address_line_1,
                                //The code --> || "" = "OR Empty String". This is to avoid errors when Paypal does not contain this data.
                                address2: details.purchase_units[0].shipping.address.address_line_2 || "",
                                city: details.purchase_units[0].shipping.address.admin_area_2 || "",
                                state: details.purchase_units[0].shipping.address.admin_area_1 || "",
                                country: details.purchase_units[0].shipping.address.country_code || "",
                                postal: details.purchase_units[0].shipping.address.postal_code || "",
                                productid: details.purchase_units[0].custom_id || "",
                                productdescription: details.purchase_units[0].items[0].name || "",
                                productquantity: details.purchase_units[0].items[0].quantity || "",
                                amountvalue: details.purchase_units[0].items[0].unit_amount.value || "",
                                amountcurrencycode: details.purchase_units[0].items[0].unit_amount.currency_code || "",
                                purchasedate: details.create_time || "",
                                paymentstatus: details.purchase_units[0].payments.captures[0].status || "",
                                paymentid: details.purchase_units[0].payments.captures[0].id || "",
                                debug: true
                            })
                        })
                    })
                }
            }).render('#paypal-button-container');

            </script>
            <%---- SMART PAYMENTS BUTTON -----------------------------------%>

        </div>
    </form>
</body>
</html>
