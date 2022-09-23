import 'package:flutter/material.dart';
import"package:hovering/hovering.dart";

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key,}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>{
  var navWidth = 30;
  double menuWidth = 36;
  var isFullNav = false;
  bool hovered = false;

  showMenus(BuildContext context) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(MediaQuery.of(context).size.width/3.3, MediaQuery.of(context).size.height/7.5, MediaQuery.of(context).size.width/2, 0),
      items: [
        PopupMenuItem(
          child: Container(
              width: MediaQuery.of(context).size.width/10,
              child: Text("CSV")
          ),
        ),
        PopupMenuItem(
          child: Container(
              width: MediaQuery.of(context).size.width/10,
              child: Text("XLSX")
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print("Width ${width}");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          leadingWidth: MediaQuery.of(context).size.width/30,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(16, 57, 196, 1.0),
                Color.fromRGBO(87, 117, 220, 1.0),
              ],
            )
          ),
        ),
        leading: InkWell(
              hoverColor: Color.fromRGBO(87, 117, 220, 1.0),
              onTap: () {  },
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 6,
                      child: Icon(Icons.more_horiz,size: 25, color: Colors.white,)),
                  SizedBox(
                      height: 6,
                      child: Icon(Icons.more_horiz,size: 25, color: Colors.white,)),
                  SizedBox(
                      height: 6,
                      child: Icon(Icons.more_horiz,size: 25, color: Colors.white,)),
                ],
              ),
            ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 0, top: 5, bottom: 5),
            child: Image.asset("managefy-name-fix-white-transp.png",
        height: 25,),
      ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings, color: Colors.white, size: 20,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.question_mark, color: Colors.white, size: 20,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle, color: Colors.white, size: 20,)),
          SizedBox(width: 20,)
        ],
        backgroundColor: Colors.white,
        elevation: 2,
      ),),
      body:
          Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: AppBar(
              backgroundColor: Colors.white,
              elevation: 2,
              actions: [
                SizedBox(
                    width: MediaQuery.of(context).size.width/menuWidth,
                    child: Container(
                      child: ListView(
                          shrinkWrap: true,
                          children:[
                            Container(
                              alignment: Alignment.centerLeft,
                              height: MediaQuery.of(context).size.height/19,
                              child:IconButton(icon: Icon(Icons.menu),
                                color: Colors.black,
                                onPressed: (){
                                  setState((){
                                    if(isFullNav == false){
                                      navWidth = 7;
                                      menuWidth = 7.3;
                                      isFullNav = true;
                                    }
                                    else{
                                      navWidth = 30;
                                      menuWidth = 36;
                                      isFullNav = false;
                                    }
                                  });
                                },
                              ),
                            ),
                          ]
                      ),)),
                VerticalDivider(),
                Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height/15,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 0, bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: (){},
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.pageview_outlined, color: Color.fromRGBO(87, 117, 220, 1.0),),
                                  SizedBox(width: 5,),
                                  Text("Overview", style: TextStyle(color: Colors.grey.shade700),)
                                ],
                              )
                              ),
                              SizedBox(
                                height: 25,
                                child: VerticalDivider(color: Colors.grey.shade300,),),
                              TextButton(
                                  onPressed: (){},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.show_chart, color: Color.fromRGBO(87, 117, 220, 1.0),),
                                      SizedBox(width: 5,),
                                      Text("Show Chart", style: TextStyle(color: Colors.grey.shade700),)
                                    ],
                                  )
                              ),
                              SizedBox(
                                height: 25,
                                child: VerticalDivider(color: Colors.grey.shade300,),),
                              TextButton(
                                  onPressed: (){},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add, color: Color.fromRGBO(87, 117, 220, 1.0),),
                                      SizedBox(width: 5,),
                                      Text("New", style: TextStyle(color: Colors.grey.shade700),)
                                    ],
                                  )
                              ),
                              SizedBox(
                                height: 25,
                                child: VerticalDivider(color: Colors.grey.shade300,),),
                              MouseRegion(
                                onHover: (_){
                                  hovered?showMenus(context):Navigator.pop(context);
                                },
                                onEnter: (_) {
                                  setState(() {
                                    hovered = true;
                                    print(hovered);
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    hovered = false;
                                    print(hovered);
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.file_download_outlined, color: Color.fromRGBO(87, 117, 220, 1.0),),
                                    SizedBox(width: 5,),
                                    Text("Export to Excel", style: TextStyle(color: Colors.grey.shade700),)
                                  ],
                                ),
                              ),
                              /*TextButton(
                                  onPressed: (){},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.file_download_outlined, color: Color.fromRGBO(87, 117, 220, 1.0),),
                                      SizedBox(width: 5,),
                                      Text("Export to Excel", style: TextStyle(color: Colors.grey.shade700),)
                                    ],
                                  )
                              ),*/
                              SizedBox(
                                height: 25,
                                child: VerticalDivider(color: Colors.grey.shade300,),),
                              TextButton(
                                  onPressed: (){},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.campaign_outlined, color: Color.fromRGBO(87, 117, 220, 1.0),),
                                      SizedBox(width: 5,),
                                      Text("Marketing Campaign", style: TextStyle(color: Colors.grey.shade700),)
                                    ],
                                  )
                              ),
                            ],
                          )
                        ),
                      ],
                    ))
              ],
            ),),
            body:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width/navWidth,
                      height: MediaQuery.of(context).size.height,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            boxShadow: [
                              /*BoxShadow(
                              color: Colors.grey.shade300,
                                spreadRadius: 0.1,
                              offset: Offset(0.5,1),
                              blurRadius: 15
                            )*/
                              BoxShadow(color: Colors.white, offset: Offset(0, 0)),
                              BoxShadow(
                                color: Colors.grey.shade300,
                                offset: Offset(0, 7),
                                blurRadius: 15,
                                spreadRadius: 0.1,
                              ),
                              BoxShadow(color: Colors.white, offset: Offset(0, 0)),
                              BoxShadow(color: Colors.white, offset: Offset(0, 0)),
                            ]
                        ),
                        child: ListView(
                            shrinkWrap: true,
                            children:[
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                onTap:(){
                                  print("Container Tap");
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width/navWidth,
                                  padding: EdgeInsets.only(left: 7, top: 5),
                                alignment: Alignment.centerLeft,
                                child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:
                                  [
                                    Icon(Icons.home, color: Colors.grey.shade700,),
                                    SizedBox(width: 10,),
                                    isFullNav? Text('Home', style: TextStyle(color: Colors.grey.shade700,),):SizedBox(),
                                  ]
                                ))
                              ),
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                    onTap:(){
                                      print("Container Tap");
                                    },
                                    child: Container(
                                        width: MediaQuery.of(context).size.width/navWidth,
                                        padding: EdgeInsets.only(left: 7, top: 5),
                                        alignment: Alignment.centerLeft,
                                        child:
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children:
                                            [
                                              Icon(Icons.analytics, color: Colors.grey.shade700,),
                                              SizedBox(width: 10,),
                                              isFullNav? Text('Analytics', style: TextStyle(color: Colors.grey.shade700,),):SizedBox(),
                                            ]
                                        ))
                                ),
                              ),
                            ]
                        ),)),
                  Text("Dashboard"),
                ],
              ),
          )
    );
  }
}
