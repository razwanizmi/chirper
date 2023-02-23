import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['document', 'toggler']

  initialize() {
    if (this.savedTheme() !== this.currentTheme()) {
      this.initTheme()
    }
  }

  click() {
    if (this.currentTheme() === 'dark') {
      this.toggleLight()
    } else {
      this.toggleDark()
    }
  }

  mouseover() {
    if (this.currentTheme() === 'dark') {
      this.renderLightIcon()
    } else {
      this.renderDarkIcon()
    }
  }

  mouseout() {
    if (this.currentTheme() === 'dark') {
      this.renderDarkIcon()
    } else {
      this.renderLightIcon()
    }
  }

  toggleLight() {
    this.documentTarget.setAttribute('data-theme', 'light')
    this.renderLightIcon()
    window.localStorage.setItem('theme', 'light')
  }

  toggleDark() {
    this.documentTarget.setAttribute('data-theme', 'dark')
    this.renderDarkIcon()
    window.localStorage.setItem('theme', 'dark')
  }

  renderLightIcon() {
    this.togglerTarget.textContent = '🔆'
  }

  renderDarkIcon() {
    this.togglerTarget.textContent = '🔅'
  }

  currentTheme() {
    return this.documentTarget.getAttribute('data-theme')
  }

  savedTheme() {
    return window.localStorage.getItem('theme')
  }

  initTheme() {
    if (this.savedTheme() === 'dark') {
      this.toggleDark()
    } else {
      this.toggleLight()
    }
  }
}
