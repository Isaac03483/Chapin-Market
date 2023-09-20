import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BodegaHomePageComponent } from './bodega-home-page.component';

describe('BodegaHomePageComponent', () => {
  let component: BodegaHomePageComponent;
  let fixture: ComponentFixture<BodegaHomePageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [BodegaHomePageComponent]
    });
    fixture = TestBed.createComponent(BodegaHomePageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
