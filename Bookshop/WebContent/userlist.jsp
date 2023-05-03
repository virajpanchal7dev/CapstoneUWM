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
	<link rel='stylesheet' href='https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css'>
    <link rel="stylesheet" href="dashboard.css">
    <link rel="stylesheet" href="profile_one.css">
    <link rel="stylesheet" href="profile_two.css">
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
	    	    $('#usertable').DataTable();
    	 });
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
          <a href="housing">
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
	          <a href="allusers"  class="active">
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
  <input type="hidden" id="id" name="id" value="${user.id}" />
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
		            <table id="usertable" class="table table-bordered">
		            	<thead>
			              <tr>
			              	<th width="30%">Sr. No.</th>
			                <th width="30%">Full Name</th>
			                <th width="30%">Email</th>
			                <th width="30%">Student Id</th>
			                <th width="30%">Education Level</th>
			                <th width="30%">Campus</th>
			                <th width="30%">Visa Type</th>
			                <th width="30%">SEVIS Id</th>
			                <th width="30%">Gender</th>
			                <th width="30%">Country</th>
			                <th width="30%">Major</th>
			                <!-- <th width="30%">Edit</th> -->
			                <!-- <th width="30%">Status</th> -->
			              </tr>
		              </thead>
		              
	                    <c:set var="i" scope="session" value="1"/>
	                     <tbody>
			                <c:forEach var="l" items="${list}">
				                <tr>
				                	<td><c:out value = "${i}"/></td>
					                <td><c:out value = "${l.fullname}"/></td>
					                <td><c:out value = "${l.email}"/></td>
					                <td><c:out value = "${l.std_id}"/></td>
					                <td><c:out value = "${l.ed_lvl}"/></td>
					                <td><c:out value = "${l.campus}"/></td>
					                <td><c:out value = "${l.visa_type}"/></td>
					                <td><c:out value = "${l.sevis_id}"/></td>
					                <td><c:out value = "${l.gender}"/></td>
					                <td><c:out value = "${l.country}"/></td>
					                <td><c:out value = "${l.major}"/></td>
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
    	
    
      <!-- <div class="overview-boxes">
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Housing Request</div>
            <div class="number">40,876</div>
            <div class="indicator">
              <i class='bx bx-up-arrow-alt'></i>
              <span class="text">Up from yesterday</span>
            </div>
          </div>
          <i class='bx bx-cart-alt cart'></i>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Transportation Req</div>
            <div class="number">38,876</div>
            <div class="indicator">
              <i class='bx bx-up-arrow-alt'></i>
              <span class="text">Up from yesterday</span>
            </div>
          </div>
          <i class='bx bxs-cart-add cart two' ></i>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Class Registration</div>
            <div class="number">$12,876</div>
            <div class="indicator">
              <i class='bx bx-up-arrow-alt'></i>
              <span class="text">Up from yesterday</span>
            </div>
          </div>
          <i class='bx bx-cart cart three' ></i>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Ongoing Discussions</div>
            <div class="number">11,086</div>
            <div class="indicator">
              <i class='bx bx-down-arrow-alt down'></i>
              <span class="text">Down From Today</span>
            </div>
          </div>
          <i class='bx bxs-cart-download cart four' ></i>
        </div>
      </div> -->

      <!-- <div class="sales-boxes">
        <div class="recent-sales box">
          <div class="title">Recent Sales</div>
          <div class="sales-details">
            <ul class="details">
              <li class="topic">Date</li>
              <li><a href="#">02 Jan 2021</a></li>
              <li><a href="#">02 Jan 2021</a></li>
              <li><a href="#">02 Jan 2021</a></li>
              <li><a href="#">02 Jan 2021</a></li>
              <li><a href="#">02 Jan 2021</a></li>
              <li><a href="#">02 Jan 2021</a></li>
              <li><a href="#">02 Jan 2021</a></li>
            </ul>
            <ul class="details">
            <li class="topic">Customer</li>
            <li><a href="#">Alex Doe</a></li>
            <li><a href="#">David Mart</a></li>
            <li><a href="#">Roe Parter</a></li>
            <li><a href="#">Diana Penty</a></li>
            <li><a href="#">Martin Paw</a></li>
            <li><a href="#">Doe Alex</a></li>
            <li><a href="#">Aiana Lexa</a></li>
            <li><a href="#">Rexel Mags</a></li>
             <li><a href="#">Tiana Loths</a></li>
          </ul>
          <ul class="details">
            <li class="topic">Sales</li>
            <li><a href="#">Delivered</a></li>
            <li><a href="#">Pending</a></li>
            <li><a href="#">Returned</a></li>
            <li><a href="#">Delivered</a></li>
            <li><a href="#">Pending</a></li>
            <li><a href="#">Returned</a></li>
            <li><a href="#">Delivered</a></li>
             <li><a href="#">Pending</a></li>
            <li><a href="#">Delivered</a></li>
          </ul>
          <ul class="details">
            <li class="topic">Total</li>
            <li><a href="#">$204.98</a></li>
            <li><a href="#">$24.55</a></li>
            <li><a href="#">$25.88</a></li>
            <li><a href="#">$170.66</a></li>
            <li><a href="#">$56.56</a></li>
            <li><a href="#">$44.95</a></li>
            <li><a href="#">$67.33</a></li>
             <li><a href="#">$23.53</a></li>
             <li><a href="#">$46.52</a></li>
          </ul>
          </div>
          <div class="button">
            <a href="#">See All</a>
          </div>
        </div>
        <div class="top-sales box">
          <div class="title">Top Seling Product</div>
          <ul class="top-sales-details">
            <li>
            <a href="#">
              <img src="images/sunglasses.jpg" alt="">
              <span class="product">Vuitton Sunglasses</span>
            </a>
            <span class="price">$1107</span>
          </li>
          <li>
            <a href="#">
              <img src="images/jeans.jpg" alt="">
              <span class="product">Hourglass Jeans </span>
            </a>
            <span class="price">$1567</span>
          </li>
          <li>
            <a href="#">
              <img src="images/nike.jpg" alt="">
              <span class="product">Nike Sport Shoe</span>
            </a>
            <span class="price">$1234</span>
          </li>
          <li>
            <a href="#">
              <img src="images/scarves.jpg" alt="">
              <span class="product">Hermes Silk Scarves.</span>
            </a>
            <span class="price">$2312</span>
          </li>
          <li>
            <a href="#">
              <img src="images/blueBag.jpg" alt="">
              <span class="product">Succi Ladies Bag</span>
            </a>
            <span class="price">$1456</span>
          </li>
          <li>
            <a href="#">
              <img src="images/bag.jpg" alt="">
              <span class="product">Gucci Womens's Bags</span>
            </a>
            <span class="price">$2345</span>
          <li>
            <a href="#">
              <img src="images/addidas.jpg" alt="">
              <span class="product">Addidas Running Shoe</span>
            </a>
            <span class="price">$2345</span>
          </li>
<li>
            <a href="#">
              <img src="images/shirt.jpg" alt="">
              <span class="product">Bilack Wear's Shirt</span>
            </a>
            <span class="price">$1245</span>
          </li>
          </ul>
        </div>
      </div> -->
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
