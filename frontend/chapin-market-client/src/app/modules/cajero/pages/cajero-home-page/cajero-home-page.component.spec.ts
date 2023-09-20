import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CajeroHomePageComponent } from './cajero-home-page.component';

describe('CajeroHomePageComponent', () => {
  let component: CajeroHomePageComponent;
  let fixture: ComponentFixture<CajeroHomePageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [CajeroHomePageComponent]
    });
    fixture = TestBed.createComponent(CajeroHomePageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
