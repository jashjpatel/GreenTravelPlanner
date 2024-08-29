import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import {MatDialog, MatDialogModule} from '@angular/material/dialog';
import { LogInPopUpComponent } from './log-in-pop-up/log-in-pop-up.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, MatDialogModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  title = 'my-angular-app';

  // creating an instance of MatDialog
  constructor(private dialog: MatDialog) {

  }
  // creating a function to open the dialog
  openDialog(){

    this.dialog.open(LogInPopUpComponent);
  }

}
console.log('Test');