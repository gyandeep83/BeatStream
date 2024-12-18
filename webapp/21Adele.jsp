<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Track List</title>
  <link rel="stylesheet" href="styles.css">
</head>
<style>body {
  font-family: Arial, sans-serif;
  background-color: #6A0DAD; /* This sets the whole background to purple */
}

.min-h-screen {
  min-height: 100vh;
}

.bg-purple-500 {
  background-color: #6A0DAD; /* This will make the container background purple */
}

.text-white {
  color: #ffffff;
}

.p-8 {
  padding: 2rem;
}

.max-w-4xl {
  max-width: 64rem;
}

.mx-auto {
  margin-left: auto;
  margin-right: auto;
}

.flex {
  display: flex;
}

.items-center {
  align-items: center;
}

.gap-3 {
  gap: 0.75rem;
}

.mb-8 {
  margin-bottom: 2rem;
}

.bg-white\/10 {
  background-color: rgba(255, 255, 255, 0.1);
}

.backdrop-blur-lg {
  backdrop-filter: blur(12px);
}

.rounded-xl {
  border-radius: 1rem;
}

.overflow-hidden {
  overflow: hidden;
}

.group {
  display: flex;
}

.flex-1 {
  flex: 1;
}

.p-4 {
  padding: 1rem;
}

.border-b {
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.text-white\/60 {
  color: rgba(255, 255, 255, 0.6);
}

.transition-colors {
  transition: background-color 0.3s;
}

.hover\:bg-white\/5:hover {
  background-color: rgba(255, 255, 255, 0.05);
}

.relative {
  position: relative;
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

.group-hover\:shadow-lg {
  transition: box-shadow 0.3s;
}

.transition-shadow {
  transition: box-shadow 0.3s;
}

.object-cover {
  object-fit: cover;
}

.absolute {
  position: absolute;
}

.inset-0 {
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}

.bg-black\/40 {
  background-color: rgba(0, 0, 0, 0.4);
}

.opacity-0 {
  opacity: 0;
}

.group-hover\:opacity-100:hover {
  opacity: 1;
}

.transition-opacity {
  transition: opacity 0.3s;
}
</style>
<body>
  <div class="min-h-screen bg-purple-500 text-white p-8">
    <div class="max-w-4xl mx-auto">
      <!-- Add Heading -->
      <h1 class="text-2xl font-bold mb-8">Featured Songs</h1>
      
      <div id="song-list" class="bg-white/10 backdrop-blur-lg rounded-xl overflow-hidden"></div>
    </div>
  </div>

  <script>const songs = [
	  {
		    title: "Hello",
		    artist: "Adele",
		    duration: "3:45",
		    albumArt: "https://upload.wikimedia.org/wikipedia/en/1/1b/Adele_-_21.png"
		  },
		  {
		    title: "Rolling in the deep",
		    artist: "Adele",
		    duration: "4:12",
		    albumArt: "https://upload.wikimedia.org/wikipedia/en/1/1b/Adele_-_21.png"
		  },
		  {
		    title: "Take it all",
		    artist: "Adele",
		    duration: "3:56",
		    albumArt: "https://upload.wikimedia.org/wikipedia/en/1/1b/Adele_-_21.png"
		  },
		  {
		    title: "He won't go",
		    artist: "Adele",
		    duration: "4:30",
		    albumArt: "https://upload.wikimedia.org/wikipedia/en/1/1b/Adele_-_21.png"
		  },
		  {
		    title: "One and only",
		    artist: "Adele",
		    duration: "5:02",
		    albumArt: "https://upload.wikimedia.org/wikipedia/en/1/1b/Adele_-_21.png"
		  }
		];

		function createSongElement(song) {
		  const songElement = document.createElement("div");
		  songElement.className = "group flex items-center gap-4 p-4 hover:bg-white/5 transition-colors border-b border-white/10 last:border-0";

		  const albumArtDiv = document.createElement("div");
		  albumArtDiv.className = "relative w-16 h-16 rounded-md overflow-hidden group-hover:shadow-lg transition-shadow";

		  const albumArtImg = document.createElement("img");
		  albumArtImg.src = song.albumArt;
		  albumArtImg.alt = song.title;
		  albumArtImg.className = "w-full h-full object-cover";

		  const playOverlay = document.createElement("div");
		  playOverlay.className = "absolute inset-0 bg-black/40 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity";

		  const playIcon = document.createElement("svg");
		  playIcon.className = "w-8 h-8 text-white";
		  playIcon.setAttribute("viewBox", "0 0 24 24");
		  playIcon.setAttribute("fill", "none");
		  playIcon.setAttribute("stroke", "currentColor");
		  playIcon.setAttribute("stroke-width", "2");
		  playIcon.setAttribute("stroke-linecap", "round");
		  playIcon.setAttribute("stroke-linejoin", "round");

		  playIcon.innerHTML = "<polygon points='5 3 19 12 5 21 5 3'></polygon>";

		  playOverlay.appendChild(playIcon);
		  albumArtDiv.appendChild(albumArtImg);
		  albumArtDiv.appendChild(playOverlay);

		  const songInfoDiv = document.createElement("div");
		  songInfoDiv.className = "flex-1";

		  const songTitle = document.createElement("h2");
		  songTitle.className = "font-semibold text-lg";
		  songTitle.textContent = song.title;

		  const songArtist = document.createElement("p");
		  songArtist.className = "text-white/60";
		  songArtist.textContent = song.artist;

		  songInfoDiv.appendChild(songTitle);
		  songInfoDiv.appendChild(songArtist);

		  const songDurationDiv = document.createElement("div");
		  songDurationDiv.className = "flex items-center gap-2 text-white/60";

		  const clockIcon = document.createElement("svg");
		  clockIcon.className = "w-4 h-4";
		  clockIcon.setAttribute("viewBox", "0 0 24 24");
		  clockIcon.setAttribute("fill", "none");
		  clockIcon.setAttribute("stroke", "currentColor");
		  clockIcon.setAttribute("stroke-width", "2");
		  clockIcon.setAttribute("stroke-linecap", "round");
		  clockIcon.setAttribute("stroke-linejoin", "round");

		  clockIcon.innerHTML = "<circle cx='12' cy='12' r='10'></circle><polyline points='12 6 12 12 16 14'></polyline>";

		  const durationText = document.createElement("span");
		  durationText.textContent = song.duration;

		  songDurationDiv.appendChild(clockIcon);
		  songDurationDiv.appendChild(durationText);

		  songElement.appendChild(albumArtDiv);
		  songElement.appendChild(songInfoDiv);
		  songElement.appendChild(songDurationDiv);

		  return songElement;
		}

		const songListContainer = document.getElementById("song-list");
		songs.forEach(song => {
		  const songElement = createSongElement(song);
		  songListContainer.appendChild(songElement);
		});
</script>
</body>
</html>
