import 'dart:developer';

import 'package:accountant_app/src/pdffile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:url_launcher/url_launcher.dart';



class ShopOrderDetails extends StatefulWidget {
  final int index;
  final String id;
  final String shopname;
  final String address;
  final String contact;
  const ShopOrderDetails({Key? key, required this.index,required this.id,required this.shopname,required this.contact,required this.address}) : super(key: key);


  @override
  State<ShopOrderDetails> createState() => _ShopOrderDetailsState();
}

class _ShopOrderDetailsState extends State<ShopOrderDetails> {
  var shopsDates = null;
  /*List<String> orders=['Shop1','Shop2','Shop3','Shop4','Shop5','Shop6','Shop7'];
  List<String> Addresses= ['chinchwad','Katraj','Akurdi','Nigdi','Narhe','Warje','Karve Nagar'];
  List<int> contacts= [9999999991,9999999992,9999999993,9999999994,9999999995,9999999996,9999999997];
  List<int> Quantities=[10,12,14,7,8,15,14];
  int rate =124;*/

  FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  Widget build(BuildContext context) {
    if(shopsDates==null){
      shopsDates = FirebaseFirestore.instance.collection('allshops').
      doc(widget.id).collection("dates").snapshots();
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Generate Invoice'),

        ),
        body:Center(
          child: SizedBox(
              child:  Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: MediaQuery.of(context).size.height*0.6,

                  //color: Colors.red,
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
                              TextEditingController rateController = TextEditingController(text: data.docs[index]['rate'].toString());
                              TextEditingController quantityController = TextEditingController(text: data.docs[index]['deliveredquantity'].toString());
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1),
                                height: MediaQuery.of(context).size.height*0.6,
                                width: MediaQuery.of(context).size.width*0.9,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 2,color: Colors.grey),
                                    borderRadius: const BorderRadius.all(Radius.circular(15))

                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      //color:Colors.grey

                                      height: MediaQuery.of(context).size.height*0.06,
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Shop Name : ',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),),
                                          Text(widget.shopname,style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),)
                                        ],
                                      ),
                                    ),
                                    Container(


                                      child: Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,

                                        children: [
                                          Text('Shop Address : ',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),),
                                          Flexible(child: Text(widget.address,style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),))
                                        ],
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: SizedBox(
                                        height: MediaQuery.of(context).size.height*0.06,
                                        child: Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('DeliveredQuantity : ',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.2,
                                              child: TextField(
                                                controller: quantityController,
                                              ),
                                            ),
                                           IconButton(onPressed: (){
                                             FirebaseFirestore db = FirebaseFirestore.instance;
                                             int temp = int.parse(quantityController.text);

                                             final washingtonRef = db.collection("allshops").doc(widget.id)
                                                 .collection("dates").doc(data.docs[index].id);
                                             washingtonRef.update({"deliveredquantity": temp}).then(
                                                     (value) => log(""),
                                                 onError: (e) => log("Error updating document $e"));
                                           }, icon: Icon(Icons.check_rounded))
                                           // Text('${data.docs[index]['orderquantity']}',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.06,
                                      child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Rate : ',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width*0.2,
                                                child: TextField(
                                                  keyboardType: TextInputType.numberWithOptions(),
                                                  controller: rateController,
                                                ),
                                              ),
                                              IconButton(onPressed: (){
                                                FirebaseFirestore db = FirebaseFirestore.instance;
                                                int temp = int.parse(rateController.text);
                                                
                                                  final washingtonRef = db.collection("allshops").doc(widget.id)
                                                      .collection("dates").doc(data.docs[index].id);
                                                  washingtonRef.update({"rate": temp}).then(
                                                          (value) => log(""),
                                                      onError: (e) => log("Error updating document $e"));
                                                }
                                              , icon: Icon(Icons.check_rounded))
                                            ],
                                          )
                                          //Text('${data.docs[index]['rate']}',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.06,
                                      child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Total : ',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),),
                                          Text('${data.docs[index]['rate']*data.docs[index]['deliveredquantity']}',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.06,
                                      child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Contact : ',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),),
                                          InkWell(
                                              onTap: ()async{

                                                launchUrl(Uri.parse('tel:${widget.contact}'));
                                                //tel:+1-555-010-999

                                                //launchUrl(_url);
                                              },
                                              child: Text('${widget.contact}',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.06,
                                      child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Deposit : ',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),),
                                          InkWell(
                                              onTap: ()async{

                                              },
                                              child: Text('${data.docs[index]['deposited']}',
                                                style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.06,
                                      child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Balance : ',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),),
                                          InkWell(
                                              onTap: ()async{

                                              },
                                              child: Text('${data.docs[index]['balance']}',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025 ,fontWeight: FontWeight.w400),))
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(onPressed: (){
                                      _createPDF(data.docs[index]['date'],  widget.shopname,  widget.address,data.docs[index]['orderquantity'],data.docs[index]['rate'],data.docs[index]['rate']*data.docs[index]['orderquantity'],widget.contact,data.docs[index]['deposited'],data.docs[index]['balance']);
                                    },
                                      style: ElevatedButton.styleFrom(primary: const Color(0xddc0c0c0),), child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Text('Print'),
                                          Icon(Icons.print)
                                        ],
                                      ),

                                    )


                                  ],
                                ),
                              );
                            }
                        );

                      }
                  )
              )

          ),


        )
    );
  }
  
  Future<void> _createPDF(String date,String shopname,String address,int quantity,int rate,int total,String contact,int deposit,int balance)async{
    PdfDocument document = PdfDocument();

    final PdfPage page = document.pages.add();

    page.graphics.drawString('Sinhagad Poultry Farm', PdfStandardFont(PdfFontFamily.helvetica, 30),/*bounds: Rect.fromLTWH(0, 0, 150, 20)*/);
// Create a PDF grid class to add tables.
    final PdfGrid grid = PdfGrid();
// Specify the grid column count.
    grid.columns.add(count: 2);
// Add a grid header row.
    final PdfGridRow headerRow = grid.headers.add(1)[0];
    headerRow.cells[0].value = 'Shop Name';
    headerRow.cells[1].value = shopname;
    //headerRow.cells[2].value = 'Country';
// Set header font.
    headerRow.style.font =
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold);
// Add rows to the grid.
    PdfGridRow row = grid.rows.add();
    row.cells[0].value = 'Shop Address';
    row.cells[1].value = address;
    //row.cells[2].value = 'Germany';
