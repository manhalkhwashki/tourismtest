<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!--    <form action="RegisterHandler" method="post">
<input type="text" name="name"/><label>الاسم</label><br/>
<input type="text" name="phone"/><label>الرقم</label><br/>
<input type="password" name="password"/><label>كلمة المرور</label><br/>
<input type="submit" value="submit"/>

</form>
-->
<%
String mess=" ";
if(request.getParameter("mess")!=null){
 mess = request.getParameter("mess");
}
%>
<div class="main">

        <section class="signup">
        
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container">
                <div class="signup-content">
                    <form method="POST" id="signup-form" class="signup-form" action="RegisterHandler">
                                           <p style="font-size:32px"> <%=mess %> <p>
                    
                        <h2 class="form-title">انشأ حساب</h2>
                        <div class="form-group">
                            <input type="text" class="form-input" name="name" id="name" placeholder="Your Name"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="phone" id="email" placeholder="Your phone"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="password" id="password" placeholder="Password"/>
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        
                        
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Sign up"/>
                        </div>
                    </form>
                    <p class="loginhere">
                        Have already an account ? <a href="Login.jsp" class="loginhere-link">Login here</a>
                    </p>
                </div>
            </div>
        </section>

    </div>

</body>
</html>