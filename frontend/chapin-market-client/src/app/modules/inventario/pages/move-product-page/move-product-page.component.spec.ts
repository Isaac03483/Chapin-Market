import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MoveProductPageComponent } from './move-product-page.component';

describe('MoveProductPageComponent', () => {
  let component: MoveProductPageComponent;
  let fixture: ComponentFixture<MoveProductPageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [MoveProductPageComponent]
    });
    fixture = TestBed.createComponent(MoveProductPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
