import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListCardsTypesPageComponent } from './list-cards-types-page.component';

describe('ListCardsTypesPageComponent', () => {
  let component: ListCardsTypesPageComponent;
  let fixture: ComponentFixture<ListCardsTypesPageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ListCardsTypesPageComponent]
    });
    fixture = TestBed.createComponent(ListCardsTypesPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
