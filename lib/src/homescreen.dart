import 'package:accountant_app/src/ordergeneration.dart';
import 'package:accountant_app/src/pdffile.dart';
import 'package:accountant_app/src/quantity.dart';
import 'package:accountant_app/src/rate.dart';
import 'package:accountant_app/src/shop_order_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: [
            InkWell(
            onTap: (){

               Navigator.push(context, MaterialPageRoute(builder: (context)=> RateScreen()));
              // ShopDetails(index: index, id: '${data.docs[index].id}',shopname: '${data.docs[index]['shopname']}',address: '${data.docs[index]['address']}',contact: data.docs[index]['contact'],)));
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.08,
                margin: const EdgeInsets.symmetric(vertical: 8),

                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 1,color: Colors.orange)

                ),
                child: const Center(
                    child: Text('Rate')
                ),
              ),
            ),
            InkWell(
          onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> AccoutantScreen()));
         },
          child: Container(
            width: MediaQuery.of(context).size.width*0.9,
            height: MediaQuery.of(context).size.height*0.08,
            margin: EdgeInsets.symmetric(vertical: 8),

            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 1,color: Colors.orange)

            ),
            child: Center(
                child: Text('Shops and Orders')
            ),
          ),
        ),
            InkWell(
            onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=> QuantityScreen()));
              // ShopDetails(index: index, id: '${data.docs[index].id}',shopname: '${data.docs[index]['shopname']}',address: '${data.docs[index]['address']}',contact: data.docs[index]['contact'],)));
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.08,
                margin: const EdgeInsets.symmetric(vertical: 8),

                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 1,color: Colors.orange)

                ),
                child: Center(
                    child: Text('Quantity')
                ),
              ),
            ),
            InkWell(
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderGeneration()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.08,
                margin: const EdgeInsets.symmetric(vertical: 8),

                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 1,color: Colors.orange)

                ),
                child: Center(
                    child: Text('Order Generation')
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccoutantScreen extends StatefulWidget {
  const AccoutantScreen({Key? key}) : super(key: key);

  @override
  State<AccoutantScreen> createState() => _AccoutantScreenState();
}

class _AccoutantScreenState extends State<AccoutantScreen> {
  //TextEditingController _datecontroller = new TextEditingController();
  DateTime date = DateTime.now();
  var myFormat = DateFormat('dd-MM-yyyy');

  List<String> orders=['Shop1','Shop2','Shop3','Shop4','Shop5','Shop6','Shop7'];
  final Stream<QuerySnapshot> shops = FirebaseFirestore.instance.collection('allshops').snapshots();


  @override
  Widget build(BuildContext context) {
   //f print('date time now ${DateTime.now()}');
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_rounded,color: Colors.black,)),
        backgroundColor: Colors.white,
        title: const Text('Accountant Screen',style: TextStyle(color: Colors.black
        ),        ),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.85,
            width: MediaQuery.of(context).size.width*0.9,
            child: StreamBuilder<QuerySnapshot>(stream: shops,
                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
                  if(snapshot.hasError){
                    return const Text('something is wrong');
                  } if(snapshot.connectionState == ConnectionState.waiting){
                    return const Text('loading......');
                  }
                  final data = snapshot.requireData;
                  return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                ShopDetails(index: index, id: '${data.docs[index].id}',shopname: '${data.docs[index]['shopname']}',address: '${data.docs[index]['address']}',contact: data.docs[index]['contact'],)));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.9,
                            height: MediaQuery.of(context).size.height*0.08,
                            margin: EdgeInsets.symmetric(vertical: 8),

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                border: Border.all(width: 1,color: Colors.orange)

                            ),
                            child: Center(
                                child: Text('${data.docs[index]['shopname']}')
                            ),
                          ),
                        );

                      }
                  );

                })
          ),
        ),

      ),
    );
  }
}



