import 'package:deal_mart/modules/details/product_details.dart';
import 'package:deal_mart/modules/map/google_map_screen.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/sizes.dart';
import '../check_out/check_out_screen.dart';

class AddressInformation extends StatelessWidget {
  AddressInformation({Key? key}) : super(key: key);
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defTextColor,
        title: const Text(
          'Address information',
          style: TextStyle(
            color: secondColor,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundColor: defTextColor,
              child: Icon(
                Icons.arrow_back,
                color: secondColor,
              ),
            ),
          ),
          onTap: () {
            navigateTo(context, const GoogleMapScreen());
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  height: getHeight(context) / 9,
                  color: defTextColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child:
                              Text('Elbaron,maddi,cairo', style:black14bold()),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: 1,
                        ),
                        flex: 7,
                      ),
                      Expanded(
                        flex: 3,
                        child: smallContainer(
                          getHeight(context) / 10,
                          getWidth(context) / 7,
                          context,
                          Center(
                              child: Stack(
                            children: [
                              Image(
                                image: const AssetImage(
                                  'assets/images/Mask Group 17.png',
                                ),
                                height: getHeight(context) / 11,
                                width: getWidth(context) / 7,
                                fit: BoxFit.contain,
                              ),
                              Positioned(
                                bottom: 6,
                                left: 10,
                                right: 10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Edite',
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                          defTextColor,
                          BorderRadius.circular(10),
                          () {
                            navigateTo(context, const GoogleMapScreen());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// FORM
              Expanded(
                child: Container(width: 1,
                  //color: Colors.blue,
                ),
                flex: 1,
              ),
              Expanded(
                flex: 35,
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20,bottom: 7),
                            child: Text(
                              'Full Name',
                              style: black12bold(),
                            ),
                          ),
                          formFeild(
                            txt: 'name',
                            isClikable: true,
                            controller: TextEditingController(),
                            type: TextInputType.name,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'please enter your name';
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20,bottom:7),
                            child: Text(
                              'Mobile number',
                              style: black12bold(),
                            ),
                          ),
                          formFeild(
                            txt: 'enter phone number',
                            isClikable: true,
                            type: TextInputType.phone,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'please enter your phone number';
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20,bottom: 7),
                            child: Text(
                              'Street name, building number,apartment number',
                              style: black12bold(),
                            ),
                          ),
                          formFeild(
                            txt: 'Street name, building number,apartment number',
                            isClikable: true,
                            controller: TextEditingController(),
                            type: TextInputType.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'please enter your Street name, building number,apartment number';
                              }
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 20,bottom: 7),
                            child: Row(
                              children: [
                                Text(
                                  'special marque',
                                  style: black12bold(),
                                ),
                                Text(
                                  '(optional)',
                                  style:grey10bold(),
                                ),
                              ],
                            ),
                          ),
                          formFeild(
                            txt: 'special marque',
                            isClikable: true,
                            controller: TextEditingController(),
                            type: TextInputType.name,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: defaultButton(
                              context,borderColor: primaryColor,
                              color: primaryColor,
                              txtColor: defTextColor,
                              function: () {
                                if(formKey.currentState!.validate()){
                                  print('validate done in address info========');
                                }
                                navigateAndFinish(context, const CheckOutScreen());
                              },
                              text: 'Save',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// Widget mobileNumContainer(context) => Container(
//       height: getHeight(context) / 13,
//       width: getWidth(context),
//       decoration: BoxDecoration(
//         color: formContainer,
//         border: Border.all(color: primaryColor),
//         //  color: buttonColor,
//         borderRadius: BorderRadius.circular(
//           10.0,
//         ),
//       ),
//       child: Row(
//         children: const [
//           Text('+20'),
//         ],
//       ),
//     );
