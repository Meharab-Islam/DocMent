import 'package:docment/feature/home/data/department_data.dart';
import 'package:docment/feature/home/model/department_model.dart';
import 'package:get/get.dart';


class DepartmentController extends GetxController {
  var departments = <DepartmentModel>[].obs;
  var isLoading = true.obs;

  final DepartmentService departmentService;

  DepartmentController({required this.departmentService});

  @override
  void onInit() {
    fetchDepartments();
    super.onInit();
  }

  Future<void> fetchDepartments() async {
    try {
      isLoading(true);
      final response = await departmentService.getDepartments();
      if (response['status'] == 'success') {
        departments.value = (response['data'] as List)
            .map((e) => DepartmentModel.fromJson(e))
            .toList();
      } else {
        // Handle error case
        Get.snackbar("Error", "Failed to load departments");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
