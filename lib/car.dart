import 'main.dart';
import 'mapPage.dart';
import 'package:flutter/material.dart';

List<String> assetsImages;
List<String> carID;
List<String> carOnlineStatus;
List<String> carInstructionStatus;

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

void getCarInformation() {}
