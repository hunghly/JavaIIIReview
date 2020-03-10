<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Snack Creation</title>
</head>
<body>
<c:if test="${sessionScope.snackCreated}">
    <h1 style="color: red;">Your snack is created successfully.</h1>
    <% request.getSession().removeAttribute("snackCreated"); %>
</c:if>
<h1>Let's create a snack!</h1>
<form action="/snack/create" method="POST">
    <div>
        <label for="name">Enter your snack's name: </label>
        <input type="text" name="name" id="name" required>
    </div>
    <div>
        <label for="price">Enter your snack's price: </label>
        <input type="text" name="price" id="price" required>
    </div>
    <input type="submit" value="Create Snack">
</form>
</body>
</html>