import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-left-nav-drawer"
export default class extends Controller {
  static values = {
    open: Boolean,
  }
  connect() {
    let grid = document.getElementById("grid-layout")
    if (this.openValue) {
      if (!grid.classList.contains("grid_nav_drawer_open")) {
        grid.classList.add('grid_nav_drawer_open');
      }
    } else {
      grid.classList.remove('grid_nav_drawer_open');
    }
  }
}
