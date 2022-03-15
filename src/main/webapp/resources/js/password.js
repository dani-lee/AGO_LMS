//비밀번호 확인 메소드
function see_through_pwd(input_id, icon_name){
	var input_newpwd = $('input[id="'+input_id+'"]');
	input_newpwd.toggleClass('active');
	if(input_newpwd.hasClass('active')){
		$('i[id="'+icon_name+'"]').attr('class',"far fa-eye-slash");
		$(input_newpwd).attr('type','text');
	}else{
		$('i[id="'+icon_name+'"]').attr('class',"far fa-eye");
		$(input_newpwd).attr('type','password');
	}
}

//비밀번호 정규식 확인 함수
function check_regx(input_newpwd){
	var pwd_regx = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=]).*$/;
	input_newpwd.on('keyup',function(){
		if(!pwd_regx.test(input_newpwd.val())){
			input_newpwd.css("border", "1px solid red");
		}else{
			input_newpwd.css("border", "1px solid green");
		}
	})
}

//비밀번호 확인
function pwd_check(input_pwd, input_pwd_check){
	input_pwd_check.on('keyup', function(){
		if(input_pwd.val() == input_pwd_check.val()){
			input_pwd_check.css("border", "1px solid green");
		}else{
			input_pwd_check.css("border", "1px solid red");
		}
	})
	
}