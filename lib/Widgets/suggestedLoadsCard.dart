import 'package:flutter/material.dart';
import '/constants/elevation.dart';
import '/constants/spaces.dart';
import '/controller/transporterIdController.dart';
import '/models/loadDetailsScreenModel.dart';
import '/screens/loadDetailsScreen.dart';
import 'alertDialog/verifyAccountNotifyAlertDialog.dart';
import 'loadCardFooter.dart';
import 'loadCardHeader.dart';
import 'package:get/get.dart';

class SuggestedLoadsCard extends StatelessWidget {
  final LoadDetailsScreenModel loadDetailsScreenModel;
  final TransporterIdController tIdController =
      Get.put(TransporterIdController());

  SuggestedLoadsCard({Key? key, required this.loadDetailsScreenModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: space_2),
      child: Column(children: [
        GestureDetector(
          onTap: () {
            if (tIdController.transporterApproved.value) {
              Get.to(() => LoadDetailsScreen(
                  loadDetailsScreenModel: loadDetailsScreenModel));
            } else {
              showDialog(
                  context: context,
                  builder: (context) => VerifyAccountNotifyAlertDialog());
            }
          },
          child: Card(
            elevation: elevation_2,
            child: Column(
              children: [
                LoadCardHeader(
                  loadDetails: loadDetailsScreenModel,
                ),
                LoadCardFooter(
                    loadPosterCompanyName:
                        loadDetailsScreenModel.loadPosterCompanyName,
                    loadPosterPhoneNo: loadDetailsScreenModel.phoneNo)
              ],
            ),
          ),
        )
      ]),
    );
  }
}
