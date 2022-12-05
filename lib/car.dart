import 'main.dart';
import 'mapPage.dart';
import 'package:flutter/material.dart';
import 'carSocket.dart';

List<String> assetsImages;
List<String> carID;
List<String> desiredXPOS;
List<String> currentXPOS;
List<String> carOnlineStatus;
List<String> carInstructionStatus;
List<String> carInfoStrings;
List<bool> isInUseList;

class CarCard {
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        children: [
          Image.asset(
            assetsImages[1],
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Text("Dark blue Sport"),
            ],
          )
        ],
      ),
    );
  }
}

List<CarCard> carClassList;

CarCard carPopulate(carCard) {
  return carCard;
}

void getCarInformation() {
  carInfoStrings = getCarInfoCompleted();
}

void parseIntoStrings(carInfoStrings) {
  int count = 0;
  for (int i = 0; i < carInfoStrings.length; i++) {
    if (i % 3 == 0 || i == 0) {
      carID[count] = carInfoStrings[i];
    }
    if ((i % 3) - 1 == 0) {
      desiredXPOS[count] = carInfoStrings[i];
    }
    if ((i % 3) - 2 == 0) {
      currentXPOS[count] = carInfoStrings[i];
    }

    count++;
  }
}

void isInUse() {
  for (int i = 0; i < carID.length; i++) {
    if (desiredXPOS[i] == currentXPOS[i])
      isInUseList[i] = false;
    else
      isInUseList[i] = true;
  }
}
