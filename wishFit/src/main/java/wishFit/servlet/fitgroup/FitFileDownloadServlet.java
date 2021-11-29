package wishFit.servlet.fitgroup;

import java.io.BufferedInputStream;
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

import wishFit.beans.fitgroupimage.FitgroupImageDao;
import wishFit.beans.fitgroupimage.FitgroupImageDto;

@WebServlet(urlPatterns = {"/page/fitgroup/download.kh","/fitgroup/download.kh"})
public class FitFileDownloadServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			// 다시해야함
			// 소모임 이미지 번호(기본키) 를 받아온다
			int fgImageNo =Integer.parseInt(req.getParameter("fgImageNo"));
			
			// 단일조회
			FitgroupImageDao fitgroupImageDao = new FitgroupImageDao();
			FitgroupImageDto fitgroupImageDto = fitgroupImageDao.get(fgImageNo);
			// 파일 설정
			// 2. 파일 정보 설정
			File dir = new File("D:/upload/wishfit");
			File target = new File(dir, fitgroupImageDto.getFgImageSave());
			InputStream in = new FileInputStream(target);
			byte[] buffer = new byte[8192];
			// 헤더 설정 -뛰어쓰기 / 유니코드안됨
			String uploadName = URLEncoder.encode(fitgroupImageDto.getFgImageUpload(), "UTF-8");
			uploadName = uploadName.replace("+", "%20");
			
			resp.setHeader("Content-Type", "application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename=\""+uploadName+"\"");
			resp.setHeader("Content-Encoding", "UTF-8");
			resp.setHeader("Content-Length", String.valueOf(fitgroupImageDto.getFgImageSize()));
			// 데이터 다운로드하기
			while (true) {
				int size = in.read(buffer);
				if (size == -1)
					break;
				resp.getOutputStream().write(buffer, 0, size);
			}

			in.close();

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
