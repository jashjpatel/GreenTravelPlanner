import { Component } from '@angular/core';
import { CommonModule } from '@angular/common'; 
import { Renderer2 } from '@angular/core';

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

  // instance of renderer2
  constructor(private renderer: Renderer2){

  }

  openModal(){
    const modelDiv = document.getElementById('myModal');
    if(modelDiv != null){
      modelDiv.style.display = 'block';
      this.isModalOpen = true;
      this.renderer.addClass(document.body, 'model-open');
    }
  }
  closeModal(){
    const modelDiv = document.getElementById('myModal');
    if(modelDiv != null){
      modelDiv.style.display = 'none';
      this.isModalOpen = false;
      this.renderer.removeClass(document.body, 'model-open'); 
    }
  }
}

console.log('Testing 12345');
