import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Dynamic Item'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameTextEditingController,
              decoration: const InputDecoration(
                hintText: "Name",
                labelText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 8,
            ),

            ElevatedButton(
              onPressed: () {
                controller.addEmployee(
                    controller.nameTextEditingController.text,
                    controller.addressTextEditingController.text);
              },
              child: const Text(" + Add "),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                   itemCount: controller.itemCount.value,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(controller.employees.value[index].name!),
                        subtitle:
                            Text(controller.employees.value[index].address!),
                        trailing: GestureDetector(
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onTap: () {
                            controller.removeEmployee(index);
                          },
                        ),
                      );
                    }),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
