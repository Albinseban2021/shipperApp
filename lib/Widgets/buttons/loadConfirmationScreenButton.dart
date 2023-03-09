import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/colors.dart';
import '/constants/fontSize.dart';
import '/constants/fontWeights.dart';
import '/constants/radius.dart';
import '/constants/spaces.dart';
import '/controller/navigationIndexController.dart';
import '/controller/postLoadErrorController.dart';
import '/controller/postLoadVariablesController.dart';
import '/controller/transporterIdController.dart';
import '/functions/PostLoadApi.dart';
import '/functions/PutLoadAPI.dart';
import '/functions/postOneSignalNotification.dart';
import '/providerClass/providerData.dart';
import '/screens/PostLoadScreens/PostLoadScreenLoacationDetails.dart';
import '/screens/PostLoadScreens/PostLoadScreenLoadDetails.dart';
import '/screens/PostLoadScreens/postloadnavigation.dart';
import '/screens/navigationScreen.dart';
import '/widgets/alertDialog/loadingAlertDialog.dart';
import '/widgets/alertDialog/CompletedDialog.dart';
import '/widgets/alertDialog/orderFailedAlertDialog.dart';
import 'package:provider/provider.dart';

class LoadConfirmationScreenButton extends StatelessWidget {
  String title;

  LoadConfirmationScreenButton({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LoadApi loadApi = LoadApi();
    PostLoadErrorController postLoadErrorController =
        Get.put(PostLoadErrorController());
    NavigationIndexController navigationIndexController =
        Get.find<NavigationIndexController>();
    TransporterIdController transporterIdController =
        Get.find<TransporterIdController>();
    ProviderData providerData = Provider.of<ProviderData>(context);
    PostLoadVariablesController postLoadVariables =
        Get.find<PostLoadVariablesController>();
    getData() async {
      // print(transporterIdController.transporterId.value);
      String? loadId = '';
      if (loadId == '') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return LoadingAlertDialog();
          },
        );
      }
      if (providerData.editLoad == false) {
        loadId = await postLoadAPi(
            postLoadVariables.bookingDate.value,
            transporterIdController.transporterId.value,
            providerData.loadingPointPostLoad,
            providerData.loadingPointCityPostLoad,
            providerData.loadingPointStatePostLoad,
            providerData.loadingPointPostLoad2 ==""?null:providerData.loadingPointPostLoad2,
            providerData.loadingPointCityPostLoad2 ==""?null:providerData.loadingPointCityPostLoad2,
            providerData.loadingPointStatePostLoad2 ==""?null:providerData.loadingPointStatePostLoad2,
            providerData.totalTyresValue,
            providerData.productType,
            providerData.truckTypeValue,
            providerData.unloadingPointPostLoad,
            providerData.unloadingPointCityPostLoad,
            providerData.unloadingPointStatePostLoad,
            providerData.unloadingPointPostLoad2 ==""?null:providerData.unloadingPointPostLoad2,
            providerData.unloadingPointCityPostLoad2 ==""?null:providerData.unloadingPointCityPostLoad2,
            providerData.unloadingPointStatePostLoad2 == ""?null:providerData.unloadingPointStatePostLoad2,
            providerData.passingWeightValue,
            providerData.unitValue == "" ? null : providerData.unitValue,
            providerData.price == 0 ? null : providerData.price);

        print("loadId $loadId");
        if (loadId != null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return completedDialog(
                  upperDialogText: 'congratulations'.tr,
                  // AppLocalizations.of(context)!.congratulations,
                  lowerDialogText: 'youHaveCompletedYourOrder'.tr
                  // AppLocalizations.of(context)!.youHaveCompletedYourOrder,
                  );
            },
          );
          Timer(
              Duration(seconds: 3),
              () => {
                    navigationIndexController.updateIndex(2),
                    Get.offAll(() => NavigationScreen()),
                    providerData.resetPostLoadFilters(),
                    providerData.resetPostLoadScreenOne(),
                    providerData.resetPostLoadScreenMultiple(),
                    providerData.updateUpperNavigatorIndex2(0),
                    controller.text = "",
                    controllerOthers.text = ""
                  });
          providerData.updateEditLoad(true, "");

          postNotification(providerData.loadingPointCityPostLoad,
              providerData.unloadingPointCityPostLoad);
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return OrderFailedAlertDialog();
            },
          );
        }
      } else if (providerData.editLoad == true) {
        loadId = await putLoadAPI(
            providerData.transporterLoadId,
            postLoadVariables.bookingDate.value,
            transporterIdController.transporterId.value,
            "${providerData.loadingPointCityPostLoad}, ${providerData.loadingPointStatePostLoad}",
            providerData.loadingPointCityPostLoad,
            providerData.loadingPointStatePostLoad,
            providerData.loadingPointCityPostLoad2==""?null:"${providerData.loadingPointCityPostLoad2}, ${providerData.loadingPointStatePostLoad2}",
            providerData.loadingPointCityPostLoad2 ==""?null:providerData.loadingPointCityPostLoad2,
            providerData.loadingPointStatePostLoad2 ==""?null:providerData.loadingPointStatePostLoad2,
            providerData.totalTyresValue,
            providerData.productType,
            providerData.truckTypeValue,
            "${providerData.unloadingPointCityPostLoad}, ${providerData.unloadingPointStatePostLoad}",
            providerData.unloadingPointCityPostLoad2==""?null:"${providerData.unloadingPointCityPostLoad2}, ${providerData.unloadingPointStatePostLoad2}",
            providerData.unloadingPointCityPostLoad2 ==""?null:providerData.unloadingPointCityPostLoad2,
            providerData.unloadingPointStatePostLoad2 == ""?null:providerData.unloadingPointStatePostLoad2,
            providerData.unloadingPointCityPostLoad,
            providerData.unloadingPointStatePostLoad,
            providerData.passingWeightValue,
            providerData.unitValue == "" ? null : providerData.unitValue,
            providerData.price == 0 ? null : providerData.price);

        if (loadId != null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return completedDialog(
                  upperDialogText: 'congratulations'.tr,
                  // AppLocalizations.of(context)!.congratulations,
                  lowerDialogText: 'youHaveSuccessfullyUpdateYourOrder'.tr
                  // AppLocalizations.of(context)!.youHaveSuccessfullyUpdateYourOrder,
                  );
            },
          );
          Timer(
              Duration(seconds: 3),
              () => {
                    Get.offAll(() => NavigationScreen()),
                    navigationIndexController.updateIndex(2),
                    providerData.resetPostLoadFilters(),
                    providerData.resetPostLoadScreenOne(),
                    providerData.resetPostLoadScreenMultiple(),
                    providerData.updateUpperNavigatorIndex2(0),
                    controller.text = "",
                    controllerOthers.text = ""
                  });
          providerData.updateEditLoad(false, "");
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return OrderFailedAlertDialog();
            },
          );
        }
      }
    }

    return GestureDetector(
      onTap: () {
        // title=="Edit"?Get.to(PostLoadScreenOne()):
        if (title == "Edit") {
          providerData.updateUpperNavigatorIndex2(0);
          Get.to(() => postloadnav());
        } else {
          providerData.updateUnitValue();
          getData();
        }
      },
      child: Container(
        height: space_8,
        decoration: BoxDecoration(
            color: darkBlueColor,
            borderRadius: BorderRadius.circular(radius_6)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: white, fontWeight: mediumBoldWeight, fontSize: size_8),
          ),
        ),
      ),
    );
  }
}
