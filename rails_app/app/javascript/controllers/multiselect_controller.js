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
        let self = this
        this.closeMenuEventListener = document.addEventListener("mouseup", function (event) {
            var obj = self.element
            var obj2 = document.getElementById(self.targetidValue);
            if (!obj.contains(event.target) && !obj2.contains(event.target)) {
                obj.style.display = "none"
            }
            if (obj2.contains(event.target)) {
                if (window.getComputedStyle(obj).display === "none") {
                    obj.style.display = "flex"
                } else {
                    obj.style.display = "none"
                }
            }
        })
    }
    disconnect() {
        document.removeEventListener('beforeunload', this.closeMenuEventListener)
    }
}
