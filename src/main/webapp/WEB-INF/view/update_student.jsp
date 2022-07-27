<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html xmlns:form="http://www.w3.org/1999/html">
    <head>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/add_student.css">
        <title>Update Student</title>
    </head>
    <body>
        <header>
            <h2>Update Student</h2>
        </header>
        <div class="formContainer">
            <form:form cssClass="studentForm" action="saveStudent" modelAttribute="student" method="post">
<!--                The hidden field is needed such that it tells hibernate to save or update-->
                <form:hidden path="id"/>
                <label class="form-label">First Name : </label>
                <form:input path="firstName" cssClass="formInput" />
                <label class="form-label">Last Name : </label>
                <form:input path="lastName" class="formInput"/>
                <label class="form-label">Email : </label>
                <form:input path="email" class="formInput"/>
                <button type="submit" class="saveBtn">Save</button>
            </form:form>
            <button onclick="window.location.href='${pageContext.request.contextPath}/student/students'" class="backBtn">Back</button>
        </div>
    </body>
</html>