<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head></head>

<title>자주묻는 질문</title>
<body>
    <div class="container-fluid col-9">
        <div class="row navList">
            <h4 class="col-8" style="margin: 0px;">자주묻는 질문</h4>
            <div class="col-4 ml-auto">
                <span><i class="la la-home"></i></span>
                <span> &nbsp;>&nbsp; </span>
                <span>운영관리</span>
                <span> &nbsp;>&nbsp; </span>
                <span>자주묻는 질문</span>
                <span> &nbsp;>&nbsp; </span>
                <span>수정</span>
            </div>
        </div>
        <hr color="#494C4D" style="height:3px; border-radius:40px; margin-top:5px;" />

		<table class="col-12">
			<tr>
				<td>
					<button class="btn btn-default" style="color: #F5F4F4;">취소</button>
					<button class="btn btn-primary float-right" style="color: #F5F4F4;">등록</button>
				</td>
			</tr>
		</table>
		<table id="maincontent" class="table mt-3" style="">
			<tbody>
				<tr class="col-12">
					<td class="col-1" style="font-weight: bold; background-color: #F5F4F4; text-align : center;">
						문의
					</td>
					<td class="col-4">&nbsp;</td>
					<td  class="col-1" style="font-weight: bold; background-color: #F5F4F4; text-align : center;">문의 분류</td>
					<td class="col-1 text-center">
						<select>
							<option>수료문의</option>
							<option selected="selected">학습문의</option>
							<option>기타</option>
						</select>
					</td>
				</tr>
				<tr class="col-12">

					<td colspan="4">
						<textarea rows="8" cols="115">
오프라인 출석체크는 어떻게 하나요?
						</textarea>
					</td>
				<tr>
			</tbody>
		</table>
		
		<table class="table">
			<tr>
				<td colspan="6" style="font-weight: bold; background-color: #F5F4F4; text-align : center;">
					답변
				</td>
			</tr>
			<tr>
				<td>
					<textarea rows="8" cols="115">
오프라인 학습은 qr코드 스캔을 통해 출석체크를 하고 있습니다.<br>
qr코드 스캔으로 출석 체크가 되지 않은 경우 해당 강의명과 이름, 아이디, 이메일 주소를 알려주실 경우 확인 후 처리해드리겠습니다.
					</textarea>
				</td>
			</tr>
		</table>
		<hr>

	</div>
					
</body>
