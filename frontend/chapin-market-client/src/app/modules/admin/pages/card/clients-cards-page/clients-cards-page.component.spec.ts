import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClientsCardsPageComponent } from './clients-cards-page.component';

describe('ClientsCardsPageComponent', () => {
  let component: ClientsCardsPageComponent;
  let fixture: ComponentFixture<ClientsCardsPageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ClientsCardsPageComponent]
    });
    fixture = TestBed.createComponent(ClientsCardsPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
