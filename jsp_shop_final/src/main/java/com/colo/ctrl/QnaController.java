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

import com.colo.domain.ProductImgVO;
import com.colo.domain.ProductVO;
import com.colo.domain.QnaImgVO;
import com.colo.domain.QnaVO;
import com.colo.orm.FtpProcessor_qna;
import com.colo.service.QnaService;
import com.colo.service.QnaServiceProcessor;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/qctrl")
public class QnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = LoggerFactory.getLogger(QnaController.class);
	private QnaService qsv;

	public QnaController() {
		qsv = new QnaServiceProcessor();
	}

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("utf-8");

		String sign = req.getParameter("sign");
		int qno = 0;
		QnaVO qvo;

		switch (sign) {
		case "regist":
			int maxSize = 1024 * 1024 * 3; // 3MB
			String realPath = req.getServletContext().getRealPath("/qna_images/");
			File dir = new File(realPath);
			if (!dir.exists())
				dir.mkdirs();
			try {
				MultipartRequest multi = new MultipartRequest(req, realPath, maxSize, "UTF-8",
						new DefaultFileRenamePolicy());
				FtpProcessor_qna fp = new FtpProcessor_qna();
				boolean isUp = qsv.qnaRegist(fp.qnaSaveContent(multi));
				Enumeration files = multi.getFileNames();

				String item = (String) files.nextElement(); // 파일객체 정보 가져오기
				String fileName = multi.getFilesystemName(item); // 그 객체에서 파일이름 추출
				logger.info("_______item_________" + item);
				logger.info("_______filename_________" + fileName);
				if (isUp && fileName != null) {
					boolean isUp2 = qsv.qnaImgRegist(fp.qnaSaveFile(multi, realPath));
					logger.info(isUp2 ? ">> QnA 이미지 등록 성공~" : "%% QnA 이미지 등록 실패!");
				}

				logger.info(isUp ? ">> QnA 등록 성공~" : "%% QnA 등록 실패!");
				int pno = Integer.parseInt(multi.getParameter("pno"));
				RequestDispatcher rdp = req.getRequestDispatcher("./ProductController?sign=detail&pno=" + pno);
				rdp.forward(req, res);
			} catch (IOException e) {
				e.printStackTrace();
			}
			break;

		case "listToReg":
			req.setAttribute("pno", Integer.parseInt(req.getParameter("pno")));
			req.setAttribute("title", req.getParameter("title"));
			req.setAttribute("qna_writer", req.getParameter("qna_writer"));
			RequestDispatcher rdpToReg = req.getRequestDispatcher("index.jsp?view=qreg");
			rdpToReg.forward(req, res);
			break;

		case "detail1":
			qno = Integer.parseInt(req.getParameter("qno"));
			qvo = qsv.qnaDetail(qno);
			req.setAttribute("qvo", qvo);
			RequestDispatcher rdpMod1 = req.getRequestDispatcher("index.jsp?view=qpwd");
			rdpMod1.forward(req, res);
			break;
			
		case "detail2":
			qno = Integer.parseInt(req.getParameter("qno"));
			List<QnaImgVO> imgList = qsv.QnaImgList(qno);
			qvo = qsv.qnaDetail(qno);
			req.setAttribute("qvo", qvo);
			req.setAttribute("imgList", imgList);
			logger.info(qvo != null ? ">>> Qna 상세조회 성공" : "%%% Qna 상세조회 실패!");
			if (req.getParameter("qna_pwd").equals(qvo.getQna_pwd())) {
				RequestDispatcher rdpDetail = req.getRequestDispatcher("index.jsp?view=qdetail");
				rdpDetail.forward(req, res);
			} else {
				RequestDispatcher rdpMod2 = req.getRequestDispatcher("index.jsp?view=qfail");
				rdpMod2.forward(req, res);
			}
			break;

		case "remove":
			qno = Integer.parseInt(req.getParameter("qno"));
			int pno = Integer.parseInt(req.getParameter("pno"));
			boolean isDel = qsv.qnaRemove(qno);
			logger.info(isDel ? ">>> Qna 삭제 성공!" : "%%% Qna 삭제 실패!");
			RequestDispatcher rdpDel = req.getRequestDispatcher("./ProductController?sign=detail&pno=" + pno);
			rdpDel.forward(req, res);
			break;

		case "modify":
			qno = Integer.parseInt(req.getParameter("qno"));
			qvo = qsv.qnaDetail(qno);
			req.setAttribute("qvo", qvo);
			RequestDispatcher rdpMod = req.getRequestDispatcher("index.jsp?view=qmod");
			rdpMod.forward(req, res);
			break;

		case "modifySave":
			if (req.getMethod().equalsIgnoreCase("post")) {
				qno = Integer.parseInt(req.getParameter("qno"));
				boolean isUp2 = qsv.qnaEdit(new QnaVO(qno, req.getParameter("qna_category"),
						req.getParameter("qna_content"), req.getParameter("qna_pwd")));
				logger.info(isUp2 ? ">>> Qna수정 성공" : "%%% Qna수정 실패");
				RequestDispatcher rdpUp = req.getRequestDispatcher("qctrl?sign=detail&qno=" + qno);
				rdpUp.forward(req, res);
			}
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
