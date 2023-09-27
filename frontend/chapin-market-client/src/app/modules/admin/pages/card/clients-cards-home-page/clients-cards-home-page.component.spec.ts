import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClientsCardsHomePageComponent } from './clients-cards-home-page.component';

describe('ClientsCardsHomePageComponent', () => {
  let component: ClientsCardsHomePageComponent;
  let fixture: ComponentFixture<ClientsCardsHomePageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ClientsCardsHomePageComponent]
    });
    fixture = TestBed.createComponent(ClientsCardsHomePageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
