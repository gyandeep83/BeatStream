import com.musicwebsite.dao.AlbumDAO;
import com.musicwebsite.models.Album;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/albums")
public class AlbumServlet extends HttpServlet {
    private AlbumDAO albumDAO = new AlbumDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch all albums
        List<Album> albums = albumDAO.getAllAlbums();
        
        // Set albums as a request attribute
        request.setAttribute("albums", albums);
        
        // Forward to albums.jsp for display
        request.getRequestDispatcher("/albums.jsp").forward(request, response);
    }
}
