package pack1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnection.DbConnection;

/**
 * Servlet implementation class Fac_Personal_detail
 */
@WebServlet("/Fac_Personal_detail")
public class Fac_Personal_detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fac_Personal_detail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname=request.getParameter("fullname");
		String add=request.getParameter("add");
		String pno=request.getParameter("pno");
		String email=request.getParameter("email");
		String bdate=request.getParameter("bdate");
		
		String gender=request.getParameter("gender");
		String bno=request.getParameter("bno");
		String ano=request.getParameter("ano");
		String panno=request.getParameter("panno");
		String des=request.getParameter("des");
		Connection cn=DbConnection.getConnection();
		HttpSession session=request.getSession();
		//session.setAttribute("email",email);
		PreparedStatement stmt;
		try {
			stmt = cn.prepareStatement("INSERT INTO `detection`.`fac_personal` (`fid`, `full_name`, `add`, `pno`, `mailid`, `bdate`, `gender`, `bno`, `ano`, `pan_no`, `designation`, `status`) "
					+ "VALUES (NULL, '"+fullname+"', '"+add+"', '"+pno+"', '"+email+"', '"+bdate+"', '"+gender+"', '"+bno+"', '"+ano+"', '"+panno+"', '"+des+"', '"+0+"')");
			stmt.executeUpdate();			
			RequestDispatcher rd=request.getRequestDispatcher("facultyOrgDetail.jsp?p=p");
			rd.forward(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		}

		
	}

}
