import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodhealthy/data/ListFood.dart';

class DetailScreen extends StatelessWidget {
  final DataFoods? food;
  var styleTextSmall = TextStyle(fontSize: 15, height: 1.4, color: Colors.green[700]);
  var styleTextLarge = TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.green[800]);
  DetailScreen({@required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          padding: EdgeInsets.all(10),
        ),
        actions: [
          FavoriteBtn()
        ],
        title: Text('${food?.nama}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/${food?.foto}'),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('${food?.deskripsi}', style: styleTextSmall,),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green[50]
                    ),
                    child: Column(
                      children: [
                        Text('Manfaat :', style: styleTextLarge),
                        SizedBox(height: 8,),
                        Text('${food?.manfaat}', style: styleTextSmall),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 15),
                  Container(
                    color: Colors.green[500],
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text("Mari kita buat sendiri...", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(15),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text("Bahan", style: styleTextLarge),
                              SizedBox(height: 10),
                              Text('${food?.bahan}', style: styleTextSmall),
                              SizedBox(height: 20),
                              Text("Langkah - Langkah", style: styleTextLarge),
                              SizedBox(height: 10),
                              Text('${food?.langkah}',style: styleTextSmall),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteBtn extends StatefulWidget {
  @override
  _FavoriteBtnState createState() => _FavoriteBtnState();
}

class _FavoriteBtnState extends State<FavoriteBtn> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() => isFavorite = !isFavorite);
        },
        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border));
  }
}
