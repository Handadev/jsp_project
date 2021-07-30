package com.colo.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.colo.domain.CartVO;
import com.colo.domain.CouponVO;
import com.colo.domain.MnoPnoVO;
import com.colo.domain.ProductImgVO;
import com.colo.domain.ProductVO;
import com.colo.domain.UserOrderListVO;
import com.colo.domain.UserVO;
import com.colo.orm.FtpProcessor_product;
import com.colo.service.CartService;
import com.colo.service.CartServiceProcessor;
import com.colo.service.ProductService;
import com.colo.service.ProductServiceProcessor;
import com.colo.service.UserCouponService;
import com.colo.service.UserCouponServiceProcess;
import com.colo.service.UserService;
import com.colo.service.UserServiceProcess;

@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = LoggerFactory.getLogger(CartController.class);
	private UserCouponService ucsv;
	private UserService usv;
	private CartService cartsv;
	private int mno;

	public CartController() {
		cartsv = new CartServiceProcessor();
		ucsv = new UserCouponServiceProcess();
		usv = new UserServiceProcess();
	}

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("utf-8");
		String sign = req.getParameter("sign");

		switch (sign) {
		case "cartRegist":
			int pno = Integer.parseInt(req.getParameter("pno"));
			mno = Integer.parseInt(req.getParameter("mno"));
			MnoPnoVO mpvo = new MnoPnoVO(mno,pno);
			boolean isExist = cartsv.dupleCheck(mpvo);
			if (isExist) {
				boolean isUp = cartsv.onlyQuantityIncrement(pno);
				logger.info(isUp ? "$$$ 성공-수량만 증가" : "!!! 실패-수량만 증가");
				RequestDispatcher rdp = req.getRequestDispatcher("ProductController?sign=detail");
				rdp.forward(req, res);
			} else {
				boolean isUp = cartsv.cartRegist(new CartVO(pno, 
						req.getParameter("imgfile"), 
						req.getParameter("title"),
						Integer.parseInt(req.getParameter("price")),
						Integer.parseInt(req.getParameter("mno"))));
				logger.info(isUp ? "$$$ 성공-장바구니 등록" : "!!! 실패-장바구니 등록");
				RequestDispatcher rdp = req.getRequestDispatcher("ProductController?sign=detail");
				rdp.forward(req, res);
			}
			break;
			
		case "cartList":
			mno = Integer.parseInt(req.getParameter("mno"));
			logger.info("!!! mno : " + mno);
			List<CartVO> list = cartsv.cartList(mno);
			logger.info(list.size() > 0 ? "$$$ 성공-장바구니 리스트 출력" : "!!! 실패-장바구니 리스트 출력");
			req.setAttribute("list", list);
			RequestDispatcher rdpCartList = req.getRequestDispatcher("index.jsp?view=clist");
			rdpCartList.forward(req, res);
			break;
			
		case "payList":
			mno = Integer.parseInt(req.getParameter("mno"));
			logger.info("!!! mno : " + mno);
			List<CartVO> payList = cartsv.payList(mno);
			List<CouponVO> userCoupon = ucsv.myCouponList(mno);
			logger.info(payList.size() > 0 ? "$$$ 성공-결제 리스트 출력" : "!!! 실패-결제 리스트 출력");
			req.setAttribute("payList", payList);
			req.setAttribute("userCoupon", userCoupon);
			RequestDispatcher rdpPayList = req.getRequestDispatcher("index.jsp?view=payList");
			rdpPayList.forward(req, res);
			break;
		case "cartRemove":
			if (req.getMethod().equalsIgnoreCase("post")) {
				int cnoRemove = Integer.parseInt(req.getParameter("cartno"));
				boolean isUpRemove = cartsv.cartRemove(cnoRemove);
				int mno2 = Integer.parseInt(req.getParameter("mno"));
				logger.info(isUpRemove ? "$$$ 성공-카트 삭제" : "!!! 실패-카트 삭제");
				RequestDispatcher rdpRemove = req.getRequestDispatcher("CartController?sign=cartList&mno" + mno2);
				rdpRemove.forward(req, res);
			}
			break;
			
		case "payRemove":
			if (req.getMethod().equalsIgnoreCase("post")) {
				int mno = Integer.parseInt(req.getParameter("mno"));
				boolean isUpRemove = cartsv.payRemove(mno);
				logger.info(isUpRemove ? "$$$ 성공-결제 후 카트 삭제" : "!!! 실패-결제 후 카트 삭제");
				
				if (req.getParameter("cpno").equals("")) {
				} else {
					int cpno = Integer.parseInt(req.getParameter("cpno"));
					boolean isCouponRemove = ucsv.couponRemove(cpno);
					logger.info(isCouponRemove ? "$$$ 성공-결제 후 쿠폰 삭제" : "!!! 실패-결제 후 쿠폰 삭제");
				}
				//orderlist 추가
				String productName = req.getParameter("productName");
				int totalPrice = Integer.parseInt(req.getParameter("totalPrice"));
				boolean isOrderUp = usv.addOrderList(new UserOrderListVO(mno, totalPrice, productName));
				logger.info(isOrderUp ? "$$$ 성공-유저 결제 내역에 추가" : "!!! 실패-결제 내역에 추가 실패");
			}
			break;

		case "quantityIncrement":
			int cartno = Integer.parseInt(req.getParameter("cartno"));
			boolean isUp2 = cartsv.quantityIncrement(cartno);
			logger.info(isUp2 ? "$$$ 성공-수량 증가" : "!!! 실패-수량 증가");
			break;
			
		case "quantityDecrement":
			int cartno2 = Integer.parseInt(req.getParameter("cartno"));
			boolean isUp3 = cartsv.quantitydecrement(cartno2);
			logger.info(isUp3 ? "$$$ 성공-수량 감소" : "!!! 실패-수량 감소");
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
