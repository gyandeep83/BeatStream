<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Artists List</title>
</head>
<body>
    <h1>Artists</h1>
    <ul>
        <c:forEach var="artist" items="${artists}">
            <li>
                <a href="songsByArtist?artistId=${artist.id}">
                    <img src="${artist.imagePath}" alt="${artist.name}" width="50" height="50"/>
                    ${artist.name} (${artist.genre})
                </a>
            </li>
        </c:forEach>
    </ul>
</body>
</html>
