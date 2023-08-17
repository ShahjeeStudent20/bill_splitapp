import 'package:flutter/material.dart';

class BillHomePage extends StatefulWidget {
  const BillHomePage({Key? key}) : super(key: key);

  @override
  State<BillHomePage> createState() => _BillHomePageState();
}

class _BillHomePageState extends State<BillHomePage> {
  TextEditingController mytext = TextEditingController();
  double? price = 0.0;
  int totalperson = 1;
  double tipPercentage = 0.0;

  double billcalculate() {
    double result = ((price! + ((tipPercentage / 100) * price!)) / totalperson);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var mystyle = const TextStyle(fontSize: 35, fontWeight: FontWeight.bold);
    var mystyle1 = const TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500);
    var mystyle2 = const TextStyle(fontSize: 25, fontWeight: FontWeight.w200);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Text(
                      "BILL AND TIP CALCULATOR",
                      textAlign: TextAlign.center,
                      style: mystyle,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.shade500,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                          topRight: Radius.circular(30),
                        )),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Per person bill is: ", style: mystyle1),
                          // ignore: unnecessary_null_comparison
                          Text(
                              "${billcalculate().toStringAsFixed(1)} Rs", // yaha se ab 1 point ayga decimal k bad
                              style: mystyle1),
                        ],
                      ),
                    )),
              ),
              const SizedBox(height: 25),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: mytext,
                onChanged: (v) {
                  setState(() {
                    price = double.parse(mytext.text);
                  });
                  // print(mytext.text);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                  hintText: 'Total bill of all',
                  labelText: 'Please enter the bill',
                  prefixIcon: Icon(Icons.price_change),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Split to persons :',
                    style: mystyle2,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (totalperson > 1) totalperson--;
                            });
                          },
                          icon: const Icon(Icons.exposure_minus_1)),
                      Text(
                        "$totalperson",
                        style: mystyle,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              totalperson++;
                            });
                          },
                          icon: const Icon(
                            Icons.exposure_plus_1,
                          )),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  thickness: 5,
                  color: Colors.teal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6),
                child: Text(
                  'Tip percentage',
                  style: mystyle2,
                ),
              ),
              Text(
                '$tipPercentage',
                style: mystyle1,
              ),
              Slider(
                divisions: 10,
                activeColor: Colors.green,
                value: tipPercentage,
                onChanged: (v) {
                  setState(() {
                    tipPercentage = v;
                  });
                },
                min: 0,
                max: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
