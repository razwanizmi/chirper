import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['toggler']

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
    document.documentElement.setAttribute('data-theme', 'light')
    this.renderLightIcon()
  }

  toggleDark() {
    document.documentElement.setAttribute('data-theme', 'dark')
    this.renderDarkIcon()
  }

  renderLightIcon() {
    this.togglerTarget.textContent = '🔆'
  }

  renderDarkIcon() {
    this.togglerTarget.textContent = '🔅'
  }

  currentTheme() {
    return document.documentElement.getAttribute('data-theme')
  }
}
