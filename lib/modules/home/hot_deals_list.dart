import 'package:deal_mart/modules/cart/cart_screen.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import '../../shared/app_cubit/app_cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../details/details_screen.dart';
class ContainerDeals extends StatefulWidget {
  final String img1 ;
  final String img2;
  final String txt1 ;
  final String price;



   const ContainerDeals({Key? key,
   required this.img1,
     required this.img2,
     required this.txt1,
     required this.price,

   }) : super(key: key);

  @override
  State<ContainerDeals> createState() => _ContainerDealsState();
}

class _ContainerDealsState extends State<ContainerDeals> {

  bool isFav = true;

  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(context)/2.7,
      width: getWidth(context),
      child: defContainer(context, Column(
        children: [
          Expanded(
            flex: 6,
            child: Row(
              children: [
              Expanded(
                flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(top:30,bottom: 0),
                    child: Image(
                      // height: getHeight(context)/7,
                      //   width: getWidth(context),
                        image: AssetImage(widget.img1),fit: BoxFit.cover),
                  )),
               Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 10,vertical: 5),
                  child: Column(
                    children:const [
                        CircleAvatar(
                          backgroundColor: formContainer,
                          radius: 45),],),),),
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30,bottom: 0),
                    child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                      Image(
                          // height: getHeight(context)/5,
                          // width: getWidth(context),
                          image: AssetImage(widget.img2)),
                      const Positioned(
                        right: 75,bottom:45,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: primaryColor,
                          child: Center(
                            child: Icon(Icons.wallet_giftcard_sharp,
                              color: defTextColor,size: 12,),
                          ),
                          )),
                    ]),
                  )),
            ],),
          ),
          Expanded(
            flex:2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(children: [
                Text('Buy ',style: prim14bold(),),
                Text(widget.txt1),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text('Price ',style:black14bold()),
                      ),
                      Text('${widget.price} EGP',style:grey14bold(),),
                    ],
                  ),
                ),
              ],),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: getHeight(context)/12,
                    child: defaultButton(context,borderColor: greenTxt,
                      function: () {
                        navigateTo(
                          context,
                          const DetailsScreen(),
                        );
                      },
                      text: 'Prize Details',
                      //    AppLocalization.of(context)!.translate('create_account')!,
                      txtColor: defTextColor,
                      color: greenTxt,
                    ),
                  ),flex: 15,
                ),
                const Expanded(child: SizedBox(width: 1,),flex: 1,),
                Expanded(flex:15,
                  child:SizedBox(
                    height: getHeight(context)/12,
                    child: cartButton(rightPadding: 0,
                        function: (){
                      navigateTo(context,AppCubit.get(context).changeBottom(3) );
                      /// navigate to cartScreen
                      //    navigateTo(context,const CartScreen() );
                    },widget: const SizedBox(width: 20,),
                        iconSize: 20,
                        text: 'Add to cart ' ,
                        fontSize: 14,
                        color:primaryColor,txtColor: defTextColor),
                  ) ,
                ),
              ],
            ),
          ),
          //const Expanded(flex: 1,child:  SizedBox(height: 1,),),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: primaryColor,
                    child: Center(
                      child: Icon(Icons.wallet_giftcard_sharp,
                        color: defTextColor,size: 15,),
                    ),
                  ),
                ),
                txtMaxLinesB1('Get a chance to '),
                 Text('win', style:  prim10bold()),
              ],
            ),
          ),
          //const Expanded(flex: 1,child:  SizedBox(height: 1,),),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom:5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(flex: 4,child: SizedBox(width: 1,)),
                  Expanded(
                      flex: 4,
                      child: Text('Honda accord 2021' ,style: black16bold(),)),
                  const Expanded(flex:1,child: const SizedBox(width: 1,)),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      child: CircleAvatar(
                        child: isFav
                            ? const Icon(
                          Icons.favorite_border,
                          color: secondColor,
                        )
                            : const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        backgroundColor: defTextColor,
                      ),
                      onTap: () {
                        setState(() {
                          isFav = !isFav;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),),
    );

  }
}

