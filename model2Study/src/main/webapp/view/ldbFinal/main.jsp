<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>LDBSOFT 그룹웨어 메인</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f4f6f9;
    }
    .navbar-brand {
      font-weight: bold;
      color: #0d6efd !important;
    }
    .sidebar {
      height: 100vh;
      background-color: #fff;
      border-right: 1px solid #dee2e6;
      padding-top: 20px;
    }
    .tab-content {
      padding: 20px;
    }
    .nav-pills .nav-link.active {
      background-color: #0d6efd;
    }
  </style>
</head>
<body>

<!-- 상단 네비게이션 -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">LDBSOFT Groupware</a>
    <div class="d-flex">
      <!-- 알림 아이콘 -->
      <div class="dropdown me-3">
        <a class="btn position-relative" href="#" role="button" id="notificationDropdown" data-bs-toggle="dropdown" aria-expanded="false">
          🔔
          <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
            3
            <span class="visually-hidden">unread messages</span>
          </span>
        </a>
        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="notificationDropdown">
          <li><a class="dropdown-item" href="#">[공지] 서버 점검 안내</a></li>
          <li><a class="dropdown-item" href="#">결재 요청이 있습니다</a></li>
          <li><a class="dropdown-item" href="#">새 공지사항 등록</a></li>
        </ul>
      </div>
      <span class="me-3">👤 동곤님</span>
      <a href="logout.jsp" class="btn btn-outline-danger btn-sm">로그아웃</a>
    </div>
  </div>
</nav>

<!-- 메인 레이아웃 -->
<div class="container-fluid">
  <div class="row">
    <!-- 사이드바 -->
    <div class="col-md-2 sidebar">
      <ul class="nav flex-column nav-pills" id="sidebarMenu" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" id="tab-home" data-bs-toggle="pill" href="#content-home" role="tab">홈</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="tab-info" data-bs-toggle="pill" href="#content-info" role="tab">개인정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="tab-notice" data-bs-toggle="pill" href="#content-notice" role="tab">공지사항</a>
        </li>

        <!-- 전자결재 -->
        <li class="nav-item">
          <a class="nav-link" data-bs-toggle="collapse" href="#approvalSubMenu" role="button" aria-expanded="false" aria-controls="approvalSubMenu">
            전자결재 ▾
          </a>
          <div class="collapse ps-3" id="approvalSubMenu">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link" id="tab-myApproval" data-bs-toggle="pill" href="#content-myApproval" role="tab">내 전자결재</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="tab-receivedApproval" data-bs-toggle="pill" href="#content-receivedApproval" role="tab">받은 전자결재</a>
              </li>
            </ul>
          </div>
        </li>

        <!-- 공용설비 -->
        <li class="nav-item">
          <a class="nav-link" data-bs-toggle="collapse" href="#facilitySubMenu" role="button" aria-expanded="false" aria-controls="facilitySubMenu">
            공용설비 ▾
          </a>
          <div class="collapse ps-3" id="facilitySubMenu">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link" id="tab-vehicle" data-bs-toggle="pill" href="#content-vehicle" role="tab">차량관리</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="tab-room" data-bs-toggle="pill" href="#content-room" role="tab">회의실관리</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="tab-reservation" data-bs-toggle="pill" href="#content-reservation" role="tab">예약내역</a>
              </li>
            </ul>
          </div>
        </li>

        <li class="nav-item">
          <a class="nav-link" id="tab-calendar" data-bs-toggle="pill" href="#content-calendar" role="tab">캘린더</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="tab-email" data-bs-toggle="pill" href="#content-email" role="tab">이메일</a>
        </li>
      </ul>
    </div>

    <!-- 콘텐츠 영역 -->
    <div class="col-md-10">
      <div class="tab-content" id="tabContent">
        <!-- 홈 -->
        <div class="tab-pane fade show active" id="content-home" role="tabpanel">
          <h3>환영합니다, 동곤님</h3>
          <p>LDBSOFT 그룹웨어에 오신 것을 환영합니다.</p>
        </div>

        <!-- 개인정보 -->
        <div class="tab-pane fade" id="content-info" role="tabpanel">
          <h3>개인정보</h3>
          <table class="table table-bordered mt-3">
            <tbody>
              <tr><th>사원번호</th><td>20250001</td></tr>
              <tr><th>이름</th><td>동곤</td></tr>
              <tr><th>부서</th><td>개발팀</td></tr>
              <tr><th>직급</th><td>대리</td></tr>
              <tr><th>이메일</th><td>donggon@ldbsoft.co.kr</td></tr>
              <tr><th>연락처</th><td>010-1234-5678</td></tr>
            </tbody>
          </table>
        </div>

        <!-- 공지사항 -->
        <div class="tab-pane fade" id="content-notice" role="tabpanel">
          <h3>공지사항</h3>
          <p>최근 공지사항 목록이 여기에 표시됩니다.</p>
        </div>

        <!-- 전자결재 -->
        <div class="tab-pane fade" id="content-myApproval" role="tabpanel">
          <h3>내 전자결재</h3>
          <p>내가 기안한 문서 목록입니다.</p>
        </div>
        <div class="tab-pane fade" id="content-receivedApproval" role="tabpanel">
          <h3>받은 전자결재</h3>
          <p>내가 결재해야 할 문서가 표시됩니다.</p>
        </div>

        <!-- 공용설비 -->
        <div class="tab-pane fade" id="content-vehicle" role="tabpanel">
          <h3>차량관리</h3>
          <p>공용 차량 예약 및 관리 기능입니다.</p>
        </div>
        <div class="tab-pane fade" id="content-room" role="tabpanel">
          <h3>회의실관리</h3>
          <p>공용 회의실 예약 및 관리 기능입니다.</p>
        </div>
        <div class="tab-pane fade" id="content-reservation" role="tabpanel">
          <h3>예약내역</h3>
          <p>예약된 자원 목록이 여기에 표시됩니다.</p>
        </div>

        <!-- 캘린더 -->
        <div class="tab-pane fade" id="content-calendar" role="tabpanel">
          <h3>캘린더</h3>
          <p>회사 일정 및 프로젝트를 확인할 수 있습니다.</p>
        </div>

        <!-- 이메일 -->
        <div class="tab-pane fade" id="content-email" role="tabpanel">
          <h3>이메일</h3>
          <p>메일 작성 및 수신 내역을 확인합니다.</p>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
