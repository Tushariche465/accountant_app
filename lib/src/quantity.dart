import 'package:flutter/material.dart';

class QuantityScreen extends StatefulWidget {
  const QuantityScreen({Key? key}) : super(key: key);

  @override
  State<QuantityScreen> createState() => _QuantityScreenState();
}

class _QuantityScreenState extends State<QuantityScreen> {
  TextEditingController quantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Quantity'),
        backgroundColor: Colors.orange,

      ),
      body: Center(
        child: Container(

          width: MediaQuery.of(context).size.width*0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total Quantity',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Quantity',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                  Text('345',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500))
                ],
              ),
              SizedBox(height: 50,),
              Text('Add Quantity',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500)),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.3,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: quantityController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      onPressed: (){

                  }, child: Text('Add',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white)),)
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}
