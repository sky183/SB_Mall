<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						20,000,000,000
					</span>
					<span class="footer">원</span>
				</div>
				<br>
				<!-- 연 버젯 % -->
				<div>
					<span class="title">Year Rate</span>
					<span id="yearBudgetPer" class="result">
						32
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
						2000000000
					</span>
					<span class="footer">원</span>
				</div>
				<br>
				<!-- 월 버젯 달성율 -->
				<div>
					<span class="title">Month Rate</span>
					<span id="monthBudgetPer" class="result">
						12
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
					<span id="yearSales" class="result">20,000,000,000</span>
					<span class="footer">원</span>
				</div>
				<!-- 월매출 -->
				<div>
					<span class="title">월매출</span>
					<span id="monthSales" class="result">20,000,000</span>
					<span class="footer">원</span>
				</div>
				<!-- 일매출 -->
				<div>
					<span class="title">일매출</span>
					<span id="dailySales" class="result">20,000,000</span>
					<span class="footer">원</span>
				</div>
				<!-- 월평균 -->
				<div>
					<span class="title">월평균</span>
					<span id="monthAverage" class="result">20,000,000</span>
					<span class="footer">원</span>
				</div>
				<!-- PPA -->
				<div>
					<span class="title">PPA</span>
					<span id="PPA" class="result">20,000,000</span>
					<span class="footer">원</span>
				</div>
				<!-- 방문수 -->
				<div>
					<span class="title">방문수</span>
					<span id="totalVisit" class="result">20,000,000</span>
					<span class="footer">건</span>
				</div>
				<!-- 신규 회원수 -->
				<div>
					<span class="title">신규 가입자</span>
					<span id="totalMember" class="result">20,000,000</span>
					<span class="footer">명</span>
				</div>
				
			<!-- leftSalesReport의 끝 -->
			</div>
			
			<!-- TCE TCI OC 등 -->
			<div id="rightSalesReport" class="cel">
				<!-- TCE -->
				<div class="bottom5">
					<span class="title">TCE</span>
					<span id="TCE" class="result">20,000,000</span>
					<span class="footer">원</span>
				</div>
				<!-- TCE - cost -->
				<div class="sub">
					<span class="subTitle">cost</span>
					<span id="cost" class="result">20,000,000</span>
					<span class="footer">%</span>
				</div>
				<!-- TCE - 인건비 -->
				<div class="sub">
					<span class="subTitle">인건비</span>
					<span id=labor class="result">20,000,000</span>
					<span class="footer">%</span>
				</div>
				<!-- TCE - 유틸리티 -->
				<div class="sub">
					<span class="subTitle">유틸리티</span>
					<span id="utility" class="result">20,000,000</span>
					<span class="footer">%</span>
				</div>
				<!-- TCE - 소모품비 -->
				<div class="sub bottom15">
					<span class="subTitle">소모품비</span>
					<span id="supplies" class="result">20,000,000</span>
					<span class="footer">%</span>
				</div>
				<!-- TCI -->
				<div>
					<span class="title">TCI</span>
					<span id=TCI class="result">20,000,000</span>
					<span class="footer">%</span>
				</div>
				<!-- TNI -->
				<div class="bottom5">
					<span class="title">TNI</span>
					<span id="TNI" class="result">20,000,000</span>
					<span class="footer">%</span>
				</div>
				<!-- TNI - 임대료 -->
				<div class="sub bottom15">
					<span class="subTitle">임대료</span>
					<span id="rent" class="result">20,000,000</span>
					<span class="footer">원</span>
				</div>
				<!-- Operating Cashflow -->
				<div>
					<span class="title">Operating Cashflow</span>
					<span id="OC" class="result">20,000,000</span>
					<span class="footer">%</span>
				</div>

			<!-- rightSalesReport의 끝 -->
			</div>
			
		<!-- salesReport의 끝 -->
		</div>
		
	<!-- mainBottom의 끝 -->
	</div>