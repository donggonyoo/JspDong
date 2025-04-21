const xhttp = new XMLHttpRequest();
xhttp.open("GET","test01.jsp");
xhttp.send();
xhttp.onreadystatechange = callBack

function callBack(){
if(this.readyState==4 && this.status == 200){
	let data = this.responseText.split(","); 
	let max = data[0];
	for(s of data){
		if(max<s){
			max = s;
		}		
	}
	document.querySelector("#result").innerHTML += `${data}<br>`
	document.querySelector("#result").innerHTML += `가장큰수는 ${max}`;
}
}