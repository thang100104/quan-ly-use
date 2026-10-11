<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý User</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f8fafc; }
        h2 { color: #1b2a7a; text-align: center; }
        .toolbar { width: 80%; margin: 0 auto 18px; display: flex; gap: 10px; align-items: center; flex-wrap: wrap; }
        .search-form { display: flex; gap: 8px; align-items: center; flex: 1; }
        .search-form input { padding: 9px 10px; min-width: 240px; border: 1px solid #ccc; border-radius: 4px; }
        table { width: 80%; margin: 20px auto; border-collapse: collapse; background: white; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #1b2a7a; color: white; }
        tr:hover { background-color: #f1f5f9; }
        .btn { padding: 8px 12px; text-decoration: none; border-radius: 4px; color: white; font-weight: bold; font-size: 14px; border: none; cursor: pointer; }
        .btn-add { background-color: #27ae60; }
        .btn-search { background-color: #8e44ad; }
        .btn-sort { background-color: #f39c12; }
        .btn-all { background-color: #7f8c8d; }
        .btn-edit { background-color: #2980b9; margin-right: 5px; }
        .btn-delete { background-color: #c0392b; }
        .message { width: 80%; margin: 0 auto; color: #555; }
    </style>
</head>
<body>
<h2>Danh Sách Người Dùng (Users)</h2>

<div class="toolbar">
    <a href="${pageContext.request.contextPath}/users?action=create" class="btn btn-add">Thêm mới User</a>

    <form class="search-form" action="${pageContext.request.contextPath}/users" method="get">
        <input type="hidden" name="action" value="search">
        <input type="text" name="country" value="${country}" placeholder="Nhập country cần tìm...">
        <button type="submit" class="btn btn-search">Tìm theo country</button>
    </form>

    <a href="${pageContext.request.contextPath}/users?action=sort" class="btn btn-sort">Sắp xếp theo name</a>
    <a href="${pageContext.request.contextPath}/users" class="btn btn-all">Tất cả</a>
</div>

<c:if test="${not empty country}">
    <p class="message">Kết quả tìm kiếm country: <strong><c:out value="${country}" /></strong></p>
</c:if>

<c:if test="${sorted}">
    <p class="message">Danh sách đang được sắp xếp theo tên A → Z.</p>
</c:if>

<table>
    <tr>
        <th>ID</th>
        <th>Tên User</th>
        <th>Email</th>
        <th>Quốc gia</th>
        <th>Hành động</th>
    </tr>

    <c:forEach var="user" items="${requestScope.listUser}">
        <tr>
            <td><c:out value="${user.id}" /></td>
            <td><c:out value="${user.name}" /></td>
            <td><c:out value="${user.email}" /></td>
            <td><c:out value="${user.country}" /></td>
            <td>
                <a href="${pageContext.request.contextPath}/users?action=edit&id=${user.id}" class="btn btn-edit">Sửa</a>
                <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}" class="btn btn-delete">Xóa</a>
            </td>
        </tr>
    </c:forEach>

    <c:if test="${empty requestScope.listUser}">
        <tr>
            <td colspan="5">Không tìm thấy User phù hợp.</td>
        </tr>
    </c:if>
</table>
</body>
</html>
