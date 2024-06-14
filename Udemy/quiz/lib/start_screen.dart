import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz ,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Center(
           child: Image.asset("assets/images/_M6A7925.JPG", width: 300,) ,
         ),
        const SizedBox.square(dimension: 80,),
        Text("Learn Flutter in fun way..!", style: GoogleFonts.robotoSerif(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.white
        )
        ),
        const SizedBox.square(dimension: 80,),
        OutlinedButton.icon(onPressed: (){
          startQuiz();
        },
          label: const Text("Start Quiz"),
          icon: const Icon(Icons.arrow_right_alt_outlined),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),)

      ],
    );
  }

}