<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head></head>

<title>자주묻는 질문</title>
<body>
    <div class="container-fluid col-9">
        <div class="row navList">
            <h4 class="col-9" style="margin: 0px;">자주묻는 질문</h4>
            <div class="col-3 ml-auto">
                <span><i class="la la-home"></i></span>
                <span> &nbsp;>&nbsp; </span>
                <span>운영관리</span>
                <span> &nbsp;>&nbsp; </span>
                <span>자주묻는 질문</span>
                <span> &nbsp;>&nbsp; </span>
                <span>등록</span>
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
							<option selected="selected">수료문의</option>
							<option>학습문의</option>
							<option>기타</option>
						</select>
					</td>
				</tr>
				<tr>

					<td colspan="4">
						<textarea rows="8" cols="115">
						
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
					
					</textarea>
				</td>
			</tr>
		</table>
		<hr>

	</div>
					
</body>
