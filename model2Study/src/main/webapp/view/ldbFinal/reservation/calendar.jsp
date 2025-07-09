<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>캘린더 - LDBSOFT 그룹웨어</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.css" rel="stylesheet">
  <style>
    body { background-color: #f4f6f9; }
    .container { max-width: 1000px; margin-top: 40px; }
    #calendar {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }
  </style>
</head>
<body>

<div class="container">
  <h2 class="mb-4">📅 회사 캘린더</h2>
  <div id="calendar"></div>
</div>

<!-- 일정 상세 모달 -->
<div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">일정 상세보기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body" id="eventDetail">
        <!-- 일정 상세 내용 출력 -->
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      locale: 'ko',
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: ''
      },
      events: [
        {
          title: '프로젝트 A 시작',
          start: '2025-07-10',
          end: '2025-07-15',
          color: '#0d6efd',
          extendedProps: {
            content: '프로젝트 A를 본격적으로 시작합니다.'
          }
        },
        {
          title: '전체 회의',
          start: '2025-07-12',
          color: '#20c997',
          extendedProps: {
            content: '부서 전체 회의가 진행됩니다.'
          }
        },
        {
          title: '워크샵',
          start: '2025-07-25',
          color: '#ffc107',
          extendedProps: {
            content: '사내 팀워크 향상을 위한 워크샵'
          }
        },
        {
          title: '신규 프로젝트 Kickoff',
          start: '2025-07-28',
          color: '#dc3545',
          extendedProps: {
            content: '신규 프로젝트 킥오프 미팅 진행'
          }
        }
      ],
      eventClick: function(info) {
        var modalBody = document.getElementById('eventDetail');
        var startDate = info.event.start.toISOString().slice(0, 10);
        var endDate = info.event.end ? info.event.end.toISOString().slice(0, 10) : null;
        var content = info.event.extendedProps.content || '-';

        var html = '<strong>제목:</strong> ' + info.event.title + '<br>' +
                   '<strong>내용:</strong> ' + content + '<br>' +
                   '<strong>시작일:</strong> ' + startDate + '<br>';

        if (endDate) {
          html += '<strong>종료일:</strong> ' + endDate;
        }

        modalBody.innerHTML = html;

        var modal = new bootstrap.Modal(document.getElementById('eventModal'));
        modal.show();
      }
    });

    calendar.render();
  });
</script>
</body>
</html>
