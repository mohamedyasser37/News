
import 'package:flutter/material.dart';
import 'package:news/category/category_tab.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/api_manager.dart';

import '../view/category_grid_view.dart';

class ItemScreen extends StatelessWidget{

Category category;
  ItemScreen(this.category);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SourceResponse>(
          future:ApiManager.getSource(category.categoryID),

          builder:(BuildContext, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.hasError){
              return Center(child: Text('Error Loading Data '),);
            }
            if(snapshot.data?.status=='error'){
              return Center(child: Text('Server Error ${snapshot.data?.message}'),);

            }
            var sources=snapshot.data?.sources;
            return CategoryTab(sources!);


          }  ,
      ),
    );
  }
}
