import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ShowProductsPageComponent } from './show-products-page.component';

describe('ShowProductsPageComponent', () => {
  let component: ShowProductsPageComponent;
  let fixture: ComponentFixture<ShowProductsPageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ShowProductsPageComponent]
    });
    fixture = TestBed.createComponent(ShowProductsPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
