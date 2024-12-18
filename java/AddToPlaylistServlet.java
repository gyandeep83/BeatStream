import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.musicwebsite.dao.PlaylistDAO;

@WebServlet("/AddToPlaylistServlet")
public class AddToPlaylistServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Validate session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve form data
        String songIdParam = request.getParameter("songId");
        String playlistIdParam = request.getParameter("playlistId");

        // Validate inputs
        if (songIdParam == null || playlistIdParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input");
            return;
        }

        try {
            int songId = Integer.parseInt(songIdParam);
            int playlistId = Integer.parseInt(playlistIdParam);

            // Add song to the playlist
            boolean success = false;
			try {
				success = PlaylistDAO.addSongToPlaylist(songId, playlistId);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

            if (success) {
                response.sendRedirect("PlaylistServlet?view=songs");
            } else {
                request.setAttribute("errorMessage", "Failed to add song to the playlist.");
                request.getRequestDispatcher("songs.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server error");
        }
    }
}
