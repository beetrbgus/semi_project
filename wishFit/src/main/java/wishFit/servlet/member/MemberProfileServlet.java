package wishFit.servlet.member;

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

import wishFit.beans.member.MemberProfileDao;
import wishFit.beans.member.MemberProfileDto;


@WebServlet(urlPatterns="/page/fitgroup/profile.kh")
public class MemberProfileServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int mpNo  = Integer.parseInt(req.getParameter("mpNo"));
			System.out.println("1");
			MemberProfileDao memberProfileDao = new MemberProfileDao();
			MemberProfileDto memberProfileDto = memberProfileDao.get(mpNo);
			System.out.println("2");

			File dir = new File("D:\\upload\\wishfit");
			File target = new File(dir, memberProfileDto.getMpSave());
			InputStream in = new FileInputStream(target);
			byte[] buffer = new byte[8192];
			
			String encodeFilename = URLEncoder.encode(memberProfileDto.getMpUpload(), "UTF-8");
			encodeFilename = encodeFilename.replace("+", "%20");
			
			
			resp.setHeader("Content-Type", "application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename=\""+encodeFilename+"\"");
			resp.setHeader("Content-Encoding", "UTF-8");
			resp.setHeader("Content-Length", String.valueOf(memberProfileDto.getMpSize()));
			
			while(true) {
				int size = in.read(buffer);
				if(size == -1) break;
				resp.getOutputStream().write(buffer, 0, size);
			}
			in.close();
		} catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
