package wishFit.servlet.fitgroup;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import wishFit.beans.fitgroup.FitgroupDao;
import wishFit.beans.fitgroup.FitgroupDto;
import wishFit.beans.fitgroupimage.FitgroupImageDao;
import wishFit.beans.fitgroupimage.FitgroupImageDto;
import wishFit.util.CommonSql;
import wishFit.util.JdbcUtils;

@WebServlet(urlPatterns = "/page/fitgroup/write.kh")
public class FitWriteServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Connection conn = JdbcUtils.connect();
			conn.setAutoCommit(false);
			
			//저장될 위치D:\wishfit
			String savePath = "D:/upload/wishfit";
			int maxSize = 10* 1024 * 1024; //10메가
			String encoding = "UTF-8";
			//중복된 이름을 처리하기 위한 객체
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();//이름을 바꿔줌
			MultipartRequest mRequest = 
					new MultipartRequest(req, savePath,maxSize,encoding, policy);
			
			// (카테고리+제목 + 내용 + 시작시간 + 끝나는시간 + 장소)
			
			
			FitgroupDto fitgroupDto = new FitgroupDto();
			// fitgroupDto.setFgId((String)req.getSession().getAttribute("uid"));
			fitgroupDto.setFgId(mRequest.getParameter("fgId"));
			fitgroupDto.setExcateName(mRequest.getParameter("excateName"));
			fitgroupDto.setFgTitle(mRequest.getParameter("fgTitle"));
			fitgroupDto.setFgIntro(mRequest.getParameter("fgIntro"));
			fitgroupDto.setFgStarttime(mRequest.getParameter("fgStarttime"));
			fitgroupDto.setFgEndtime(mRequest.getParameter("fgEndtime"));
			fitgroupDto.setFgLocation(mRequest.getParameter("fgLocation"));
			fitgroupDto.setFgLatitude(mRequest.getParameter("fgLatitude"));
			fitgroupDto.setFgLongtitude(mRequest.getParameter("fgLongitude"));
			
			FitgroupDao fitgroupDao = new FitgroupDao();

			//상세보기로 이동하기 위한 스퀸스 구하기
			int fgNo = CommonSql.getSequence("fitgroup_seq"); // 시퀸스를 이용해서 번호로를 알아낸다
			fitgroupDto.setFgNo(fgNo);
			fitgroupDao.write(fitgroupDto);
			
			//파일등록이 존재할 경우만
			if(mRequest.getFile("fgImage")!= null) {
				FitgroupImageDto fitgroupImageDto  = new FitgroupImageDto();
				fitgroupImageDto.setFgNo(fgNo);//소모임 번호
				fitgroupImageDto.setFgImageSave(mRequest.getFilesystemName("fgImage"));//저장한 이름
				fitgroupImageDto.setFgImageUpload(mRequest.getOriginalFileName("fgImage"));//업로드 이름
				fitgroupImageDto.setFgImageType(mRequest.getContentType("fgImage")); // 이미지 타입
				File target = mRequest.getFile("fgImage");
				fitgroupImageDto.setFgImageSize(target.length()); //파일 크기
				
				FitgroupImageDao fitgroupImageDao = new FitgroupImageDao();
				int fgImageNo = CommonSql.getSequence("fitgroupimage_seq"); 
				fitgroupImageDto.setFgImageNo(fgImageNo);
				
				fitgroupImageDao.insert(fitgroupImageDto);
				System.out.println("fitImageNo    :"+fitgroupImageDto.getFgImageNo());
			}
			conn.commit();
			resp.sendRedirect("detail.jsp?fgNo=" + fgNo);

		} catch (Exception e) {
			e.printStackTrace();// 에러메세지의 근원을 찾아서 단계별로 알려준다
			resp.sendError(500); // 오류발생시 500번으로 이동시킨다

		}

	}
}
