<?php
	session_start();
?>
<html>
	<head>
		<title>
			Enter Travel/Ticket Details
		</title>
		<style>
			body {
  font-family: Arial, sans-serif;
}

.logo {
	float: left;
	object-fit: cover;
	width: 55px;
	padding: 10px;
}

h1 {
	font-family: sans-serif;
	font-style: bold;
	font-size: 50pt;
	color: #140189a6;
}

#title {
	display: inline;
}

.bg {
	/* background-image: url("images/4.jpg"); */
	background-size: cover;
	width: 100vw;
	height: 100vh;
}

.float_form {
  width: 500px;
  margin-left:35vw;
  margin-right:auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 10px;
  background-color: white;
  box-shadow: 2px 2px 10px gray;
}

.float_form input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.float_form input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.float_form input[type=submit]:hover {
  background-color: #45a049;
}

.float_form fieldset {
  border: none;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
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
}

li a:hover {
  background-color: #111;
}
			input {
    			border: 1.5px solid #030337;
    			border-radius: 4px;
    			padding: 7px 10px;
			}
			input[type=submit] {
				background-color: #030337;
				color: white;
    			border-radius: 4px;
    			padding: 7px 45px;
    			margin: 0px 215px
			}
			input[type=date] {
				border: 1.5px solid #030337;
    			border-radius: 4px;
    			padding: 5.5px 30px;
			}
			h2 {
    text-align: center;
    font-size: 2em;
    margin-top: 50px;
    margin-bottom: 30px;
}

.logo {
	float: left;
	object-fit: cover;
	width: 55px;
	padding: 10px;
}

hr {
    border: 1px solid #ccc;
    margin: 20px 0;
}

.fix_table {
    font-size: 1.1em;
    font-weight: bold;
    padding-bottom: 10px;
}

table {
    width: 80%;
    margin: 0 auto;
}

input[type=text], input[type=date], input[type=time], input[type=number],select {
	
    width: 80%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
}

input[type=submit] {
    width: 30%;
    margin: 30px 500px;
    padding: 14px 20px;

    background-color: #140189;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #140189a6;
}
		</style>
		<!-- <link rel="stylesheet" type="text/css" href="css/style2.css"/> -->
		<link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
	</head>
	<body>
		<img class="logo" src="images/s1.jpeg"/> 
		<h1 id="title">
			AirlineX
		</h1>
		<section class="bg">
		<div>
			<ul>
				<li><a href="login_page.php"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
				<li><a href="customer_homepage.php"><i class="fa fa-desktop" aria-hidden="true"></i> Dashboard</a></li>
				<li><a href="about.php"><i class="fa fa-plane" aria-hidden="true"></i> About Us</a></li>
				<li><a href="logout_handler.php"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
			</ul>
		</div>
		<?php
			$no_of_pass=$_SESSION['no_of_pass'];
			$class=$_SESSION['class'];
			$count=$_SESSION['count'];
			$flight_no=$_POST['select_flight'];
			$_SESSION['flight_no']=$flight_no;
			//$pass_name=array();
			echo "<h2>ADD PASSENGERS DETAILS</h2>";
			echo "<form action=\"add_ticket_details_form_handler.php\" method=\"post\">";
			while($count<=$no_of_pass)
			{
					echo "<p><strong>PASSENGER ".$count."<strong></p>";
					echo "<table cellpadding=\"0\">";
					echo "<tr>";
					echo "<td class=\"fix_table_short\">Passenger's Name</td>";
					echo "<td class=\"fix_table_short\">Passenger's Age</td>";
					echo "<td class=\"fix_table_short\">Gender</td>";

					echo "<td class=\"fix_table_short\">Inflight Meal</td>";
					echo "<br>";
					echo "<hr>";

					echo "<td class=\"fix_table_short\">Frequent Flier ID (if applicable)</td>";
					echo "</tr>";
					echo "<tr>";
					echo "<td class=\"fix_table_short\"><input type=\"text\" name=\"pass_name[]\" 
					pattern=\"^[a-zA-Z_]+\"required></td>";
					echo "<td class=\"fix_table_short\"><input type=\"text\" name=\"pass_age[]\"
					pattern=\"^[0-9]{2}$\"required></td>";
					echo "<td class=\"fix_table_short\">";
					echo "<select name=\"pass_gender[]\">";
  					echo "<option value=\"male\">Male</option>";
  					echo "<option value=\"female\">Female</option>";
  					echo "<option value=\"other\">Other</option>";
  					echo "</select>";
  					echo "</td>";
  					echo "<td class=\"fix_table_short\">";
					echo "<select name=\"pass_meal[]\">";
  					echo "<option value=\"yes\">Yes</option>";
  					echo "<option value=\"no\">No</option>";
  					echo "</select>";
  					echo "</td>";
  					echo "<td class=\"fix_table_short\"><input type=\"text\" name=\"pass_ff_id[]\"></td>";
					echo "</tr>";
					echo "</table>";
					echo "<br><hr>";
					$count=$count+1;
				}
				echo "<br><h2>ENTER TRAVEL DETAILS</h2>";
				echo "<table cellpadding=\"5\">";
				echo "<tr>";
				echo "<td class=\"fix_table_short\">Do you want access to our Premium Lounge?</td>";
				echo "<td class=\"fix_table_short\">Do you want to opt for Priority Checkin?</td>";
				echo "<td class=\"fix_table_short\">Do you want to purchase Travel Insurance?</td>";
				echo "</tr>";
				echo "<tr>";
				echo "<td class=\"fix_table\">";
				echo "Yes <input type='radio' name='lounge_access' value='yes' checked/> No <input type='radio' name='lounge_access' value='no'/>";
  				echo "</td>";
  				echo "<td class=\"fix_table\">";
				echo "Yes <input type='radio' name='priority_checkin' value='yes' checked/> No <input type='radio' name='priority_checkin' value='no'/>";
  				echo "</td>";
  				echo "<td class=\"fix_table\">";
				echo "Yes <input type='radio' name='insurance' value='yes' checked/> No <input type='radio' name='insurance' value='no'/>";
  				echo "</td>";
				echo "</tr>";
				echo "</table>";
				echo "<br><br>";
				echo "<input type=\"submit\" value=\"Submit Travel/Ticket Details\" name=\"Submit\">";
				echo "</form>";
		?>
		<!--Following data fields were empty!
			...
			ADD VIEW FLIGHT DETAILS AND VIEW JETS/ASSETS DETAILS for ADMIN
		-->
		</section>
	</body>
</html>