<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<!-- Designined by CodingLab | www.youtube.com/codinglabyt -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> UWM - ISSS </title>
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>
    <link rel="stylesheet" href="dashboard.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
     <script type="text/javascript" src="transportation.js"></script>  
     <script src="https://code.jquery.com/jquery-1.12.4.min.js" type="text/javascript"></script>
   </head>
<body>
  <div class="sidebar">
    <div class="logo-details">
      <i class='bx bxl-c-plus-plus'></i>
      <span class="logo_name">UWM - ISSS</span>
    </div>
      <ul class="nav-links">
        <li>
          <a href="dashboard">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
          <a href="housing">
            <i class='bx bx-box' ></i>
            <span class="links_name">Housing</span>
          </a>
        </li>
        <c:set var = "ud" scope = "session" value = "${userDetail}"/>
        <c:if test = "${ud == 'Admin'}">
        	<li>
	          <a href="transportation?id=${user.id}" class="active">
	            <i class='bx bx-list-ul' ></i>
	            <span class="links_name">Transportation Requests</span>
	          </a>
	        </li>
        </c:if>
        <c:if test = "${ud == 'Prospective Student'}">
	        <li>
	          <a href="transportation?id=${user.id}" class="active">
	            <i class='bx bx-list-ul' ></i>
	            <span class="links_name">Request for Transportation </span>
	          </a>
	        </li>
        </c:if>
        <li>
          <a href="discussioncorner">
            <i class='bx bx-pie-chart-alt-2' ></i>
            <span class="links_name">Discussion Corner</span>
          </a>
        </li>
        <%-- <c:set var = "ud" scope = "session" value = "${userDetail}"/> --%>
        <c:if test = "${ud == 'Admin'}">
        	<li>
	          <a href="allusers">
	            <i class='bx bx-pie-chart-alt-2' ></i>
	            <span class="links_name">User List</span>
	          </a>
        	</li>
        </c:if>
        <li>
          <a href="profile?id=${user.id}">
            <i class='bx bx-coin-stack' ></i>
            <span class="links_name">Profile</span>
          </a>
        </li>
        <!-- <li>
          <a href="#">
            <i class='bx bx-book-alt' ></i>
            <span class="links_name">Total order</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class='bx bx-user' ></i>
            <span class="links_name">Team</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class='bx bx-message' ></i>
            <span class="links_name">Messages</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class='bx bx-heart' ></i>
            <span class="links_name">Favrorites</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class='bx bx-cog' ></i>
            <span class="links_name">Setting</span>
          </a>
        </li> -->
        <li class="log_out">
          <a href="logout">
            <i class='bx bx-log-out'></i>
            <span class="links_name">Log out</span>
          </a>
        </li>
      </ul>
  </div>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">${title}</span>
      </div>
      <!-- <div class="search-box">
        <input type="text" placeholder="Search...">
        <i class='bx bx-search' ></i>
      </div> -->
      <div class="profile-details">
        <img src="images/profile.jpg" alt="">
        <span class="admin_name">${user.fullname}</span>
        <!-- <i class='bx bx-chevron-down' ></i> -->
      </div>
    </nav>

    <div class="home-content">
    
    
    <section>
		    <div class="rt-container">
		          <div class="col-rt-12">
		              <div class="Scriptcontent">
		              
		<!-- Student Profile -->
		<div class="student-profile py-4">
		  <div class="container">
		    <div class="row">
		      <div class="col-lg-10">
		        <div class="card shadow-sm">
		          <div class="card-header bg-transparent text-center">
		            <!-- <img class="profile_img" src="images/profile.jpg" alt="student dp"> -->
		            
		          </div>
		          <div class="card-body">
		          <form id="ticketOperationD" action="ticketOpsDownload?id=${user.id}" method="post" enctype="multipart/form-data">
		            <input type="hidden" id="id" name="id" value="${user.id}" />
				    
				    
					<h3> ${transportationmessage} </h3>
					
					<c:set var = "req" scope = "session" value = "${req}"/>
					<c:if test = "${req == '0'}" >
						<!-- <input type="submit" value="Back" onclick="goToDashboardPage()"> -->
					</c:if>
					<c:if test = "${req == '1'}" >
						<%-- <input type="submit" value="Download Ticket" onclick="downloadTicket('${user.id}')"> --%>
						<input type="submit" value="Download Ticket">
					</c:if>
					<%-- <c:if test = "${req == '2'}" >
						<input type="submit" value="View/ Download">
					</c:if> --%>
					</form>
		          </div>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		</div>
		<!-- partial -->
		           
		    		</div>
				</div>
		    </div>
		</section>
    
    
    
    
    
    
    
      
    </div>
  </section>

  <script>
    let sidebar = document.querySelector(".sidebar");
	let sidebarBtn = document.querySelector(".sidebarBtn");
	sidebarBtn.onclick = function() {
	  sidebar.classList.toggle("active");
	  if(sidebar.classList.contains("active")){
	  sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
	}else
	  sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
	}
 </script>

</body>
</html>
