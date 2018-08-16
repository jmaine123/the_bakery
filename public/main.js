var slideIndex = 0;

function slideshow() {
    var slides = document.getElementsByClassName("bakery_pic");
    console.log(slides);
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex+=1;
    if (slideIndex > slides.length) {slideIndex = 1}
    slides[slideIndex-1].style.display = "block";
    setTimeout(slideshow, 4000);
}

slideshow();

window.addEventListener('scroll', function(){
  var slides = document.getElementById('slides')
  var bakery_grid = document.getElementsByClassName('bakery_grid')
  var height = window.scrollY;
  console.log(height);
  console.log(slides)
  if (height === 0 || height <= 100){
    slides.style.display = "none";
    bakery_grid[0].style.display = "none"
  }
  else if (height >100 && height <=150) {
    slides.style.display = "block"
  }
  else {
    bakery_grid[0].style.display = "grid"
  }
})
