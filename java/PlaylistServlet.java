import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;  // <-- Added import for ArrayList
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.musicwebsite.dao.PlaylistDAO;
import com.musicwebsite.dao.SongDAO;
import com.musicwebsite.dao.UserDAO;
import com.musicwebsite.models.Playlist;
import com.musicwebsite.models.Song;

@WebServlet("/PlaylistServlet")
public class PlaylistServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");

        // Retrieve playlists for the user
        List<Playlist> userPlaylists = PlaylistDAO.getUserPlaylistsByUsername(username);
        if (userPlaylists == null) {
            userPlaylists = new ArrayList<>();
        }
        request.setAttribute("userPlaylists", userPlaylists);

        // Determine which view to render
        String view = request.getParameter("view");
        if (view == null) {
            view = "playlists";
        }

        if ("songs".equals(view)) {
            // Fetch songs and set the attribute
            List<Song> songs = null;
			try {
				songs = SongDAO.getAllSongs();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            if (songs == null) {
                songs = new ArrayList<>();
            }
            request.setAttribute("songs", songs);

            System.out.println("Rendering songs.jsp with songs: " + songs);
            request.getRequestDispatcher("songs.jsp").forward(request, response);
        } else {
            System.out.println("Rendering viewPlaylists.jsp with playlists: " + userPlaylists);
            request.getRequestDispatcher("viewPlaylists.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        String playlistName = request.getParameter("playlistName");
        String imagePath = request.getParameter("playlistImage"); // Replace with actual upload logic

        try {
            int userId = UserDAO.getUserIdByUsername(username);
            PlaylistDAO.createPlaylist(userId, playlistName, imagePath);

            response.sendRedirect("PlaylistServlet");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
