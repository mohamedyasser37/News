import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/view/category_grid_view.dart';
import 'package:news/category/item_screen.dart';
import 'package:news/view/search.dart';
import 'package:news/view/setting.dart';

class HomeView extends StatefulWidget {
static const routeName="HomeView"  ;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
List<Category>category=[
  Category(
      categoryID: "Sports",
      categoryImage: "assets/images/sports.png",
      categoryTitle: "Sports",
      categoryBackground: Color.fromARGB(255, 201, 28, 34)),
  Category(
      categoryID: "general",
      categoryImage: "assets/images/Politics.png",
      categoryTitle: "Politics",
      categoryBackground: Color.fromARGB(255, 0, 62, 144)),
  Category(
      categoryID: "Health",
      categoryImage: "assets/images/health.png",
      categoryTitle: "Health",
      categoryBackground: Color.fromARGB(255, 237, 30, 121)),
  Category(
      categoryID: "Business",
      categoryImage: "assets/images/bussines.png",
      categoryTitle: "Business",
      categoryBackground: Color.fromARGB(255, 207, 126, 72)),
  Category(
      categoryID: "technology",
      categoryImage: "assets/images/environment.png",
      categoryTitle: "Technology",
      categoryBackground: Color.fromARGB(255, 72, 130, 207)),
  Category(
      categoryID: "Science",
      categoryImage: "assets/images/science.png",
      categoryTitle: "Science",
      categoryBackground: Color.fromARGB(255, 242, 211, 82)),
];

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(color: Colors.white,
          child: Image.asset("assets/images/pattern0.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,),),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              SelectedItem !=null? InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, Search.routeName);
                    },
                  child: Icon(Icons.search,size: 28,)):SizedBox(),
              SizedBox(width: 10,),
              InkWell(
                  onTap: (){
                    setState(() {
                      SelectedItem=null;

                    });

                  },
                  child: Icon(Icons.home,size: 22,)),
              SizedBox(width: 4,),
            ],

            title:SelectedItem==null? Text("Route News App",):Text(SelectedItem!.categoryTitle),
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))
            ),

          ),
          drawer: Drawer(
              width: MediaQuery.of(context).size.width*.6,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 130,
                       width: double.infinity,
                          //margin: EdgeInsets.all(40),
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Text("News App!",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                              fontSize: 22),
                              textAlign: TextAlign.center,),
                          )),
                      Padding(
                        padding:  EdgeInsets.only(top:
                        MediaQuery.of(context).size.width*(0.13)),
                        child: IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back_rounded,size: 30,color: Colors.white,)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          SelectedItem=null;
                          Navigator.pop(context);
                        });

                      },
                      child: Row(
                        children: [
                          Icon(Icons.menu,size: 30,),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Categories", style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 22,),),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, Setting.routName);

                      },
                      child: Row(
                        children: [
                          Icon(Icons.settings,size: 30,),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Settings", style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 22,),),

                        ],
                      ),
                    ),
                  ),
                ],
              )),
          body:SelectedItem==null? Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Pick your category \n of interest 😊",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                   fontSize: 24
                  )),
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 7/8,
                      ),
                    itemCount: category.length,
                      itemBuilder: (context, index) => CategoryGridView(
                          category: category[index],
                          index: index,OnClickItem: OnClick,),
                  ),
                ),
              ],
            ),
          ) : ItemScreen(SelectedItem!),

        ),
      ],
    );
  }

  Category? SelectedItem=null;

  void OnClick(Category category){
    setState(() {
      SelectedItem=category;
    });

  }
}