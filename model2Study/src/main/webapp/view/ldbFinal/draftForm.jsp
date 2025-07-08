<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>결재문서 작성 - LDBSOFT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f6f9;
        }
        .container {
            max-width: 900px;
            margin-top: 40px;
        }
        .form-template {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container bg-white p-4 shadow rounded">
    <h2 class="mb-4">결재문서 작성</h2>

    <form method="post" action="approvalSubmit.jsp" enctype="multipart/form-data">
        <!-- 결재양식 선택 -->
        <div class="mb-3">
            <label class="form-label">결재양식 선택 *</label>
            <select class="form-select" id="formTypeSelect" name="formType" required onchange="showFormTemplate()">
                <option value="">양식을 선택하세요</option>
                <option value="휴가신청서">휴가신청서</option>
                <option value="지출결의서">지출결의서</option>
                <option value="프로젝트제안서">프로젝트 제안서</option>
            </select>
        </div>

        

        <!-- 결재자 선택 (횡으로) -->
        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label">1차 결재자 *</label>
                <select class="form-select employee-select" name="approver1" required>
                    <option value="">직원을 검색하세요</option>
                    <option value="emp001">김이사 (이사 / 개발팀)</option>
                    <option value="emp002">박부장 (부장 / 운영팀)</option>
                    <option value="emp003">이대리 (대리 / 인사팀)</option>
                    <option value="emp004">홍과장 (과장 / 고객지원팀)</option>
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label">2차 결재자 *</label>
                <select class="form-select employee-select" name="approver2" required>
                    <option value="">직원을 검색하세요</option>
                    <option value="emp001">김이사 (이사 / 개발팀)</option>
                    <option value="emp002">박부장 (부장 / 운영팀)</option>
                    <option value="emp003">이대리 (대리 / 인사팀)</option>
                    <option value="emp004">홍과장 (과장 / 고객지원팀)</option>
                </select>
            </div>
        </div>

        <!-- 마감기한 -->
        <div class="mb-3">
            <label class="form-label">마감기한 *</label>
            <input type="date" class="form-control" name="deadline" required>
        </div>


        <!-- 양식별 전용 입력 폼 -->
        <div id="휴가신청서" class="form-template d-none">
            <h5>휴가신청서 양식</h5>
            <table class="table table-bordered">
                <tr>
                    <th>휴가 유형</th>
                    <td>
                        <select name="leaveType" class="form-select">
                            <option>연차</option>
                            <option>반차</option>
                            <option>경조사</option>
                            <option>병가</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>휴가 기간</th>
                    <td>
                        <input type="date" name="leaveStart"> ~ 
                        <input type="date" name="leaveEnd">
                    </td>
                </tr>
                <tr>
                    <th>잔여 연차</th>
                    <td>9일</td> <!-- 추후 DB 연동 -->
                </tr>
            </table>
        </div>

        <div id="지출결의서" class="form-template d-none">
            <h5>지출결의서 양식</h5>
            <table class="table table-bordered">
                <tr>
                    <th>지출 항목</th>
                    <td><input type="text" name="expenseItem" class="form-control"></td>
                </tr>
                <tr>
                    <th>금액</th>
                    <td><input type="number" name="amount" class="form-control"></td>
                </tr>
                <tr>
                    <th>사용일자</th>
                    <td><input type="date" name="usedDate" class="form-control"></td>
                </tr>
            </table>
        </div>

        <div id="프로젝트제안서" class="form-template d-none">
            <h5>프로젝트 제안서 양식</h5>
            <table class="table table-bordered">
                <tr>
                    <th>프로젝트명</th>
                    <td><input type="text" name="projectTitle" class="form-control"></td>
                </tr>
                <tr>
                    <th>예상 기간</th>
                    <td><input type="text" name="expectedDuration" class="form-control" placeholder="예: 2025.01 ~ 2025.06"></td>
                </tr>
                <tr>
                    <th>목표</th>
                    <td><textarea name="projectGoal" class="form-control" rows="3"></textarea></td>
                </tr>
            </table>
        </div>
        
        <!-- 제목 -->
        <div class="mb-3">
            <label class="form-label">제목 *</label>
            <input type="text" class="form-control" name="title" required>
        </div>
        <!-- 공통 내용 입력 -->
        <div class="mb-3">
            <label class="form-label">내용 *</label>
            <textarea class="form-control" name="content" rows="5" required></textarea>
        </div>

        <!-- 첨부파일 -->
        <div class="mb-3">
            <label class="form-label">첨부파일 (최대 50MB)</label>
            <input type="file" class="form-control" name="attachment">
        </div>

        

        <!-- 제출 버튼 -->
        <div class="text-end mt-4">
            <button type="submit" name="action" value="save" class="btn btn-primary">제출</button>
            <button type="submit" name="action" value="draft" class="btn btn-secondary">임시저장</button>
            <a href="approvalList.jsp" class="btn btn-light">취소</a>
        </div>
    </form>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script>
    // 결재자 검색용 select2
    $(document).ready(function () {
        $('.employee-select').select2({
            placeholder: '직원 검색...',
            allowClear: true
        });
    });

    // 결재양식에 따라 폼 보여주기
    function showFormTemplate() {
        const selected = document.getElementById("formTypeSelect").value;
        const templates = document.querySelectorAll(".form-template");
        templates.forEach(t => t.classList.add("d-none"));

        if (selected) {
            document.getElementById(selected).classList.remove("d-none");
        }
    }
</script>
</body>
</html>
