import com.musicwebsite.dao.SongDAO;
import com.musicwebsite.models.Song;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/songs")
public class SongServlet extends HttpServlet {
    private SongDAO songDAO = new SongDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 System.out.println("fetching all songs");
    	List<Song> songs = songDAO.getAllSongs();
        request.setAttribute("songs", songs);
        request.getRequestDispatcher("/songs.jsp").forward(request, response);
    }
}
