
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdaw222/self/Cator/modelCator.dart';
import 'package:sdaw222/self/Comp/Comp.dart';
import 'package:sdaw222/self/prod/modelspord.dart';
import 'package:sdaw222/self/shopehome/States.dart';
import 'package:sdaw222/self/shopehome/cubit.dart';

class ProductsHomeSop extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<cubitHomeSop,homeStatesSop>(
      listener: (BuildContext context, state) {
              if(state is ScuusersgetFaovrtes)
                if(state.a.status!){
                  toast(text: state.a.message, status: toasts.successful);
                }

      },
      builder: (BuildContext context,  state) {
        var cuibt=cubitHomeSop.get(context);
        return cuibt.mom != null && cuibt.cator != null  ?
        bulidertyyyy(cuibt.mom!,cuibt.cator!,context) :
        Center(child: CircularProgressIndicator());
      },

    );
  }


  Widget bulidertyyyy(prodModels sss,Autogenerated GGG,context){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
       // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: sss.data.banners.map((e) =>
                Image(image:NetworkImage("${e.image}"),
                  width: double.infinity,
                  height: 250.0,
                  fit: BoxFit.cover,
                )

            ).toList(),
            options:CarouselOptions(
              autoPlay: true,
              height: 250.0,
              enableInfiniteScroll: true,
              initialPage: 0,
              reverse: false,
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              scrollDirection: Axis.horizontal,
              autoPlayAnimationDuration: Duration(seconds: 3),
              autoPlayInterval: Duration(seconds: 5),
              viewportFraction: 1.0,
            ),),
          SizedBox(height: 30.0,),
          Container(
          //  width: 100,
            height: 100,
            child: ListView.separated(
              shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=>bluiderStort(GGG.data.Data2[index]),
                separatorBuilder: (context,index)=> SizedBox(width: 12.0,),
                itemCount: GGG.data.Data2.length,
            ),
          ),
          //نعرض المنتج صقين عمودين
          SizedBox(height: 30.0,),
          Container(
            color: Colors.grey[300],
          //  width: 120.0,
           // height: 120.0,
            child: GridView.count(
              crossAxisCount: 2,
              physics:BouncingScrollPhysics() ,
              shrinkWrap: true,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 1/1.66,
              children: List.generate(sss.data.products.length, (index) =>Buliderprotttttt(sss.data.products[index],context) ),
            ),
          ),

        ],
      ),
    );
  }


  Widget bluiderStort(Data2a aaa){

    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image(
              image: NetworkImage("${aaa.image}") ,
              fit: BoxFit.cover,
              height: 100.0,
              width:100.0,
            ),
            Container(
              width: 100.0,
              padding: EdgeInsets.symmetric(horizontal: 7.0),
              color: Colors.black.withOpacity(.7),
              child: Text(
                "${aaa.name}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,

                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );

  }








  Widget Buliderprotttttt(productsModel ppas,context){
    return Container(
      color: Colors.white,
      width: 200.0,
      height: 200.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                  image:NetworkImage("${ppas.image}"),
                  width: 200.0,
                 height:200.0,
              //  fit: BoxFit.cover,
              ),
              if(ppas.discount !=0)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.0),
                child: Text(
                  "Discoun",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(height: 16.0,),
          Text(
            "${ppas.name}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
            //  mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("${ppas.price.round()}",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(width: 10.0,),
                if(ppas.discount !=0)
                  Text(
                  "${ppas.old_price}",
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Spacer(),
                  IconButton(
               //   padding: EdgeInsets.zero,
                   // iconSize: 14.0,
                  onPressed: (){
                    cubitHomeSop.get(context).ChangeFavortesPost(productse: ppas.id);
                  },
                  icon:CircleAvatar(
                      child: Icon(Icons.favorite_border,size: 14.0,color: Colors.white,),
                    backgroundColor: cubitHomeSop.get(context).favorteas[ppas.id]!?Colors.blue:Colors.grey,
                  //  radius: 14.0,
                  ),

                ),
              ],
            ),
          ),
        ],
      ),
    );

  }

}

