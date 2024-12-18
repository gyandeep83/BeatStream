package com.musicwebsite.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.musicwebsite.models.Playlist;
import com.musicwebsite.models.Song;
import com.musicwebsite.utils.DBConnection;

public class PlaylistDAO {
    
    // Method to get playlists by username
	public static List<Playlist> getUserPlaylistsByUsername(String username) {
        List<Playlist> playlists = new ArrayList<>();
        String sql = "SELECT * FROM playlists WHERE user_id = (SELECT id FROM users WHERE username = ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Playlist playlist = new Playlist();
                playlist.setId(resultSet.getInt("id"));
                playlist.setName(resultSet.getString("name"));
                // Handle potential null images
                String image = resultSet.getString("image");
                playlist.setImage(image != null ? image : "default_image_path.jpg");
                playlists.add(playlist);
                System.out.println("Playlists fetched for user " + username + ": " + playlists);
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving playlists for user: " + username);
            e.printStackTrace();
        }
        return playlists;
    }
    
	
	

    // Method to create a playlist (just an example)
    public static void createPlaylist(int userId, String name, String imagePath) throws SQLException {
        String sql = "INSERT INTO playlists (user_id, name, image) VALUES (?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            statement.setString(2, name);
            statement.setString(3, imagePath);
            statement.executeUpdate();
        }
    }



    

	public static List<Song> getSongsByPlaylistId(int playlistId) {
		
		 List<Song> songs = new ArrayList<>();
	        String sql = "SELECT s.id, s.title, s.artist FROM songs s "
	                     + "JOIN playlist_songs ps ON s.id = ps.song_id "
	                     + "WHERE ps.playlist_id = ?";
	        
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setInt(1, playlistId);
	            ResultSet resultSet = statement.executeQuery();
	            
	            while (resultSet.next()) {
	                Song song = new Song();
	                song.setId(resultSet.getInt("id"));
	                song.setTitle(resultSet.getString("title"));
	                song.setArtist(resultSet.getString("artist"));
	                songs.add(song);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return songs;
		
	}
	

/**
	public static String getPlaylistNameById(int playlistId) {
		 String playlistName = null;
	        String sql = "SELECT name FROM playlists WHERE id = ?";
	        
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setInt(1, playlistId);
	            ResultSet resultSet = statement.executeQuery();
	            
	            if (resultSet.next()) {
	                playlistName = resultSet.getString("name");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return playlistName;
	}
    **/


//Method to get a specific playlist by ID
public static Playlist getPlaylistById(int playlistId) {
 Playlist playlist = null;
 String sql = "SELECT * FROM playlists WHERE id = ?";

 try (Connection connection = DBConnection.getConnection();
      PreparedStatement statement = connection.prepareStatement(sql)) {
     statement.setInt(1, playlistId);
     ResultSet resultSet = statement.executeQuery();

     if (resultSet.next()) {
         playlist = new Playlist();
         playlist.setId(resultSet.getInt("id"));
         playlist.setUserId(resultSet.getInt("user_id"));
         playlist.setName(resultSet.getString("name"));
         // Handle potential null images
         String image = resultSet.getString("image");
         playlist.setImage(image != null ? image : "default_image_path.jpg");
         playlist.setCreationDate(resultSet.getTimestamp("creation_date"));
     }
 } catch (SQLException e) {
     System.err.println("Error retrieving playlist with ID: " + playlistId);
     e.printStackTrace();
 }
 return playlist;
}
/**
public static boolean addSongToPlaylist(int songId, int playlistId) throws SQLException {
    String sql = "INSERT INTO playlist_songs (playlist_id, song_id) VALUES (?, ?)";
    try (Connection connection = DBConnection.getConnection();
         PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setInt(1, playlistId);
        statement.setInt(2, songId);
        int rowsInserted = statement.executeUpdate();
        return rowsInserted > 0;
    } catch (SQLIntegrityConstraintViolationException e) {
        // Handle duplicate entries gracefully
        System.out.println("The song is already in the playlist.");
        return false;
    }
}**/

public static boolean addSongToPlaylist(int songId, int playlistId) {
    String query = "INSERT INTO playlist_songs (playlist_id, song_id) VALUES (?, ?)";

    try (Connection connection = DBConnection.getConnection();
         PreparedStatement statement = connection.prepareStatement(query)) {
        
        statement.setInt(1, playlistId);
        statement.setInt(2, songId);
        int rowsAffected = statement.executeUpdate();
        return rowsAffected > 0;

    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}

public List<Playlist> getPlaylistsByUserId(int userId) {
    List<Playlist> playlists = new ArrayList<>();
    String query = "SELECT id, name FROM playlists WHERE user_id = ?";

    try (Connection connection = DBConnection.getConnection();
         PreparedStatement statement = connection.prepareStatement(query)) {

        statement.setInt(1, userId);

        try (ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Playlist playlist = new Playlist();
                playlist.setId(resultSet.getInt("id"));
                playlist.setName(resultSet.getString("name"));
                playlists.add(playlist);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return playlists;
}

public static List<Song> getSongsInPlaylist(int playlistId) throws SQLException {
    String query = "SELECT s.id, s.title, a.name AS artist, s.file_path " +
                   "FROM songs s " +
                   "INNER JOIN playlist_songs ps ON s.id = ps.song_id " +
                   "LEFT JOIN artists a ON s.artist_id = a.id " +
                   "WHERE ps.playlist_id = ?";

    List<Song> songs = new ArrayList<>();
    try (Connection connection = DBConnection.getConnection();
         PreparedStatement statement = connection.prepareStatement(query)) {

        statement.setInt(1, playlistId);
        try (ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                Song song = new Song();
                song.setId(rs.getInt("id"));
                song.setTitle(rs.getString("title"));
                song.setArtist(rs.getString("artist")); // Artist name from the `artists` table
                song.setFilePath(rs.getString("file_path")); // File path for playing the song
                songs.add(song);
            }
        }
    }
    return songs;
}



/**
    public static List<Song> getSongsByPlaylistId(int playlistId) {
        List<Song> songs = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection()) {
            String query = "SELECT s.id, s.title, s.artist, s.albumImage, s.genre, s.filePath " +
                           "FROM songs s " +
                           "JOIN playlist_songs ps ON s.id = ps.song_id " +
                           "WHERE ps.playlist_id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, playlistId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Song song = new Song();
                song.setId(rs.getInt("id"));
                song.setTitle(rs.getString("title"));
                song.setArtist(rs.getString("artist"));
                song.setAlbumImage(rs.getString("albumImage"));
                song.setGenre(rs.getString("genre"));
                song.setFilePath(rs.getString("filePath"));
                songs.add(song);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return songs;
    }

    public static String getPlaylistNameById(int playlistId) {
        String name = null;
        try (Connection connection = DBConnection.getConnection()) {
            String query = "SELECT name FROM playlists WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, playlistId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                name = rs.getString("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }**/

}




