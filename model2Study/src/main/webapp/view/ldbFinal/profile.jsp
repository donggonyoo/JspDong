<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>개인정보 관리 - LDBSOFT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
        }
        .container {
            max-width: 900px;
            margin-top: 40px;
        }
        .img-thumbnail {
            max-width: 150px;
        }
    </style>
</head>
<body>

<div class="container bg-white p-4 shadow rounded">
    <h2 class="mb-4">개인정보 관리</h2>
    <form method="post" action="updateProfile.jsp" enctype="multipart/form-data">
        <div class="row mb-4">
            <div class="col-md-3 text-center">
                <img src="profile_default.png" alt="사원 사진" class="img-thumbnail mb-2">
                <input type="file" class="form-control" name="photo">
            </div>
            <div class="col-md-9">
                <div class="row g-3">
                    <!-- 필수 항목 -->
                    <div class="col-md-6">
                        <label class="form-label">이름 *</label>
                        <input type="text" class="form-control" name="name" value="동곤" readonly>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">이메일 *</label>
                        <input type="email" class="form-control" name="email" value="donggon@ldbsoft.co.kr" readonly>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">전화번호 *</label>
                        <input type="text" class="form-control" name="phone" value="010-1234-5678">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">부서 *</label>
                        <input type="text" class="form-control" name="department" value="개발팀" readonly>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">직급 *</label>
                        <input type="text" class="form-control" name="position" value="대리" readonly>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">권한 *</label>
                        <input type="text" class="form-control" name="role" value="LEVEL1" readonly>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">재직상태 *</label>
                        <input type="text" class="form-control" name="status" value="재직" readonly>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">입사일 *</label>
                        <input type="date" class="form-control" name="hireDate" value="2021-03-01" readonly>
                    </div>

                    <!-- 선택 항목 -->
                    <div class="col-md-6">
                        <label class="form-label">성별</label>
                        <select class="form-select" name="gender">
                            <option selected>남</option>
                            <option>여</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">생년월일</label>
                        <input type="date" class="form-control" name="birthDate" value="1990-01-01">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">주소</label>
                        <input type="text" class="form-control" name="address" value="서울특별시 강남구 테헤란로">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">은행명</label>
                        <input type="text" class="form-control" name="bank" value="국민은행">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">계좌번호</label>
                        <input type="text" class="form-control" name="account" value="123-4567-8901">
                    </div>
                </div>
            </div>
        </div>

        <div class="text-end">
            <button type="submit" class="btn btn-primary">저장</button>
            <a href="index.jsp" class="btn btn-secondary">취소</a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
