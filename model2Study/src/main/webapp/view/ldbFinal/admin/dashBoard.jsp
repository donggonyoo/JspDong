<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>연차 사용률 대시보드</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    body { background-color: #f4f6f9; }
    .container { max-width: 1200px; margin-top: 40px; }
    .filter-box { background-color: #fff; padding: 20px; border-radius: 10px; margin-bottom: 20px; }
    .table thead th { background-color: #f1f3f5; }
  </style>
</head>
<body>
<div class="container">
  <h3 class="mb-4 fw-bold">📊 연차 사용률 대시보드</h3>

  <!-- 필터 영역 -->
  <div class="filter-box shadow-sm">
    <form class="row g-3">
      <div class="col-md-3">
        <label class="form-label">연도</label>
        <select class="form-select">
          <option selected>2025</option>
          <option>2024</option>
        </select>
      </div>
      <div class="col-md-3">
        <label class="form-label">분기</label>
        <select class="form-select">
          <option selected>전체</option>
          <option>1분기</option>
          <option>2분기</option>
          <option>3분기</option>
          <option>4분기</option>
        </select>
      </div>
      <div class="col-md-3">
        <label class="form-label">부서</label>
        <select class="form-select">
          <option selected>전체</option>
          <option>개발팀</option>
          <option>디자인팀</option>
          <option>총무팀</option>
        </select>
      </div>
      <div class="col-md-3">
        <label class="form-label">직급</label>
        <select class="form-select">
          <option selected>전체</option>
          <option>사원</option>
          <option>주임</option>
          <option>대리</option>
          <option>과장</option>
        </select>
      </div>
    </form>
  </div>

  <!-- 차트 -->
  <div class="card p-4 mb-4">
    <canvas id="leaveChart" height="100"></canvas>
  </div>

  <!-- 테이블 -->
  <div class="card p-4">
    <div class="d-flex justify-content-between mb-3">
      <h5 class="fw-bold">부서별 직원 연차 현황</h5>
      <button class="btn btn-sm btn-outline-success">엑셀 다운로드</button>
    </div>
    <table class="table table-bordered text-center">
      <thead>
        <tr>
          <th>부서</th>
          <th>이름</th>
          <th>직급</th>
          <th>총 연차</th>
          <th>사용 연차</th>
          <th>잔여 연차</th>
          <th>사용률(%)</th>
        </tr>
      </thead>
      <tbody>
        <tr><td>개발팀</td><td>김동곤</td><td>대리</td><td>15</td><td>5</td><td>10</td><td>33%</td></tr>
        <tr><td>디자인팀</td><td>최윤아</td><td>주임</td><td>15</td><td>9</td><td>6</td><td>60%</td></tr>
        <tr><td>총무팀</td><td>박지성</td><td>사원</td><td>15</td><td>12</td><td>3</td><td>80%</td></tr>
        <tr><td>개발팀</td><td>정호준</td><td>팀장</td><td>20</td><td>10</td><td>10</td><td>50%</td></tr>
        <tr><td>디자인팀</td><td>이정은</td><td>과장</td><td>15</td><td>2</td><td>13</td><td>13%</td></tr>
      </tbody>
    </table>
  </div>
</div>

<script>
  const ctx = document.getElementById('leaveChart').getContext('2d');
  const leaveChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['개발팀', '디자인팀', '총무팀'],
      datasets: [
        {
          label: '사용 연차',
          data: [15, 11, 12], // 개발팀: 5+10, 디자인팀: 9+2, 총무팀: 12
          backgroundColor: 'rgba(54, 162, 235, 0.7)'
        },
        {
          label: '잔여 연차',
          data: [20, 19, 3], // 개발팀: 10+10, 디자인팀: 6+13, 총무팀: 3
          backgroundColor: 'rgba(255, 99, 132, 0.7)'
        }
      ]
    },
    options: {
      responsive: true,
      scales: {
        y: { beginAtZero: true }
      }
    }
  });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
