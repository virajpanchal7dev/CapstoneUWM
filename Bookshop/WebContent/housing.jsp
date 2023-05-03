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
    <link rel='stylesheet' href='https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css'>
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
     <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
          <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
     <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
     
     <script>
	     
	     
	     $(document).ready(function () {
	    	    $('#housinglocationtable').DataTable();
    	 });
     </script>
    
    
    
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
      src="https://maps.googleapis.com/maps/api/js?key=YOURAPI&callback=initMap&v=weekly"
      defer
    ></script>
    <script>
		function initMap() {
		  const map = new google.maps.Map(document.getElementById("map"), {
			zoom: 14,
			center: { lat: 43.077693, lng: -87.881831 },
		  });
		  // Set LatLng and title text for the markers. The first marker (Boynton Pass)
		  // receives the initial focus when tab is pressed. Use arrow keys to
		  // move between markers; press tab again to cycle through the map controls.
		  /* var MyReports  = [];
			<c:forEach var="h" items="${housinglist}">
			  MyReports.push(${h.location_name});
			</c:forEach>
		  alert(MyReports); */
		  
		  
		  const housingL = [
			  <c:forEach var="h" items="${housinglist}">
					[{ lat: ${h.latitude}, lng: ${h.longitude} }, "${h.location_name}"],
			  </c:forEach>
		  ];
		  
		  /* const tourStops = [
			[{ lat: 43.067774, lng: -87.887209 }, "The Park at 1824"],
			[{ lat: 43.066412, lng: -87.882713 }, "The Candlelite"],
			[{ lat: 43.079298, lng: -87.881781 }, "UWM Sandburg Residence Halls"],
			[{ lat: 43.060500, lng: -87.891509 }, "UWM Cambridge Commons"],
			[{ lat: 43.087847, lng: -87.885372 }, "Fountainview Apartments"],
		  ]; */
		  // Create an info window to share between markers.
		  const infoWindow = new google.maps.InfoWindow();

		  // Create the markers.
		  housingL.forEach(([position, name], i) => {
			const marker = new google.maps.Marker({
			  position,
			  map,
			  title: name,
			  optimized: false,
			});

			// Add a click listener for each marker, and set up the info window.
			marker.addListener("click", () => {
			  infoWindow.close();
			  infoWindow.setContent(marker.getTitle());
			  infoWindow.open(marker.getMap(), marker);
			});
		  });
		}

		window.initMap = initMap;
	</script>
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
          <a href="housing"  class="active">
            <i class='bx bx-box' ></i>
            <span class="links_name">Housing</span>
          </a>
        </li>
        <c:set var = "ud" scope = "session" value = "${userDetail}"/>
        <c:if test = "${ud == 'Admin'}">
        	<li>
	          <a href="transportation?id=${user.id}">
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
    	<c:if test = "${ud != 'Admin'}">
    		<div id="map" style="width:1200px; height:600px"></div>
    	</c:if>
    	<c:if test = "${ud == 'Admin'}">
    		<section>
		    <div class="rt-container">
		          <div class="col-rt-12">
		              <div class="Scriptcontent">
		              
						<!-- Student Profile -->
						<div class="student-profile py-4">
						  <div class="container">
						    <div class="row">
						      <%-- <div class="col-lg-4">
						        <div class="card shadow-sm">
						          <div class="card-header bg-transparent text-center">
						            <img class="profile_img" src="https://source.unsplash.com/600x300/?student" alt="student dp">
						            <h3>${user.fullname}</h3>
						          </div>
						          <div class="card-body">
						            <p class="mb-0"><strong class="pr-1">Student ID:</strong>${userDetails.std_id}</p>
						            <p class="mb-0"><strong class="pr-1">Education Level:</strong>${userDetails.ed_lvl}</p>
						            <p class="mb-0"><strong class="pr-1">Campus:</strong>${userDetails.campus}</p>
						          </div>
						        </div>
						      </div> --%>
						      <div class="col-lg-15">
						        <div class="card shadow-sm">
						          <div class="card-header bg-transparent border-0">
						            <!-- <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Active User List</h3> -->
						          </div>
						          <div class="card-body pt-0">
						            <%-- <table class="table table-bordered">
						              <tr>
						                <th width="30%">Visa type</th>
						                <!-- <td width="2%">:</td> -->
						                <td>${userDetails.visa_type}</td>
						              </tr>
						              <tr>
						                <th width="30%">Sevis Id</th>
						                <!-- <td width="2%">:</td> -->
						                <td>${userDetails.sevis_id}</td>
						              </tr>
						              <tr>
						                <th width="30%">Gender</th>
						                <!-- <td width="2%">:</td> -->
						                <td>${userDetails.gender}</td>
						              </tr>
						              <tr>
						                <th width="30%">Country</th>
						                <!-- <td width="2%">:</td> -->
						                <td>${userDetails.country}</td>
						              </tr>
						              <tr>
						                <th width="30%">Major</th>
						                <!-- <td width="2%">:</td> -->
						                <td>${userDetails.major}</td>
						              </tr>
						            </table> --%>
						            <table id="housinglocationtable" class="table table-bordered">
						            	<thead>
							              <tr>
							              	<th width="30%">Sr. No.</th>
							                <th width="30%">Housing Location Names</th>
							                <th width="30%">Latitude</th>
							                <th width="30%">Longitude</th>
							                
							                <!-- <th width="30%">Edit</th> -->
							                <!-- <th width="30%">Status</th> -->
							              </tr>
						              </thead>
						              
					                    <c:set var="i" scope="session" value="1"/>
					                     <tbody>
							                <c:forEach var="h" items="${housinglist}">
								                <tr>
								                	<td><c:out value = "${i}"/></td>
									                <td><c:out value = "${h.location_name}"/></td>
									                <td><c:out value = "${h.latitude}"/></td>
									                <td><c:out value = "${h.longitude}"/></td>
									                
									                <!-- <td><a href="#"><img src="images/editImage.png" style="width:40px;height:40px;" ></a></td> -->
								                </tr>
								                <c:set var="i" value="${i + 1}" scope="page"/>
						   					</c:forEach>
							              </tbody>
						            
						            </table>
						          </div>
						        </div>
						          <div style="height: 26px"></div>
						        <!-- <div class="card shadow-sm">
						          <div class="card-header bg-transparent border-0">
						            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Other Information</h3>
						          </div>
						          <div class="card-body pt-0">
						              <p>Some Desc...</p>
						          </div>
						        </div> -->
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
