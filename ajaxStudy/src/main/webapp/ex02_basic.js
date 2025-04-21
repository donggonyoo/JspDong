
function loadJspGet(){
	const xhttp = new XMLHttpRequest(); //ajax객체
	const params = "?name="+document.f.name.value;
	xhttp.open("GET","ex02_basic.jsp"+params);
	//ex02_basic.jsp?name="name.value" 형식으로넘어감
	xhttp.send();
	xhttp.onreadystatechange=callback;
}

function loadJspPost(){
	const xhttp = new XMLHttpRequest();
	const params = "name="+document.f.name.value;
	xhttp.open("Post","ex02_basic.jsp");
	
	//POST 데이터가 폼 형식이라는 걸 서버에 알려줌. + 인코딩지정
	xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8")
	xhttp.send(params); //POST : send시 파라미터전달
	xhttp.onreadystatechange=callback;
}
function callback(){
	if(this.readyState==4 && this.status == 200){
		alert(this.responseText);
		document.querySelector("#demo").innerHTML = this.responseText;
	}
}
