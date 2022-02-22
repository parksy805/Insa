/*********************************************************
 * DESC : 직원 정보 등록 js
 * AUTH : 박소영 (개발팀)
 * HIST : 20220220
*********************************************************/
 
/********************************************************
profileImg 업로드 시, scr 변경
*********************************************************/
function setProfileImg(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
		var img = document.getElementById("profile_thumbnail");
		img.setAttribute("src", event.target.result);
		document.querySelector("#profile_thumbnail").appendChild(img);
	};
	
	reader.readAsDataURL(event.target.files[0]);
}




