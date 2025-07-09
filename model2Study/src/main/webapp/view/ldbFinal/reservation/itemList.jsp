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
    tbody tr {
      transition: background-color 0.2s;
    }
    tbody tr:hover {
      cursor: pointer;
      background-color: #e7f1ff;
    }
    .search-form .form-control,
    .search-form .form-select {
      height: 100%;
    }
    .search-form .form-label {
      font-weight: 500;
    }
    .search-form {
      margin-bottom: 40px;
    }
  </style>
</head>
<body>
<div class="container">
  <h3 class="mb-4 fw-bold">품목 코드 리스트</h3>

  <!-- 검색 및 필터 폼 -->
  <form class="row align-items-end g-3 search-form" method="get">
    <div class="col-md-6">
      <label for="keyword" class="form-label">품목명</label>
      <input type="text" id="keyword" class="form-control" name="keyword" placeholder="예: 노트북">
    </div>
    <div class="col-md-3">
      <label for="used" class="form-label">재고 수량 필터</label>
      <select name="used" id="used" class="form-select">
        <option value="">전체</option>
        <option value=">0">0개 이상</option>
        <option value="0">0개 이하</option>
      </select>
    </div>
    <div class="col-md-3">
      <label class="form-label d-block">&nbsp;</label>
      <button type="submit" class="btn btn-outline-primary w-100">검색</button>
    </div>
  </form>

  <!-- 품목 리스트 -->
  <table class="table table-bordered table-hover bg-white">
    <thead class="table-light">
      <tr>
        <th style="width: 20%">품목코드</th>
        <th style="width: 40%">품목명</th>
        <th style="width: 20%">남은 수량</th>
        <th style="width: 20%">예약</th>
      </tr>
    </thead>
    <tbody>
      <tr onclick="showDetail('P0001', '노트북', '업무용 고사양 노트북입니다.', 30, 12)">
        <td>P0001</td>
        <td class="text-primary fw-semibold">노트북</td>
        <td>12</td>
        <td><a href="itemRequestForm.jsp?code=P0001" class="btn btn-sm btn-primary">예약</a></td>
      </tr>
      <tr onclick="showDetail('P0002', '모니터', '27인치 Full HD 모니터입니다.', 20, 8)">
        <td>P0002</td>
        <td class="text-primary fw-semibold">모니터</td>
        <td>8</td>
        <td><a href="itemRequestForm.jsp?code=P0002" class="btn btn-sm btn-primary">예약</a></td>
      </tr>
      <tr onclick="showDetail('P0003', '마우스', '무선 블루투스 마우스입니다.', 10, 0)">
        <td>P0003</td>
        <td class="text-primary fw-semibold">마우스</td>
        <td>0</td>
        <td>-</td>
      </tr>
    </tbody>
  </table>
</div>

<!-- 품목 상세 모달 -->
<div class="modal fade" id="itemDetailModal" tabindex="-1" aria-labelledby="itemDetailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="itemDetailModalLabel">품목 상세 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <ul class="list-group">
          <li class="list-group-item"><strong>품목코드:</strong> <span id="modalItemCode"></span></li>
          <li class="list-group-item"><strong>품목명:</strong> <span id="modalItemName"></span></li>
          <li class="list-group-item"><strong>상세정보:</strong> <span id="modalItemDesc"></span></li>
          <li class="list-group-item"><strong>총 수량:</strong> <span id="modalTotalQty"></span></li>
          <li class="list-group-item"><strong>예약 가능 수량:</strong> <span id="modalAvailableQty"></span></li>
        </ul>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  function showDetail(code, name, desc, totalQty, availableQty) {
    document.getElementById("modalItemCode").innerText = code;
    document.getElementById("modalItemName").innerText = name;
    document.getElementById("modalItemDesc").innerText = desc;
    document.getElementById("modalTotalQty").innerText = totalQty;
    document.getElementById("modalAvailableQty").innerText = availableQty;
    const modal = new bootstrap.Modal(document.getElementById("itemDetailModal"));
    modal.show();
  }
</script>
</body>
</html>
