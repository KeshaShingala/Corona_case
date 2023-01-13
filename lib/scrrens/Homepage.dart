import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                  height: 899,
                  width: double.infinity,
                  child: Image.asset("assets/images/family-wearing-protective-medical-mask-prevent-virus-dad-mom-daughter-son-wearing-surgical-mask_38747-637.webp",
                    fit: BoxFit.fill,
                  )),

              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft:  Radius.circular(30)),
                    color: Colors.grey.shade100
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Be aware \nStay healthy",style: TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.w600),),
                      SizedBox(height: 20,),
                      Text("Welcome to COVID-19 information portal.",style: TextStyle(color: Colors.grey.shade500,fontSize: 17,fontWeight: FontWeight.w600),),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("GET STARTED",style: TextStyle(fontSize: 15,color: Colors.black54,fontWeight: FontWeight.w700),),
                          SizedBox(width: 20,),
                          InkWell(
                            onTap: (){
                              setState((){
                                Navigator.of(context).pushNamed("secondpage");
                              });
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purple.shade600
                              ),
                              child: Icon(Icons.arrow_forward,color: Colors.white,),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
