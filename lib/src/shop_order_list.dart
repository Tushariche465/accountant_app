import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'order_details.dart';
class ShopDetails extends StatefulWidget {
  final int index;
  final String id;
  final String shopname;
  final String address;
  final String contact;
  const ShopDetails({Key? key, required this.index,required this.id,required this.address,required this.contact,required this.shopname}) : super(key: key);

  @override
  State<ShopDetails> createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  DateTime date = DateTime.now();
  var myFormat = DateFormat('dd-MM-yyyy');
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> shopsDates = FirebaseFirestore.instance.collection('allshops').
    doc(widget.id).collection("dates").snapshots();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back,color: Colors.black,)),
          title: const Text('Orders',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black),)

      ),
      body: Center(
          child: StreamBuilder(
              stream: shopsDates,
              builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot) {
                if (snapshot.hasError) {
                  return const Text('something is wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('loading......');
                }
                final data = snapshot.requireData;
                return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          InkWell(
                            onTap: (){

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  ShopOrderDetails(index: widget.index,
                                    address: widget.address,shopname: widget.shopname,
                                    contact: widget.contact, id: widget.id,)));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.9,
                              height: MediaQuery.of(context).size.height*0.1,
                              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.011,bottom: MediaQuery.of(context).size.height*0.011),
                              decoration: BoxDecoration(
                                  color: const Color(0x40c0c0c0),
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(width: 1,color: Colors.orange)


                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  InkWell(
                                    onTap: (){
                                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopOrderDetails()));
                                    },
                                    child: Text('${data.docs[index]['date']}'),
                                  ),


                                ],
                              ),

                            ),
                          ),
                        ],
                      );
                    }
                );

              }
          )
      ),
    );
  }
}