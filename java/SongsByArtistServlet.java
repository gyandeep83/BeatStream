import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicwebsite.dao.ArtistDAO;
import com.musicwebsite.dao.SongDAO;
import com.musicwebsite.models.Artist;
import com.musicwebsite.models.Song;



@WebServlet("/songsByArtist")
public class SongsByArtistServlet extends HttpServlet {
    private SongDAO songDAO = new SongDAO();
    private ArtistDAO artistDAO = new ArtistDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int artistId = Integer.parseInt(request.getParameter("artistId"));
        List<Song> songs = songDAO.getSongsByArtistId(artistId);

        Artist artist = artistDAO.getArtistById(artistId); // Fetch the artist's name and image

        if (artist != null) {
            request.setAttribute("artistName", artist.getName());
            request.setAttribute("artistImage", artist.getImagePath());
        }
        request.setAttribute("songs", songs);
        request.getRequestDispatcher("/songsByArtist.jsp").forward(request, response);
    }
}
