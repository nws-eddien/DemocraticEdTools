import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static values = {
    timeleft: Number,
    timelimit: Number,
  };
  connect() {
    this.refreshTimer = setInterval(() => {
      this.timeleftValue--
      this.element.innerHTML = `
            <div role="progressbar" aria-valuemin="0" aria-valuemax="100" style="--value: ${this.timeleftValue/this.timelimitValue*100}">
                <div class="progressbar-text">${this.formatNumber(Math.floor(this.timeleftValue/60))}:${this.formatNumber(Math.abs(this.timeleftValue%60))}</div>
            </div>
        `
    },1000)
  }

  disconnect () {
    clearInterval(this.refreshTimer)
  }

  formatNumber (number) {
    return number.toLocaleString('en-US', {
      minimumIntegerDigits: 2,
      useGrouping: false
    })
  }
}
