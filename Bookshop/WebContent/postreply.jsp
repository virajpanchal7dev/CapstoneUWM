<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<!-- Designined by CodingLab | www.youtube.com/codinglabyt -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> UWM - ISSS </title>
    
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>
	
    <link rel="stylesheet" href="dashboard.css">
    <link rel="stylesheet" href="profile_one.css">
    <link rel="stylesheet" href="profile_two.css">
    <link rel="stylesheet" href="discussion.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
     <script type="text/javascript" src="discussion.js"></script>  
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
          <a href="discussioncorner"  class="active">
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
		            
					<table class="table table-bordered">
					  
		              <tr>
		              	<th>Name</th>
		              	<td>:</td>
		              	<td>${postdetail.fullname}</td>
		              	<th>Category</th>
		              	<td>:</td>
		              	<td>${postdetail.category}</td>
		              </tr>
		              <tr>
		              	<th>Description</th>
		              	<td>:</td>
		              	<td colspan="4">${postdetail.description}</td>
		              </tr>

		            </table>
		          </div>
		          <div class="card-body">
		          <form id="replies" action="replytopost" method="post">
		          	  <input type="hidden" id="id" name="id" value="${user.id}" />
					  <input type="hidden" id="pid" name="pid" value="${postdetail.pid}" />
			          <table class="table table-bordered">
			              <tr>
			              	<th>Reply</th>
			              	<td>:</td>
			              	<td><textarea id="reply" name="reply" rows="2" cols="70" maxlength="500" required="required"></textarea></td>
			              	
			              </tr>
			              <tr>
		            		<td colspan="3">
			            		<input type="submit" id="reply" value="Reply"/>
			            		<input type="button" id="back" onclick="backreply()" value="Back"/>
		            		</td>
		            	  </tr>
	
			            </table>
		          </form> 	
		          
		          </div>
		          <div class="card-body">
		          	<table class="table table-bordered">
		              <tr>
		                <th>Name</th>
		                <th>Reply Description</th>
		              </tr>
		              
		              <c:set var = "rList" scope = "session" value = "${postAllReply}"/>
		              <c:if test = "${rList == 'null'}">
		                  <tr>
			                	<td colspan="2">Be the first one to answer the query</td>
			              </tr>
		              </c:if>
		              <c:if test = "${rList != 'null'}">
		                  
	                    
		                <c:forEach var="r" items="${postAllReply}">
			                <tr> 
			                	<td><c:out value = "${r.fullname}"/></td>
				                <td><c:out value = "${r.reply}"/></td> 
			                </tr>
			                
	   					</c:forEach>
			          </c:if>  
		            
		            </table>
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
