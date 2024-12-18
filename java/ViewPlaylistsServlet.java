import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.musicwebsite.dao.PlaylistDAO;
import com.musicwebsite.models.Playlist;

@WebServlet("/viewPlaylists")
public class ViewPlaylistsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        List<Playlist> userPlaylists = PlaylistDAO.getUserPlaylistsByUsername(username);

        request.setAttribute("userPlaylists", userPlaylists);
        request.getRequestDispatcher("viewPlaylists.jsp").forward(request, response);
    }
}
