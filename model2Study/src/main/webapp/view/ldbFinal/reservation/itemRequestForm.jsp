<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>품목 예약 신청</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background-color: #f8f9fa; }
    .container { max-width: 700px; margin-top: 60px; }
  </style>
</head>
<body>
<div class="container bg-white shadow-sm rounded p-5">
  <h4 class="mb-4 fw-bold">품목 예약 신청</h4>

  <form action="itemReservationProc.jsp" method="post">
    <!-- 품목코드 -->
    <div class="mb-3">
      <label class="form-label">품목코드</label>
      <input type="text" class="form-control" name="itemCode" value="P0001" readonly>
    </div>

    <!-- 품목명 -->
    <div class="mb-3">
      <label class="form-label">품목명</label>
      <input type="text" class="form-control" name="itemName" value="노트북" readonly>
    </div>

    <!-- 신청자명 -->
    <div class="mb-3">
      <label for="employeeName" class="form-label">신청자</label>
      <input type="text" class="form-control" id="employeeName" name="employeeName" required placeholder="이름 입력">
    </div>

    <!-- 신청 수량 -->
    <div class="mb-3">
      <label for="quantity" class="form-label">신청 수량 (최대 5개)</label>
      <input type="number" class="form-control" id="quantity" name="quantity" required min="1" max="5" value="1">
    </div>

    <!-- 사용 목적 -->
    <div class="mb-4">
      <label for="purpose" class="form-label">사용 목적</label>
      <textarea id="purpose" name="purpose" class="form-control" rows="4" required placeholder="사용 목적을 입력하세요."></textarea>
    </div>

    <!-- 버튼 -->
    <div class="d-flex justify-content-between">
      <a href="itemCodeList.jsp" class="btn btn-outline-secondary">← 목록</a>
      <button type="submit" class="btn btn-primary">예약 신청</button>
    </div>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
