
import java.io.*;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.sql.DataSource;
import java.io.IOException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@SuppressWarnings("serial")
@WebServlet("/PicReader.do")
@MultipartConfig
public class PicReader extends HttpServlet {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String action = req.getParameter("action");
		if ("getMemPhoto".equals(action)) {
			Connection con = null;
			try {
				res.setContentType("image/*");
				con = ds.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(
						"SELECT MEM_pic FROM MEM WHERE MEM_NO = '" + req.getParameter("mem_no") + "'");
				ServletOutputStream out = res.getOutputStream();
				if (rs.next()) {
					BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("mem_pic"));
					byte[] buf = new byte[4 * 1024]; // 4K buffer
					int len;
					while ((len = in.read(buf)) != -1) {
						out.write(buf, 0, len);
					}
					in.close();
				} else {
					res.sendError(HttpServletResponse.SC_NOT_FOUND);
				}
				rs.close();
				stmt.close();
			} catch (Exception e) {
				System.out.println(e);
			}finally {
				try {
					if (con != null)
						con.close();
				} catch (SQLException e) {
					System.out.println(e);
				}
			}
		}
		
		
	}
	}
