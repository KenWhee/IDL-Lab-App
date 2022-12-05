import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'client.dart';
import 'main.dart';
import 'car.dart';
import 'dart:convert';

String carInfo;
List<String> carInfoCompleted;

carSocket() async {
  // createSocket();

  /*
  Client: I want car state information
  Server: Sends Information
  */

  // function to send a message to the server wait 15 seconds for a response
  Future<void> sendMessage(Socket socket, String message) async {
    socket.write(message);
    await Future.delayed(Duration(seconds: 15));
  }

  // establishes a tcp connection with the server on port 5400
  Socket socket = await Socket.connect('192.168.1.1', 5400);

  /*
  send a string to the server, 'CarData', this should be interpreted by
  the back end to send a string containing the current car data available
  */
  await sendMessage(socket, 'CarData');

  // listens for the response from the server and stores the response in carInfo
  socket.listen(
    (Uint8List data) {
      final serverResponse = String.fromCharCodes(data);
      carInfo = serverResponse;
    },
    onError: (error) {
      print(error);
      socket.destroy();
    },
    onDone: () {
      socket.destroy();
    },
  );
}

/*
parse carInfo into a List, parseList, assuming comma seperated values then,
take the wanted values and add them to a List carInfoCompleted

the data will be in the following format

List<String> carInfoCompleted
[
  Index 0: CarID
  Index 1: Desired_x_pos
  Index 2: Current_x_pos
  Index 3: CarID
  Index 4: Desired_x_pos
  Index 5: Current_x_pos
  ...
  ...
  ...
]

We also store this information in this class for future development, however,
returning a List of strings allows for on-the-fly parsing of the carInfo string
*/
List<String> parseString(carInfo) {
  String carInfoParsed = carInfo.split(',');
  List parseList;
  for (int i = 0; i < carInfoParsed.length; i++) {
    parseList.add(carInfoParsed[i]);
  }

  for (int i = 0; i < parseList.length; i++) {
    // add only the carID's
    if ((i % 11) - 1 == 0 || i == 1) {
      carInfoCompleted = parseList[i];
    }
    //add only the desired_x_pos
    if ((i % 11) - 4 == 0 || i == 4) {
      carInfoCompleted = parseList[i];
    }
    //add only the current_x_pos
    if ((i % 11) - 3 == 0 || i == 3) {
      carInfoCompleted = parseList[i];
    }
  }

  return carInfoCompleted;
}

List<String> getCarInfoCompleted() {
  carSocket();
  return parseString(carInfo);
}


// if we get a hostname we can assume it's online
// if it desired_pos != pos_X assign instruction status
//  then lock car card

// update list 10 seconds



