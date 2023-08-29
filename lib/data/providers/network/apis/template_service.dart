import 'dart:convert';

import 'package:bc_keeper/app/utils/StringExtensions.dart';
import 'package:bc_keeper/data/models/Template.dart';
import 'package:bc_keeper/data/models/User.dart';
import 'package:dio/dio.dart';

class TemplateService {
  Dio httpClient;
  User? user;

  TemplateService({
    required this.httpClient,
    required this.user,
  });

  Future<List<Template>> fetchTemplates() async {
    try {
      var response = await httpClient.get('/templates/GetTemplates');

      if (response.statusCode == 200) {
        var responseData = response.data;

        if (responseData.containsKey('resultData')) {
          List<Template> templateList = [];
          for (var item in responseData['resultData']) {
            var temp = Template.fromJson(item);
            templateList.add(temp);
          }
          return templateList;
        } else {
          throw Exception('Invalid response data format');
        }
      } else {
        throw Exception('Failed to load templates');
      }
    } catch (error) {
      throw Exception('Get templates error: $error');
    }
  }

  Future<Template> fetchTemplate(int id) async {
    try {
      var response = await httpClient.get('/templates/GetTemplate/$id');

      if (response.statusCode == 200) {
        var responseData = response.data;

        if (responseData.containsKey('resultData')) {
          var templateData = responseData['resultData'][0];
          var template = Template.fromJson(templateData);
          print(template.jsonstr);

          if (template.jsonstr != null) {
            template.hierarchy = TemplateHierarchy.fromJson(json.decode(template
                .jsonstr!
                .removeControlCharacters()
                .removeUnexpectedCharacters()));
          }

          return template;
        } else {
          throw Exception('Invalid response data format');
        }
      } else {
        throw Exception('Failed to load template');
      }
    } catch (error) {
      throw Exception('Get template error: $error');
    }
  }

  Future<bool> saveTemplate(Template template) async {
    try {
      template.jsonstr = json.encode(template.hierarchy?.toJson());
      var response = await httpClient.post('/templates/saveTemplate',
          data: template.toJson());

      if (response.statusCode == 200) {
        var responseData = response.data;
        return response.data['status'] == 'OK';
      } else {
        throw Exception('Kart kaydedilemedi');
      }
    } catch (error) {
      throw Exception('Kart kaydetme hatası: $error');
    }
  }
}
