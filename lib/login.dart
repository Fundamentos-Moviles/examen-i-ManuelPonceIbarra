import 'package:examen1_pim/home.dart';
import 'package:flutter/material.dart';
import 'package:examen1_pim/utils/constants.dart' as con;
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usuario = TextEditingController();
  final pass = TextEditingController();
  String error='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(color: con.fondo2),
            Column(
              children: [
                Expanded(
                    child: Row(
                      children: [
                        Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: con.fondo))),
                        Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: con.fondo2))),
                        Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: con.fondo3))),
                        Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: con.fondo4)))
                      ],
                    )
                ),
                Expanded(
                    child: Row(
                      children: [
                        Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: con.fondo4))),
                        Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: con.fondo3))),
                        Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: con.fondo2))),
                        Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: con.fondo)))
                      ],
                    )
                ),
                Expanded(
                    child: Row(
                      children: [
                        Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: con.fondo3))),
                        Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: con.fondo4))),
                        Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: con.fondo))),
                        Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: con.fondo2)))
                      ],
                    )
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 150.0, left: 50, bottom: 150, right: 50),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: con.gris,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Bienvenido a tu primer EXAMEN',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: con.titulos,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: usuario,
                          decoration: InputDecoration(
                            hintText: 'Correo/Usuario',
                            filled: true,
                            fillColor: con.blanco,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: con.negro, width: 1.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: pass,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            filled: true,
                            fillColor: con.blanco,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: con.negro, width: 1.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Text(
                          error,
                          style: TextStyle(color: con.rojo, fontSize: 16),
                        ),
                        ElevatedButton(onPressed: (){
                          /*validar contraseña y usuario*/
                          validUser();
                        },
                            style: ElevatedButton.styleFrom(
                             backgroundColor: con.botones,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fixedSize: Size(200, 40),
                            ),
                            child: Text('Iniciar Sesion',
                            style: TextStyle(color: con.blanco,fontSize: 20),)
                        ),
                        const SizedBox(height: 30.0),
                        Text('Mi primer examen ¿Estara sencillo?',
                        style: TextStyle(color: con.blanco, fontSize: 15),),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
        );
  }
  void validUser(){
    setState(() {
      if(usuario.text.isEmpty && pass.text.isEmpty){
        error='Datos Incompleto';
      }else if(usuario.text=='test' && pass.text=='FDM1'){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }else if(usuario.text=='test' && pass.text!='FDM1'){
        error='Error en contraseña';
      }else if(usuario.text!='test' && pass.text=='FDM1'){
        error='Error en Usuario';
      }else if(usuario.text!='test' && pass.text!='FDM1'){
        error='Error en usuario y contraseña';
      }
    });
  }
}
