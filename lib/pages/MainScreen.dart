// ignore: file_names
import 'package:flutter/material.dart';
import 'package:foodhealthy/data/ListFood.dart';
import 'package:foodhealthy/pages/DetailScreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("FoodHealthy"),
        ),
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // section hero start
              Container(
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          child:
                              Image.asset('images/hero.jpg', fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                        height: 150,
                        width: 150,
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                            "Temukan Makanan dan minuman sehat beserta resepnya dengan mudah di FoodHealthy",
                            style: TextStyle(
                                fontSize: 16,
                                wordSpacing: 2,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2),
                            textAlign: TextAlign.center),
                      ),
                    )
                  ],
                ),
              ),
              // section hero end

              // section lists start
              Text("Daftar Makanan dan minuman pilihan :",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.green[700])),
              const SizedBox(height: 15),
              Column(
                children: dataFoodsList.map((data) {
                  return InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(food: data);
                    })),
                    child: Container(
                      height: 120,
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      padding: const EdgeInsets.all(10),
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Colors.green.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0, 2))
                      ]),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Image.asset(
                                'images/' + data.foto,
                                fit: BoxFit.cover,
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      data.nama,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green[500]),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      data.deskripsi,
                                      maxLines: 3,
                                      style:
                                          TextStyle(color: Colors.green[400],height: 1.5),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )
              // section lists end
            ],
          ),
        ));
  }
}
