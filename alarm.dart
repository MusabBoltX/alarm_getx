import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlarmController extends GetxController {
  RxList<AlarmModel> alarmsList = <AlarmModel>[].obs;

  void createAlarm(AlarmModel alarm) {
    alarmsList.add(alarm);
  }
}

class AlarmScreen extends StatelessWidget {
  AlarmScreen({super.key});

  final AlarmController alarm = Get.put(AlarmController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SafeArea(
              child: Text(
                'Alarm Screen',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: alarm.alarmsList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${alarm.alarmsList[index].title} ${index + 1}'),
                      subtitle: Text(alarm.alarmsList[index].label),
                      style: ListTileStyle.drawer,
                      isThreeLine: true,
                      trailing: const Icon(Icons.alarm),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          alarm.createAlarm(
            AlarmModel(
              appearance: 'Everyday',
              time: '12:00',
              title: 'Alarm',
              enabled: true,
              label: 'Alarm Description',
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AlarmModel {
  final String time;
  final String appearance;
  final String title;
  final bool enabled;
  final String label;

  AlarmModel({
    required this.appearance,
    required this.time,
    required this.title,
    required this.enabled,
    required this.label,
  });
}
