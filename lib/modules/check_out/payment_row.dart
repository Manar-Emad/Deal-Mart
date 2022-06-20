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
  bool isVisible;

   PaymentRow({Key? key,
     this.context,
     this.txt,
     this.payTxt,
     this.icon,
     this.widgetRadio,
     this.functionIf,
     this.functionElse,
     required this.isVisible,
   }) : super(key: key);

  @override
  State<PaymentRow> createState() => _PaymentRowState();
}

class _PaymentRowState extends State<PaymentRow> {

  bool isVisaNumAdded=false;
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Row(
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
          Visibility(
            visible: widget.isVisible,
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
