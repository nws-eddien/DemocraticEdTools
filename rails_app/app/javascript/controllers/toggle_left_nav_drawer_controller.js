import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-left-nav-drawer"
export default class extends Controller {
  connect() {
    console.log("nix")
  }

  toggle() {
    let drawer = document.getElementById("left_nav_drawer")
    let overlay = document.getElementById("nav_drawer_left_overlay")
    if (getComputedStyle(drawer).display === "none") {
      drawer.style.display="block"
      overlay.style.display="block"
    } else {
      drawer.style.display="none"
      overlay.style.display="none"
    }
  }
}
