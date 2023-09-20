import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddSalePageComponent } from './add-sale-page.component';

describe('AddSalePageComponent', () => {
  let component: AddSalePageComponent;
  let fixture: ComponentFixture<AddSalePageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AddSalePageComponent]
    });
    fixture = TestBed.createComponent(AddSalePageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
