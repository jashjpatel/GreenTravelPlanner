import { Component } from '@angular/core';
import { CommonModule } from '@angular/common'; 

@Component({
  selector: "app-root",
  standalone: true,
  imports: [CommonModule],
  // define a template as an external file 
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'my-angular-app';
  openModal(){
    const modelDiv = document.getElementById('myModal');
    if(modelDiv != null){
      modelDiv.style.display = 'block';
    }
  }
}

console.log('Testing 12345');
