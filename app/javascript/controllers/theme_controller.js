import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['toggler']

  initialize() {
    const theme = window.localStorage.getItem('theme')

    if (theme === 'dark') {
      this.toggleDark()
    } else {
      this.toggleLight()
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
    document.documentElement.setAttribute('data-theme', 'light')
    this.renderLightIcon()
    window.localStorage.setItem('theme', 'light')
  }

  toggleDark() {
    document.documentElement.setAttribute('data-theme', 'dark')
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
    return document.documentElement.getAttribute('data-theme')
  }
}
