import { Component } from '@angular/core';
import { FormBuilder, Validators, FormGroup } from '@angular/forms'
import { AuthService } from '../../services/auth.service';
import Swal from 'sweetalert2';
import { Router } from '@angular/router';
import { ValidateFields } from '../../../validations/validate-Fields';
import { MainClass } from 'src/classes/mainClass';
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

/*
La clase LoginComponent se encarga de manejar la lógica de la página de inicio de sesión.
*/
export class LoginComponent {
  hideConfirmPassword = true;
  validateField: MainClass= new MainClass();
  miFormulario: FormGroup = this.fb.group({
    email: ['', [Validators.required, Validators.pattern(/^(?:[^<>()[\].,;:\s@"]+(\.[^<>()[\].,;:\s@"]+)*|"[^\n"]+")@(?:[^<>()[\].,;:\s@"]+\.)+[^<>()[\]\.,;:\s@"]{2,63}$/i)]],
    password: ['', [Validators.required, Validators.minLength(8)]]
  })


  constructor(private fb: FormBuilder, private router: Router, private service: AuthService) { }

  noValidField(field: string): boolean {
    return ValidateFields.invalidField(this.miFormulario, field) || false
  }
  errorMsgField(field: string, namefield: string): string {
    return ValidateFields.errorMsg(this.noValidField(field), this.miFormulario, field, namefield);
  }

  /*
  La función login() se encarga de realizar la petición de inicio de sesión al backend.
  */
  login() {
    const { email, password } = this.miFormulario.value;
    if (email && password) {
      this.service.login(email, password).subscribe((resp) => {
        if (resp.ok === true) {
            this.router.navigateByUrl(`${resp.rol}/inicio`);
          Swal.fire('Bienvenido',`El usuario ha iniciado sesión.`, 'success');
        } else {
          Swal.fire('Cuenta no registrada', 'Revisa si los campos estan correctos.', 'error');
        }
      })
    } else {
      Swal.fire('Cuenta no registrada', 'Revisa si los campos estan correctos.', 'error');
    }
  }


}
