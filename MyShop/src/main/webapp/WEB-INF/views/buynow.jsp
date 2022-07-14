<%@page import="java.util.ArrayList"%>
<%@page import="com.priyanshu.model.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>
<jsp:include page="bootstrap/bcdn.jsp"></jsp:include>

<link href="/css/buynow.css" rel="stylesheet" crossorigin="anonymous">
<script src="/js/buynow.js"></script>

<title>Purchase</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<style type="text/css">
.material-icons.md-48 {
	font-size: 25px;
	background-color: red;
}
</style>

</head>

<body class="container-fluid bg-light " style="margin: 0%; padding: 0%;">

	<!-- Navbar -->
	<div>
		<jsp:include page="bootstrap/nav.jsp"></jsp:include>
	</div>


	<div class="wrap cf">
		<h1 class="projTitle">Shopping Cart</h1>
		<div class="heading cf">
			<h1>My Cart</h1>
			<a href="/" class="continue">Continue Shopping</a>
		</div>

		<div class="cart">

			<ul class="cartWrap">
				<li class="items odd">

					<form method="post" action="/purchase/buynow/purchasepage">

						<c:forEach items="${ sessionScope.totalProductList }" var="total">

							<div class="infoWrap">
								<div class="cartSection">

									<img src="/image/${total.path }" alt="" class="itemImg" /> <input
										type="hidden" value="${total.productId }"
										name="id${total.productId }">
									<p class="itemNumber">#QUE-007544- ${total.productId }</p>
									<h3>${total.model }</h3>

									<p>
										<input type="text" class="qty" placeholder="0" />
									</p>

									<p class="stockStatus">In Stock</p>
								</div>


								<div class="prodTotal cartSection">
									<p>
										<i class="fa fa-rupee" style="font-size: 24px">
											${total.price }</i>
									</p>
								</div>
								<div class="cartSection removeWrap">
									<a href="/removeCart?id=${total.productId }" class="remove">
										<i class="material-icons md-48">delete</i>
									</a>
								</div>
							</div>
						</c:forEach>

						<div class="special">
							<div class="specialContent">Free gift with purchase!, gift
								wrap, etc!!</div>
						</div>
				</li>
			</ul>

		</div>


		<div class="promoCode">
			<label for="promo">Have A Promo Code?</label><input type="text"
				placholder="Enter Code" /> <a href="#" class="btn"></a>
		</div>

		<div class="subtotal cf">

			<%
			ArrayList<Item> al = (ArrayList<Item>) session.getAttribute("totalProductList");
			int totalPrice = 0;
			if (al != null)
				for (int i = 0; i < al.size(); i++)
					totalPrice += al.get(i).getPrice();
			%>

			<ul>
				<li class="totalRow"><span class="label">Subtotal </span> <span
					class="value"> <i class="fa fa-rupee"
						style="font-size: 24px"> <%=totalPrice%>
					</i>
				</span></li>

				<li class="totalRow"><span class="label">Shipping</span><span
					class="value"> <i class="fa fa-rupee"
						style="font-size: 24px"> 0.0</i>
				</span></li>

				<li class="totalRow"><span class="label">Tax (GST 18%)</span> <%
 int tax = totalPrice * 12 / 100;
 %> <span class="value"> <i class="fa fa-rupee"
						style="font-size: 24px"> <%=tax%>
					</i>
				</span></li>

				<li class="totalRow final"><span class="label">Total</span><span
					class="value"> <input type="hidden" value="<%=totalPrice%>"
						name="total"> <i class="fa fa-rupee"
						style="font-size: 24px"> <%
 totalPrice += tax;
 %> <%=totalPrice%>
					</i>
				</span></li>
				<br>
				<li class="totalRow"><button type="submit"
						class="btn btn-success btn-lg">Purchase</button></li>
			</ul>

		</div>
	</div>

	</form>



	<!-- Footer -->
	<jsp:include page="bootstrap/footer.jsp"></jsp:include>

</body>

</html>
