import 'dart:convert';
import 'lokasi_event.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider_dzikir/bloc/lokasi/bloc/lokasi_state.dart';


class LokasiBloc extends Bloc<LokasiEvent, LokasiState> {
  LokasiBloc() : super(LokasiInitialState());

  Stream<LokasiState> mapEventToState(LokasiEvent event) async* {
    if (event is FetchLokasiEvent) {
      yield LokasiLoadingState();
      try {
        List<String> labels = await fetchLabels();
        yield LokasiLoadedState(labels);
      } catch (e) {
        yield LokasiErrorState("Error fetching location data");
      }
    } else if (event is SelectLokasiEvent) {
      String currentSelectedValue = event.label;
      // Lakukan sesuatu dengan label yang dipilih
    }
  }

  Future<List<String>> fetchLabels() async {
    final apiUrl = 'http://192.168.14.213/v1/api/data/location';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonBody = response.body;
      final parsedJson = json.decode(jsonBody);
      List<String> labels = List<String>.from(parsedJson['data'].map((label) => label['label']));
      return labels;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

