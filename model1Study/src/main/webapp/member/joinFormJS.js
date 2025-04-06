/**
 * 입력값 검증 위한 JS
 */
function input_check(f){
	//f : <form...>
	//f.id : <input name="id">name이 id인태그
	if(f.id.value.trim() == ""){ 
		alert("아이디입력")
		f.id.focus(); //name이id인 곳에 포커스를 둠
		return false; //기본이벤트 취소
	}
	if(f.pass.value.trim() == ""){ 
		alert("비밀번호입력")
		f.pass.focus();
		return false; 
	}
	if(f.name.value.trim() == ""){ 
		alert("이름입력")
		f.name.focus();
		return false; 
	}
	return true;//아이디비번이름이 입력됐다면 true
}

