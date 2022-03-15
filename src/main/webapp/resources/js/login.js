//이메일 정규식 확인
function check_email_regx(input_email){
	  var email_regx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	  input_email.on('keyup',function(){
		  if(email_regx.test(input_email.val())){
			  input_email.css("border", "1px solid blue");
		  }else{
			  input_email.css("border", "1px solid red");
		  }
	  });
  }


