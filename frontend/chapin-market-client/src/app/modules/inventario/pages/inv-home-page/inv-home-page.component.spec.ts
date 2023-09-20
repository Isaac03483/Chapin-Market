import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InvHomePageComponent } from './inv-home-page.component';

describe('InvHomePageComponent', () => {
  let component: InvHomePageComponent;
  let fixture: ComponentFixture<InvHomePageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [InvHomePageComponent]
    });
    fixture = TestBed.createComponent(InvHomePageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
