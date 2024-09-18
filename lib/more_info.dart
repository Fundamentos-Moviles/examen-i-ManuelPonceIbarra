import 'package:flutter/material.dart';
import 'package:examen1_pim/utils/constants.dart' as con;

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  late List<int> recuadros;
  void initState(){
    recuadros = List.from(con.Lrecuadros);
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Padding(padding: EdgeInsets.all(15),
      child: Column(
        children: [
          ElevatedButton(onPressed: (){
            agregar();
          },style: ElevatedButton.styleFrom(
            backgroundColor: con.botones,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            fixedSize: Size(200, 40),
            ), child: Text('Iniciar Sesion',
            style: TextStyle(color: con.blanco,fontSize: 20),)
          ),
          SizedBox(height: 10,),
          if(recuadros.isNotEmpty)
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: List.generate(recuadros.length, (contenedor){
                  return Row(
                    children: List.generate(recuadros[contenedor], (index) => Expanded(
                        child: Container(
                          margin: EdgeInsets.only(bottom:10),
                        color: (index % 2==0) ? con.rojo : con.fondo4,
                        height: 200,)
                    )
                    ),
                  );
                }),
              ),
            ))
        ],
      ),
    );
  }
  void agregar(){
    setState(() {
      if(recuadros.isEmpty || recuadros.last ==12){
        recuadros.add(1);
      }else{
        recuadros[recuadros.length-1]++;
      }
    });
  }
}