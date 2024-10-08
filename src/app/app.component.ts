import { Component } from '@angular/core';
import { CommonModule } from '@angular/common'; 
import { Renderer2 } from '@angular/core';
import { FormsModule } from '@angular/forms';
// declare the interface to store user data
interface UserData{
  firstName: string;
  lastName: string;
  username: string;
  password: string;
  email: string;
  isVerified: boolean;
}

@Component({
  selector: "app-root",
  standalone: true,
  imports: [CommonModule, FormsModule],
  // define a template as an external file 
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'my-angular-app';

  users: UserData[] = [];
  currentUser: UserData = {
    firstName: '',
    lastName: '',
    username: '',
    password: '',
    email: '',
    isVerified: false
  };
  
  // variables that holds whether or not the modals are open
  isLoginModalOpen = false;
  isSigninModalOpen = false;
  
  // instance of renderer2
  constructor(private renderer: Renderer2){

  }




  OnSubmit(){
    // save the values the user inputs into an array
    const newUser = {
      ...this.currentUser
    };
    // add new user to array
    this.users.push(newUser);
    // reset the form after saving the data only if isVerified is true
    if(newUser.isVerified == true){
      // print the data to console
      console.log(this.currentUser);
      this.resetForm();
    }
  }

  resetForm(){
    this.currentUser = {
      firstName: '',
      lastName: '',
      username: '',
      password: '',
      email: '',
      isVerified: false
    };
  }

  openLoginModal(){
    const modelDiv = document.getElementById('loginModal');
    if(modelDiv != null){
      modelDiv.style.display = 'block';
      this.isLoginModalOpen = true;
      this.renderer.addClass(document.body, 'model-open');
    }
  }
  closeLoginModal(){
    const modelDiv = document.getElementById('loginModal');
    if(modelDiv != null){
      modelDiv.style.display = 'none';
      this.isLoginModalOpen = false;
      this.renderer.removeClass(document.body, 'model-open'); 
    }
  }
  openSigninModal(){
    const modelDiv = document.getElementById('signinModal');
    if(modelDiv != null){
      modelDiv.style.display = 'block';
      this.isSigninModalOpen = true;
      this.renderer.addClass(document.body, 'model-open');
    }
  }

  closeSigninModal(){
    const modelDiv = document.getElementById('signinModal');
    if(modelDiv != null){
      modelDiv.style.display = 'none';
      this.isSigninModalOpen = false;
      this.renderer.removeClass(document.body, 'model-open'); 
    }
  }
}
