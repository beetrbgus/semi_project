package wishFit.servlet.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import wishFit.beans.member.MemberDao;
import wishFit.beans.member.MemberDto;
import wishFit.beans.member.MemberProfileDao;
import wishFit.beans.member.MemberProfileDto;

@WebServlet(urlPatterns="/page/member/join.kh")
public class MemberJoinServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 이미지 파일 설정
			String savePath = "D:/upload/member";
			int maxSize = 10*1024*1024;
			String encoding ="UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			MultipartRequest mRequest =
					new MultipartRequest(req, savePath, maxSize, encoding, policy);
			
			req.setCharacterEncoding("UTF-8");
			MemberDto memberDto = new MemberDto();
			memberDto.setMemId(mRequest.getParameter("memId"));
			memberDto.setMemPw(mRequest.getParameter("memPw"));
			memberDto.setMemPwQ(mRequest.getParameter("memPwQ"));
			memberDto.setMemPwA(mRequest.getParameter("memPwA"));
			memberDto.setMemName(mRequest.getParameter("memName"));
			memberDto.setMemNick(mRequest.getParameter("memNick"));
			memberDto.setMemBirth(mRequest.getParameter("memBirth"));
			memberDto.setMemPhone(mRequest.getParameter("memPhone"));
			memberDto.setMemGender(mRequest.getParameter("memGender"));
			
			MemberDao memberDao = new MemberDao();
			memberDao.join(memberDto);
			
			if(mRequest.getFile("attach")!=null) {
				MemberProfileDto memberProfileDto = new MemberProfileDto();
				
				memberProfileDto.setMpId(memberDto.getMemId());
				memberProfileDto.setMpSave(mRequest.getFilesystemName("attach"));
				memberProfileDto.setMpUpload(mRequest.getOriginalFileName("attach"));
				memberProfileDto.setMpType(mRequest.getContentType("attach"));
				
				File target = mRequest.getFile("attach");
				memberProfileDto.setMpSize(target == null ? 0L : target.length());
				
				MemberProfileDao memberProfileDao = new MemberProfileDao();
				memberProfileDao.insert(memberProfileDto);
			}
			
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
		}	catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
