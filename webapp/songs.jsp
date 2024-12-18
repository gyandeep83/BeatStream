<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.musicwebsite.dao.PlaylistDAO" %>
<%@ page import="com.musicwebsite.models.Playlist" %>
<html>
<head>
    <title>Songs List</title>
    <style>
        body {
            margin: 0;
            padding-bottom: 100px; /* Ensure space for the footer */
        }
        .song-container {
            border: 1px solid #ddd;
            padding: 15px;
            margin: 10px;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .album-art {
            width: 100px;
            height: 100px;
        }
        .song-details {
            flex-grow: 1;
        }
        #footerPlayer {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: #f1f1f1;
            padding: 10px;
            text-align: center;
            border-top: 1px solid #ccc;
            display: flex;
            align-items: center;
            gap: 15px;
            z-index: 1000; /* Ensure the footer stays on top */
        }
        #albumArt {
            width: 50px;
            height: 50px;
        }
        #footerSongDetails {
            flex-grow: 1;
            text-align: left;
        }
        .add-to-playlist-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
        }
        .add-to-playlist-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Songs</h1>

    <!-- Error Handling -->
    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>

    <div class="songs-container">
        <c:forEach var="song" items="${songs}">
            <!-- Song Container -->
            <div class="song-container">
                <img src="${song.albumImage}" alt="${song.title}" class="album-art">
                <div class="song-details">
                    <h2>${song.title}</h2>
                    <p>Artist: ${song.artist}</p>
                    <p>Genre: ${song.genre}</p>
                    <button class="add-to-playlist-btn" onclick="playSong('${song.filePath}', '${song.albumImage}', '${song.title}', '${song.artist}')">
                        Play Song
                    </button>
                </div>

                <!-- Add to Playlist Form -->
               <form action="AddToPlaylistServlet" method="post" onsubmit="addToPlaylist(event, this)">
    <input type="hidden" name="songId" value="${song.id}" />

    <!-- Playlist Selection -->
    <c:if test="${not empty userPlaylists}">
        <select name="playlistId" required>
            <c:forEach var="playlist" items="${userPlaylists}">
                <option value="${playlist.id}">${playlist.name}</option>
            </c:forEach>
        </select>
    </c:if>
    <c:if test="${empty userPlaylists}">
        <p>No playlists available. Create a playlist first.</p>
    </c:if>

    <button type="submit" class="add-to-playlist-btn">Add to Playlist</button>
</form>

            </div>
        </c:forEach>
    </div>

    <!-- Footer Player Section -->
    <div id="footerPlayer">
        <img id="albumArt" src="" alt="Album Art">
        <div id="footerSongDetails">
            <p id="footerTitle">Select a song to play</p>
            <p id="footerArtist"></p>
        </div>
        <audio id="audioPlayer" controls>
            Your browser does not support the audio element.
        </audio>
    </div>

    <script>
        function playSong(filePath, albumArtPath, title, artist) {
            // Set the audio source
            var audioPlayer = document.getElementById('audioPlayer');
            audioPlayer.src = filePath;
            audioPlayer.play();

            // Set the album art
            var albumArt = document.getElementById('albumArt');
            if (albumArtPath) {
                albumArt.src = albumArtPath;
                albumArt.style.display = 'block';
            } else {
                albumArt.style.display = 'none';
            }

            // Set the song details
            document.getElementById('footerTitle').textContent = title;
            document.getElementById('footerArtist').textContent = artist;
        }
        
        <script>
        function addToPlaylist(songId, playlistId) {
            fetch('AddToPlaylistServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `songId=${songId}&playlistId=${playlistId}`,
            })
                .then(response => response.json())
                .then(data => {
                    if (data.status === "success") {
                        alert(data.message); // Show success message
                    } else {
                        alert(data.message); // Show error message
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("An unexpected error occurred. Please try again later.");
                });
        }
        </script>
</body>

</html>
