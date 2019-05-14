<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${param.menu == 'manage' or param.menu == 'search'}">
	<c:choose>				
		<c:when test="${!empty search.searchCondition && !empty search.searchKeyword }">
			
			<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
					◀ 이전
			</c:if>
			
			<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
					<a href="/product/listProduct.do?currentPage=${ resultPage.beginUnitPage-1}&menu=${param.menu}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}">◀ 이전</a>
			</c:if>
			
			<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
				<a href="/product/listProduct.do?currentPage=${ i }&menu=${param.menu}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}">${ i }</a>
			</c:forEach>
			
			<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
					이후 ▶
			</c:if>
			
			<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
							<a href="/product/listProduct.do?currentPage=${resultPage.endUnitPage+1}&menu=${param.menu}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}">이후 ▶</a>
			</c:if>
			
		</c:when>
		<c:otherwise>
		
			<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
					◀ 이전
			</c:if>
			
			<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
					<a href="/product/listProduct.do?currentPage=${ resultPage.beginUnitPage-1}&menu=${param.menu}">◀ 이전</a>
			</c:if>
			
			<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
				<a href="/product/listProduct.do?currentPage=${ i }&menu=${param.menu}">${ i }</a>
			</c:forEach>
			
			<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
					이후 ▶
			</c:if>
			
			<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
							<a href="/product/listProduct.do?currentPage=${resultPage.endUnitPage+1}&menu=${param.menu}">이후 ▶</a>
			</c:if>
			
		</c:otherwise>
	</c:choose>
</c:if>	

<%-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --%>

<c:if test="${param.userId == sessionScope.user.userId}">

	<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
				◀ 이전
	</c:if>
	
	<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
		<a href="/purchase/listPurchase.do?userId=${sessionScope.user.userId}&currentPage=${ resultPage.beginUnitPage-1}">◀ 이전</a>
	</c:if>
	
	<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
		<a href="/purchase/listPurchase.do?userId=${sessionScope.user.userId}&currentPage=${ i }">${ i }</a>
	</c:forEach>
	
	<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
				이후 ▶
	</c:if>
	
	<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
		<a href="/purchase/listPurchase.do?userId=${sessionScope.user.userId}&currentPage=${resultPage.endUnitPage+1}">이후 ▶</a>
	</c:if>
</c:if>

<%-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --%>

<c:if test="${sessionScope.user.userId == 'admin' and empty param.menu}">
	
	<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
				◀ 이전
	</c:if>
	
	<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
		<a href="javascript:fncGetUserList('${ resultPage.beginUnitPage-1}')">◀ 이전</a>
	</c:if>
	
	<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
		<a href="javascript:fncGetUserList('${ i }');">${ i }</a>
	</c:forEach>
	
	<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
				이후 ▶
	</c:if>
	
	<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
		<a href="javascript:fncGetUserList('${resultPage.endUnitPage+1}')">이후 ▶</a>
	</c:if>


</c:if>