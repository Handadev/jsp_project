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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.CouponVO;
import com.colo.domain.UserVO;
import com.colo.service.CouponService;
import com.colo.service.CouponServiceProcess;
import com.colo.service.UserService;
import com.colo.service.UserServiceProcess;

@WebServlet("/couponctrl")
public class CouponController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = LoggerFactory.getLogger(CouponController.class);
	CouponService coupsv;
	UserService usv;
	boolean isUp;

	public CouponController() {
		coupsv = new CouponServiceProcess();
		usv = new UserServiceProcess();
	}

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("utf-8");

		String sign = req.getParameter("sign");
		RequestDispatcher rdp;
		CouponVO cvo = null;

		switch (sign) {
		
		// 쿠폰 등록
		case "regist":
			isUp = coupsv.couponRegist(new CouponVO(req.getParameter("couponName"), req.getParameter("couponEndDate"),
					Integer.parseInt(req.getParameter("couponDiscount"))));
			logger.info(isUp ? ">>> 쿠폰 등록 성공" : "XXX 쿠폰 등록 실패");
			break;
		
		// 등록한 쿠폰 정보보기 - 쿠폰 regist에서 ajax 동작. 마지막으로 등록된 쿠폰 객체 가져와서 json으로 넘김
		case "info":
			int lastRegCouponNumber = coupsv.couponInfo();
			if (lastRegCouponNumber > 0) 
			cvo = coupsv.couponDetail(lastRegCouponNumber);
			int cpno = cvo.getCpno();
			String name = cvo.getCp_name();
			String endDate = cvo.getCp_enddate();
			int discount = cvo.getCp_discount();
			
			JSONObject data = new JSONObject();
			
			data.put("cpno", cpno);
			data.put("name", name);
			data.put("endDate", endDate);
			data.put("discount", discount);

			String jsonData = data.toJSONString();
			PrintWriter out = res.getWriter();
			out.print(jsonData);
			break;
		
		// 쿠폰 삭제
		case "delete":
			isUp = coupsv.couponDelete(Integer.parseInt(req.getParameter("cpno")));
			logger.info(isUp ? ">>> 쿠폰 삭제 성공" : "XXX 쿠폰 삭제 실패");
			rdp = req.getRequestDispatcher("couponctrl?sign=list");
			rdp.forward(req, res);
			break;
			
		// 쿠폰 리스트
		case "list":
			List<CouponVO> list = coupsv.couponList();
			logger.info(list.size() > 0 ? ">>> 쿠폰 리스트 가져오기 성공" : "XXX 쿠폰 리스트 가져오기 실패");
			req.setAttribute("couponList", list);
			rdp = req.getRequestDispatcher("index.jsp?view=couponList");
			rdp.forward(req, res);
			break;
		
		// 쿠폰 정보 변경 페이지 이동
		case "modify":
			cvo = coupsv.couponDetail(Integer.parseInt(req.getParameter("cpno")));
			logger.info(cvo != null ? ">>> 쿠폰 정보 가져오기 성공" : "XXX 쿠폰 정보 가져오기 실패");
			req.setAttribute("couponDetail", cvo);
			rdp = req.getRequestDispatcher("index.jsp?view=couponModify"); 
			rdp.forward(req, res);
			break;
		
		// 쿠폰 정보 변경 저장
		case "modifySave":
			isUp = coupsv
					.couponEdit(new CouponVO(Integer.parseInt(req.getParameter("cpno")), req.getParameter("couponName"),
							req.getParameter("couponEndDate"), Integer.parseInt(req.getParameter("couponDiscount"))));
			logger.info(isUp ? ">>> 쿠폰 수정 성공" : "XXX 쿠폰 수정 실패");
			rdp = req.getRequestDispatcher("couponctrl?sign=list");
			rdp.forward(req, res);
			break;
			
		// 유저 쿠폰 적용 프론트 화면
		case "apply": 
			cvo = coupsv.couponDetail(Integer.parseInt(req.getParameter("cpno")));
			List<UserVO> userList = usv.adminList();
			req.setAttribute("couponDetail", cvo);
			req.setAttribute("userList", userList);
			rdp = req.getRequestDispatcher("index.jsp?view=couponApply"); 
			rdp.forward(req, res);
			break;
		
		// 유저 쿠폰 적용 - 작동 설명 couponAdd에 있음
		case "applySave": 
			isUp = coupsv.couponAdd(Integer.parseInt(req.getParameter("mno")),
									Integer.parseInt(req.getParameter("cpno")));
			
			logger.info(isUp ? ">>> 쿠폰 유저 적용 성공" : "XXX 쿠폰 유저 적용 실패");
			rdp = req.getRequestDispatcher("./uctrl?sign=list"); 
			rdp.forward(req, res);
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
