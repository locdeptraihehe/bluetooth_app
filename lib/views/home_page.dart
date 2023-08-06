import 'package:bluetooth_app/controllers/bluetooth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<BlueToothController>(
            init: BlueToothController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: double.infinity,
                      color: Colors.blue,
                      child: const Center(
                        child: Text(
                          'BlueToothApp',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(350, 50),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                      onPressed: () => controller.scanDevice(),
                      child: const Text('Scan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<List<ScanResult>>(
                      stream: controller.scanResults,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final data = snapshot.data![index];
                                return Card(
                                    elevation: 2,
                                    child: ListTile(
                                      title: Text(data.device.name),
                                      subtitle: Text(data.device.id.id),
                                      trailing: Text(data.rssi.toString()),
                                    ));
                              });
                        } else {
                          return const Center(
                            child: Text('No devices found'),
                          );
                        }
                      },
                    )
                  ],
                ),
              );
            }));
  }
}
