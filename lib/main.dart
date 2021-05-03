
import 'dart:math';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyPromedioApp());

class MyPromedioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Promedio de Notas',
      debugShowCheckedModeBanner: false,
      home: MyPromedio(),
    );
  }
}

class MyPromedio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Promedio();
}

class Promedio extends State<MyPromedio> {
  final controller_num1=TextEditingController();
  final controller_num2=TextEditingController();
  final controller_num3=TextEditingController();
  final controller_num4=TextEditingController();
  final my_form_key=GlobalKey<FormState>();
  final d=Decimal;

  String muestrePromedio="";

  //Sacar el promedio
  void CalculoPromediarNotas(){
    
    int decimals = 2; 

    double format = pow(10, decimals); 
    
    //
    if(my_form_key.currentState.validate()){
      double number1=double.parse(controller_num1.text);
      double number2=double.parse(controller_num2.text);
      double number3=double.parse(controller_num3.text);
      double number4=double.parse(controller_num4.text);

      double resultado= (number1+number2+number3+number4)/4;

      setState(() {
        muestrePromedio="El promedio es: $resultado";
      });
    }

  }


  //diseño
  @override
  Widget build(BuildContext context) {
    
    return Scaffold( 
      //child,child
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:Text('Calcular el Promedio de Notas') ,
        backgroundColor:Colors.red.shade800,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){},
        ),
      ),
      //body
      body: Form(
        key: my_form_key,
        child:SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:<Widget>[
              Container(
                width:600,
                height:100,
                decoration:BoxDecoration(
                  color: Colors.red.shade800, 
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: new Image(
                        width: 150.0,
                        height: 150.0,
                        image: new AssetImage('assets/images/promedio.png'),
                      ),
                    )
                  ],
                ),              
              ),
              //se pueden colocar tantos container como deseemos
              //agregamos los textfield para el input de los datos
              Container(
                padding: EdgeInsets.only(top:40),
                child: Column(
                  children:<Widget> [
                    Container(
                      width:200,
                      height:50,
                      padding:EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black,blurRadius: 5)
                        ]),
                        child: TextFormField(
                          controller: controller_num1,
                          validator: (value){
                            if(value.isEmpty) return "Nota 1 necesaria";
                          },
                          decoration: InputDecoration(
                            hintText: "Nota 1",
                            icon: Icon(Icons.account_circle_outlined,
                            color: Colors.black)
                          ),
                          //
                          keyboardType: TextInputType.number,
                        ),
                    ),
                    Divider(height: 30),

                     Container(
                      width:200,
                      height:50,
                      padding:EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black,blurRadius: 5)
                        ]),
                        child: TextFormField(
                          controller: controller_num2,
                          validator: (value){
                            if(value.isEmpty) return "Nota 2 necesaria";
                          },
                          decoration: InputDecoration(
                            hintText: "Nota 2",
                            icon: Icon(Icons.account_circle_outlined,
                            color: Colors.black)
                          ),
                          //
                          keyboardType: TextInputType.number,
                        ),
                    ),
                    Divider(height: 30,),

                     Container(
                      width:200,
                      height:50,
                      padding:EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black,blurRadius: 5)
                        ]),
                        child: TextFormField(
                          controller: controller_num3,
                          validator: (value){
                            if(value.isEmpty) return "Nota 3 necesaria";
                          },
                          decoration: InputDecoration(
                            hintText: "Nota 3",
                            icon: Icon(Icons.account_circle_outlined,
                            color: Colors.black)
                          ),
                          //
                          keyboardType: TextInputType.number,
                        ),
                    ),
                    Divider(height: 30,),

                     Container(
                      width:200,
                      height:50,
                      padding:EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black,blurRadius: 5)
                        ]),
                        child: TextFormField(
                          controller: controller_num4,
                          validator: (value){
                            if(value.isEmpty) return "Nota 4 necesaria";
                          },
                          decoration: InputDecoration(
                            hintText: "Nota 4",
                            icon: Icon(Icons.account_circle_outlined,
                            color: Colors.black)
                          ),
                          //
                          keyboardType: TextInputType.number,
                        ),
                    ),
                  Divider(height: 35,), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: CalculoPromediarNotas,
                        shape: new RoundedRectangleBorder(
                          borderRadius:new BorderRadius.circular(30.0)),
                          color: Colors.yellow,
                          padding: EdgeInsets.only(bottom: 20,left: 60,right: 60,top: 20),
                          height: 50,
                          child: Column(
                            children: <Widget>[Icon(Icons.calculate),Text('Promedio')],
                          ),
                      )
                    ],
                  ),
                  Divider(height: 5),
                  //la caja donde se imprimira el resultado
                  Container(
                    height: 50.0,
                    width: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.grey.shade500,Colors.yellow]  
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(35))),
                  //creamos el llamado al resultado para el textformfield
                    child: Center(
                      child: Text(
                        muestrePromedio,
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 15.0)
                  ],
                ),
              )
            ],
          ),
        )
      ),


      );
  }
}