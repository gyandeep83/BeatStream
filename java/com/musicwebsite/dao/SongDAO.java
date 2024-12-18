package com.musicwebsite.dao;
import com.musicwebsite.models.Song;
import com.musicwebsite.utils.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class SongDAO {
	public static List<Song> getAllSongs() {
	    List<Song> songs = new ArrayList<>();
	    String query = "SELECT s.id, s.title, s.genre, s.release_year, s.duration, s.file_path, " +
	                   "ar.name AS artist_name, a.image_path AS album_image " +
	                   "FROM songs s " +
	                   "JOIN artists ar ON s.artist_id = ar.id " +
	                   "JOIN albums a ON s.album_id = a.id";

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query);
	         ResultSet resultSet = statement.executeQuery()) {

	        while (resultSet.next()) {
	            Song song = new Song();
	            song.setId(resultSet.getInt("id"));
	            song.setTitle(resultSet.getString("title"));
	            song.setGenre(resultSet.getString("genre"));
	            song.setReleaseYear(resultSet.getInt("release_year"));
	            song.setDuration(resultSet.getInt("duration"));
	            song.setFilePath(resultSet.getString("file_path"));
	            song.setArtist(resultSet.getString("artist_name"));  // Artist name
	            song.setAlbumImage(resultSet.getString("album_image"));  // Album art

	            songs.add(song);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return songs;
	}


	public List<Song> getSongsByArtistId(int artistId) {
	    List<Song> songs = new ArrayList<>();
	    String query = "SELECT s.id, s.title, s.genre, s.release_year, s.duration, s.file_path, " +
	                   "a.image_path AS album_image " +
	                   "FROM songs s " +
	                   "JOIN albums a ON s.album_id = a.id " +
	                   "WHERE s.artist_id = ?";

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query)) {
	        statement.setInt(1, artistId);
	        ResultSet resultSet = statement.executeQuery();

	        while (resultSet.next()) {
	            Song song = new Song();
	            song.setId(resultSet.getInt("id"));
	            song.setTitle(resultSet.getString("title"));
	            song.setGenre(resultSet.getString("genre"));
	            song.setReleaseYear(resultSet.getInt("release_year"));
	            song.setDuration(resultSet.getInt("duration"));
	            song.setFilePath(resultSet.getString("file_path"));
	            song.setAlbumImage(resultSet.getString("album_image"));  // Set album art
	            songs.add(song);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return songs;
	}

    
    
	public List<Song> getSongsByAlbumId(int albumId) {
	    List<Song> songs = new ArrayList<>();
	    String query = "SELECT s.id, s.title, s.genre, s.release_year, s.duration, s.file_path, " +
	                   "a.image_path AS album_image " +
	                   "FROM songs s " +
	                   "JOIN albums a ON s.album_id = a.id " +
	                   "WHERE s.album_id = ?";

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query)) {

	        statement.setInt(1, albumId);

	        try (ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	                Song song = new Song();
	                song.setId(resultSet.getInt("id"));
	                song.setTitle(resultSet.getString("title"));
	                song.setGenre(resultSet.getString("genre"));
	                song.setReleaseYear(resultSet.getInt("release_year"));
	                song.setDuration(resultSet.getInt("duration"));
	                song.setFilePath(resultSet.getString("file_path"));
	                song.setAlbumImage(resultSet.getString("album_image"));  // Set album art
	                
	                songs.add(song);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return songs;
	}


	public List<Song> getSongsByGenre(String genre) {
	    List<Song> songs = new ArrayList<>();
	    String query = "SELECT s.title, s.genre, s.release_year, s.duration, s.file_path, " +
	                   "a.image_path AS album_art, ar.name AS artist_name " +
	                   "FROM songs s " +
	                   "JOIN albums a ON s.album_id = a.id " +
	                   "JOIN artists ar ON s.artist_id = ar.id " +
	                   "WHERE s.genre = ?";

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query)) {
	        statement.setString(1, genre);

	        try (ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	                Song song = new Song();
	                song.setTitle(resultSet.getString("title"));
	                song.setGenre(resultSet.getString("genre"));
	                song.setReleaseYear(resultSet.getInt("release_year"));
	                song.setDuration(resultSet.getInt("duration"));
	                song.setFilePath(resultSet.getString("file_path"));
	                song.setAlbumImage(resultSet.getString("album_art"));
	                song.setArtist(resultSet.getString("artist_name")); // Set artist name

	                songs.add(song);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return songs;
	}
}


