import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['toggler']

  toggleTheme() {
    if (document.documentElement.getAttribute('data-theme') === 'dark') {
      this.toggleLight()
    } else {
      this.toggleDark()
    }
  }

  toggleLight() {
    document.documentElement.setAttribute('data-theme', 'light')
    this.togglerTarget.textContent = '🔆'
  }

  toggleDark() {
    document.documentElement.setAttribute('data-theme', 'dark')
    this.togglerTarget.textContent = '🔅'
  }
}
