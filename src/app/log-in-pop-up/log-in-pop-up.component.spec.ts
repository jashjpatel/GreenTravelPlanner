import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LogInPopUpComponent } from './log-in-pop-up.component';

describe('LogInPopUpComponent', () => {
  let component: LogInPopUpComponent;
  let fixture: ComponentFixture<LogInPopUpComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [LogInPopUpComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LogInPopUpComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
