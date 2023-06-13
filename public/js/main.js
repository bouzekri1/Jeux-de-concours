document.addEventListener('DOMContentLoaded', function () {
    var flashMessage = document.querySelector('.flash-error');

    flashMessage.addEventListener('mouseover', function () {
        flashMessage.classList.add('flash-error-hover');
    });

    flashMessage.addEventListener('mouseout', function () {
        flashMessage.classList.remove('flash-error-hover');
    });
        flashMessage.addEventListener('click', function () {
            flashMessage.style.display = 'none';
        });
});