import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:io';
import 'dart:convert';

class SendAudioService extends ChangeNotifier {
  Future uploadAudio(File file, String word) async {
    Uri uri = Uri.parse('http://ce95-35-245-9-226.ngrok.io/check_pronunciation');
    dynamic responseData;
    try{
      var request = http.MultipartRequest('POST', uri);
      request.fields['word'] = word; // include the word in the request
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          file.path,
          contentType: MediaType('audio', 'wav'),
        ),
      );
      var response = await request.send();
      if(response.statusCode == 200){
        print("Upload successful");
        var jsonResponse = await response.stream.bytesToString();
        var data = jsonDecode(jsonResponse);
        responseData = data;
      }else {
        print("Upload failed");
      }
      return responseData;
    }catch(e){
      print(e.toString());
    }
  }
}

