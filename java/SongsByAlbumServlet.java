
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicwebsite.dao.AlbumDAO;
import com.musicwebsite.dao.SongDAO;
import com.musicwebsite.models.Album;
import com.musicwebsite.models.Song;

@WebServlet("/songsByAlbum")
public class SongsByAlbumServlet extends HttpServlet {
    private SongDAO songDAO = new SongDAO();
    private AlbumDAO albumDAO = new AlbumDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String albumIdParam = request.getParameter("albumId");

        // Validate albumId parameter
        if (albumIdParam == null || albumIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Album ID is missing.");
            return;
        }

        try {
            int albumId = Integer.parseInt(albumIdParam);

            // Fetch songs for the given album ID
            List<Song> songs = songDAO.getSongsByAlbumId(albumId);

            // Fetch album details for display purposes
            Album album = albumDAO.getAlbumById(albumId);

            if (album != null) {
                request.setAttribute("albumTitle", album.getTitle());
                request.setAttribute("albumImage", album.getImagePath());
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Album not found.");
                return;
            }

            request.setAttribute("songs", songs);
            request.getRequestDispatcher("/songsByAlbum.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Album ID format.");
        }
    }
}
