import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="quotes"
export default class extends Controller {
  static targets = [ 'lineItemDate' ]

  reorderLineItemDates() {
    const lineItemDates = this.lineItemDateTargets;

    console.log(lineItemDates)
    
    const sortedDates = lineItemDates.sort((a, b) => {

      const dateA = new Date(a.getAttribute('date'));
      const dateB = new Date(b.getAttribute('date'));
      return dateA - dateB;
    });

    console.log(sortedDates);

    // Reorder in the DOM
    const container = this.lineItemDateTargets[0].parentElement;
    sortedDates.forEach(date => container.appendChild(date));
  }
}
