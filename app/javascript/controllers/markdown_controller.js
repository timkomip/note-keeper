import { Controller } from "@hotwired/stimulus"
import 'easymde';

export default class extends Controller {
  connect() {
    this.easyMDE = new EasyMDE({element: this.element});
  }
}
