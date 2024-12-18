/*import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicwebsite.dao.ArtistDAO;
import com.musicwebsite.models.Artist;

@WebServlet("/ArtistServlet")
public class ArtistServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve all artists from the database
        List<Artist> artists = ArtistDAO.getAllArtists();
        request.setAttribute("artists", artists);
        
        // Forward to JSP to display the list of artists
        request.getRequestDispatcher("artists.jsp").forward(request, response);
    }

    // Handle POST requests to add new artists
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String bio = request.getParameter("bio");
        String imageUrl = request.getParameter("image_url");
        String genre = request.getParameter("genre");

        Artist artist = new Artist();
        artist.setName(name);
        artist.setBio(bio);
        artist.setImageUrl(imageUrl);
        artist.setGenre(genre);

        // Call DAO to add the artist
        if (ArtistDAO.addArtist(artist)) {
            response.sendRedirect("ArtistServlet"); // Redirect to the list of artists after adding
        } else {
            request.setAttribute("errorMessage", "Failed to add artist");
            request.getRequestDispatcher("addArtist.jsp").forward(request, response); // Forward to add artist page
        }
    }
}

package com.musicwebsite.servlets;

import com.musicwebsite.models.Artist;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/artists")
public class ArtistServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Hardcoded list of artists
        List<Artist> artists = new ArrayList<>();
        artists.add(new Artist(1, "Eminem", "Bio of Artist One", "/img/eminem.jpg", "Genre One"));
        artists.add(new Artist(2, "Artist Two", "Bio of Artist Two", "image2.jpg", "Genre Two"));
        artists.add(new Artist(3, "Artist Three", "Bio of Artist Three", "image3.jpg", "Genre Three"));

        // Store artists in request scope
        request.setAttribute("artists", artists);

        // Forward to JSP
        request.getRequestDispatcher("artists.jsp").forward(request, response);
    }
}
*/

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.sql.*;

import com.musicwebsite.dao.ArtistDAO;
import com.musicwebsite.models.Artist;
import javax.servlet.annotation.WebServlet;
import java.util.List;

@WebServlet("/artists")
public class ArtistServlet extends HttpServlet {
    private ArtistDAO artistDAO = new ArtistDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Artist> artists = artistDAO.getAllArtists();
        request.setAttribute("artists", artists);
        request.getRequestDispatcher("/artists.jsp").forward(request, response);
    }
}
