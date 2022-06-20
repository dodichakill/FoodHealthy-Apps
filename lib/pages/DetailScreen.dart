import 'package:flutter/material.dart';
import 'package:foodhealthy/data/ListFood.dart';

class DetailScreen extends StatelessWidget {
  final DataFoods? food;
  const DetailScreen({ Key? key, @required this.food }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var styleTextSmall = TextStyle(fontSize: 15, height: 1.4, color: Colors.green[700]);
    var styleTextLarge = TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.green[800]);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          padding: const EdgeInsets.all(10),
        ),
        actions: const [
          FavoriteBtn()
        ],
        title: Text('${food?.nama}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/${food?.foto}'),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('${food?.deskripsi}', style: styleTextSmall,),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.green[50]
                    ),
                    child: Column(
                      children: [
                        Text('Manfaat :', style: styleTextLarge),
                        const SizedBox(height: 8,),
                        Text('${food?.manfaat}', style: styleTextSmall),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 25),
                  Container(
                    color: Colors.green[400],
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Text("Mari kita buat sendiri...", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(15),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text("Bahan :", style: styleTextLarge),
                              const SizedBox(height: 10),
                              Text('${food?.bahan}', style: styleTextSmall),
                              const SizedBox(height: 20),
                              Text("Langkah - Langkah :", style: styleTextLarge),
                              const SizedBox(height: 10),
                              Text('${food?.langkah}',style: styleTextSmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
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
  const FavoriteBtn({Key? key}) : super(key: key);

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
