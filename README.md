# Quản lý User sử dụng JSP - Servlet - JDBC - MySQL

Bài thực hành Java Web theo kiến trúc MVC, kết nối MySQL bằng JDBC.

## Chức năng
- Hiển thị danh sách User
- Thêm mới User
- Sửa thông tin User
- Xóa User
- Thực hành CRUD với MySQL

## Công nghệ
- Java 17
- Maven
- Jakarta Servlet 6
- JSP + JSTL 3
- JDBC
- MySQL Connector/J 8.3.0
- Tomcat 10.1+

## 1. Tạo cơ sở dữ liệu
Chạy file:

```bash
database.sql
```

Hoặc chạy trực tiếp trong MySQL:

```sql
CREATE DATABASE IF NOT EXISTS demo;
USE demo;

CREATE TABLE users (
    id INT(3) NOT NULL AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(220) NOT NULL,
    country VARCHAR(120),
    PRIMARY KEY (id)
);
```

## 2. Cấu hình MySQL
Mở:

`src/main/java/com/codegym/dao/UserDAO.java`

Sửa các giá trị:

```java
private final String jdbcUsername = "root";
private final String jdbcPassword = "password";
```

cho đúng với tài khoản MySQL trên máy.

## 3. Build
```bash
mvn clean package
```

File WAR được tạo tại:

`target/user-management.war`

## 4. Chạy trên Tomcat
Deploy file WAR lên Tomcat 10.1+ và truy cập:

`http://localhost:8080/user-management/users`
