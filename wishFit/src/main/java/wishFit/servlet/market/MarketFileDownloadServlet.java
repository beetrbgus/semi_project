package wishFit.servlet.market;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.market.MarketFileDao;
import wishFit.beans.market.MarketFileDto;


@WebServlet(urlPatterns="/page/market/download.kh")
public class MarketFileDownloadServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : 단일조회 항목(int imageNo)
			//= 이 서블릿은 어떠한 경우에도 파일을 1개만 출력한다. 절대로 여러개를 동시에 출력할 수 없다. 
			int imageNo = Integer.parseInt(req.getParameter("imageNo"));
			
			//처리
			//1. board_file 단일조회
			MarketFileDao marketFileDao = new MarketFileDao();
			MarketFileDto marketFileDto = marketFileDao.get(imageNo);
			
			//2. 파일 정보 설정
			File dir = new File("C:\\Users\\gptjd\\upload\\board");
			File target = new File(dir, marketFileDto.getBoardSave());
			InputStream in = new FileInputStream(target);
			byte[] buffer = new byte[8192];
			
			//3. 헤더 설정
			//[주의] 파일명에는 띄어쓰기나 일부 특수문자, 한글 등의 유니코드가 포함될 수 있다.
			//(1) 따옴표를 이용하여 띄어쓰기 등을 무시하도록 처리
			//(2) 인코딩을 통해서 파일명에 존재하는 유니코드를 변환 처리(URLEncoder)
			String uploadName = URLEncoder.encode(marketFileDto.getBoardUpload(), "UTF-8");
			uploadName = uploadName.replace("+", "%20");
			
			resp.setHeader("Content-Type", "application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename=\""+uploadName+"\"");
			resp.setHeader("Content-Encoding", "UTF-8");
			resp.setHeader("Content-Length", String.valueOf(marketFileDto.getBoardSize()));
			
			//출력 : 파일 출력
			//4. 데이터 출력(다운로드)
			while(true) {
				int size = in.read(buffer);
				if(size == -1) break;
				resp.getOutputStream().write(buffer, 0, size);
			
		}
			in.close();
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			
		}
	}

}
