import { Component } from '@angular/core';

@Component({
  selector: 'app-clients-cards-home-page',
  templateUrl: './clients-cards-home-page.component.html',
  styleUrls: ['./clients-cards-home-page.component.css']
})
export class ClientsCardsHomePageComponent {

  navBarState: NavBarState = NavBarState.CLOSED;

  protected readonly NavBarState = NavBarState;

  setNavBarState(navBarState: NavBarState) {
    this.navBarState = navBarState;
  }
}

enum NavBarState {
  CLIENTS_WITHOUT_CARDS, CLIENTS_CARDS, CLOSED
}
