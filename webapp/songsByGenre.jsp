<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Songs in ${genre}</title>
    <style>
        .song-container {
            border: 1px solid #ddd;
            padding: 15px;
            margin: 10px;
            display: flex;
            align-items: center;
            gap: 15px;
            cursor: pointer;
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
        }
        #albumArt {
            width: 50px;
            height: 50px;
        }
        #footerSongDetails {
            flex-grow: 1;
            text-align: left;
        }
    </style>
    <script>
        function playSong(filePath, albumArtPath, title, artist) {
            var audioPlayer = document.getElementById('audioPlayer');
            audioPlayer.src = filePath;
            audioPlayer.play();

            var albumArt = document.getElementById('albumArt');
            if (albumArtPath) {
                albumArt.src = albumArtPath;
                albumArt.style.display = 'block';
            } else {
                albumArt.style.display = 'none';
            }

            document.getElementById('footerTitle').textContent = title;
            document.getElementById('footerArtist').textContent = artist;
        }
    </script>
</head>
<body>
    <h1>Songs in ${genre}</h1>
    <div>
        <c:forEach var="song" items="${songs}">
            <div class="song-container" onclick="playSong('${song.filePath}', '${song.albumImage}', '${song.title}', '${song.artist}')">
                <img src="${song.albumImage}" alt="${song.title}" class="album-art">
                <div class="song-details">
                    <h2>${song.title}</h2>
                    <p>Artist: ${song.artist}</p>
                    <p>Genre: ${song.genre}</p>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Footer Player Section -->
    <div id="footerPlayer">
        <img id="albumArt" src="" alt="Album Art" style="display:none;">
        <div id="footerSongDetails">
            <p id="footerTitle">Select a song to play</p>
            <p id="footerArtist"></p>
        </div>
        <audio id="audioPlayer" controls>
            Your browser does not support the audio element.
        </audio>
    </div>
</body>
</html>
