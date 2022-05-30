import 'package:flutter/material.dart';

class drafft extends StatelessWidget {
  const drafft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                height: 150.0,
                width: 30.0,
                child: Stack(
                  children: <Widget>[
                    const IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: null,
                    ),
                    // list.length ==0 ? Container() :
                    Positioned(
                        child: Stack(
                      children: <Widget>[
                        Icon(Icons.brightness_1,
                            size: 20.0, color: Colors.green[800]),
                        Positioned(
                            top: 3.0,
                            right: 4.0,
                            child: Center(
                                //  child: Text(
                                // // list.length.toString(),
                                //  style: const TextStyle(
                                //  color: Colors.white,
                                //  fontSize: 11.0,
                                //  fontWeight: FontWeight.w500
                                //  ),
                                //  ),
                                )),
                      ],
                    )),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
