
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container main-container">

  		<div class="col-md-3 sidebar1">
  			<div class="row">
				<!-- uncomment code for absolute positioning tweek see top comment in css -->
				<div class="absolute-wrapper"> </div>
				<!-- Menu -->
				<div class="side-menu">
					<nav class="navbar navbar-default" role="navigation">
						<!-- Main Menu -->
						<div class="side-menu-container">
							<ul class="nav navbar-nav">
							
						
								<!-- --------------------test------------------ -->
								<c:if test="${withOutSession==1}">
									<c:forEach items="${screenPermission}" var="menuMap">
										<c:if test="${menuMap.key == 'NoSubMenu'}">
											<c:forEach items="${menuMap.value}" var="subMenu">
												<li class=""><a  class=""
													href="${pageContext.request.contextPath}${subMenu.url}"><i
														class="fa ${subMenu.cls}"></i> <span>${subMenu.screenName}</span></a></li>
											</c:forEach>
										</c:if>
											<c:if test="${menuMap.key != 'NoSubMenu'}">
						<li  class="dropdown"><a href="#" class="loginDropDown" data-toggle="dropdown"> 
										<span>${menuMap.key}</span>
										<i class="fa fa-caret-down"></i>					
						</a>
							<ul  class="dropdown-menu multi-column mystyle">
							<div class="col-sm-12">
							<ul class="multi-column-dropdown">
								<c:forEach items="${menuMap.value}" var="subMenu">
									<li><a
										href="${pageContext.request.contextPath}${subMenu.url}" style="width:200px"><i
											class="fa ${subMenu.cls}"></i> <span>${subMenu.screenName}</span></a>
									</li>
								</c:forEach>
								</ul>
								</div>
								
							</ul></li>
					</c:if>
						
									</c:forEach>
								</c:if>
							
									
									
									
			
							</ul>
						</div><!-- /.navbar-collapse -->
					</nav>
			
				</div>
			</div>  		
		</div></div>