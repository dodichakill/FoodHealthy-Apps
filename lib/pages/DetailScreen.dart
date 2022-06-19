import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodhealthy/data/ListFood.dart';

class DetailScreen extends StatefulWidget {
  final DataFoods? food;

  const DetailScreen({Key? key, @required this.food}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var styleTextSmall = TextStyle(fontSize: 15, height: 1.4, color: Colors.green[700]);

  var styleTextLarge = TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.green[800]);

  @override
  Widget build(BuildContext context) {
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
        title: Text('${widget.food?.nama}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/${widget.food?.foto}'),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('${widget.food?.deskripsi}', style: styleTextSmall,),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green[50]
                    ),
                    child: Column(
                      children: [
                        Text('Manfaat :', style: styleTextLarge),
                        const SizedBox(height: 8,),
                        Text('${widget.food?.manfaat}', style: styleTextSmall),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  Container(
                    color: Colors.green[500],
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
                              Text("Bahan", style: styleTextLarge),
                              const SizedBox(height: 10),
                              Text('${widget.food?.bahan}', style: styleTextSmall),
                              const SizedBox(height: 20),
                              Text("Langkah - Langkah", style: styleTextLarge),
                              const SizedBox(height: 10),
                              Text('${widget.food?.langkah}',style: styleTextSmall),
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
