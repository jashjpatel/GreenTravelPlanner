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
  // variable that holds whether or not the modal is open
  isModalOpen = false;

  openModal(){
    const modelDiv = document.getElementById('myModal');
    if(modelDiv != null){
      modelDiv.style.display = 'block';
      this.isModalOpen = true;
    }
  }
  closeModal(){
    const modelDiv = document.getElementById('myModal');
    if(modelDiv != null){
      modelDiv.style.display = 'none';
      this.isModalOpen = false;
    }
  }
}

console.log('Testing 12345');
