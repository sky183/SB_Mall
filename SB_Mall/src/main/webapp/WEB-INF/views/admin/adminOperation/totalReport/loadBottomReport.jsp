<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<!-- 중단 -->
	<div id="mainMid">
		<!-- 버젯 리포트 -->
		<div id="budgetReport" class="tab back3">
			<!-- 연간 버젯 및 달성율 -->
			<div id="yearBudgetReport" class="cel">
				<!-- 연 버젯 -->
				<div>
					<span class="title">Year Budget</span>
					<span id="yearBudget" class="result">
						<fmt:formatNumber value="${totalReportVo.yearBudget}" pattern="#,###"/>
					</span>
					<span class="footer">원</span>
				</div>
				<br>
				<!-- 연 버젯 % -->
				<div>
					<span class="title">Year Rate</span>
					<span id="yearBudgetPer" class="result">
						<fmt:formatNumber value="${totalReportVo.yearBudgetRate}" pattern="#,###"/>
					</span>
					<span class="footer">%</span>
				</div>
				
			</div>
			
			<!-- 월 버젯 및 달성율 -->
			<div id="monthBudgetReport" class="cel">
				<!-- 월 버젯 -->
				<div>
					<span class="title">Month Budget</span>
					<span id="monthBudget" class="result">
						<fmt:formatNumber value="${totalReportVo.monthBudget}" pattern="#,###"/>
					</span>
					<span class="footer">원</span>
				</div>
				<br>
				<!-- 월 버젯 달성율 -->
				<div>
					<span class="title">Month Rate</span>
					<span id="monthBudgetPer" class="result">
						<fmt:formatNumber value="${totalReportVo.monthBudgetRate}" pattern="#,###"/>
					</span>
					<span class="footer">%</span>
				</div>
				
			</div>
			
		<!-- budgetReport의 끝 -->
		</div>
		
	<!-- mainMid의 끝 -->
	</div>
	
	<!-- 하단 -->
	<div id="mainBottom">
		<!-- 세일즈 리포트 -->
		<div id="salesReport" class="tab">
			
			<!-- 매출 평균 방문수 회원수 PPA -->
			<div id="leftSalesReport" class="cel">
				<!-- 연매출 -->
				<div>
					<span class="title">연매출</span>
					<span id="yearAmount" class="result">
						<fmt:formatNumber value="${totalReportVo.yearAmount}" pattern="#,###"/>
					</span>
					<span class="footer">원</span>
				</div>
				<!-- 월매출 -->
				<div>
					<span class="title">월매출</span>
					<span id="monthAmount" class="result">
						<fmt:formatNumber value="${totalReportVo.monthAmount}" pattern="#,###"/>
					</span>
					<span class="footer">원</span>
				</div>
				<!-- 일매출 -->
				<div>
					<span class="title">일매출</span>
					<span id="dailySales" class="result">
						<fmt:formatNumber value="${totalReportVo.dailySales}" pattern="#,###"/>
					</span>
					<span class="footer">원</span>
				</div>
				<!-- 월평균 -->
				<div>
					<span class="title">월평균</span>
					<span id="monthAvg" class="result">
						<fmt:formatNumber value="${totalReportVo.monthAvg}" pattern="#,###"/>
					</span>
					<span class="footer">원</span>
				</div>
				<!-- PPA -->
				<div>
					<span class="title">PPA</span>
					<span id="ppa" class="result">
						<fmt:formatNumber value="${totalReportVo.ppa}" pattern="#,###"/>
					</span>
					<span class="footer">원</span>
				</div>
				<!-- 방문수 -->
				<div>
					<span class="title">방문수</span>
					<span id="visitCount" class="result">
						<fmt:formatNumber value="${totalReportVo.visitCount}" pattern="#,###"/>
					</span>
					<span class="footer">건</span>
				</div>
				<!-- 신규 회원수 -->
				<div>
					<span class="title">신규 가입자</span>
					<span id="newMember" class="result">
						<fmt:formatNumber value="${totalReportVo.newMember}" pattern="#,###"/>
					</span>
					<span class="footer">명</span>
				</div>
				
			<!-- leftSalesReport의 끝 -->
			</div>
			
			<!-- TCE TCI OC 등 -->
			<div id="rightSalesReport" class="cel">
				<!-- TCE -->
				<div class="bottom5">
					<span class="title">TCE</span>
					<span id="tce" class="result">
						<fmt:formatNumber value="${totalReportVo.tce}" pattern="#,###"/>
					</span>
					<span class="footer">원</span>
				</div>
				<!-- TCE - cost -->
				<div class="sub">
					<span class="subTitle">cost</span>
					<span id="monthCostRate" class="result">
						<fmt:formatNumber value="${totalReportVo.monthCostRate}" pattern="#,###"/>
					</span>
					<span class="footer">%</span>
				</div>
				<!-- TCE - 인건비 -->
				<div class="sub">
					<span class="subTitle">인건비</span>
					<span id=laborCostRate class="result">
						<fmt:formatNumber value="${totalReportVo.laborCostRate}" pattern="#,###"/>
					</span>
					<span class="footer">%</span>
				</div>
				<!-- TCE - 유틸리티 -->
				<div class="sub">
					<span class="subTitle">유틸리티</span>
					<span id="utilityRate" class="result">
						<fmt:formatNumber value="${totalReportVo.utilityRate}" pattern="#,###"/>
					</span>
					<span class="footer">%</span>
				</div>
				<!-- TCE - 소모품비 -->
				<div class="sub bottom15">
					<span class="subTitle">소모품비</span>
					<span id="supplieRate" class="result">
						<fmt:formatNumber value="${totalReportVo.supplieRate}" pattern="#,###"/>
					</span>
					<span class="footer">%</span>
				</div>
				<!-- TNC -->
				<div class="bottom5">
					<span class="title">TNC</span>
					<span id="tnc" class="result">
						<fmt:formatNumber value="${totalReportVo.tnc}" pattern="#,###"/>
					</span>
					<span class="footer">%</span>
				</div>
				<!-- TNI - 임대료 -->
				<div class="sub bottom15">
					<span class="subTitle">임대료</span>
					<span id="rent" class="result">
						<fmt:formatNumber value="${totalReportVo.rent}" pattern="#,###"/>
					</span>
					<span class="footer">원</span>
				</div>
				<!-- TCI -->
				<div>
					<span class="title">TCI</span>
					<span id=tci class="result">
						<fmt:formatNumber value="${totalReportVo.tci}" pattern="#,###"/>
					</span>
					<span class="footer">%</span>
				</div>
				<!-- Operating Cashflow -->
				<div>
					<span class="title">Operating Cashflow</span>
					<span id="operatingCashflow" class="result">
						<fmt:formatNumber value="${totalReportVo.operatingCashflow}" pattern="#,###"/>
					</span>
					<span class="footer">%</span>
				</div>

			<!-- rightSalesReport의 끝 -->
			</div>
			
		<!-- salesReport의 끝 -->
		</div>
		
	<!-- mainBottom의 끝 -->
	</div>
	