import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListEmployeesPageComponent } from './list-employees-page.component';

describe('ListEmployeesPageComponent', () => {
  let component: ListEmployeesPageComponent;
  let fixture: ComponentFixture<ListEmployeesPageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ListEmployeesPageComponent]
    });
    fixture = TestBed.createComponent(ListEmployeesPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
