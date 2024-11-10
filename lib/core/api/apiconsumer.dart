abstract class Apiconsumer {
  get(String path, {Object? data, Map<String, dynamic> ?quaryParameters});
  post(String path, {Object? data, Map<String, dynamic> ?quaryParameters ,bool isFormData= false});
  patch(String path, {Object? data, Map<String, dynamic> ?quaryParameters,  bool isFormData= false});
  delete(String path, {Object? data, Map<String, dynamic> ?quaryParameters,  bool isFormData= false});
}
