/*
 * package edu.kh.hotellala.reservationCheck.controller;
 * 
 * import java.io.IOException; import java.util.List;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession;
 * 
 * import edu.kh.hotellala.member.model.vo.Member; import
 * edu.kh.hotellala.reservation.model.vo.Payment; import
 * edu.kh.hotellala.reservation.model.vo.ReservationRequest; import
 * edu.kh.hotellala.reservationCheck.model.service.ReservationCheckService;
 * import edu.kh.hotellala.reservationCheck.model.vo.Refund;
 * 
 * @WebServlet("/reservation/c") public class ReservationCancelCheckServlet
 * extends HttpServlet{
 * 
 * @Override protected void doGet(HttpServletRequest req, HttpServletResponse
 * resp) throws ServletException, IOException {
 * 
 * // 취소 내역 조회 String path =
 * "/WEB-INF/views/reservationCancel/reservationCancelCheck.jsp";
 * req.getRequestDispatcher(path).forward(req, resp);
 * 
 * }
 * 
 * @Override protected void doPost(HttpServletRequest req, HttpServletResponse
 * resp) throws ServletException, IOException {
 * 
 * try {
 * 
 * HttpSession session = req.getSession();
 * 
 * // 파라미터 변수 저장 String refundReason = req.getParameter("refundReason");
 * 
 * System.out.println(refundReason);
 * 
 * int memberNo = 0; int paymentNo = 0;
 * 
 * if(session.getAttribute("loginMember") != null) {
 * 
 * Member member = (Member)(session.getAttribute("loginMember")); memberNo =
 * member.getMemberNo();
 * 
 * Payment payment = (Payment)(session.getAttribute("paymentNo")); paymentNo =
 * payment.getPaymentNo();
 * 
 * // VO Refund refund = new Refund();
 * 
 * refund.setPaymentNo(paymentNo); refund.setMemberNo(memberNo);
 * refund.setRefundReason(refundReason);
 * 
 * if(refund != null) { session.setAttribute("refund", refund); }
 * 
 * // Service ReservationCheckService service = new ReservationCheckService();
 * 
 * // 취소 내역 조회 List<Refund> cancelCheckList =
 * service.reservationCancelCheck(refund, refundReason);
 * 
 * 
 * req.setAttribute("cancelCheckList", cancelCheckList);
 * 
 * 
 * //new Gson().toJson(checkList, resp.getWriter()); String path =
 * "/WEB-INF/views/reservationCheck/reservationCancelCheck.jsp";
 * req.getRequestDispatcher(path).forward(req, resp);
 * 
 * }
 * 
 * 
 * } catch (Exception e) { e.printStackTrace(); } } }
 */