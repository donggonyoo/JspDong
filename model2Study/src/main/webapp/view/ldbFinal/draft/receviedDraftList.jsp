<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>받은 전자결재 - LDBSOFT</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
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
      <h2>받은 전자결재</h2>
      <span class="text-muted">결재자: <strong>김대리</strong></span>
    </div>

    <table class="table table-hover table-bordered text-center align-middle">
      <thead class="table-light">
        <tr>
          <th>문서번호</th>
          <th>제목</th>
          <th>기한</th>
          <th>기안자</th>
          <th>1차 결재자</th>
          <th>2차 결재자</th>
          <th>상태</th>
          <th>상세보기</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>A00001</td>
          <td><a href="draftManagement.jsp?id=A00001">휴가신청서(5/1~5/3)</a></td>
          <td>2025-05-01</td>
          <td>동곤</td>
          <td>김대리</td>
          <td>이과장</td>
          <td><span class="badge bg-warning text-dark">기안중</span></td>
          <td><a href="draftManagement.jsp?id=A00001" class="btn btn-sm btn-outline-primary">보기</a></td>
        </tr>
        <tr>
          <td>A00002</td>
          <td><a href="draftManagement.jsp?id=A00002">지출결의서(회의비)</a></td>
          <td>2025-05-02</td>
          <td>동곤</td>
          <td>김대리</td>
          <td>이과장</td>
          <td><span class="badge bg-success">결재 완료</span></td>
          <td><a href="draftManagement.jsp?id=A00002" class="btn btn-sm btn-outline-primary">보기</a></td>
        </tr>
        <tr>
          <td>A00003</td>
          <td><a href="draftManagement.jsp?id=A00003">출장신청서(부산)</a></td>
          <td>2025-05-03</td>
          <td>동곤</td>
          <td>김대리</td>
          <td>이과장</td>
          <td><span class="badge bg-warning text-dark">기안중</span></td>
          <td><a href="draftManagement.jsp?id=A00003" class="btn btn-sm btn-outline-primary">보기</a></td>
        </tr>
        <tr>
          <td>A00004</td>
          <td><a href="draftManagement.jsp?id=A00004">연차신청서(5/10)</a></td>
          <td>2025-05-04</td>
          <td>동곤</td>
          <td>김대리</td>
          <td>이과장</td>
          <td><span class="badge bg-warning text-dark">기안중</span></td>
          <td><a href="draftManagement.jsp?id=A00004" class="btn btn-sm btn-outline-primary">보기</a></td>
        </tr>
        <tr>
          <td>A00005</td>
          <td><a href="draftManagement.jsp?id=A00005">경조사비 신청</a></td>
          <td>2025-05-05</td>
          <td>동곤</td>
          <td>김대리</td>
          <td>이과장</td>
          <td><span class="badge bg-success">결재 완료</span></td>
          <td><a href="draftManagement.jsp?id=A00005" class="btn btn-sm btn-outline-primary">보기</a></td>
        </tr>
      </tbody>
    </table>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

