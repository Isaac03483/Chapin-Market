import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UpdateClientPageComponent } from './update-client-page.component';

describe('UpdateClientPageComponent', () => {
  let component: UpdateClientPageComponent;
  let fixture: ComponentFixture<UpdateClientPageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [UpdateClientPageComponent]
    });
    fixture = TestBed.createComponent(UpdateClientPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
