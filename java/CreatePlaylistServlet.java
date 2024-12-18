import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.musicwebsite.dao.PlaylistDAO;
import com.musicwebsite.dao.UserDAO;

@WebServlet("/createPlaylist")
@MultipartConfig
public class CreatePlaylistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        String playlistName = request.getParameter("playlistName");
        Part playlistImagePart = request.getPart("playlistImage");
        String imagePath = null;

        // Debug: Check values of extracted parameters
        System.out.println("Username: " + username);
        System.out.println("Playlist Name: " + playlistName);

        if (playlistImagePart != null && playlistImagePart.getSize() > 0) {
            String fileName = playlistImagePart.getSubmittedFileName();
            String uploadDir = getServletContext().getRealPath("/uploads");
            File uploadsDir = new File(uploadDir);
            if (!uploadsDir.exists()) {
                uploadsDir.mkdir();
            }
            File file = new File(uploadsDir, fileName);
            playlistImagePart.write(file.getAbsolutePath());
            
            // Save the image path without the leading slash
            imagePath = "uploads/" + fileName;

            // Debug: Check file path
            System.out.println("Image Path: " + imagePath);
        }

        try {
            int userId = UserDAO.getUserIdByUsername(username);
            
            // Debug: Check userId before database operation
            System.out.println("User ID: " + userId);

            if (userId == 0) {
                System.out.println("Invalid user ID retrieved.");
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Invalid user ID.");
                return;
            }

            PlaylistDAO.createPlaylist(userId, playlistName, imagePath);
            response.sendRedirect("PlaylistServlet");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error while creating playlist.");
        }
    }
}
