import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.musicwebsite.dao.UserDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    // Handle GET requests
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to login page or show login form (if needed)
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    // Handle POST requests (for user login submission)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Call DAO to validate user
        if (UserDAO.validateUser(username, password)) {
            // If user is valid, create a session
            HttpSession session = request.getSession();  // Create a new session or return an existing one
            session.setAttribute("username", username);  // Store the username in the session
            response.sendRedirect("homepage.jsp");  // Redirect to homepage after successful login
        } else {
            // If user is not valid, send back to login page with error message
            request.setAttribute("errorMessage", "Invalid credentials");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
