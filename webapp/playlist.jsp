<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.musicwebsite.dao.UserDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.musicwebsite.models.Playlist" %>
<html>
<head>
    <title>Your Playlists</title>
</head>
<body>
    <h1>Your Playlists</h1>
    <c:forEach var="playlist" items="${userPlaylists}">
        <div>
            <h3>${playlist.name}</h3>
            <a href="playlistDetails.jsp?playlistId=${playlist.id}">View Playlist</a>
        </div>
    </c:forEach>
</body>
</html>
