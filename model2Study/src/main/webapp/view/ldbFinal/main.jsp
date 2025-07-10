<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>LDBSOFT 그룹웨어 메인</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background-color: #f4f6f9; }
    .navbar-brand { font-weight: bold; color: #0d6efd !important; }
    .sidebar {
      height: 100vh;
      background-color: #fff;
      border-right: 1px solid #dee2e6;
      padding-top: 20px;
    }
    .tab-content { padding: 20px; }
    .nav-pills .nav-link.active { background-color: #0d6efd; }
  </style>
</head>
<body>

<!-- 상단 네비게이션 -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">LDBSOFT Groupware</a>
    <div class="d-flex">

      <!-- 검색 버튼 및 입력창 -->
      <div class="dropdown me-3">
        <button class="btn" type="button" id="searchToggle" data-bs-toggle="dropdown" aria-expanded="false">
          🔍
        </button>
        <ul class="dropdown-menu p-3" style="min-width: 300px;">
          <form id="searchForm" class="mb-2">
            <input type="text" id="searchInput" class="form-control" placeholder="사원 이름 검색" autocomplete="off">
          </form>
          <div id="searchResults"></div>
        </ul>
      </div>

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
          <li><a class="dropdown-item" href="#">결제 요청이 있습니다</a></li>
          <li><a class="dropdown-item" href="#">새 공지사항 등록</a></li>
        </ul>
      </div>

      <span class="me-3">👤 동고는님</span>
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
        <li class="nav-item"><a class="nav-link active" id="tab-home" data-bs-toggle="pill" href="#content-home" role="tab">홈</a></li>
        <li class="nav-item"><a class="nav-link" id="tab-info" data-bs-toggle="pill" href="#content-info" role="tab">개인정보</a></li>
        <li class="nav-item"><a class="nav-link" id="tab-notice" data-bs-toggle="pill" href="#content-notice" role="tab">공지사항</a></li>
          <li class="nav-item">
          <a class="nav-link" data-bs-toggle="collapse" href="#boardMenu" role="button" aria-expanded="false" aria-controls="boardMenu">게시판 ▾</a>
          <div class="collapse ps-3" id="boardMenu">
            <ul class="nav flex-column">
              <li class="nav-item"><a class="nav-link" id="tab-faq" data-bs-toggle="pill" href="#content-faq" role="tab">자주묻는질문</a></li>
              <li class="nav-item"><a class="nav-link" id="tab-question" data-bs-toggle="pill" href="#content-question" role="tab">질문게시판</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link"id="tab-draft" data-bs-toggle="collapse" href="#approvalSubMenu" role="button" aria-expanded="false" aria-controls="approvalSubMenu">전자결재 ▾</a>
          <div class="collapse ps-3" id="approvalSubMenu">
            <ul class="nav flex-column">
              <li class="nav-item"><a class="nav-link" id="tab-myApproval" data-bs-toggle="pill" href="#content-myApproval" role="tab">내 전자결재</a></li>
              <li class="nav-item"><a class="nav-link" id="tab-receivedApproval" data-bs-toggle="pill" href="#content-receivedApproval" role="tab">받은 전자결재</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-bs-toggle="collapse" href="#facilitySubMenu" role="button" aria-expanded="false" aria-controls="facilitySubMenu">공용설비 ▾</a>
          <div class="collapse ps-3" id="facilitySubMenu">
            <ul class="nav flex-column">
              <li class="nav-item"><a class="nav-link" id="tab-vehicle" data-bs-toggle="pill" href="#content-vehicle" role="tab">차량관리</a></li>
              <li class="nav-item"><a class="nav-link" id="tab-room" data-bs-toggle="pill" href="#content-room" role="tab">회의실관리</a></li>
              <li class="nav-item"><a class="nav-link" id="tab-reservation" data-bs-toggle="pill" href="#content-reservation" role="tab">예약내역</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#CalendarMenu" role="button" aria-expanded="false" aria-controls="facilitySubMenu">캘린더 ▾</a>
         <div class="collapse ps-3" id="CalendarMenu">
            <ul class="nav flex-column">
              <li class="nav-item"><a class="nav-link" id="tab-calendar" data-bs-toggle="pill" href="#content-calendar" role="tab">캘린더조회</a></li>
              <li class="nav-item"><a class="nav-link" id="tab-calendar" data-bs-toggle="pill" href="#content-calendarRegist" role="tab">일정등록</a></li>              
            </ul>
          </div>
          </li>
        <li class="nav-item"><a class="nav-link" id="tab-email" data-bs-toggle="pill" href="#content-email" role="tab">이메일</a></li>
         <li class="nav-item">
          <a class="nav-link" data-bs-toggle="collapse" href="#adminMenu" role="button" aria-expanded="false" aria-controls="adminMenu">관리자 ▾</a>
          <div class="collapse ps-3" id="adminMenu">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="collapse" href="#adminRegSub" role="button" aria-expanded="false" aria-controls="adminRegSub">등록 ▾</a>
                <div class="collapse ps-3" id="adminRegSub">
                  <ul class="nav flex-column">
                  <li class="nav-item"><a class="nav-link" href="faqWrite.jsp">자주묻는질문 등록</a></li>
                    <li class="nav-item"><a class="nav-link" href="vehicleRegisterForm.jsp">차량등록</a></li>
                    <li class="nav-item"><a class="nav-link" href="roomRegisterForm.jsp">회의실등록</a></li>
                    <li class="nav-item"><a class="nav-link" href="itemCodeWrite.jsp">비품등록</a></li>
                  </ul>
                </div>
              </li>
              <li class="nav-item"><a class="nav-link" href="annualLeaveDashboard.jsp">연차사용률</a></li>
              <li class="nav-item"><a class="nav-link" href="adminMemberManage.jsp">회원관리</a></li>
            </ul>
          </div>
        </li>
      </ul>
    </div>

    <!-- 콘텐츠 영역 -->
    <div class="col-md-10">
      <div class="tab-content" id="tabContent">
        <div class="tab-pane fade show active" id="content-home" role="tabpanel">
          <h3>환영합니다, 동곤님</h3>
          <p>LDBSOFT 그룹웨어에 오신 것을 환영합니다.</p>
        </div>
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
        <div class="tab-pane fade" id="content-notice" role="tabpanel">
          <h3>공지사항</h3>
          <p>최근 공지사항 목록이 여기에 표시됩니다.</p>
        </div>
        <div class="tab-pane fade" id="content-myApproval" role="tabpanel">
          <h3>내 전자결재</h3>
          <p>내가 기안한 문서 목록입니다.</p>
        </div>
        <div class="tab-pane fade" id="content-receivedApproval" role="tabpanel">
          <h3>받은 전자결재</h3>
          <p>내가 결재해야 할 문서가 표시됩니다.</p>
        </div>
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
        <div class="tab-pane fade" id="content-calendar" role="tabpanel">
          <h3>캘린더</h3>
          <p>회사 일정 및 프로젝트를 확인할 수 있습니다.</p>
        </div>
        <div class="tab-pane fade" id="content-email" role="tabpanel">
          <h3>이메일</h3>
          <p>메일 작성 및 수신 내역을 확인합니다.</p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 사원 정보 모달 -->
<div class="modal fade" id="employeeModal" tabindex="-1" aria-labelledby="employeeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="employeeModalLabel">사원 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
      </div>
      <div class="modal-body" id="employeeModalBody">
        <!-- 사원 정보가 여기에 삽입됨 -->
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  const employees = [
    { name: "김사원", dept: "개발팀", rank: "사원", email: "kim@ldbsoft.co.kr", phone: "010-1234-0001" },
    { name: "이대리", dept: "영업팀", rank: "대리", email: "lee@ldbsoft.co.kr", phone: "010-5678-0002" },
    { name: "박과장", dept: "기획팀", rank: "과장", email: "park@ldbsoft.co.kr", phone: "010-1111-0003" }
  ];

  const searchInput = document.getElementById("searchInput");
  const searchResults = document.getElementById("searchResults");
  const modalBody = document.getElementById("employeeModalBody");

  searchInput.addEventListener("input", () => {
    const keyword = searchInput.value.trim();
    searchResults.innerHTML = "";

    if (keyword.length > 0) {
      const filtered = employees.filter(emp => emp.name.includes(keyword));
      if (filtered.length === 0) {
        searchResults.innerHTML = "<div class='text-muted px-2'>검색 결과 없음</div>";
      } else {
        filtered.forEach(emp => {
          const item = document.createElement("li");
          item.classList.add("dropdown-item");
          item.textContent = `${emp.name} (${emp.dept})`;
          item.style.cursor = "pointer";
          item.addEventListener("click", () => {
            modalBody.innerHTML = `
              <ul class="list-group">
                <li class="list-group-item"><strong>이름:</strong> ${emp.name}</li>
                <li class="list-group-item"><strong>부서:</strong> ${emp.dept}</li>
                <li class="list-group-item"><strong>직급:</strong> ${emp.rank}</li>
                <li class="list-group-item"><strong>이메일:</strong> ${emp.email}</li>
                <li class="list-group-item"><strong>연락처:</strong> ${emp.phone}</li>
              </ul>`;
            new bootstrap.Modal(document.getElementById("employeeModal")).show();
          });
          searchResults.appendChild(item);
        });
      }
    }
  });
</script>
</body>
</html>
