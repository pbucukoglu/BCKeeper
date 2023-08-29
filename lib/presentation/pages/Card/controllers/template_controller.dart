import 'package:get/get.dart';

import 'package:bc_keeper/data/models/Template.dart';
import 'package:bc_keeper/data/providers/network/apis/template_service.dart';

class TemplateController extends GetxController {
  TemplateService templateService;

  TemplateController({
    required this.templateService,
  });

  final Rxn<List<Template>> templates = Rxn<List<Template>>(null);

  final Rxn<Template> selectedTemplate = Rxn<Template>(null);
  final Rx<RxStatus> status = Rx(RxStatus.loading());

  TemplateHierarchy? get hierarchy => selectedTemplate.value?.hierarchy;

  TemplateText? get text => selectedTemplate.value?.text;

  int get W => hierarchy?.card?.W ?? 1;
  int get H => hierarchy?.card?.H ?? 1;

  void updateFullnamePosition(double x, double y) {
    hierarchy?.fullname?.X = x.toInt();
    hierarchy?.fullname?.Y = y.toInt();
  }

  Future<void> fetchTemplates({int? selectedId}) async {
    status.value = RxStatus.loading();
    try {
      templates.value =
          await templateService.fetchTemplates(); // Initialize templates
      if (templates.value != null && templates.value?[0].id != null) {
        if (selectedId == null) {
          await fetchTemplate(templates.value![0].id!);
        } else {
          await fetchTemplate(selectedId);
        }
      }
      status.value = RxStatus.success();
    } catch (error) {
      Get.snackbar(
        'Error:'.tr, // Snackbar başlığı
        'Template is not available !!', // Snackbar içeriği
      );
    }
  }

  Future<void> fetchTemplate(int id) async {
    status.value = RxStatus.loading();
    var template = await templateService.fetchTemplate(id);
    print("fetch");
    try {
      selectedTemplate.value = template;

      status.value = RxStatus.success();
    } catch (error) {
      Get.snackbar(
        'Error:', // Snackbar başlığı
        'Template is not available !!', // Snackbar içeriği
      );
    }
  }

  Future<void> updateTemplate() async {
    status.value = RxStatus.loading();
    try {
      if (selectedTemplate.value != null) {
        // Update the name of the current card with the new name

        var result =
            await templateService.saveTemplate(selectedTemplate.value!);

        if (result) {
          Get.snackbar(
            'Succesful:'.tr, // Snackbar başlığı
            'CardInfoChanged'.tr, // Snackbar içeriği
          );
        } else {
          Get.snackbar(
            'Error:'.tr, // Snackbar başlığı
            'Cardisnotupdated!!'.tr, // Snackbar içeriği
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error:'.tr, // Snackbar başlığı
        'CardNotUpdated'.tr, // Snackbar içeriği
      );
    }

    status.value = RxStatus.success();
  }
}
