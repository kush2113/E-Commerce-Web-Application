<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .checkout-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 30px auto;
            width: 90%;
            max-width: 1200px;
        }

        .section {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .left-section {
            width: 100%;
            max-width: 65%;
        }

        .right-section {
            width: 100%;
            max-width: 30%;
        }

        .section-header {
            font-weight: bold;
            font-size: 18px;
            color: #333;
            margin-bottom: 15px;
        }

        .payment-methods i {
            margin-right: 10px;
            color: #555;
        }

        .items-details img {
            width: 80px;
            border-radius: 8px;
        }

        .item-info {
            margin-left: 15px;
        }

        .item-info p {
            margin: 0;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            font-size: 16px;
            color: #555;
        }

        .summary-row strong {
            color: #000;
        }

        .pay-now-btn {
            display: block;
            width: 100%;
            padding: 15px;
            background-color: #ff4d4f;
            color: #fff;
            font-size: 18px;
            border: none;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .pay-now-btn:hover {
            background-color: #ff3b3d;
        }

        .text-muted {
            font-size: 14px;
            color: #888;
        }

        @media (max-width: 768px) {
            .checkout-container {
                flex-direction: column;
                width: 95%;
            }

            .left-section, .right-section {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="checkout-container">

    <!-- Left Section -->
    <div class="left-section">
        <!-- Delivery Address -->
        <div class="section">
            <div class="section-header">Delivery Address</div>
            <p><strong><%= request.getAttribute("customerName") %></strong></p>
            <p><%= request.getAttribute("customerAddress") %></p>
            <p><strong>Phone: <%= request.getAttribute("customerPhone") %></strong></p>
            <a href="changeAddress.jsp" class="text-primary">Change Address</a>
        </div>

        <!-- Payment Methods -->
        <div class="section">
            <div class="section-header">Payment Methods</div>
            <p><i class="fas fa-credit-card"></i> **** **** ****
                <%= request.getAttribute("cardLastFourDigits") %> (Mastercard)</p>
            <a href="changePayment.jsp" class="text-primary">Change Payment Method</a>
        </div>

        <!-- Items Details -->
        <div class="section items-details">
            <div class="section-header">Items Details</div>
            <div class="d-flex align-items-center">
                <img src="<%= request.getAttribute("itemImage") %>" alt="Product Image">
                <div class="item-info">
                    <p><strong><%= request.getAttribute("itemName") %></strong></p>
                    <p>Price: US $<%= request.getAttribute("itemPrice") %></p>
                </div>
            </div>
        </div>
    </div>

    <!-- Right Section -->
    <div class="right-section">
        <!-- Order Summary -->
        <div class="section">
            <div class="section-header">Order Summary</div>
            <div class="summary-row">
                <span>Subtotal</span>
                <span>US $<%= request.getAttribute("subtotal") %></span>
            </div>
            <div class="summary-row">
                <span>Promo Codes</span>
                <span><a href="applyPromo.jsp" class="text-primary">Enter Code</a></span>
            </div>
            <div class="summary-row">
                <span>Shipping Fee</span>
                <span>Free</span>
            </div>
            <hr>
            <div class="summary-row">
                <span>Total</span>
                <span><strong>US $<%= request.getAttribute("total") %></strong></span>
            </div>
        </div>

        <!-- Pay Now -->
        <form action="processPayment.jsp" method="post">
            <input type="hidden" name="total" value="<%= request.getAttribute("total") %>">
            <button class="pay-now-btn" type="submit">Pay Now</button>
        </form>

        <p class="text-muted mt-3">
            By clicking "Pay Now", you agree to our Terms and Conditions.
        </p>
    </div>

</div>

</body>
</html>
