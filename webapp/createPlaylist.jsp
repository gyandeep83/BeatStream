<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Playlist</title>
</head>
<body>
    <h1>Create a New Playlist</h1>

   <form action="createPlaylist" method="POST" enctype="multipart/form-data">
    <label for="playlistName">Playlist Name:</label>
    <input type="text" name="playlistName" required>
    
    <label for="playlistImage">Playlist Image:</label>
    <input type="file" name="playlistImage">
    
    <input type="submit" value="Create Playlist">
</form>



</body>
</html>
