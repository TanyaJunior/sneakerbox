// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

document.addEventListener("DOMContentLoaded", function () {
  const navbarCollapse = document.querySelector("#navbarSupportedContent");
  const navbarToggler = document.querySelector("#navbarToggler");

  navbarToggler.addEventListener("click", function () {
    if (navbarCollapse.style.display === "none" || navbarCollapse.style.display === "") {
      navbarCollapse.style.display = "flex";
    } else {
      navbarCollapse.style.display = "none";
    }
  });
});
