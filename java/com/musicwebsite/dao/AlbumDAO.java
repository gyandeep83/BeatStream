package com.musicwebsite.dao;

import com.musicwebsite.models.Album;
import com.musicwebsite.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AlbumDAO {
    
    // Method to get all albums
	public List<Album> getAllAlbums() {
	    List<Album> albums = new ArrayList<>();
	    String query = "SELECT a.id, a.title, a.release_year, a.image_path, ar.name AS artist_name " +
	                   "FROM albums a " +
	                   "JOIN artists ar ON a.artist_id = ar.id";

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query);
	         ResultSet resultSet = statement.executeQuery()) {

	        while (resultSet.next()) {
	            Album album = new Album();
	            album.setId(resultSet.getInt("id"));
	            album.setTitle(resultSet.getString("title"));
	            album.setReleaseYear(resultSet.getInt("release_year"));
	            album.setImagePath(resultSet.getString("image_path"));
	            album.setArtistName(resultSet.getString("artist_name"));  // Set the artist's name

	            albums.add(album);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return albums;
	}


    // Method to get album details by ID
    public Album getAlbumById(int id) {
        Album album = null;
        String query = "SELECT * FROM albums WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    album = new Album();
                    album.setId(resultSet.getInt("id"));
                    album.setTitle(resultSet.getString("title"));
                    album.setReleaseYear(resultSet.getInt("release_year"));
                    album.setImagePath(resultSet.getString("image_path"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return album;
    }
}