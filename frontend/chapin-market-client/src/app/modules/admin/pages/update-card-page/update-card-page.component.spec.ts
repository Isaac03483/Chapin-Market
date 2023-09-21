import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UpdateCardPageComponent } from './update-card-page.component';

describe('UpdateCardPageComponent', () => {
  let component: UpdateCardPageComponent;
  let fixture: ComponentFixture<UpdateCardPageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [UpdateCardPageComponent]
    });
    fixture = TestBed.createComponent(UpdateCardPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
