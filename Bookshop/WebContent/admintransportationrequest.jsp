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
    <link rel="stylesheet" href="profile_one.css">
    <link rel="stylesheet" href="profile_two.css">
    
   
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
	          <a href="transportation?id=${user.id}">
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
    
    	<c:if test = "${ud == 'Admin'}">    
    	
    		<section>
		    <div class="rt-container">
		          <div class="col-rt-12">
		              <div class="Scriptcontent">
		              
			<!-- Student Profile -->
			<div class="student-profile py-4">
			  <div class="container">
			    <div class="row">
			      
			      <div class="col-lg-15">
			        <div class="card shadow-sm">
			          <div class="card-header bg-transparent border-0">
			            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Student Transportation Requests</h3>
			          </div>
			          <div class="card-body pt-0">
			            <form id="ticketOperation" action="ticketOps" method="post" enctype="multipart/form-data">
				            <table class="table table-bordered">
				              <tr>
				              	<th>Sr. No.</th>
				                <th>Full Name</th>
				                <th>Email</th>
				                <th>Student Id</th>
				                <th>Flight Date</th>
				                <th>Arrival Date</th>
				                <th>Request Status</th>
				              </tr>
				              
				              <c:set var = "tList" scope = "session" value = "${transportationList}"/>
				              <c:if test = "${tList == 'null'}">
				                  <tr>
					                	<td colspan="7">No Records Found</td>
					              </tr>
				              </c:if>
				              <c:if test = "${tList != 'null'}">
				                  
			                    <c:set var="i" scope="session" value="1"/>
				                <c:forEach var="tl" items="${transportationList}">
					                <tr>
					                	<td><c:out value = "${i}"/></td>
						                <td><c:out value = "${tl.fullname}"/></td>
						                <td><c:out value = "${tl.email}"/></td>
						                <td><c:out value = "${tl.std_id}"/></td>
						                <td><c:out value = "${tl.flightdate}"/></td>
						                <td><c:out value = "${tl.arrivaldate}"/></td>
						                <%-- <td><input type="file" id="ticketfile" name="ticketfile" /> 
						                	<br><br><input type="button" onclick="upload('${tl.std_id}', ticketfile, '${i}')" value="Upload">
						                	<!-- <br><br><input type="submit" value="Upload"> -->
						                </td> --%>
						                <td>
					                		<c:set var = "tRequest" scope = "session" value = "${tl.request}"/>
					                		<c:if test = "${tRequest == 0}">
					                		<a href="#">
						                		<img id="tPending" src="images/pending.png" style="width:40px;height:40px;" onclick="pendingReq()">
						                	</a>
						                	</c:if>
						                	<c:if test = "${tRequest == '1'}">
						                		<img src="images/approve.png" style="width:40px;height:40px;" >
						                	</c:if>
						               	</td>
					                </tr>
					                <c:set var="i" value="${i + 1}" scope="page"/>
			   					</c:forEach>
					          </c:if>  
				            
				            </table>
				            <c:if test = "${tList != 'null'}">
					            <input type="file" id="ticketfile" name="ticketfile" required >
					            <br><br>
					            <input type="submit" value="Upload Tickets">
				            </c:if>
			            </form>
			          </div>
			        </div>
			          <div style="height: 26px"></div>
			        
			      </div>
			    </div>
			  </div>
			</div>
			<!-- partial -->
			           
			    		</div>
					</div>
			    </div>
			</section>
    	
    	</c:if>
      
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
