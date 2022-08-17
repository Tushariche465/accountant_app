import 'package:flutter/material.dart';

class OrderGeneration extends StatefulWidget {
  const OrderGeneration({Key? key}) : super(key: key);

  @override
  State<OrderGeneration> createState() => _OrderGenerationState();
}

class _OrderGenerationState extends State<OrderGeneration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Text('Create Order'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height*0.9,
            child: Column(
              children:  <Widget>[
                Container(
                  child:  Center(
                      child: Text(
                        'Order Generation',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: const Center(
                      child: Text(
                        'Add Orders from here',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  height: (MediaQuery.of(context).size.height) * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border:
                      Border.all(width: 1, color: Colors.grey.shade500)),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 2),
                  child: TextField(
                    //controller: ,
                    decoration: const InputDecoration(
                      //enabledBorder: ,
                      border: InputBorder.none,
                      hintText: 'Shop Name',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  height: (MediaQuery.of(context).size.height) * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border:
                      Border.all(width: 1, color: Colors.grey.shade500)),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 2),
                  child: TextField(
                    //controller: ,
                    decoration: const InputDecoration(
                      //enabledBorder: ,
                      border: InputBorder.none,
                      hintText: 'Owner Name',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  height: (MediaQuery.of(context).size.height) * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border:
                      Border.all(width: 1, color: Colors.grey.shade500)),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 2),
                  child: TextField(
                    //controller: ,
                    decoration: const InputDecoration(
                      //enabledBorder: ,
                      border: InputBorder.none,
                      hintText: 'Contact',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  height: (MediaQuery.of(context).size.height) * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border:
                      Border.all(width: 1, color: Colors.grey.shade500)),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 2),
                  child: const TextField(
                    //controller: ,
                    keyboardType: TextInputType.number,
                    decoration:  InputDecoration(
                      //enabledBorder: ,
                      border: InputBorder.none,
                      hintText: 'Address',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  height: (MediaQuery.of(context).size.height) * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border:
                      Border.all(width: 1, color: Colors.grey.shade500)),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 2),
                  child: const TextField(
                   // controller: ,
                    decoration: InputDecoration(
                      //enabledBorder: ,
                      border: InputBorder.none,
                      hintText: 'Date',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  height: (MediaQuery.of(context).size.height) * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border:
                      Border.all(width: 1, color: Colors.grey.shade500)),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 2),
                  child: const TextField(
                    // controller: ,
                    decoration: InputDecoration(
                      //enabledBorder: ,
                      border: InputBorder.none,
                      hintText: 'Quantity',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  height: (MediaQuery.of(context).size.height) * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border:
                      Border.all(width: 1, color: Colors.grey.shade500)),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 2),
                  child: const TextField(
                    // controller: ,
                    decoration: InputDecoration(
                      //enabledBorder: ,
                      border: InputBorder.none,
                      hintText: 'Rate',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: (MediaQuery.of(context).size.width) * 0.9,
                    height: (MediaQuery.of(context).size.height) * 0.07,
                    decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    child: const Center(
                        child: Text(
                          'Add Order',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
