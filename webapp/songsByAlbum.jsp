<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Songs in ${albumTitle}</title>
</head>
<body>
    <h1>Songs in ${albumTitle}</h1>
    <c:if test="${not empty albumImage}">
        <img src="${albumImage}" alt="${albumTitle}" width="300" />
    </c:if>
    <table border="1">
        <thead>
            <tr>
                <th>Title</th>
                <th>Genre</th>
                <th>Release Year</th>
                <th>Duration</th>
                <th>Play</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="song" items="${songs}">
                <tr>
                    <td>${song.title}</td>
                    <td>${song.genre}</td>
                    <td>${song.releaseYear}</td>
                    <td>${song.duration / 60}:${song.duration % 60}</td>
                    <td>
                        <audio controls>
                            <source src="${song.filePath}" type="audio/mpeg">
                            Your browser does not support the audio element.
                        </audio>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
