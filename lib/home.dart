import 'package:flutter/material.dart';
import 'package:examen1_pim/utils/constants.dart' as con;

import 'more_info.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List lista;

  @override
  void initState() {
    lista = List.from(con.listaExamen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: con.fondo2,
          ),
          Padding(
            padding:
            const EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: con.blanco,
                    boxShadow: [
                      BoxShadow(
                        color: con.blanco.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: const Center(
                    child: Text('Notificaciones de actividades',
                        style: TextStyle(fontSize: 24,color: con.titulos,
                          fontWeight: FontWeight.bold,)),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (BuildContext context, int index) {
                      var datos = lista[index].toString().split('#');
                      return Column(
                        children: [
                          int.parse(datos[0]) % 2 == 1
                              ? createCard1(id: datos[0],Numero: datos[1],
                            txt: datos[2],nota: datos[3],
                            estrellas: int.parse(datos[4]),
                          )
                              : createCard2(index, int.parse(datos[0]),
                            datos[1], datos[2], datos[3], int.parse(datos[4]),
                          ),
                          const SizedBox(height: 15),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    'SEGUNDA VISTA:_Manuel_Ponce_Ibarra',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: con.titulos,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container createCard2(int index, int id, String Numero, String txt,
      String nota, int estrellas) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: con.card,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      Numero,
                      style: TextStyle(fontSize: 24,color: con.fondo2,),
                    ),
                    Spacer(),
                    Icon(Icons.eco_outlined,color: con.hoja,),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  txt,
                  style: TextStyle(fontSize: 16,color: con.negro),
                ),
                SizedBox(height: 5),
                Text(
                  "Nota: $nota",
                  style: TextStyle(fontSize: 12,color: con.gris,),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(5,(index) => Icon(Icons.star,
                    color: index < estrellas ? con.est : con.gris,
                    size: 18,
                  ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MoreInfo()));
                  },
                  icon: Icon(Icons.edit, size: 18, color: con.blanco,),
                  label: Text("Ver más", style: TextStyle(color: con.blanco),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: con.bot,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fixedSize: Size(150, 20),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    if (Numero == '20' || Numero == '23' || Numero == '15' || Numero == '10') {
                      showSnackBar('Se elimino el elemento con el id: $id', 5);
                    }else{ setState(() {
                      lista.removeAt(index);
                      showSnackBar('Se elimino el elemento con el id: $id', 5);
                    });}
                  },
                  icon: Icon(Icons.delete, size: 18, color: con.blanco),
                  label: Text("Borrar", style: TextStyle(color: con.blanco),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: con.bot,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fixedSize: Size(150, 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(String texto,int duracion) {
    final snackBar = SnackBar(
      content: Text(texto),
      duration: Duration(seconds: duracion)
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}


class createCard1 extends StatelessWidget {
  final String id;
  final String Numero;
  final String txt;
  final String nota;
  final int estrellas;
  const createCard1({
    super.key, required this.id, required this.Numero, required this.txt, required this.nota, required this.estrellas,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MoreInfo()));
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: con.card,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    Numero,
                    style: TextStyle(fontSize: 24,color: con.fondo2,),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(),
                ),
                Expanded(
                  flex: 0,
                  child: Icon(Icons.eco_outlined,color: con.hoja,),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              txt,
              style: TextStyle(fontSize: 16,color: con.negro,),
            ),
            SizedBox(height: 5),
            Text(
              "Nota: $nota",
              style: TextStyle(fontSize: 12,color: con.gris,),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(5,(index) => Icon(Icons.star,
                  color: index < estrellas ? con.est : con.gris,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
