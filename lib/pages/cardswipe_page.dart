import 'package:fellowship/pages/util/card_provider.dart';
import 'package:fellowship/pages/util/travel_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flip_card/flip_card.dart';


class SwipePage extends StatefulWidget {
    const SwipePage({Key? key}) : super(key: key);
    
    @override
    _SwipePageState createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
        @override
        Widget build(BuildContext context) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade200,
                Colors.black
              ]
            )
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
                  body: SafeArea(
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(16),
                          child: Column(
                          children: [
                            buildLogo(),
                            const SizedBox(height: 16),
                            Expanded(child: buildCards()),
                            const SizedBox(height: 16),
                            buildButtons()],
                          ),
                      ),
                  ),
              ),
        );

    
        Widget buildLogo() => Row(
          children: [
            Icon(
              Icons.diamond,
              color: Colors.white,
              size: 36,
              ),
            const SizedBox(width: 4),
            Text('Gem',
            style:TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ))
          ],);

        Widget buildCards() {
            final provider = Provider.of<CardProvider>(context);
            final urlImages = provider.urlImages;

            return urlImages.isEmpty
              ? Center(
              child: ElevatedButton(
              child: Text('Restart'),
              onPressed: () {
                final provider =
                    Provider.of<CardProvider> (context, listen: false);

              provider.resetUsers();
              },
              ))
        :  FlipCard(
                direction: FlipDirection.VERTICAL,
                // front of the card
                front:Stack(
            children: urlImages
                .map((urlImage)  => TinderCard(
                urlImage: urlImage,
                isFront: urlImages.last == urlImage,
            ))
                .toList(),
            ),
            back: Stack(
            children: urlImages
                .map((urlImage)  => TinderCard(
                urlImage: urlImage,
                isFront: urlImages.last == urlImage,
            ))
                .toList(),
            ),);
            ;
    }

    // Widget buildBack() => ClipRRect(
    //   borderRadius: BorderRadius.circular(20),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       // image: DecorationImage(
    //         // fit: BoxFit.cover,
    //         // image: _urlImages,/
    //         // alignment: Alignment(-0.3, 0),
    //       ),
    //     ),
    //   )
    //   );

    Widget buildButtons(){
      final provider= Provider.of<CardProvider>(context);
      final urlImages = provider.urlImages;

      return urlImages.isEmpty
      ? ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          'Restart',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          final provider =
            Provider.of<CardProvider>(context, listen: false);
          provider.resetUsers();
        },
      )
      : Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
        children: [
          ElevatedButton(
            child: Icon(Icons.clear, color :Colors.red, size: 10),
            onPressed: () {
              final provider =
              Provider.of<CardProvider>(context, listen: false);

            provider.dislike();  
            },
            ),
          ElevatedButton(
            child: Icon(Icons.star, color :Colors.blue, size: 10),
            onPressed: () {
              final provider =
              Provider.of<CardProvider>(context, listen: false);

            provider.save();  
            },
            ),  
          ElevatedButton(
            child: Icon(Icons.favorite, color :Colors.green, size: 10),
            onPressed: () {
              final provider =
              Provider.of<CardProvider>(context, listen: false);

            provider.like();  
            },
            ),    
        ],
      );
    }
}
