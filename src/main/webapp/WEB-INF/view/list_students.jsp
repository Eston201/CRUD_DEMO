<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <title>Students</title>
    </head>

    <body>
        <header>
            <h2>Student Management</h2>
        </header>

        <div class="tableContainer">
            <button onclick="window.location.href='addStudent'; return false;" type="button" class="btn btn-dark addStudent">Add Student</button>
            <table class="table table-hover table-striped table-dark">
                <thead>
                    <tr>
                        <td>First Name</td>
                        <td>Last Name</td>
                        <td>Email</td>
                        <td>Action</td>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="student" items="${students}">

                    <c:url var="updateBtn" value="/student/updateStudent">
                        <c:param name="studentId" value="${student.id}"/>
                    </c:url>
                    <c:url var="deleteBtn" value="/student/deleteStudent">
                        <c:param name="studentId" value="${student.id}"/>
                    </c:url>
                    <tr>
                        <td>${student.firstName}</td>
                        <td>${student.lastName}</td>
                        <td>${student.email}</td>
                        <td class="actions">
                            <button onclick="window.location.href='${updateBtn}'" type="button" class="btn btn-primary actionBtn">Update</button>
                            <button onclick="if (!(confirm('Delete Customer Confirmation'))) return false;
                                    window.location.href='${deleteBtn}'"
                                    type="button" class="btn btn-danger actionBtn">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>