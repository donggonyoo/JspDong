<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>사원 목록 - LDBSOFT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
        }
        .container {
            max-width: 1200px;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<div class="container bg-white p-4 shadow rounded">
    <h2 class="mb-4">사원 목록</h2>

    <!-- 검색/필터 -->
    <form class="row g-3 mb-3">
        <div class="col-md-4">
            <input type="text" class="form-control" name="keyword" placeholder="이름 또는 사원번호 검색">
        </div>
        <div class="col-md-3">
            <select class="form-select" name="department">
                <option value="">전체 부서</option>
                <option>개발팀</option>
                <option>인사팀</option>
                <option>고객지원팀</option>
                <option>운영팀</option>
            </select>
        </div>
        <div class="col-md-3">
            <select class="form-select" name="position">
                <option value="">전체 직급</option>
                <option>사원</option>
                <option>대리</option>
                <option>과장</option>
                <option>팀장</option>
                <option>이사</option>
                <option>사장</option>
            </select>
        </div>
        <div class="col-md-2">
            <button type="submit" class="btn btn-primary w-100">검색</button>
        </div>
    </form>

    <!-- 목록 테이블 -->
    <table class="table table-hover">
        <thead class="table-light">
            <tr>
                <th>사원번호</th>
                <th>이름</th>
                <th>부서</th>
                <th>직급</th>
                <th>이메일</th>
                <th>전화번호</th>
                <th>재직상태</th>
                <th>상세</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>20250001</td>
                <td>동곤</td>
                <td>개발팀</td>
                <td>대리</td>
                <td>donggon@ldbsoft.co.kr</td>
                <td>010-1234-5678</td>
                <td>재직</td>
                <td><a href="profile.jsp?empNo=20250001" class="btn btn-sm btn-outline-primary">보기</a></td>
            </tr>
            <tr>
                <td>20250002</td>
                <td>이슬기</td>
                <td>인사팀</td>
                <td>과장</td>
                <td>lee@ldbsoft.co.kr</td>
                <td>010-1111-2222</td>
                <td>재직</td>
                <td><a href="profile.jsp?empNo=20250002" class="btn btn-sm btn-outline-primary">보기</a></td>
            </tr>
            <!-- 반복 출력 영역 -->
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
