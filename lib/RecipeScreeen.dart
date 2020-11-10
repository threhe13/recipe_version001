import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeScreen extends StatelessWidget {

  final image;///For hero tagging and showing relative image
  RecipeScreen(this.image);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Hero(
              child: Container(
                height: size.height*0.55,
                child: Image.asset(image, fit:BoxFit.cover),
              ),
              tag: image,
            ),

            ///Container more contents
            DraggableScrollableSheet(
              maxChildSize: 1,
              initialChildSize: 0.6,
              minChildSize: 0.6,
              builder: (context, controller){
                  return SingleChildScrollView(
                    controller: controller,
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      height: 800,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                "닭강정 만들기",
                                style: GoogleFonts.roboto(
                                  fontSize: 20, fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Spacer(),
                              IconButton(icon: null, onPressed: null),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}
