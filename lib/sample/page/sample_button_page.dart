import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SampleButtonPage extends StatelessWidget {
  const SampleButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('------기본형 버튼들------', style: TextStyle(fontSize: 30),),
              ),
              ElevatedButton(
                child: Text('RaisedButton', style: TextStyle(fontSize: 24)),
                onPressed: () => {},
              ),
              TextButton(
                child: Text('TextButton', style: TextStyle(fontSize: 24)),
                onPressed: () => {},
              ),
              IconButton(
                icon: Icon(Icons.print),
                onPressed: () => {},
              ),
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => {},
              ),
              InkWell(
                child: Text('InkWell', style: TextStyle(fontSize: 24)),
                onTap: () => {},
              ),
              /*InkWell(
                child: Image.asset('images/family_1.jpg', width: 120, height: 120),
                onTap: () => {},
              ),*/
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('------스타일추가------', style: TextStyle(fontSize: 30),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text('RaisedButton', style: TextStyle(fontSize:15)),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),

                    ),
                    onPressed: () => {},
                  ),
                  ElevatedButton(
                    child: Text('RaisedButton', style: TextStyle(fontSize:15)),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                      elevation: MaterialStateProperty.all(5.0),
                      // backgroundColor: MaterialStateProperty.resolveWith((states) {
                      //
                      //   if (                                                                                                                                                                                              ) {
                      //     return Colors.red;
                      //   } else {
                      //     return Colors.green;
                      //   }
                      // }),
                    ),
                    onPressed: () => {},
                  ),
                ],
              ),
              TextButton(
                child: Text('TextButton', style: TextStyle(fontSize: 20)),
                clipBehavior: Clip.hardEdge,
                onPressed: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
