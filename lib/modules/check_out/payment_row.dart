import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/sizes.dart';
import '../../shared/styles/styles.dart';
class PaymentRow extends StatefulWidget {
  Widget? widgetRadio;
  IconData? icon;
  // Widget? widgetButton;
  Function? functionIf;
  Function? functionElse;
  BuildContext? context;
  String? txt;
  // String? visaNum;
  String? payTxt;

   PaymentRow({Key? key,
     this.context,
     this.txt,
     this.payTxt,
     this.icon,
     this.widgetRadio,
     this.functionIf,
     this.functionElse,
   }) : super(key: key);

  @override
  State<PaymentRow> createState() => _PaymentRowState();
}

class _PaymentRowState extends State<PaymentRow> {

  bool isVisibile= false;
  bool isVisaNumAdded=false;
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),),),
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: getHeight(context)/1.7,
                        // width: getWidth(context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Center(
                                child: SizedBox(width: getWidth(context)/5,
                                  child: defaultSeparator(const Color(0xff707070)),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children:  [
                                  TextButton(onPressed: (){ Navigator.pop(context);},
                                      child: Text('Cancel',style: grey12bold(),)),
                                ],),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text('Enter the card information',style: black14bold(),),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: formFeild(txt: 'Cardholder name', controller: TextEditingController(),isClikable: true),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: formFeild(txt: 'Card number',type: TextInputType.phone, isClikable: true),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(children: [
                                Expanded(
                                  flex:50,
                                  child: formFeild(
                                    txt: 'MM/YY',type: TextInputType.datetime,
                                    isClikable: true,),
                                ),
                                const Expanded(child: SizedBox(width: 1,),flex: 1,),
                                Expanded(
                                    flex: 50,
                                    child: formFeild(txt: 'CVV', type: TextInputType.phone,isClikable: true)),
                              ],),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(Icons.check_circle_outline,color: greenTxt,),
                                ),
                                Text('Do not worry the card information is safe',style: black10bold(),),
                              ],),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: defaultButton(context, function: (){
                                ///TODO
                                ///اضيف ال visibility
                                setState((){
                                  isVisibile=!isVisibile;
                                  Navigator.pop(context);
                                  isVisaNumAdded=!isVisaNumAdded;
                                });
                              },
                                text: 'Add', borderColor: primaryColor,
                                color: primaryColor,txtColor: defTextColor,
                              ),
                            )

                          ],),
                      ),
                    );
                  });},
            child: Row(
              children: [
               widget.widgetRadio!,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    widget.txt!,
                    style: black14bold(),
                  ),
                ),

                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    widget.icon,
                    color: secondColor,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: isVisibile,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: getHeight(context)/66,
                child: Row(
                  children: [
                    const Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: 10),
                      child: Image(image: AssetImage('assets/images/Visa_2021.svg.png'),)
                    ),
                    Text(
                      '**** **** **** 5436',
                      style: black12bold(),
                    ),
                    const Spacer(),
                    TextButton(
                      child: Text(
                        'Delete',
                        style: grey10bold(),
                      ),
                      onPressed: () async {
                        final action =
                        await AlertDialogs.cancelDeleteDialog(
                            context,
                            'Do you want to delete the card',
                             'Cancel','Delete'
                        );

                        if (action == DialogAction.cancel) {
                         // setState(() => tappedCancel = true);
                          widget.functionIf;
                        } else {
                          // setState(() => tappedCancel = false);
                         widget.functionElse;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
    );
  }
}
