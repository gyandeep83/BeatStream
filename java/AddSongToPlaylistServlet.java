import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicwebsite.dao.PlaylistDAO;

@WebServlet("/addSongToPlaylist")
public class AddSongToPlaylistServlet extends HttpServlet {
    private PlaylistDAO playlistDAO = new PlaylistDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int songId = Integer.parseInt(request.getParameter("songId"));
        int playlistId = Integer.parseInt(request.getParameter("playlistId"));

        // Add song to playlist
        boolean success = playlistDAO.addSongToPlaylist(songId, playlistId);

        if (success) {
            response.sendRedirect("songs"); // Redirect to songs page
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to add song to playlist");
        }
    }
}
