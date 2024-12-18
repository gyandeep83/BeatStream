<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Albums</title>
</head>
<body>
    <h1>Albums</h1>
    <div>
        <c:forEach var="album" items="${albums}">
            <div style="border: 1px solid #ddd; padding: 10px; margin: 10px;">
                <img src="${album.imagePath}" alt="${album.title}" style="width: 150px; height: 150px;">
                <h2>${album.title}</h2>
                <p>Artist: ${album.artistName}</p>
                <p>Release Year: ${album.releaseYear}</p>
                <a href="songsByAlbum?albumId=${album.id}">View Songs</a>

            </div>
        </c:forEach>
    </div>
</body>
</html>
