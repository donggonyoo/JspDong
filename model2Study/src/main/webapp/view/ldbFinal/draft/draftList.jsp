<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>전자결재 - LDBSOFT</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f4f6f9;
}

.container {
	max-width: 1200px;
	margin-top: 40px;
}

.table th, .table td {
	vertical-align: middle;
}
</style>
</head>
<body>

	<div class="container bg-white p-4 shadow rounded">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h2>전자결재</h2>
			<a href="draftForm.jsp" class="btn btn-primary">+ 새 결재문서 작성</a>
		</div>

		<!-- 결재문서 리스트 -->
		<h5 class="mb-3">내 결재문서 목록</h5>

		<table
			class="table table-hover table-bordered text-center align-middle">
			<thead class="table-light">
				<tr>
					<th>문서번호</th>
					<th>제목</th>
					<th>기한</th>
					<th>기안자</th>
					<th>1차 결재</th>
					<th>2차 결재</th>
					<th>상태</th>
					<th>재기안</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<!-- 샘플 데이터: 추후 DB 연동 -->
				<tr>
					<td>A00001</td>
					<td><a href="draftDetail.jsp?id=A00001">휴가신청서(5/1~5/3)</a></td>
					<td>2025-05-01</td>
					<td>동곤</td>
					<td>김부장</td>
					<td>김이사</td>
					<td><span class="badge bg-warning text-dark">기안중</span></td>
					<td><a href="draftForm.jsp?id=A00001"
						class="btn btn-sm btn-outline-secondary">재기안</a></td>
					<td><a href="draftDelete.jsp?id=A00001"
						class="btn btn-sm btn-outline-danger">삭제</a></td>
				</tr>
				<tr>
					<td>A00002</td>
					<td><a href="draftDetail.jsp?id=A00002">지출결의서(회의비)</a></td>
					<td>2025-05-10</td>
					<td>동곤</td>
					<td>박부장</td>
					<td>대표</td>
					<td><span class="badge bg-success">결재 완료</span></td>
					<td>-</td>
					<td>-</td>
				</tr>
			</tbody>
		</table>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
