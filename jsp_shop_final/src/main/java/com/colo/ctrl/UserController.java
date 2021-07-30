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

import com.colo.domain.CouponVO;
import com.colo.domain.UserOrderListVO;
import com.colo.domain.UserVO;
import com.colo.service.UserCouponService;
import com.colo.service.UserCouponServiceProcess;
import com.colo.service.UserService;
import com.colo.service.UserServiceProcess;

@WebServlet("/uctrl")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = LoggerFactory.getLogger(UserController.class);
	private UserService usv;
	private UserCouponService ucsv;
	private String id;
	private int mno;
	String result;

	public UserController() {
		usv = new UserServiceProcess();
		ucsv = new UserCouponServiceProcess();
	}

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		String sign = req.getParameter("sign");
		RequestDispatcher rdp;

		switch (sign) {

		/* --------- 유저모드 --------- */

		// 회원가입

		case "regist":
			boolean isUp = usv.userRegist(new UserVO(req.getParameter("id"), req.getParameter("pwd"),
					req.getParameter("name"), req.getParameter("birthday"), req.getParameter("address"),
					req.getParameter("phonenumber"), req.getParameter("email")));
			logger.info(isUp ? ">>> 회원가입 성공" : "%%% 회원가입 실패");
			if (isUp) {
				result = "registO";
				rdp = req.getRequestDispatcher("index.jsp?result=" + result);
				rdp.forward(req, resp);
			} else {
				result = "registX";
				rdp = req.getRequestDispatcher("index.jsp?view=regist&result=" + result);
				rdp.forward(req, resp);
			}
			break;

		// 로그인

		case "login":
			UserVO uvo = usv.userLogin(new UserVO(req.getParameter("id"), req.getParameter("pwd")));
			if (uvo != null) {
				HttpSession session = req.getSession();
				session.setAttribute("ses", uvo);
				session.setMaxInactiveInterval(10 * 60);
				rdp = req.getRequestDispatcher("index.jsp");
				rdp.forward(req, resp);
			} else {
				result = "loginX";
				rdp = req.getRequestDispatcher("index.jsp?view=login&result=" + result);
				rdp.forward(req, resp);
			}
			break;

		// 로그아웃

		case "logout":
			HttpSession session = req.getSession();
			session.invalidate();
			rdp = req.getRequestDispatcher("index.jsp");
			rdp.forward(req, resp);
			break;

		// 아이디 중복 체크

		case "idCheck":
			id = req.getParameter("id");
			boolean isExist = usv.dupleIdCheck(id);
			logger.info(isExist ? "%%% 아이디 중복!" : ">>> 사용가능한 아이디");
			out = resp.getWriter();
			out.print(isExist);
			break;

		// 유저 디테일페이지 표시

		case "myUpdate":
			boolean isUp3 = usv.myUpdate(new UserVO(Integer.parseInt(req.getParameter("mno")), req.getParameter("pwd"),
					req.getParameter("phonenumber"), req.getParameter("address"), req.getParameter("email")));
			logger.info(isUp3 ? ">>> 업데이트 성공!!!!" : "%%%  업데이트 실패 ㅠㅠㅠ");
			uvo = usv.udList(Integer.parseInt(req.getParameter("mno")));
			session = req.getSession();
			session.setAttribute("ses", uvo);
			session.setMaxInactiveInterval(10 * 60);
			rdp = req.getRequestDispatcher("index.jsp?view=user");
			rdp.forward(req, resp);
			break;

		// 회원 탈퇴

		case "leave":
			HttpSession session2 = req.getSession();
			session2.invalidate();
			boolean isUp4 = usv.userRemove(req.getParameter("id"));
			logger.info(isUp4 ? ">>> 회원탈퇴 성공!!!" : "%%% 회원탈퇴 실패 ㅠㅠㅠ");
			rdp = req.getRequestDispatcher("index.jsp");
			rdp.forward(req, resp);
			break;

			// 구매내역 리스트 불러오기

		case "showOrderList":
			mno = Integer.parseInt(req.getParameter("mno"));
			List<UserOrderListVO> list = usv.orderList(mno);
			logger.info(list.size() > 0 ? ">>> 리스트 출력 성공" : "%%% 리스트가 비어 있음");
			req.setAttribute("list", list);
			rdp = req.getRequestDispatcher("index.jsp?view=userOrderList");
			rdp.forward(req, resp);
			break;

		// 유저 쿠폰 리스트

		case "myCouponList":
			List<CouponVO> couponList = ucsv.myCouponList(Integer.parseInt(req.getParameter("mno")));
			logger.info(couponList.size() > 0 ? ">>> 유저 쿠폰 리스트 출력 성공" : "%%% 유저 쿠폰 리스트 비어 있음");
			req.setAttribute("couponList", couponList);
			rdp = req.getRequestDispatcher("index.jsp?view=userCouponList");
			rdp.forward(req, resp);
			break;

		/*------- 관리자 컨트롤러 -------*/

		// 관리자 리스트 목록 불러오기

		case "list":
			List<UserVO> list2 = usv.adminList();
			logger.info(list2.size() > 0 ? ">>> 리스트 출력 성공" : "%%% 리스트가 비어 있음");
			req.setAttribute("list", list2);
			rdp = req.getRequestDispatcher("index.jsp?view=admin");
			rdp.forward(req, resp);
			break;

		// 유저 업데이트(관리자)

		case "adUpdate":
			boolean isUp2 = usv.userUpdate(new UserVO(Integer.parseInt(req.getParameter("mno")), req.getParameter("id"),
					req.getParameter("pwd"), req.getParameter("name"), req.getParameter("birthday"),
					req.getParameter("phonenumber"), req.getParameter("address"), req.getParameter("signupdate"),
					Integer.parseInt(req.getParameter("pro_point")), Integer.parseInt(req.getParameter("grade")),
					req.getParameter("email")));
			logger.info(isUp2 ? ">>> 유저 업데이트 성공" : "%%%  유저 업데이트 실패!!!!!");
			rdp = req.getRequestDispatcher("uctrl?sign=list");
			rdp.forward(req, resp);
			break;

		// 유저 삭제(관리자)

		case "remove":
			String method = req.getMethod();
			if (method.equalsIgnoreCase("post")) {
				id = req.getParameter("delId");
				boolean isUp5 = usv.userRemove(id);
				logger.info(isUp5 ? ">>> 멤버 삭제 성공" : "%%% 멤버 삭제 실패");
			}
			rdp = req.getRequestDispatcher("uctrl?sign=list");
			rdp.forward(req, resp);
			break;

		// (관리자) 업데이트 디테일 리스트

		case "upList":
			mno = Integer.parseInt(req.getParameter("mno"));
			UserVO uvo2 = usv.udList(mno);
			List<CouponVO> userCoupon = ucsv.myCouponList(mno);
			req.setAttribute("uvo", uvo2);
			req.setAttribute("coupon", userCoupon);
			rdp = req.getRequestDispatcher("index.jsp?view=adUpdate");
			rdp.forward(req, resp);
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
