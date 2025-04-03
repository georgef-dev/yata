import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["select"]

  connect() {
    this.updateSelectStyle()
  }

  change() {
    this.updateSelectStyle()
  }

  updateSelectStyle() {
    const select = this.selectTarget
    const value = select.value
    
    // Remove any existing color classes
    select.classList.remove(
      'border-green-300', 'border-yellow-300', 'border-red-300',
      'bg-green-50', 'bg-yellow-50', 'bg-red-50'
    )
    
    // Add new color classes based on priority
    switch(value) {
      case 'low':
        select.classList.add('border-green-300', 'bg-green-50')
        break
      case 'medium':
        select.classList.add('border-yellow-300', 'bg-yellow-50')
        break
      case 'high':
        select.classList.add('border-red-300', 'bg-red-50')
        break
    }
  }
} 