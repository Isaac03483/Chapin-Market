import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddEmployeePageComponent } from './add-employee-page.component';

describe('AddEmployeePageComponent', () => {
  let component: AddEmployeePageComponent;
  let fixture: ComponentFixture<AddEmployeePageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AddEmployeePageComponent]
    });
    fixture = TestBed.createComponent(AddEmployeePageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
