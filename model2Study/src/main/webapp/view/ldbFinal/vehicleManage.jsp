<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>차량관리 - LDBSOFT 그룹웨어</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background-color: #f4f6f9; }
    .container { max-width: 1000px; margin-top: 40px; }
    .table td, .table th { vertical-align: middle; }
  </style>
</head>
<body>

<div class="container bg-white p-4 shadow rounded">
  <h2 class="mb-4">🚗 차량관리</h2>
  <table class="table table-bordered text-center align-middle">
    <thead class="table-light">
      <tr>
        <th>설비번호</th>
        <th>차종</th>
        <th>차량번호</th>
        <th>색상</th>
        <th>수용인원</th>
        <th>예약</th>
      </tr>
    </thead>
    <tbody>
      <!-- 차량목록 하드코딩 -->
      <tr>
        <td>K0001</td><td>세단</td><td>12가1234</td><td>흰색</td><td>5</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="openModal('K0001', '세단')">예약하기</button></td>
      </tr>
      <tr>
        <td>K0002</td><td>SUV</td><td>34나5678</td><td>검정</td><td>7</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="openModal('K0002', 'SUV')">예약하기</button></td>
      </tr>
      <tr>
        <td>K0003</td><td>승합차</td><td>56다2345</td><td>은색</td><td>9</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="openModal('K0003', '승합차')">예약하기</button></td>
      </tr>
      <tr>
        <td>K0004</td><td>트럭</td><td>78라6789</td><td>파란색</td><td>2</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="openModal('K0004', '트럭')">예약하기</button></td>
      </tr>
      <tr>
        <td>K0005</td><td>전기차</td><td>90마1111</td><td>초록색</td><td>5</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="openModal('K0005', '전기차')">예약하기</button></td>
      </tr>
      <tr>
        <td>K0006</td><td>SUV</td><td>11바2222</td><td>빨간색</td><td>7</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="openModal('K0006', 'SUV')">예약하기</button></td>
      </tr>
      <tr>
        <td>K0007</td><td>세단</td><td>22사3333</td><td>검정</td><td>5</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="openModal('K0007', '세단')">예약하기</button></td>
      </tr>
      <tr>
        <td>K0008</td><td>승합차</td><td>33아4444</td><td>흰색</td><td>9</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="openModal('K0008', '승합차')">예약하기</button></td>
      </tr>
      <tr>
        <td>K0009</td><td>트럭</td><td>44자5555</td><td>노란색</td><td>2</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="openModal('K0009', '트럭')">예약하기</button></td>
      </tr>
      <tr>
        <td>K0010</td><td>전기차</td><td>55차6666</td><td>검정</td><td>5</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="openModal('K0010', '전기차')">예약하기</button></td>
      </tr>
    </tbody>
  </table>
</div>

<!-- 예약 모달 -->
<div class="modal fade" id="reserveModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">차량 예약</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <p id="reserveInfo"></p>
        <label class="form-label">예약 날짜 선택</label>
        <input type="date" class="form-control">
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button class="btn btn-primary" disabled>예약</button> <!-- 기능 없음 -->
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  function openModal(id, model) {
    document.getElementById('reserveInfo').innerText = '차량번호: ' + id + ' / 차종: ' + model;
    const modal = new bootstrap.Modal(document.getElementById('reserveModal'));
    modal.show();
  }
</script>
</body>
</html>
