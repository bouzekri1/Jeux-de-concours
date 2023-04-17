const playButton = document.getElementById("playButton");
playButton.addEventListener("click", function () {
    alert("Jouer maintenant !");
});

const images = document.querySelectorAll('.banner-container-img img');
let currentImageIndex = 0;

function showNextImage() {
    // Hide the current image
    images[currentImageIndex].classList.remove('active');
    // Move to the next image
    currentImageIndex = (currentImageIndex + 1) % images.length;
    // Show the next image
    images[currentImageIndex].classList.add('active');
}

// Show the first image
images[0].classList.add('active');

// Call showNextImage every 3 seconds
setInterval(showNextImage, 3000);

// Add an event listener to the banner container to pause the slideshow when the user hovers over it
const bannerContainer = document.querySelector('.banner-container-img');
bannerContainer.addEventListener('mouseenter', () => {
    clearInterval(slideshowInterval);
});

// Add an event listener to the banner container to resume the slideshow when the user moves the mouse away
bannerContainer.addEventListener('mouseleave', () => {
    slideshowInterval = setInterval(showNextImage, 3000);
});

