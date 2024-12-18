<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Playlist Details</title>
</head>
<body>
    <h1>Playlist: ${playlist.name}</h1>
    <c:forEach var="song" items="${songs}">
    <div>
        <span>${song.title} by ${song.artist}</span>
        <audio controls>
            <source src="${song.filePath}" type="audio/mpeg">
            Your browser does not support the audio element.
        </audio>
    </div>
</c:forEach>

    <a href="PlaylistServlet">Back to Playlists</a>
</body>
</html>
