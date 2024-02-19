import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="multiselect"
export default class extends Controller {
    static values = {
        elements: Array,
        names: Array,
        targetid: String
    }
    update_selection() {
        let selected_elements = []
        for (var i = 0; i < this.elementsValue.length; i++) {
            let element = document.getElementById(this.elementsValue[i])
            if (element.checked) {
                selected_elements.push(this.namesValue[i])
            }
        }
        let innerHtml =""
        for(let i=0; i< selected_elements.length; i++) {
            innerHtml = innerHtml + "<span class='multiselect_selected_item'>" + selected_elements[i] + "</span>"
        }
        document.getElementById(this.targetidValue).innerHTML = innerHtml

    }
    connect ()  {
        this.update_selection()
        this.boundToggleMultiselect = this.toggleMultiselect.bind(this)
        document.addEventListener("mouseup", this.boundToggleMultiselect)
    }
    disconnect() {
        document.removeEventListener('mouseup', this.boundToggleMultiselect)
    }

    toggleMultiselect (e) {
        var obj = this.element
        var obj2 = document.getElementById(this.targetidValue);
        if (!obj.contains(e.target) && !obj2.contains(e.target)) {
            obj.style.display = "none"
        }
        if (obj2.contains(e.target)) {
            if (window.getComputedStyle(obj).display === "none") {
                obj.style.display = "flex"
            } else {
                obj.style.display = "none"
            }
        }
    }
}
