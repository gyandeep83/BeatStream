
import com.musicwebsite.dao.SongDAO;
import com.musicwebsite.models.Song;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/songsByGenre")
public class SongsByGenreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String genre = request.getParameter("genre");

        if (genre != null && !genre.isEmpty()) {
            SongDAO songDAO = new SongDAO();
            List<Song> songs = songDAO.getSongsByGenre(genre);

            request.setAttribute("songs", songs);
            request.setAttribute("genre", genre);
            request.getRequestDispatcher("/songsByGenre.jsp").forward(request, response);
        } else {
            response.sendRedirect("genres.jsp");
        }
    }
}
