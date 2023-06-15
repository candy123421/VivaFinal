 <%@page import="java.io.File"%>
 <%@page import="java.io.*"%>
 <%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <title>Insert title here</title>
 </head>
 <body>
 
<% 
  // 다운받을 파일의 이름을 가져옴
  String fileName = request.getParameter("fileName");
  // 다운받을 파일이 저장되어 있는 폴더 이름
  String saveFolder = "File";
  
  // Context에 대한 정보를 알아옴
  ServletContext context = getServletContext(); // 서블릿에 대한 환경정보를 가져옴
  
  // 실제 파일이 저장되어 있는 폴더의 경로
  String realFolder = context.getRealPath("saveFolder");
  // 다운받을 파일의 전체 경로를 filePath에 저장
  String filePath = realFolder + "\\" + fileName;
  
  try{
out.clear();

out = pageContext.pushBody();

   // 다운받을 파일을 불러옴
   File file = new File(filePath);
   byte b[] = new byte[4096];
   
   // page의 ContentType등을 동적으로 바꾸기 위해 초기화시킴
   response.reset();
   //해당 컨텐츠 타입의 MIME형식이다. 
   response.setContentType("application/octet-stream");
   //.mov -> video/quicktime
   //.one -> application/onenote
   //.ppt -> application/vnd.ms-powerpoint
   //.txt -> text/plain
   //.ini -> application/octet-stream (octect-stream은 8비트로 된 데이터라는 뜻)
   //.wav -> audio/wav
   
   // 한글 인코딩
   // '8859_1'은 1바이트에 해당하는 256개의 코드에 대해, 즉 0x00 ~ 0xff 까지의 모든 코드에 대해 대응되는 문자를 갖고 있다.
   //반면 8859_1보다 많은 문자를 거느리고 있는 'EUC-KR', 
   //이것의 확장형인 'MS949' 나 심지어 모든 글자를 다 포함한다고 여겨도 될 만한 'UTF-8' 조차
   //가진 문자는 확실히 많지만 모든 바이트 열에 대해 대응되는 문자를 갖고 있는 것은 아니다.
   String Encoding = new String(fileName.getBytes("UTF-8"), "8859_1");
   
   // 파일 링크를 클릭했을 때 다운로드 저장 화면이 출력되게 처리하는 부분
   response.setHeader("Content-Disposition", "attachment; filename = " + Encoding);
  
   // 파일의 세부 정보를 읽어오기 위해서 선언
   FileInputStream is = new FileInputStream(filePath);
  
   // 파일에서 읽어온 세부 정보를 저장하는 파일에 써주기 위해서 선언
   ServletOutputStream sos = response.getOutputStream();
   
   int numRead;
   // 바이트 배열 b의 0번 부터 numRead번 까지 파일에 써줌 (출력)
   while((numRead = is.read(b, 0, b.length)) != -1){
	   sos.write(b, 0, numRead);
   }
   
   sos.flush();
   sos.close();
   is.close();
   
  } catch(Exception e){
	  e.printStackTrace();
  }
 %>
 </body>
 </html>