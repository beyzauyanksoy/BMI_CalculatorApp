import 'package:flutter/material.dart';

import 'calculate.dart';
import 'ibm.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController myControllerYas = TextEditingController();
  TextEditingController myControllerKilo = TextEditingController();
  TextEditingController myControllerUzunluk = TextEditingController();
  // double yas = 0;
  // double height = 0;
  // double weight = 0;
  // double ort = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    myControllerKilo.dispose();
    myControllerUzunluk.dispose();
    myControllerYas.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                //color: Colors.amber,
                width: 250,
                height: 90,
                child: Text(
                  "Let's calculate\nyour current BMI",
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('You can find out whether are'),
                      Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Text('overweight, underweight or ideal weight.'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: Colors.grey.shade500),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            'Female',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade500),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Text('Male',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: Colors.grey.shade500),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Text('Other',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 30),
                child: TextField(
                  controller: myControllerYas,
                  // onChanged: (value) {
                  //   setState(() {
                  //     yas = double.parse(value);
                  //     print('yas $yas');
                  //   });
                  // },
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Age',
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey.shade400)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 30),
                child: TextField(
                  controller: myControllerUzunluk,
                  // onChanged: (value) {
                  //   setState(() {
                  //     height = double.parse(value);
                  //     print('height $height');
                  //   });
                  // },
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Height',
                      suffix: Text(
                        'cm',
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey.shade400)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 30),
                child: TextField(
                  controller: myControllerKilo,
                  // onChanged: (value) {
                  //   setState(() {
                  //     weight = double.parse(value);
                  //     print('weight $weight');
                  //   });
                  // },
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Weight',
                      suffix: Text(
                        'kg',
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey.shade400)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 170, right: 30),
                child: GestureDetector(
                  onTap: () {
                    // ort = weight / (height * height);
                    // print('ortalama: $ort');
                    String sonuc = Calculate.bmiCalculate(
                            double.parse(myControllerKilo.text),
                            double.parse(myControllerUzunluk.text))
                        .toStringAsFixed(2);
                    String detay = Calculate.detail(
                        double.parse(myControllerKilo.text),
                        double.parse(myControllerUzunluk.text));
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Ibm(
                          detay: detay,
                          sonuc: sonuc,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    alignment: Alignment.center,
                    width: 350,
                    height: 50,
                    child: const Text(
                      'Calculate BMI',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
