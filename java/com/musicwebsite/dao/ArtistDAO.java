/*package com.musicwebsite.dao;

import com.musicwebsite.models.Artist;
import com.musicwebsite.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ArtistDAO {

    // Method to get all artists
    public static List<Artist> getAllArtists() {
        List<Artist> artists = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM artists";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Artist artist = new Artist();
                artist.setArtistId(rs.getInt("artist_id"));
                artist.setName(rs.getString("name"));
                artist.setBio(rs.getString("bio"));
                artist.setImageUrl(rs.getString("image_url"));
                artist.setGenre(rs.getString("genre"));
                artists.add(artist);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return artists;
    }

    // Method to add a new artist
    public static boolean addArtist(Artist artist) {
        boolean isAdded = false;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO artists (name, bio, image_url, genre) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, artist.getName());
            ps.setString(2, artist.getBio());
            ps.setString(3, artist.getImageUrl());
            ps.setString(4, artist.getGenre());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isAdded = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isAdded;
    }

    // You can add more methods for updating and deleting artists as needed
}*/


package com.musicwebsite.dao;

import com.musicwebsite.models.Artist;
import com.musicwebsite.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ArtistDAO {
    public List<Artist> getAllArtists() {
        List<Artist> artists = new ArrayList<>();
        String query = "SELECT * FROM artists";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Artist artist = new Artist();
                artist.setId(resultSet.getInt("id"));
                artist.setName(resultSet.getString("name"));
                artist.setGenre(resultSet.getString("genre"));
                artist.setImagePath(resultSet.getString("image_path"));
                artists.add(artist);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return artists;
    }


    public Artist getArtistById(int artistId) {
        Artist artist = null;
        String query = "SELECT name, image_path FROM artists WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, artistId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                artist = new Artist();
                artist.setName(resultSet.getString("name"));
                artist.setImagePath(resultSet.getString("image_path"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return artist;
    }
}