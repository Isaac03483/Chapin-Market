import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SaleFormPageComponent } from './sale-form-page.component';

describe('SaleFormPageComponent', () => {
  let component: SaleFormPageComponent;
  let fixture: ComponentFixture<SaleFormPageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [SaleFormPageComponent]
    });
    fixture = TestBed.createComponent(SaleFormPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
