package com.musicwebsite.models;

import java.sql.Timestamp;
import java.util.List;

public class Playlist {
    private int id;
    private int userId;
    private String name;
    private String image;
    private Timestamp creationDate;  // Add this line
    private List<Song> songs;

    // Constructors
    public Playlist() {
    }

    public Playlist(int id, int userId, String name, String image, Timestamp creationDate) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.image = image;
        this.creationDate = creationDate;  // Add this line
    }

    public Playlist(int id, int userId, String name, String image, Timestamp creationDate, List<Song> songs) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.image = image;
        this.creationDate = creationDate;  // Add this line
        this.songs = songs;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Timestamp getCreationDate() {  // Add this method
        return creationDate;
    }

    public void setCreationDate(Timestamp creationDate) {  // Add this method
        this.creationDate = creationDate;
    }

    public List<Song> getSongs() {
        return songs;
    }

    public void setSongs(List<Song> songs) {
        this.songs = songs;
    }
    
    public String getImagePath() {
        return image != null ? image : "default_image_path.jpg";
    }

    @Override
    public String toString() {
        return "Playlist{" +
               "id=" + id +
               ", userId=" + userId +
               ", name='" + name + '\'' +
               ", image='" + image + '\'' +
               ", creationDate=" + creationDate +  // Add this line
               ", songs=" + songs +
               '}';
    }
}
