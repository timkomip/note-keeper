import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.input = this.element
    this.editor = null
    this.setUpEditor()
  }

  disconnect() {
    this.cleanUpEditor()
  }

  setUpEditor() {
    this.input.hidden = true;
    this.editor = document.createElement('div')
    this.editor.className = 'border p-4'
    this.editor.setAttribute('contenteditable', true)
    this.editor.innerHTML = this.input.value
    this.editor.addEventListener('blur', (e) => {
      this.input.value = e.target.innerHTML
    })
    this.input.parentNode.insertBefore(this.editor, this.editor.nextSibling);
  }

  cleanUpEditor() {
    if (this.editor) {
      this.editor.remove()
      this.editor = null
    }
    this.input.hidden = false
  }
}
