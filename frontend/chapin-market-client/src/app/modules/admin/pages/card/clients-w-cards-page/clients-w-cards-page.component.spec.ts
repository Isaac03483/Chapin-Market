import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClientsWCardsPageComponent } from './clients-w-cards-page.component';

describe('ClientsWCardsPageComponent', () => {
  let component: ClientsWCardsPageComponent;
  let fixture: ComponentFixture<ClientsWCardsPageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ClientsWCardsPageComponent]
    });
    fixture = TestBed.createComponent(ClientsWCardsPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
