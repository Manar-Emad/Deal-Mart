import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 65,
                  width: 64,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();

                      }
                    },
                    onSaved: (pin1){ },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: ' 0 ',

                    ),
                    keyboardType:TextInputType.number ,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,

                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