// Add next row.
    row = grid.rows.add();
    row.cells[0].value = 'Delivered Quantity';
    row.cells[1].value = '$quantity';
    // row.cells[2].value = 'Mexico';
// Add next row.
    row = grid.rows.add();
    row.cells[0].value = 'Rate';
    row.cells[1].value = '$rate';

    row = grid.rows.add();
    row.cells[0].value = 'Total';
    row.cells[1].value = '$total';

    row = grid.rows.add();
    row.cells[0].value = 'Contact';
    row.cells[1].value = '$contact';

    row = grid.rows.add();
    row.cells[0].value = 'Deposit';
    row.cells[1].value = '$deposit';

    row = grid.rows.add();
    row.cells[0].value = 'Balance';
    row.cells[1].value = '$balance';
    //row.cells[2].value = 'Mexico';
// Set grid format.
    grid.style.cellPadding = PdfPaddings(left: 5, top: 5);
// Draw table in the PDF page.
    grid.draw(
        page: page,
        bounds: Rect.fromLTWH(
            0, 100, page.getClientSize().width, page.getClientSize().height));
// Save the document.
    //File('PDFTable.pdf').writeAsBytes(document.save());
// Dispose the document.
    List<int> bytes = document.save();
    document.dispose();
    saveAndLaunchFile(bytes, '${widget.shopname}_$date.pdf');
  }
}