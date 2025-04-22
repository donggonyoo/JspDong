
function loadjsp(){
	//ex01_basic.jsp 파일에 GET 요청을 보냄(비동기처리함수)
	fetch("ex01_basic.jsp")
	
	//JSP 파일의 응답 결과(HTML이든 문자열이든)를 문자열로 추출함
	//response = jsp의response가 아님 (변수명)(서버에서온 응답)
	.then((response)=>response.text())
	
	//(추출한문자열)얻은 data를 id가 demo인 요소에 출력함
	.then((data)=>document.querySelector('#demo').innerHTML = data)
	
}