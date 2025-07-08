<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>회의실 관리 - LDBSOFT 그룹웨어</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    body { background-color: #f4f6f9; }
    .container { max-width: 1000px; margin-top: 40px; }
    .table td, .table th { vertical-align: middle; }
  </style>
</head>
<body>

<div class="container bg-white p-4 shadow rounded">
  <h2 class="mb-4">🏢 회의실 관리</h2>
  <table class="table table-bordered text-center align-middle">
    <thead class="table-light">
      <tr>
        <th>설비번호</th>
        <th>이름</th>
        <th>수용인원</th>
        <th>예약</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>R0001</td><td>중회의실 1</td><td>10</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="openReserveModal('R0001', '중회의실 1')">예약하기</button></td>
      </tr>
      <tr>
        <td>R0002</td><td>대회의실</td><td>20</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="openReserveModal('R0002', '대회의실')">예약하기</button></td>
      </tr>
      <tr>
        <td>R0003</td><td>소회의실 A</td><td>6</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="openReserveModal('R0003', '소회의실 A')">예약하기</button></td>
      </tr>
      <tr>
        <td>R0004</td><td>소회의실 B</td><td>8</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="openReserveModal('R0004', '소회의실 B')">예약하기</button></td>
      </tr>
      <tr>
        <td>R0005</td><td>프로젝트룸</td><td>12</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="openReserveModal('R0005', '프로젝트룸')">예약하기</button></td>
      </tr>
    </tbody>
  </table>
</div>

<!-- 회의실 예약 모달 -->
<div class="modal fade" id="reserveModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">회의실 예약</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <p id="reserveInfo" class="fw-bold"></p>
        <div class="mb-3">
          <label class="form-label">예약 날짜</label>
          <input type="date" class="form-control">
        </div>
        <div class="mb-3">
          <label class="form-label">시간 선택 (2시간 단위)</label>
          <select class="form-select">
            <option>09:00 ~ 11:00</option>
            <option>11:00 ~ 13:00</option>
            <option>13:00 ~ 15:00</option>
            <option>15:00 ~ 17:00</option>
            <option>17:00 ~ 19:00</option>
          </select>
        </div>
        <div class="mb-3">
          <label class="form-label">참여자</label>
          <div class="input-group">
            <input type="text" id="participantInput" class="form-control" readonly placeholder="선택된 사원 이름(직급)이 표시됩니다" />
            <button class="btn btn-outline-secondary" type="button" onclick="openParticipantModal()">참여자 선택</button>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button class="btn btn-primary" disabled>예약</button>
      </div>
    </div>
  </div>
</div>

<!-- 참여자 선택 모달 -->
<div class="modal fade" id="participantModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">사원 목록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <table class="table table-sm table-hover">
          <thead>
            <tr><th></th><th>이름</th><th>직급</th><th>이메일</th></tr>
          </thead>
          <tbody>
            <tr>
              <td><input type="checkbox" class="emp-check" value="김이사(이사)" /></td>
              <td>김이사</td><td>이사</td><td>kim@ldbsoft.co.kr</td>
            </tr>
            <tr>
              <td><input type="checkbox" class="emp-check" value="박부장(부장)" /></td>
              <td>박부장</td><td>부장</td><td>park@ldbsoft.co.kr</td>
            </tr>
            <tr>
              <td><input type="checkbox" class="emp-check" value="이대리(대리)" /></td>
              <td>이대리</td><td>대리</td><td>lee@ldbsoft.co.kr</td>
            </tr>
            <tr>
              <td><input type="checkbox" class="emp-check" value="홍과장(과장)" /></td>
              <td>홍과장</td><td>과장</td><td>hong@ldbsoft.co.kr</td>
            </tr>
            <tr>
              <td><input type="checkbox" class="emp-check" value="최사원(사원)" /></td>
              <td>최사원</td><td>사원</td><td>choi@ldbsoft.co.kr</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button class="btn btn-primary" onclick="applyParticipants()">선택 완료</button>
      </div>
    </div>
  </div>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  function openReserveModal(roomId, roomName) {
    document.getElementById('reserveInfo').innerText = '회의실: ' + roomName + ' (' + roomId + ')';
    document.getElementById('participantInput').value = '';
    document.querySelectorAll('.emp-check').forEach(cb => cb.checked = false);
    const modal = new bootstrap.Modal(document.getElementById('reserveModal'));
    modal.show();
  }

  function openParticipantModal() {
    const modal = new bootstrap.Modal(document.getElementById('participantModal'));
    modal.show();
  }

  function applyParticipants() {
    const checked = document.querySelectorAll('.emp-check:checked');
    const names = Array.from(checked).map(cb => cb.value);  // ex: "김이사(이사)"
    document.getElementById('participantInput').value = names.join(', ');
    bootstrap.Modal.getInstance(document.getElementById('participantModal')).hide();
  }
</script>
</body>
</html>
