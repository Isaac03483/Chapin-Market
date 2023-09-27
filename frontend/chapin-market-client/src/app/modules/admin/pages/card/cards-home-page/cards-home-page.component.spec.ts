import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CardsHomePageComponent } from './cards-home-page.component';

describe('CardsHomePageComponent', () => {
  let component: CardsHomePageComponent;
  let fixture: ComponentFixture<CardsHomePageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [CardsHomePageComponent]
    });
    fixture = TestBed.createComponent(CardsHomePageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
