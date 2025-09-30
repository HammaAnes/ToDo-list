import 'package:flutter/material.dart';

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
      body: Container(
        
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
                      style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Roboto", fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          "today to complete ",
                          style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Roboto", fontWeight: FontWeight.w500),
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
                  style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Inter")
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
                  Text("Daily Task", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Roboto", fontWeight: FontWeight.w500)),
                  SizedBox(height: 10),
                  Text("2/3 Task Completed", style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Roboto", fontWeight: FontWeight.w400)),
                  SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("You are almost done go ahead", style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "Roboto", fontWeight: FontWeight.w200)),
                      Text("66%", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Roboto", fontWeight: FontWeight.w400)),
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
            Task(taskName: "Mobile App Research", color: Color(0xFFFACBBA), taskDate: "4 Oct",)
          ],
        ),
      ),
    );
  }
} 

class See_all extends StatelessWidget{
  final String sectionName;

  const See_all({this.sectionName = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(sectionName, style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Roboto")),
                Text("See All", style: TextStyle(color: Color(0xFFBA83DE), fontSize: 16, fontFamily: "Roboto"))
              ],
            );
  }

}

class Task extends StatelessWidget{
  final String taskName;
  final String taskDate;
  final Color color;

  const Task({this.taskName ="", this.taskDate = "", this.color = const Color(0xFFFFFFFF)});

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
        double width = 0.90 *constraint.maxWidth;
        return Container(
          padding: EdgeInsets.only(left: 10, top: 20, right: 9, bottom: 19),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(8)),
            color: Color(0xFF1F1F1F)
          ),
          width: width,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(taskName, style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Roboto", fontWeight: FontWeight.w400)),
                  Text(taskDate, style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "Roboto", fontWeight: FontWeight.w500)),
                ],
              ),
              CircleAvatar(child: Icon(Icons.check))
            ],
          ),
        );
        }
      )
    );
  }
}