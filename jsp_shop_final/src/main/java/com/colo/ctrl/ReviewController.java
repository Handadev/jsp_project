package com.colo.ctrl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.QnaVO;
import com.colo.domain.ReviewImgVO;
import com.colo.domain.ReviewMyVO;
import com.colo.domain.ReviewVO;
import com.colo.orm.FtpProcessor_qna;
import com.colo.service.ReviewService;
import com.colo.service.ReviewServiceProcessor;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/rctrl")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = LoggerFactory.getLogger(ReviewController.class);
	private ReviewService rsv;

	public ReviewController() {
		rsv = new ReviewServiceProcessor();
	}

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("utf-8");

		String sign = req.getParameter("sign");
		int rno = 0;
		int pno = 0;
		ReviewVO rvo;

		switch (sign) {
		case "regist":
			int maxSize = 1024 * 1024 * 3; // 3MB
			String realPath = req.getServletContext().getRealPath("/rev_images/");
			File dir = new File(realPath);
			if (!dir.exists())
				dir.mkdirs();
			try {
				MultipartRequest multi = new MultipartRequest(req, realPath, maxSize, "UTF-8",
						new DefaultFileRenamePolicy());
				FtpProcessor_qna fp = new FtpProcessor_qna();
				boolean isUp = rsv.revRegist(fp.revSaveContent(multi));
				Enumeration files = multi.getFileNames();
				String item = (String) files.nextElement(); // 파일객체 정보 가져오기
				String fileName = multi.getFilesystemName(item); // 그 객체에서 파일이름 추출
				if (isUp && fileName != null) {
					boolean isUp2 = rsv.revImgRegist(fp.revSaveFile(multi, realPath));
					logger.info(isUp2 ? ">> Review 이미지 등록 성공~" : "%% Review 이미지 등록 실패!");
				}
				logger.info(isUp ? ">> Review 등록 성공~" : "%% Review 등록 실패!");
				pno = Integer.parseInt(multi.getParameter("pno"));
				RequestDispatcher rdp = req.getRequestDispatcher("./ProductController?sign=detail&pno=" + pno);
				rdp.forward(req, res);
			} catch (IOException e) {
				e.printStackTrace();
			}

			break;
		case "modify":
			rno = Integer.parseInt(req.getParameter("rno"));
			pno = Integer.parseInt(req.getParameter("pno"));
			rvo = rsv.revDetail(rno);
			req.setAttribute("rvo", rvo);
			req.setAttribute("pno", pno);
			RequestDispatcher rdpMod = req.getRequestDispatcher("index.jsp?view=rmod");
			rdpMod.forward(req, res);
			break;

		case "modifySave":
			if (req.getMethod().equalsIgnoreCase("post")) {
				rno = Integer.parseInt(req.getParameter("rno"));
				pno = Integer.parseInt(req.getParameter("pno"));
				boolean isUp2 = rsv.revEdit(new ReviewVO(rno, req.getParameter("rev_content")));
				logger.info(isUp2 ? ">>> Review 수정 성공" : "%%% Review 수정 실패");
				RequestDispatcher rdpUp = req.getRequestDispatcher("./ProductController?sign=detail&pno=" + pno);
				rdpUp.forward(req, res);
			}
			break;

		case "remove":
			rno = Integer.parseInt(req.getParameter("rno"));
			logger.info("pno -------------" + req.getParameter("pno"));
			pno = Integer.parseInt(req.getParameter("pno"));
			boolean isDel = rsv.revRemove(rno);
			logger.info(isDel ? ">>> Review 삭제 성공!" : "%%% Review 삭제 실패!");
			RequestDispatcher rdpDel = req.getRequestDispatcher("./ProductController?sign=detail&pno=" + pno);
			rdpDel.forward(req, res);
			break;

		case "mylist":
			String writer = req.getParameter("rev_writer");
			List<ReviewMyVO> myList = rsv.revMyList(writer);
			List<ReviewImgVO> imgList2 = rsv.revMyImgList();
			logger.info(myList.size() > 0 ? ">> 나의 Review 리스트 추가 성공~" : "%% 나의 Review 리스트 추가 실패!");
			logger.info(imgList2.size() > 0 ? ">> Review img 리스트 추가 성공~" : "%% Review img리스트 추가 실패!");
			req.setAttribute("myRevList", myList);
			req.setAttribute("revImgList2", imgList2);
			RequestDispatcher rdpMyList = req.getRequestDispatcher("index.jsp?view=rmlist");
			rdpMyList.forward(req, res);
			break;
			
		case "myModify":
			rno = Integer.parseInt(req.getParameter("rno"));
			String rev_writer = req.getParameter("rev_writer");
			rvo = rsv.revDetail(rno);
			req.setAttribute("rvo", rvo);
			req.setAttribute("rev_writer", rev_writer);
			RequestDispatcher rdpMyMod = req.getRequestDispatcher("index.jsp?view=rmymod");
			rdpMyMod.forward(req, res);
			break;

		case "myModifySave":
			if (req.getMethod().equalsIgnoreCase("post")) {
				rno = Integer.parseInt(req.getParameter("rno"));
				String rev_writer2 = req.getParameter("rev_writer");
				boolean isUp2 = rsv.revEdit(new ReviewVO(rno, req.getParameter("rev_content")));
				logger.info(isUp2 ? ">>> Review 수정 성공" : "%%% Review 수정 실패");
				RequestDispatcher rdpUp = req.getRequestDispatcher("./rctrl?sign=mylist&rev_writer=" + rev_writer2);
				rdpUp.forward(req, res);
			}
			break;

		case "myRemove":
			rno = Integer.parseInt(req.getParameter("rno"));
			String rev_writer3 = req.getParameter("rev_writer");
			boolean isDel2 = rsv.revRemove(rno);
			logger.info(isDel2 ? ">>> Review 삭제 성공!" : "%%% Review 삭제 실패!");
			RequestDispatcher rdpMyDel = req.getRequestDispatcher("./rctrl?sign=mylist&rev_writer=" + rev_writer3);
			rdpMyDel.forward(req, res);
			break;

		default:
			break;
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

}
