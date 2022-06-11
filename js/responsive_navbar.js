// Responsive navbar

const bar = document.getElementById("bar");
const navbar = document.getElementById("navbar");
const close = document.getElementById("close");

window.addEventListener("DOMContentLoaded", (event) => {
  if (bar) {
    bar.addEventListener("click", () => {
      navbar.classList.add("active");
    });
  }

  if (close) {
    close.addEventListener("click", () => {
      navbar.classList.remove("active");
    });
  }
});
