import 'package:appqrcode/models/Equipment.dart';
import 'package:appqrcode/product_card.dart';
import "package:flutter/material.dart";
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:appqrcode/services/EquipmentService.dart';
import 'package:appqrcode/details/details_screen.dart';
import 'details/EquipmentDetails.dart';
import 'models/Product.dart';

class QrcodePage extends StatelessWidget {
  const QrcodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
  }
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //late Equipment equipment;
  Future<Equipment>? _future;
  @override
  void initState(){
    super.initState();
    String qrcode = 'equipment-1646593980823-test1';
    _future = getEquipment(qrcode);
  }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  Barcode? resultt;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    Equipment eq;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: FutureBuilder<Equipment>(
                future: _future,
                builder: (context, snapshot){
                  print(snapshot.connectionState);
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                      return Container();
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    case ConnectionState.active:
                      return Text('');
                    case ConnectionState.done:
                      if (snapshot.hasError){
                        return Text(
                          '${snapshot.hasError}',
                          style: TextStyle(color: Colors.red),
                        );
                      }else {
                        print("hasdata");
                        Equipment eq = snapshot.data!;
                        print(eq.toString());
                        WidgetsBinding.instance?.addPostFrameCallback((_) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    EquipmentDetail(equipment: eq)
                            ),
                          );
                        });
                        return Container();
                      }
                  }


                  return const CircularProgressIndicator();
                },
              ),

              //  child: (result != null)
              //     ? Text(
              //     'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
              //     //: Text('Scan a code $qrcode'),
              //     : ElevatedButton(
              //         onPressed:() {
              //           String qrcode = 'equipment-1646237449568-equipment3';
              //           _future = getEquipment(qrcode);
              //           Equipment equipment = _future as Equipment;
              //          Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => EquipmentDetail(equipment: equipment))
              //           );},
              //         child: const Text('scan'),
              //       ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        Future.delayed(Duration(seconds: 3), () {});

      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

