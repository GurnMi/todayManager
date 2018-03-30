<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="UTF-8">
 <title>Login Demo - Kakao JavaScript SDK</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


    </head>
    <body>
    <a id="kakao-login-btn"></a>
    <a href="http://developers.kakao.com/logout"></a>
    
    <form action="${pageContext.request.contextPath}/login/" method="post" id="form">
    	<input type="text" name="id" id="id" hidden="hidden">
    	<!-- <input type="button"  id="kakao-login-btn"/>
    	<a href="http://developers.kakao.com/logout"></a> -->
    </form>
    
    <script type='text/javascript'>
      //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('073bab6d5ebe961bfb1e314c96760511');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function(authObj) {
        	//alert(JSON.stringify(authObj));
        	 Kakao.API.request({

		       url: '/v1/user/me',
		
		       success: function(res) {
		             //alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력	
		             //alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력		
		             //console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
		             console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
		            // console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
		         	// res.properties.nickname으로도 접근 가능 )
		            // console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
					//location.href("result");	
		            
		            
		            loginSuccess(res.kaccount_email);
		            
		            
		           }
		
		       })
          },
          fail: function(err) {
             alert(JSON.stringify(err));
          }
        });
        
        
        function loginSuccess(id){
        	$("#id").val(id);
        	$("#form").submit();
        	//$(location).attr("href","result?id="+id);
        }
      //]]>
    </script>

</body>
</html>