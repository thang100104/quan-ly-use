# Quản lý User sử dụng JSP - Servlet - JDBC - MySQL

Ứng dụng Java Web theo kiến trúc MVC, kết nối MySQL bằng JDBC.

## Chức năng
- Hiển thị danh sách User
- Thêm mới User
- Sửa thông tin User
- Xóa User
- Tìm kiếm User theo `country`
- Sắp xếp User theo `name` từ A → Z
- Thực hành CRUD với MySQL

## Công nghệ
- Java 17
- Maven
- Jakarta Servlet 6
- JSP + JSTL 3
- JDBC
- MySQL Connector/J 8.3.0
- Tomcat 10.1+

## Cấu hình MySQL

Chạy file `database.sql` để tạo database `demo` và bảng `users`.

Sau đó mở:

`src/main/java/com/codegym/dao/UserDAO.java`

và sửa:

```java
private final String jdbcUsername = "root";
private final String jdbcPassword = "password";
```

cho đúng với MySQL trên máy.

## Chức năng mới của bài cập nhật

### Tìm kiếm theo country
Trên màn hình danh sách, nhập country rồi bấm **Tìm theo country**.

SQL sử dụng:

```sql
SELECT * FROM users WHERE country LIKE ?;
```

### Sắp xếp theo name
Bấm **Sắp xếp theo name** để sắp xếp A → Z.

SQL sử dụng:

```sql
SELECT * FROM users ORDER BY name ASC;
```

## Build

```bash
mvn clean package
```

File WAR:

`target/user-management.war`

Deploy lên Tomcat 10.1+ rồi truy cập:

`http://localhost:8080/user-management/users`
