<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.musicwebsite.dao.PlaylistDAO" %>
<%@ page import="com.musicwebsite.models.Playlist" %>
<html>
<head>
    <title>Your Playlists</title>
</head>
<body>
    <h1>Your Playlists</h1>
    
    <!-- Show playlists for the user -->
    <c:forEach var="playlist" items="${userPlaylists}">
        <div>
            <img src="${playlist.image}" alt="Playlist Image" width="150" height="150"/>
            <h3>${playlist.name}</h3>
            <a href="PlaylistDetailsServlet?playlistId=${playlist.id}">View Songs</a>

        </div>
    </c:forEach>

    <!-- Button to create a new playlist -->
    <a href="createPlaylist.jsp"><button>Create Playlist</button></a>
</body>
</html>
