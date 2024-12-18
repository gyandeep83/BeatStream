import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicwebsite.dao.PlaylistDAO;
import com.musicwebsite.models.Playlist;
import com.musicwebsite.models.Song;

@WebServlet("/PlaylistDetailsServlet")
public class PlaylistDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the playlist ID from the request parameter
        String playlistIdParam = request.getParameter("playlistId");

        if (playlistIdParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Playlist ID is required");
            return;
        }

        try {
            int playlistId = Integer.parseInt(playlistIdParam);

            // Retrieve the playlist details
            Playlist playlist = PlaylistDAO.getPlaylistById(playlistId);
            if (playlist == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Playlist not found");
                return;
            }

            // Retrieve the list of songs in the playlist
            List<Song> songs = PlaylistDAO.getSongsInPlaylist(playlistId);

            // Set the playlist and songs as attributes to be used in the JSP
            request.setAttribute("playlist", playlist);
            request.setAttribute("songs", songs);

            // Forward the request to playlistDetails.jsp
            request.getRequestDispatcher("playlistDetails.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Playlist ID format");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request");
        }
    }
}
