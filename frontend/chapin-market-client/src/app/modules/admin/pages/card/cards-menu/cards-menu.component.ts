import { Component } from '@angular/core';

@Component({
  selector: 'app-cards-menu',
  templateUrl: './cards-menu.component.html',
  styleUrls: ['./cards-menu.component.css']
})
export class CardsMenuComponent {
  navBarState: NavBarState = NavBarState.CLOSED;

  ngOnInit(): void {
  }

  setNavBarState(navBarSTate: NavBarState) {
    this.navBarState = navBarSTate;
  }

  protected readonly NavBarState = NavBarState;
}

enum NavBarState {
  CARDS_TYPES, CLIENTS_CARDS, CLOSED
}
