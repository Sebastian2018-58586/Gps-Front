
// La interfaz User define la estructura 
//de un objeto de usuario. Cada propiedad en esta interfaz representa un campo de datos para un usuario.
export interface User {
  uid?:string,
  name?: string,
  surname?:string,
  image?:string,
  adress?:string,
  phoneNumber?:number,
  rol?: string,
  email?:string
}
// define la estructura de un objeto de respuesta de autenticación. 
export interface AuthResponse{
  ok: boolean,
  uid?: string,
  name?: string,
  surname?:string,
  image?:string,
  adress?:string,
  phoneNumber?:number,
  rol?: string,
  email?:string
  token?:string
}
