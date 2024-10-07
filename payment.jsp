<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
  /* Center the stripe-buy-button element */
  stripe-buy-button {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 50vh; /* Center vertically on the page */
  }
   img {
    display: block;
    margin: 0 auto;
  }
     p {
    font-size: 24px; /* Adjust the font size as needed */
    display: flex;
    justify-content: center;
    align-items: center;
    height: 150px; /* Adjust the height as needed */
  }
</style>

<script async
  src="https://js.stripe.com/v3/buy-button.js">
</script>

<stripe-buy-button
  buy-button-id="buy_btn_1O8oANSHfylSYPXH7Ej2Slco"
  publishable-key="pk_live_51O8niCSHfylSYPXH6BchxOg94K3RnALUCINOXTL5QKaunaPHYsPTsxhyeMeGwwxs3mUT4dfAIhbIM9Hne5i5EwwU008zSepEEX"
>
</stripe-buy-button>

<p>Or</p>
<img src="static/PAYMENT.png" o alt="QR Code Image" width="250" height="250">


</body>
</html>