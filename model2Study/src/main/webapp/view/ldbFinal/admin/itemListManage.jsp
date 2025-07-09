<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>품목 코드 관리</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .container {
      max-width: 960px;
      margin-top: 50px;
    }
    .table th, .table td {
      vertical-align: middle;
      text-align: center;
    }
  </style>
</head>
<body>
<div class="container">
  <h3 class="mb-4 fw-bold">품목 코드 관리</h3>

  <!-- 검색 및 필터 폼 -->
  <form class="row g-2 mb-3" method="get">
    <div class="col-md-5">
      <input type="text" class="form-control" name="keyword" placeholder="품목명 검색 (예: 노트북)">
    </div>
    <div class="col-md-3">
      <select name="used" class="form-select">
        <option value="">수량 필터 전체</option>
        <option value="more">1개 이상</option>
        <option value="none">0개</option>
      </select>
    </div>
    <div class="col-md-2">
      <button type="submit" class="btn btn-outline-primary w-100">검색</button>
    </div>
    <div class="col-md-2 text-end">
      <a href="itemCodeWrite.jsp" class="btn btn-success w-100">+ 등록</a>
    </div>
  </form>

  <!-- 품목 리스트 -->
  <table class="table table-bordered table-hover bg-white">
    <thead class="table-light">
      <tr>
        <th style="width: 20%">품목코드</th>
        <th style="width: 40%">품목명</th>
        <th style="width: 20%">남은 수량</th>
        <th style="width: 20%">관리</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>P0001</td>
        <td>노트북</td>
        <td>7</td>
        <td>
          <button class="btn btn-sm btn-outline-danger">삭제</button>
        </td>
      </tr>
      <tr>
        <td>P0002</td>
        <td>모니터</td>
        <td>3</td>
        <td>
          <button class="btn btn-sm btn-outline-danger">삭제</button>
        </td>
      </tr>
      <tr>
        <td>P0003</td>
        <td>마우스</td>
        <td>0</td>
        <td>
          <button class="btn btn-sm btn-outline-danger">삭제</button>
        </td>
      </tr>
    </tbody>
  </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
