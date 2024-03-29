<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Books"%>
<%@page import="com.mapper.BookRowMapper1"%>
<%@page import="com.mapper.BookIssue"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>

<html lang="en">

<head>
   <meta charset="ISO-8859-1">
    <title>Book Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#03a6f3">
    <link rel="stylesheet" href="bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="owl.carousel.min.css">
    <link rel="stylesheet" href="styles.css">
</head>

<body>
<% String bookname = request.getParameter("bookname");
		 String author = request.getParameter("author");
		 int empid=101;
		
		 
		 try{
  			//loading drivers for Postgres
  			
  			Class.forName("org.postgresql.Driver");

  		 //creating connection with the database 
  	    Connection con=DriverManager.getConnection
  	                   ("jdbc:postgresql://localhost:5432/postgres","postgres","admin");

          
          
          String query="insert into requestedbooks(bookname,author,empid)"+"values(?,?,?)";
          PreparedStatement preparedStmt= con.prepareStatement(query);
          preparedStmt.setString(1,bookname);
          preparedStmt.setString(2,author);
          preparedStmt.setInt(3,empid);
          
      //    preparedStmt.setTimestamp(3,ts);
          preparedStmt.execute();
         
     
          
          }
          catch(Exception e)
     	 {		 request.getRequestDispatcher("unsuccessfulform.jsp").forward(request,response);
     	     
     	 }
%>
    <header>
        <div class="header-top">
            <div class="container">
                <div class="row">
                    <div class="col-md-3"><a href="#" class="web-url">www.comviva.com</a></div>
                    <div class="col-md-6">
                        <h5>Enhance your learning daily</h5></div>
                    <div class="col-md-3">
                        <span class="ph-number">Call : 800 1234 5678</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="main-menu">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="https://www.comviva.com/"><img src="images/comvivalogo.jpeg" alt="logo"></a>
                    <img src="images/bookshelflogo.png" alt="logo">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        &nbsp;
						&nbsp;
						
                        
                     <form class="form-inline my-2 my-lg-0" action="/book-module/search">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search here..." aria-label="Search"  name="name"/>
                            <span class="fa fa-search"></span>
                        </form>
                    </div>
                </nav>
            </div>
        </div>
    </header>
    <div class="breadcrumb">
        <div class="container">
            <a class="breadcrumb-item" href="account.jsp">Account</a>
            <span class="breadcrumb-item active">Request For A Book</span>
            <span class="breadcrumb-item active">Form Submitted Successfully</span>
        </div>
    </div>
	<div class="container" align="center">
	
	<div class="alert alert-success"><strong>Success!<br></strong>Your form has been successfully submitted.</div>
     </div> 
	 <footer>
	 
	 
	 <div class="container">
            <div class="row">
                
                
                <div class="col-md-5">
                    <div class="form">
                        <h3>Feedback</h3>
                        
                        <form>
                            <div class="row">
                                <div class="col-md-6">
                                    <input placeholder="Name" required>
                                </div>
                                <div class="col-md-6">
                                    <input type="email" placeholder="Email" required>
                                </div>
                                <div class="col-md-12">
                                    <textarea placeholder="Message"></textarea>
                                </div>
                                <div class="col-md-12">
                                    <button class="btn black">Alright, Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

	 
	 
        <div class="copy-right">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h5>(C) 2019. All Rights Reserved. Comviva Technologies.</h5>
                    </div>
                    
                </div>
            </div>
        </div>
    </footer>
    <script src="jquery.min.js"></script>
    <script src="bootstrap.min.js"></script>
    <script type="text/javascript" src="owl.carousel.min.js"></script>
    <script src="custom.js"></script>
</body>

</html>