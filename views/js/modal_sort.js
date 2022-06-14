const sortModal = document.getElementById("sort-modal");
const openModal = document.getElementById("open-modal");
const closeModal = document.getElementById("close-modal");

window.addEventListener("DOMContentLoaded", (event) => {
  if (openModal) {
    openModal.addEventListener("click", () => {
      sortModal.classList.add("active");
    });
  }

  if (closeModal) {
    closeModal.addEventListener("click", () => {
      sortModal.classList.remove("active");
    });
  }
});
