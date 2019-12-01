# PayPalButtonAspNet
This is a sample of how to set up the PayPal Button integration with ASP.NET WebForms


Also, as a reference, you might want to use this sample object to understand how PayPal is passing data. You can find the same for your transactions when debugging in Google Chrome (Console Section).

1. create_time: "2019-11-17T23:47:30Z"
2. id: "1AN0512580560C"
3. intent: "CAPTURE"
4. links: Array(1)
	1. 0:
		1. href: "https://api.sandbox.paypal.com/v2/checkout/orders/skdjfkjskdfkjkC"
		2. method: "GET"
		3. rel: "self"
		4. title: "GET"
		5. __proto__: Object
	2. length: 1
	3. __proto__: Array(0)
5. payer:
	1. address:
		1. country_code: "US"
		2. __proto__: Object
	2. email_address: "test-buyer@hotmail.com"
	3. name:
		1. given_name: "test"
		2. surname: "buyer"
		3. __proto__: Object
	4. payer_id: "FKZLLSS8FY4"
	5. __proto__: Object
6. purchase_units: Array(1)
	1. 0:
		1. amount: {value: "0.01", currency_code: "USD", breakdown: {…}}
		2. custom_id: "1"
		3. description: "Order made at Resumeshare"
		4. items: Array(1)
			1. 0:
				1. description: "1 month unlimited jobs"
				2. name: "1 Month Unlimited Jobs"
				3. quantity: "1"
				4. tax:
					1. currency_code: "USD"
					2. value: "0.00"
					3. __proto__: Object
				5. unit_amount:
					1. currency_code: "USD"
					2. value: "0.01"
					3. __proto__: Object
				6. __proto__: Object
			2. length: 1
			3. __proto__: Array(0)
		5. payee:
			1. email_address: "ottonegron-facilitator@hotmail.com"
			2. merchant_id: "P37P4UKWUZJ"
			3. __proto__: Object
		6. payments:
			1. captures: Array(1)
				1. 0: {status: "PENDING", id: "2H2626dfgHN456245E", final_capture: true, create_time: "2019-11-17T23:47:53Z", update_time: "2019-11-17T23:47:53Z", …}
				2. length: 1
				3. __proto__: Array(0)
			2. __proto__: Object
		7. reference_id: "default"
		8. shipping:
			1. address:
				1. address_line_1: "1 Main St"
				2. admin_area_1: "CA"
				3. admin_area_2: "San Jose"
				4. country_code: "US"
				5. postal_code: "95131"
				6. __proto__: Object
			2. name:
				1. full_name: "test buyer"
				2. __proto__: Object
			3. __proto__: Object
		9. __proto__: Object
	2. length: 1
	3. __proto__: Array(0)
7. status: "COMPLETED"
8. update_time: "2019-11-17T23:47:53Z"
9. __proto__: Object
