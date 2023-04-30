<?php
	session_start();
?>
<html>
	<head>
		<title>
			Welcome Administrator
		</title>
		<style>
			body {
background-color: #f5f5f5;
}

/* ul {
list-style-type: none;
margin: 0;
padding: 0;
overflow: hidden;
background-color: #140189a6;
position: -webkit-sticky; /* Safari */
position: sticky;
top: 0;
}

li {
float: left;
}

li a {
display: block;
color: white;
text-align: center;
padding: 14px 16px;
text-decoration: none;
font-size: 17px;
}

li a:hover {
background-color: #140189a6;
color: #f5f5f5;
} */

.admin_func a {
display: block;
color: #140189a6;
text-align: left;
padding: 14px 16px;
text-decoration: none;
font-size: 17px;
}

.admin_func a:hover {
background-color: #f5f5f5;
color: #140189a6;
}

table {
width: 50%;
margin: auto;
}

h2 {
text-align: center;
margin-top: 50px;
}

#new_user_form {
width: 50%;
margin: auto;
}

.center_form {
text-align: center;
}

input[type=submit] {
background-color: #140189a6;
color: white;
border-radius: 4px;
padding: 7px 45px;
margin: 20px 0px;
cursor: pointer;
}

input[type=submit]:hover {
background-color: #f5f5f5;
color: #140189a6;
}

input {
border: 1.5px solid #140189a6;
border-radius: 4px;
padding: 7px 30px;
margin: 8px 0;
}

#title {
display: inline;
}

.bg {
background-image: url("images/4.jpg");
background-size: cover;
width: 100%;
height: 100%;
}

.logo {
float: left;
object-fit: cover;
width: 55px;
padding: 10px;
}
table {
  width: 80%;
  margin: 0 auto;
  border-collapse: collapse;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

.admin_func a {
  display: block;
  text-align: center;
  text-decoration: none;
  color: #140189a6;
  font-size: 20px;
  padding: 20px;
}

.admin_func a:hover {
  background-color: #dddddd;
}

.admin_func i {
  margin-right: 10px;
}

		</style>
		<link rel="stylesheet" type="text/css" href="css/style2.css"/>
		<link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
	</head>
	<body>
		<img class="logo" src="images/s1.jpeg"/> 
		<h1 id="title">
			AirlineX
		</h1>
		<div>
			<ul>
				<li><a href="admin_homepage.php"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
				<li><a href="admin_homepage.php"><i class="fa fa-desktop" aria-hidden="true"></i> Dashboard</a></li>
				<li><a href="logout_handler.php"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
			</ul>
		</div>
		<h2>Welcome Administrator!</h2>
		<table cellpadding="5">
			
			<tr>
				<td class="admin_func"><a href="admin_view_booked_tickets.php"><i class="fa fa-plane" aria-hidden="true"></i> View List of Booked Tickets for a Flight</a>
				</td>
			</tr>
			<tr>
				<td class="admin_func"><a href="add_flight_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Add Flight Schedule Details</a>
				</td>
			</tr>
			<!-- <tr>
				<td class="admin_func"><a href="modify_flight_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Modify Flight Schedule Details</a>
				</td>
			</tr> -->
			<tr>
				<td class="admin_func"><a href="delete_flight_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Delete Flight Schedule Details</a>
				</td>
			</tr>
			<tr>
				<td class="admin_func"><a href="add_jet_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Add Aircrafts Details</a>
				</td>
			</tr>
			<tr>
				<td class="admin_func"><a href="activate_jet_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Activate Aircraft</a>
				</td>
			</tr>
			<tr>
				<td class="admin_func"><a href="deactivate_jet_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Deactivate Aircraft</a>
				</td>
			</tr>
		</table>
	</body>
</html>