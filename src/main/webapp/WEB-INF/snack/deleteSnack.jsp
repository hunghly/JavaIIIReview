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
    <title>Snack Deletion</title>
</head>
<body>
<c:if test="${sessionScope.snackDeleted}">
    <h1 style="color: red;">Your snack is successfully deleted.</h1>
    <% request.getSession().removeAttribute("snackDeleted"); %>
</c:if>
<h1>Let's delete a snack!</h1>
<form action="/snack/delete" method="POST">
    <label for="snack-select">Choose a snack:</label>

    <select name="snacks" id="snack-select">
        <c:forEach var="snack" items="${snackList}">
            <option value="${snack.name}">${snack.name}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Delete Snack">
</form>
</body>
</html>