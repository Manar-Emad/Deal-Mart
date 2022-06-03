import 'package:deal_mart/modules/cart/cart_screen.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../details/details_screen.dart';

class HotDealsList extends StatelessWidget {
  const HotDealsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,

        child: SizedBox(
          height: getHeight(context)/3,
          child: ListView.builder(
            //  scrollDirection:Axis.horizontal ,
              itemCount: 5,
              itemBuilder: (BuildContext context,int index){
                return ListTile(
                    leading: const Icon(Icons.list),
                    trailing: const Text("GFG",
                      style:  TextStyle(
                          color: Colors.green,fontSize: 15),),
                    title:Text("List item $index")
                );
              }
          ),
        ),
      ),
    );
  }
}

class ContainerDeals extends StatefulWidget {
  final String img1 ;
  final String img2;
  final String txt1 ;
  final String txt2;



   const ContainerDeals({Key? key,
   required this.img1,
     required this.img2,
     required this.txt1,
     required this.txt2,

   }) : super(key: key);

  @override
  State<ContainerDeals> createState() => _ContainerDealsState();
}

class _ContainerDealsState extends State<ContainerDeals> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
        child: GestureDetector(
          onTap: (){navigateTo(context, const DetailsScreen());},
          child: Container(
            height: getHeight(context)/3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const[
                  BoxShadow(
                    color: defTextColor,
                    //spreadRadius: 5,
                    // blurRadius: 7,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ]),
            child: Column(
              children: [
                Row(children: [
                  Image(image: AssetImage(widget.img1)),
                  const Padding(
                    padding: EdgeInsets.symmetric( horizontal: 10,vertical: 5),
                    child: CircleAvatar(backgroundColor: primaryColor,radius: 0.5),
                  ),
                  Image(image: AssetImage(widget.img2)),
                ],),
                sizedBoxh1,
                Row(children: [
                  TextButton(onPressed: (){}, child: Text('Buy ',style: prim18bold(),),),
                  Text(widget.txt1),
                const Spacer(),
                  Text('Price ',style:black18bold()),
                  const Text('',style: TextStyle(color: greenTxt ,fontSize: 18 ,fontWeight: FontWeight.bold),),
                  Text('EGP',style:TextStyle(color: textGray,fontWeight: FontWeight.bold,fontSize: 18),),
                ],),
                sizedBoxh1,
                Row(
                  children: [
                    Expanded(
                      child: defaultButton(context,borderColor: primaryColor,
                        function: () {
                          setState(() {
                            isSelected ;
                          });
                          navigateTo(
                            context,
                            const DetailsScreen(),
                          );
                        },
                        text: 'Prize Details',
                        //    AppLocalization.of(context)!.translate('create_account')!,
                        txtColor: defTextColor,
                        color: greenTxt,
                      ),flex: 15,
                    ),
                    const Expanded(child: SizedBox(width: 1,),flex: 1,),
                    Expanded(flex:15,
                      child:cartButton(function: (){
                        navigateTo(context,const CartScreen() );
                      }, text: 'Add to cart ' ,color:primaryColor,txtColor: defTextColor) ,
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

