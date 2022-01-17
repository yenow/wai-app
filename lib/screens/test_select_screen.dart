import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/main.dart';
import 'package:wai/models/enneagram_type.dart';

class TestSelectScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     // double padding = MediaQuery.of(context).size.width/10;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(width:double.infinity, height: 30,),
          Flexible(
              flex: 1,
              child: Center(
                  child: Text(
                    'WHO AM I ',
                    style: _buildTextStyle(fontSize: 26),
                  )
              )
          ),
          Flexible(
            flex: 1,
            child: Center(
                child: Text(
                  '내 에니어그램 성향이 뭔지 알고 있다면, 골라주세요',
                  style: _buildTextStyle(),
                )
            )
          ),
          _buildEnneagramTypeGridView(context),
          Flexible(
            flex: 1,
            child: Center(
              child: Text('에니어그램을 처음 해보신다면, 테스트를 진행해주세요.', style: _buildTextStyle(),)
            )
          ),
          _buildSimpleTestButton(),
          _buildTestButton(),
          SizedBox(width:double.infinity, height: 30,),
        ],
      ),
    );
  }

  Flexible _buildTestButton() {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 3),
        child: ElevatedButton(
          child: Text('정밀테스트', style: _buildTextStyle(color: Colors.white)),
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size.infinite),
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  // side: BorderSide(color: Colors.red)
                )
            ),
          ),
          onPressed: () {

          },
        ),
      ),
    );
  }
  
  Flexible _buildSimpleTestButton() {
    return Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 3),
            child: ElevatedButton(
              child: Text('간단테스트', style: _buildTextStyle(color: Colors.white)),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size.infinite),
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      // side: BorderSide(color: Colors.red)
                    )
                ),
              ),
              onPressed: () {
                
              },
            ),
          ),    
        );
  }

  Flexible _buildEnneagramTypeGridView(BuildContext context) {
    return Flexible(
          flex: 6,
          // fit: FlexFit.loose,
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/9),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  padding: EdgeInsets.all(0),
                  children: List.generate(9, (index) {
                    num type = index + 1;

                    return Center(
                      child: TextButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage(enneagramType[type]!.path), width: 50 * widthRatio, height: 50 * heightRatio,  fit: BoxFit.fill,),
                            SizedBox(height: 5,),
                            Text(
                              '$type유형',
                              style: GoogleFonts.jua(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.blueGrey ),
                            ),
                          ],
                        ),
                        onPressed: () {

                        },
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        );
  }

  TextStyle _buildTextStyle({double fontSize = 15, color = Colors.blueGrey}) {
    return GoogleFonts.jua(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color
    );
  }
}
