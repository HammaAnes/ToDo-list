import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CreateTask extends StatefulWidget {
  const CreateTask({super.key});
  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Color(0xFF020206),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 19, top: 69, right: 19, bottom: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white)
                    ),
                    child: ElevatedButton(
                      onPressed: ()=>{
                       Navigator.pop(context)
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, minimumSize: Size.zero,padding: EdgeInsets.zero ,shape: CircleBorder()),
                      child: Icon(Icons.arrow_back, color: Colors.white, size: 15)
                     ),
                  ),
                  SizedBox(width: 48),
                  Text(
                    "Mobile App Research",
                    style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
                  )
                ],
              ),

              SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text("<", style: GoogleFonts.roboto(color: Color(0xFFBA83DE), fontSize: 18)),
                  SvgPicture.asset("assets/icons/left.svg", height: 17, width: 8),
                  Text("08 March", style: GoogleFonts.roboto(color: Color(0xFFBA83DE), fontSize: 18)),
                  SvgPicture.asset("assets/icons/right.svg", height: 17, width: 8),
                ],
              ),

              SizedBox(height: 37),

              Row(
                children: [
                  Container()
                ],
              )
            ]
          ),
        )
      )
    )
    
    );
  }
} 

class DayOfTheWeek extends StatelessWidget{

  final String day;
  final String dayofmonth;

  const DayOfTheWeek({this.day = "Sun", this.dayofmonth = "1"});

  @override
  Widget build(BuildContext context) {
    return Container( 
      
    );
  }
}