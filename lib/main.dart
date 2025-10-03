import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'create_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF020206),
      floatingActionButton:               
      Container(
        height: 68,
        width: 68,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withValues(alpha: 0.35),
              blurRadius: 5,
              offset: Offset(5, 10)
            ),
          ],
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [Color(0xFFC59ADF),Color(0XFFD48CC3)], begin: Alignment.topLeft, end: Alignment.bottomCenter, stops: [0.4, 1])
        ),
        child: FloatingActionButton(
          onPressed: ()=>{
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateTask())
            )
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          disabledElevation: 0,
          highlightElevation: 0, child: Icon(Icons.add, weight: 3, color: Color(0xFF292D32),size: 34),
        )
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            children: [
              Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 36)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You have got 5 tasks",
                        style: GoogleFonts.roboto(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                        // style: TextStyle(),
                      ),
                      Row(
                        children: [
                          Text(
                            "today to complete ",
                            style: GoogleFonts.roboto(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Image.asset("assets/icons/pen.png", width: 23, height: 22,)
                        ],
                      )
                    ],
                  ),
                  
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("assets/images/anas_profile.jpg"),
                  )
                ],
              ),

              SizedBox(height: 22),

            Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 7)),
                  Icon(Icons.search, color: Colors.white, size: 19.17),
                  Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 11.83)),
                  Text(
                    "Search Task Here",
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 16)
                  )
                ],
              ),
            ),
              SizedBox(height: 19),
              See_all(sectionName: "Progress"),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF181818),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.only(left: 14, top: 15, right: 27, bottom: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Daily Task", style: GoogleFonts.roboto(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(height: 10),
                    Text("2/3 Task Completed", style: GoogleFonts.roboto(color: Color(0xFFFFFFFF).withValues(alpha: 0.8), fontSize: 16, fontWeight: FontWeight.w400)),
                    SizedBox(height: 9),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("You are almost done go ahead", style: GoogleFonts.roboto(color: Color(0xFFFFFFFF).withValues(alpha: 0.8), fontSize: 14, fontWeight: FontWeight.w200)),
                        Text("66%", style: GoogleFonts.roboto(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    SizedBox(height: 6),
                    Container(
                      height: 18,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFBA83DE).withValues(alpha: 0.41),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraint){
                          double progress = 0.66 * constraint.maxWidth;
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: progress,
                              decoration: BoxDecoration(
                                color: Color(0xFFBA83DE),
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          );
                        }
                      )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              See_all(sectionName: "Today's Task"),
              SizedBox(height: 20),
              Task(taskName: "Mobile App Research", color: Color(0xFFFACBBA), taskDate: "4 Oct"),
              SizedBox(height: 8),
              Task(taskName: "Prepare Wireframe for Main Flow", color: Color(0xFFD7F0FF), taskDate: "4 Oct"),
              SizedBox(height: 8),
              Task(taskName: "Prepare Screens", color: Color(0xFFFAD9FF), taskDate: "4 Oct"),
              SizedBox(height: 33),

              See_all(sectionName: "Tommorow Tasks"),
              SizedBox(height: 20),
              Task(taskName: "Website Research", color: Color(0xFFFACBBA), taskDate: "4 Oct"),
              SizedBox(height: 8),
              Task(taskName: "Prepare Wireframe for Main Flow", color: Color(0xFFD7F0FF), taskDate: "4 Oct"),
              SizedBox(height: 8),
              Task(taskName: "Prepare Screens", color: Color(0xFFFAD9FF), taskDate: "4 Oct"),
            ],
          ),
        )
      )
    );
  }
} 

class See_all extends StatelessWidget{
  final String sectionName;

  const See_all({super.key, this.sectionName = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(sectionName, style: GoogleFonts.roboto(color: Colors.white, fontSize: 22)),
                Text("See All", style: GoogleFonts.roboto(color: Color(0xFFBA83DE), fontSize: 16))
              ],
            );
  }

}

class Task extends StatelessWidget{
  final String taskName;
  final String taskDate;
  final Color color;

  const Task({super.key, this.taskName ="", this.taskDate = "", this.color = const Color(0xFFFFFFFF)});

  @override
  Widget build(BuildContext context) {  
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(9)),
        color: color
      ),

      alignment: AlignmentDirectional.topEnd,
      clipBehavior: Clip.hardEdge,
      child: LayoutBuilder(builder: (context, constraint){
        double width = 0.95 *constraint.maxWidth;
        return Container(
          padding: EdgeInsets.only(left: 10, top: 20, right: 9, bottom: 19),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(8)),
            color: Color(0xFF1F1F1F)
          ),
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(taskName, style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400)),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Image.asset("assets/icons/calendar.png"),
                      Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 4)),
                      Text(taskDate, style: GoogleFonts.inter(color: Color(0xFFFFFFFF).withValues(alpha: 0.80), fontSize: 14,fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFBA83DE),
                  border: BoxBorder.all(width: 1.5, color: Colors.black)
                ),
                child: Icon(Icons.check, size: 13, weight: 1.5),
              )
              
            ],
          ),
        );
        }
      )
    );
  }
}