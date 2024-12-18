<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Featured Music</title>
    <link rel="stylesheet" href="styles.css">
</head>
<style>body, html {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #3c1361;
    color: white;
}

.min-h-screen {
    min-height: 100vh;
}

.bg-purple-800 {
    background-color: #3c1361;
}

.text-white {
    color: white;
}

.p-8 {
    padding: 2rem;
}

.max-w-4xl {
    max-width: 960px;
    margin: 0 auto;
}

.text-4xl {
    font-size: 2.5rem;
}

.font-bold {
    font-weight: bold;
}

.mb-8 {
    margin-bottom: 2rem;
}

.space-y-4 > * + * {
    margin-top: 1rem;
}

.bg-purple-700 {
    background-color: #4b3f72;
}

.hover-bg-purple-600:hover {
    background-color: #6a1b9a;
}

.rounded-lg {
    border-radius: 0.5rem;
}

.p-4 {
    padding: 1rem;
}

.flex {
    display: flex;
}

.items-center {
    align-items: center;
}

.gap-4 {
    gap: 1rem;
}

.w-16 {
    width: 4rem;
}

.h-16 {
    height: 4rem;
}

.rounded-md {
    border-radius: 0.375rem;
}

.object-cover {
    object-fit: cover;
}

.flex-1 {
    flex: 1;
}

.text-lg {
    font-size: 1.125rem;
}

.text-purple-200 {
    color: #d1c4e9;
}
</style>
<body>
    <div class="min-h-screen bg-purple-800 text-white p-8">
        <div class="max-w-4xl mx-auto">
            <h1 class="text-4xl font-bold mb-8 text-white">Featured Music</h1>
            <div id="songs-container" class="space-y-4"></div>
        </div>
    </div>
    <script src="app.js"></script>
</body>
<script>const songs = [
    {
        id: 1,
        title: "Midnight Rain",
        artist: "Ed Sheeran",
        album: "Neon Dreams",
        duration: "3:45",
        coverUrl: "https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop"
    },
    {
        id: 2,
        title: "Cosmic Dance",
        artist: "Ed Sheeran",
        album: "Galaxy Groove",
        duration: "4:20",
        coverUrl: "https://images.unsplash.com/photo-1616356607338-fd87169ecf1a?w=300&h=300&fit=crop"
    },
    {
        id: 3,
        title: "Urban Sunset",
        artist: "Ed Sheeran",
        album: "Metropolitan",
        duration: "3:55",
        coverUrl: "https://images.unsplash.com/photo-1557672172-298e090bd0f1?w=300&h=300&fit=crop"
    },
    {
        id: 4,
        title: "Ocean Breeze",
        artist: "Ed Sheeran",
        album: "Coastal Vibes",
        duration: "4:10",
        coverUrl: "https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=300&h=300&fit=crop"
    },
    {
        id: 5,
        title: "Desert Rose",
        artist: "Ed Sheeran",
        album: "Oasis",
        duration: "3:30",
        coverUrl: "https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=300&h=300&fit=crop"
    }
];

const container = document.getElementById('songs-container');

songs.forEach(song => {
    const songElement = document.createElement('div');
    songElement.className = 'bg-purple-700 hover-bg-purple-600 rounded-lg p-4 flex items-center gap-4';

    songElement.innerHTML = `
        <img src="${song.coverUrl}" alt="${song.album}" class="w-16 h-16 rounded-md object-cover">
        <div class="flex-1">
            <h3 class="font-semibold text-lg">${song.title}</h3>
            <p class="text-purple-200">${song.artist} • ${song.album}</p>
        </div>
        <span class="text-purple-200">${song.duration}</span>
    `;

    container.appendChild(songElement);
});
</script>
</html>
