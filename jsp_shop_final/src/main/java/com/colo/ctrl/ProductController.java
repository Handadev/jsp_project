package com.colo.ctrl;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.ProductImgVO;
import com.colo.domain.ProductVO;
import com.colo.domain.QnaVO;
import com.colo.domain.ReviewImgVO;
import com.colo.domain.ReviewVO;
import com.colo.orm.FtpProcessor_product;
import com.colo.service.ProductService;
import com.colo.service.ProductServiceProcessor;
import com.colo.service.QnaService;
import com.colo.service.QnaServiceProcessor;
import com.colo.service.ReviewService;
import com.colo.service.ReviewServiceProcessor;

@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = LoggerFactory.getLogger(ProductController.class);

	private ProductService psv;
	private QnaService qsv;
	private ReviewService rsv;
   
	public ProductController() {
		psv = new ProductServiceProcessor();
		qsv = new QnaServiceProcessor();
		rsv = new ReviewServiceProcessor();
	}

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("utf-8");

		String sign = req.getParameter("sign");

		switch (sign) {
		case "regist":
			FtpProcessor_product fp = new FtpProcessor_product();
			boolean isUp = psv.productRegist(fp.saveFile(req));
			logger.info(isUp ? "$$$ 성공-상품등록" : "!!! 실패-상품등록");
			RequestDispatcher rdp = req.getRequestDispatcher("ProductController?sign=list");
			rdp.forward(req, res);
			break;
			
		case "list":
			List<ProductVO> list = psv.productList();
			logger.info(list.size() > 0 ? "$$$ 성공-상품조회" : "!!! 실패-상품조회");
			req.setAttribute("list", list);
			RequestDispatcher rdpList = req.getRequestDispatcher("index.jsp?view=plist");
			rdpList.forward(req, res);
			break;
			
			
		case "detail":
			/*
			 * HttpSession session = req.getSession(); session.getAttribute("ses");
			 * 
			 * int pno = Integer.parseInt(req.getParameter("pno")); List<ProductImgVO>
			 * imgList = psv.imgList(pno); ProductVO pvo = psv.productInfo(pno);
			 * logger.info(pvo == null ? "!!! 실패-상품 상세조회" : "$$$ 성공-상품 상세조회");
			 * req.setAttribute("pvo", pvo); req.setAttribute("imgList", imgList);
			 * RequestDispatcher rdpDetail =
			 * req.getRequestDispatcher("index.jsp?view=pdetail"); rdpDetail.forward(req,
			 * res);
			 */
			
			HttpSession session = req.getSession();
	         session.getAttribute("ses");
	         int pno = Integer.parseInt(req.getParameter("pno"));

	         List<ProductImgVO> imgList = psv.imgList(pno);
	         ProductVO pvo = psv.productInfo(pno);
	         logger.info(pvo == null ? "!!! 실패-상품 상세조회" : "$$$ 성공-상품 상세조회");
	         req.setAttribute("pvo", pvo);
	         req.setAttribute("imgList", imgList);

	         // 리뷰 리스트 불러오기
	         List<ReviewVO> revList = rsv.revList(pno);
	         for (int i = 0; i < revList.size(); i++) {
	            int rno = revList.get(i).getRno();
	            List<ReviewImgVO> revImgList = rsv.revImgList(rno);
	            revList.get(i).setRev_imglist(revImgList);
	         }
	         logger.info(revList.size() > 0 ? ">> Review 리스트 추가 성공~" : "%% Review 리스트 추가 실패!");
	         req.setAttribute("revList", revList);

	         // Qna 리스트 불러오기
	         List<QnaVO> qnaList = qsv.qnaList(pno);
	         logger.info(qnaList.size() > 0 ? ">> QnA 리스트 추가 성공~" : "%% QnA 리스트 추가 실패!");
	         req.setAttribute("qnaList", qnaList);

	         RequestDispatcher rdpDetail = req.getRequestDispatcher("index.jsp?view=pdetail");
	         rdpDetail.forward(req, res);
			

	         
			break;

		case "modify":
			int pnoModify = Integer.parseInt(req.getParameter("pno"));
			ProductVO pvoModify = psv.productInfo(pnoModify);
			List<ProductImgVO> imgList2 = psv.imgList(pnoModify);
			logger.info(pvoModify == null ? "$$$ 실패-수정창 보기 완료" : "!!! 성공-수정창 보기 완료");
			req.setAttribute("pvoModify", pvoModify);
			req.setAttribute("imgList", imgList2);
			RequestDispatcher rdpModify = req.getRequestDispatcher("index.jsp?view=pmodify");
			rdpModify.forward(req, res);
			break;

		case "modifySave":
			if (req.getMethod().equalsIgnoreCase("post")) {
				FtpProcessor_product fp2 = new FtpProcessor_product();
				int pnoModifySave = Integer.parseInt(req.getParameter("pno"));
				int mno = Integer.parseInt(req.getParameter("mno"));
				// pno에 해당하는 이미지 파일 테이플 select imagename from tbl_imgfile where pno = ?
				// 파일질라와 image 테이블만 지워야함
				// productRemove는 파일질라, product, image 다 지움
				boolean isRemove = psv.fileRemove(pnoModifySave);
				boolean isUpModifySave = psv.productEdit(fp2.modifyFile(req, pnoModifySave), mno);
				logger.info(isUpModifySave ? "$$$ 상품수정 성공" : "!!! 상품수정 실패");
				List<ProductImgVO> imgList3 = psv.imgList(pnoModifySave);
				req.setAttribute("imgList", imgList3);
				RequestDispatcher rdp4 = req.getRequestDispatcher("ProductController?sign=detail&pno=" + pnoModifySave);
				rdp4.forward(req, res);
			}
			break;

		case "remove":
			if (req.getMethod().equalsIgnoreCase("post")) {
				int pnoRemove = Integer.parseInt(req.getParameter("pno"));
				boolean isUpRemove = psv.productRemove(pnoRemove);
				logger.info(isUpRemove ? "$$$ 성공-상품 삭제" : "!!! 실패-상품 삭제");
				RequestDispatcher rdpRemove = req.getRequestDispatcher("ProductController?sign=list");
				rdpRemove.forward(req, res);
			}
			break;
			
		case "search":
	         String title = req.getParameter("title");
	         List<ProductVO> list2 = psv.productSearch(title);
	         logger.info(list2.size() > 0 ? ">>> 검색 결과 출력 성공!!!!!" : "%%% 검색 결과 출력 실패 ㅠㅠㅠㅠ");
	         req.setAttribute("searchList", list2);
	         RequestDispatcher rdp4 = req.getRequestDispatcher("index.jsp?view=search");
	         rdp4.forward(req, res);
	         break;

		default:
			break;
		}
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		service(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		service(req, res);
	}

}
