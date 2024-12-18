<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MusicStream</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f5f5f5;
            overflow-y: auto; /* Ensure vertical scrolling is allowed */
        }

        .navbar {
            background-color: #3f51b5;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .nav-links {
            list-style: none;
            display: flex;
            gap: 25px;
            margin: 0;
            padding: 0;
        }
        
        .nav-links li {
            display: inline;
        }

        .nav-links a {
            color: #fff;
            text-decoration: none;
            font-size: 18px;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #c5cae9;
        }
        

        .logo {
            font-size: 26px;
            font-weight: bold;
        }

        .search-profile {
            display: flex;
            align-items: center;
        }

        .search-profile input {
            padding: 8px 15px; /* Adjusted padding */
            margin-right: 15px;
            border: none;
            border-radius: 20px;
            outline: none;
            width: 250px; /* Increased width */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease; /* Smooth transition */
            background-color: #fff; /* White background */
            color: #333; /* Darker text color */
        }

        .search-profile input::placeholder {
            color: #888; /* Lighter placeholder color */
        }

        .search-profile input:focus {
            width: 300px; /* Expands on focus */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            background-color: #e8eaf6; /* Light background on focus */
        }
        .profile-icon {
            font-size: 22px;
            cursor: pointer;
        }

        .hero {
            text-align: center;
            background-color: #5c6bc0;
            color: #fff;
            padding: 30px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .hero h1 {
            font-size: 38px;
            margin: 0;
        }

        .hero p {
            font-size: 20px;
            margin-top: 10px;
        }

        .featured-playlists {
            padding: 50px 20px;
        }

        .featured-playlists h2 {
            text-align: center;
            font-size: 30px;
            margin-bottom: 30px;
            color: #333;
        }

        .playlists-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }

        .playlist {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            padding: 20px;
            width: 220px;
            text-align: center;
            margin: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .playlist:hover {
            transform: translateY(-5px);
            box-shadow: 0 0 25px rgba(0,0,0,0.2);
        }

        .playlist-cover {
            width: 100%;
            height: 140px;
            background-color: #ddd;
            border-radius: 10px;
            margin-bottom: 15px;
            background-size: cover; /* Ensure the image covers the div */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Prevent repeating of the image */
        }

        /* Container styling */
        .top-artists {
            padding: 50px 20px;
        }
        
        .top-artists h2 {
            text-align: center;
            font-size: 30px;
            margin-bottom: 30px;
            color: #333;
        }
        
        .artists-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .artist {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            padding: 20px;
            width: 220px;
            text-align: center;
            margin: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .artist:hover {
            transform: translateY(-5px);
            box-shadow: 0 0 25px rgba(0,0,0,0.2);
        }
        
        .artist-cover,
.song-cover {
    width: 100%;
    height: 140px; /* Ensuring same height */
    background-color: #ddd;
    border-radius: 10px;
    margin-bottom: 15px;
    background-size: cover; /* Ensure the image covers the div */
    background-position: center; /* Center the image */
    background-repeat: no-repeat; /* Prevent repeating of the image */
    display: block; /* Ensure it behaves like a block-level element */
}

        
        .artist-name {
            font-weight: bold;
            font-size: 1.1em;
            margin: 5px 0;
        }
        
        .artist-ranking {
            color: #888;
            margin: 5px 0;
        }
        
        .view-profile {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        .view-profile:hover {
            background-color: #0056b3;
        }

       /* Container styling */
       .trending-songs {
        padding: 50px 20px;
    }
    
    .trending-songs h2 {
        text-align: center;
        font-size: 30px;
        margin-bottom: 30px;
        color: #333;
    }
    
    .trending-songs-container {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        gap: 20px;
    }
    
    .song {
        background-color: #fff;
        border-radius: 15px;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
        padding: 20px;
        width: 220px;
        text-align: center;
        margin: 10px;
        transition: transform 0.3s, box-shadow 0.3s;
    }
    
    .song:hover {
        transform: translateY(-5px);
        box-shadow: 0 0 25px rgba(0,0,0,0.2);
    }
    

    
    .song-name {
        font-weight: bold;
        font-size: 1.1em;
        margin: 5px 0;
    }
    
    .song-ranking {
        color: #888;
        margin: 5px 0;
    }
    
    .play-this {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 8px 15px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    
    .play-this:hover {
        background-color: #0056b3;
    }

    .spacing-div {
        height: 200px; /* Adjust the height as needed */
    }
        

        .play-now {
            background-color: #3f51b5;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 20px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .play-now:hover {
            background-color: #303f9f;
        }

        .music-controls {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 8px 15px; /* Reduced padding */
            background-color: #e0e0e0;
            position: fixed;
            bottom: 0;
            width: 100%;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
        }
        
        .song-info {
            display: flex;
            align-items: center;
            margin-bottom: 5px; /* Reduced margin */
        }
        
        .song-cover {
            width: 40px; /* Reduced size */
            height: 40px; /* Reduced size */
            background-color: #ddd;
            margin-right: 10px; /* Reduced margin */
            border-radius: 5px;
        }
        
        .song-details {
            display: flex;
            flex-direction: column;
            font-size: 14px; /* Adjusted font size */
        }
        
        .controls .control-btn {
            background: none;
            border: none;
            font-size: 20px; /* Reduced icon size */
            margin: 0 8px; /* Reduced margin */
            cursor: pointer;
            color: #3f51b5;
        }
        
        .progress-bar {
            width: 80%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 5px; /* Reduced margin */
            gap: 5px; /* Reduced gap */
        }
        
        .progress-bar input {
            width: 100%;
            accent-color: #3f51b5;
        }
        
        .time {
            font-size: 11px; /* Reduced font size */
            color: #333;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">MusicStream</div>
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/PlaylistServlet">Playlists</a></li>
            <li><a href="artists.jsp">Artists</a></li>
            <li><a href="albums.jsp">Albums</a></li>
            <li><a href="${pageContext.request.contextPath}/PlaylistServlet?view=songs">Songs</a></li>

        </ul>
        <div class="search-profile">
            <input type="text" placeholder="Search for songs, albums, artists...">
            <div class="profile-icon">
            <a href="dashboard.jsp">&#128100;</a>
            </div>
        </div>
    </nav>

    <header class="hero">
        <h1>Welcome to MusicStream</h1>
        <p>Discover and enjoy millions of songs</p>
    </header>

    <main>
        <section class="featured-playlists">
            <h2>Featured Playlists</h2>
            <div class="playlists-container">
                <div class="playlist">
                    <div class="playlist-cover" style="background-image: url('https://media.istockphoto.com/id/1299679815/vector/relaxed-male-character-in-home-clothes-and-slippers-sitting-in-comfortable-chair-yawning-man.jpg?s=612x612&w=0&k=20&c=s4OxVgFYYadB1g48qKQuRlGxcZMXqaKVLrCTcMntO1w=');"></div>
                    <p class="playlist-title">Relax</p>
                    <p class="playlist-artist">Various Artists</p>
                    <a href="songlist.jsp"><button class="play-now">View</button></a>
                </div>
                <div class="playlist">
                    <div class="playlist-cover" style="background-image: url('data:image/jpeg;base64,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');"></div>
                    <p class="playlist-title">Sad</p>
                    <p class="playlist-artist">Various Artists</p>
                    <a href="songlist.jsp"><button class="play-now">View</button></a>
                </div>
                <div class="playlist">
                    <div class="playlist-cover" style="background-image: url('https://hips.hearstapps.com/hmg-prod/images/happy-songs-2020-1603993911.png?crop=0.502xw:1.00xh;0.250xw,0&resize=640:*');"></div>
                    <p class="playlist-title">Chill</p>
                    <p class="playlist-artist">Various Artists</p>
                    <a href="songlist.jsp"><button class="play-now">View</button></a>
                </div>
                <div class="playlist">
                    <div class="playlist-cover" style="background-image: url('https://i1.sndcdn.com/artworks-001097944150-imso7f-t500x500.jpg');"></div>
                    <p class="playlist-title">Motivated</p>
                    <p class="playlist-artist">Various Artists</p>
                    <a href="songlist.jsp"><button class="play-now">View</button></a>
                </div>
            </div>
        </section>

        <section class="top-artists">
            <h2>Top Artists</h2>
            <div class="artists-container">
                <div class="artist">
                    <div class="artist-cover" style="background-image: url('https://i.scdn.co/image/ab676161000051745ba2d75eb08a2d672f9b69b7');"></div>
                    <p class="artist-name">Arijit singh</p>
                    <p class="artist-ranking">Number 1</p>
                    <a href="songlist.jsp"><button class="play-now">View</button></a>
                </div>
                <div class="artist">
                    <div class="artist-cover" style="background-image: url('https://img.etimg.com/thumb/width-1600,height-900,imgsize-31566,resizemode-75,msid-113567636/magazines/panache/more-diljit-dosanjh-concerts-coming-up-in-delhi-jaipur-mumbai-check-dates-ticket-prices.jpg');"></div>
                    <p class="artist-name">Diljit Dosanjh</p>
                    <p class="artist-ranking">Number 2</p>
                    <a href="songlist.jsp"><button class="play-now">View</button></a>
                </div>
                <div class="artist">
                    <div class="artist-cover" style="background-image: url('https://media.npr.org/assets/img/2021/11/16/gettyimages-1235223332_sq-e88ad790d447bd7dfcb0c1571047db26d39a8ee0.jpg');"></div>
                    <p class="artist-name">Travis scott</p>
                    <p class="artist-ranking">Number 3</p>
                    <a href="songlist.jsp"><button class="play-now">View</button></a>
                </div>
                <div class="artist">
                    <div class="artist-cover" style="background-image: url('https://www.rollingstone.com/wp-content/uploads/2024/08/HanuManKind.jpg');"></div>
                    <p class="artist-name">Hanumankind</p>
                    <p class="artist-ranking">Number 4</p>
                    <a href="songlist.jsp"><button class="play-now">View</button></a>
                </div>
            </div>
        </section>

        <section class="trending-songs">
            <h2>Trending Songs</h2>
            <div class="trending-songs-container">
                <div class="song">
                    <p class="song-name">Sweet child O' mine</p>
                    <p class="song-ranking">Number 1</p>
                    <button class="play-now">Play</button>
                </div>
                <div class="song">
                    <p class="song-name">Fein!</p>
                    <p class="song-ranking">Number 2</p>
                    <button class="play-now">Play</button>
                </div>
                <div class="song">
                    <p class="song-name">Proper patola</p>
                    <p class="song-ranking">Number 3</p>
                    <button class="play-now">Play</button>
                </div>
                <div class="song">
                    <p class="song-name">Tum hi ho</p>
                    <p class="song-ranking">Number 4</p>
                    <button class="play-now">Play</button>
                </div>
            </div>
        </section>
    </main>

    <!-- Add an empty div for spacing -->
<div class="spacing-div"></div>


    <footer class="music-controls">
        <div class="song-info">
            <div class="song-cover"></div>
            <div class="song-details">
                <p class="song-title">Song Title</p>
                <p class="artist-name">Artist Name</p>
            </div>
        </div>
        <div class="progress-bar">
            <span class="time">0:00</span>
            <input type="range" min="0" max="100" value="0" />
            <span class="time">3:30</span>
        </div>
        <div class="controls">
            <button class="control-btn">⏮</button>
            <button class="control-btn play-pause">▶️</button>
            <button class="control-btn">⏭</button>
        </div>
    </footer>

    <script>
        document.querySelector('.play-pause').addEventListener('click', function() {
            this.textContent = (this.textContent === '▶️') ? '⏸️' : '▶️';
        });
    </script>
</body>
</html>