import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddClientCardPageComponent } from './add-client-card-page.component';

describe('AddClientCardPageComponent', () => {
  let component: AddClientCardPageComponent;
  let fixture: ComponentFixture<AddClientCardPageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AddClientCardPageComponent]
    });
    fixture = TestBed.createComponent(AddClientCardPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
