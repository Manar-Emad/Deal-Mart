import 'package:deal_mart/modules/wallet/withdrawal_history.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import '../../shared/app_cubit/app_cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/sizes.dart';
import '../settings/settings_screen.dart';
import 'deposit_history.dart';

class WalletBalanceScreen extends StatefulWidget {
  const WalletBalanceScreen({Key? key}) : super(key: key);

  @override
  State<WalletBalanceScreen> createState() => _WalletBalanceScreenState();
}

class _WalletBalanceScreenState extends State<WalletBalanceScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: defTextColor,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Wallet balance',
          style: TextStyle(
            color: secondColor,
          ),
        ),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: secondColor,
            ),
            onPressed: () {
              navigateTo(context, const SettingsScreen());
            }),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: defContainer(
                context,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Text(
                        'Your balance',
                        style: white14bold(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'EGP',
                            style: white20regular(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              '452',
                              style: white22bold(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          child: Row(
                            children: [
                              const CircleAvatar(
                                child: Center(
                                    child: Icon(
                                  Icons.add,
                                  size: 18,
                                  color: defTextColor,
                                )),
                                backgroundColor: Colors.white24,
                                radius: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  'Charge',
                                  style: white14regular(),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: defTextColor,
                                size: 15,
                              ),
                            ],
                          ),
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                builder: (context) {
                                  return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: SizedBox(
                                        height: getHeight(context) / 2.4,
                                        // width: getWidth(context),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Center(
                                                  child: SizedBox(
                                                    width:
                                                        getWidth(context) / 5,
                                                    child: defaultSeparator(
                                                        separatorColor),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20,
                                                              bottom: 10,
                                                              left: 20,
                                                              right: 20),
                                                      child: Text(
                                                        'Charge your wallet',
                                                        style: black12bold(),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 40),
                                                      child: Form(
                                                        key: formKey,
                                                        child: formFeild(
                                                            txt: '500',
                                                            type: TextInputType.phone,
                                                            validate: (value) {
                                                              if (value.isEmpty) {
                                                                return 'enter number to charge';
                                                              }
                                                              return null;
                                                            },
                                                            isClikable: true),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: defaultButton(
                                                        context,
                                                        function: () {
                                                          if(formKey.currentState!.validate()){
                                                          }
                                                          Navigator.pop(context);
                                                        },
                                                        text: 'Charge',
                                                        borderColor:
                                                            primaryColor,
                                                        color: primaryColor,
                                                        txtColor: defTextColor,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ]),
                                      ));
                                });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                color: greenTxt),
          ),
          SizedBox(
            height: getHeight(context) / 20,
           width: getWidth(context) / 1.5,
            child: TabBar(
/// BUTTONS TABBAR
                unselectedLabelColor: textGray,
                labelColor: Colors.green,
                unselectedLabelStyle:
                TextStyle(color: textGray,),
                labelStyle:
                const TextStyle(fontWeight: FontWeight.bold),
                indicatorWeight: 1,
                controller: tabController,
                indicator: BoxDecoration(shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  //color: primaryColor,
                ),
                tabs:  [
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                        Border.all( color:Colors.red , width: 1),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child:  Text("APPS",),
                      ),
                    ),
                    //text: 'Deposit history',
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                        Border.all( color:Colors.red , width: 1),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child:  Text("Withdrawal history",),
                      ),
                    ),
                    //text: 'Deposit history',
                  ),
                ]),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                DepositHistory(),
                WithdrawalHistory(),
              ],),
          )
        ],
      ),
    );
  }
}
