/**
 * 
 */

 function inputBox(e){
	if(e.num.value <= 0 ){
		alert("0개이상입력바랍니다");
		e.num.focus();
		return false;
	}
	return true;
 }  