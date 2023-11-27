import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:provider_dzikir/model/model_lokasi.dart';
import 'package:provider_dzikir/bloc/lokasi/bloc/lokasi_event.dart';
import 'package:provider_dzikir/bloc/lokasi/bloc/lokasi_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitialState());

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    if (event is FetchLocationEvent) {
      try {
        // Gantilah baris berikut dengan logika pengambilan data asinkron
        ModelLocation modelLocation = await fetchData();
        yield LocationLoadedState(modelLocation);
      } catch (e) {
        yield LocationErrorState("Error fetching location data");
      }
    }

    // Tambahkan penanganan event lainnya jika diperlukan
  }

  Future<ModelLocation> fetchData() async {
    // Gantilah ini dengan logika pengambilan data sesungguhnya
    await Future.delayed(Duration(seconds: 2));
    return ModelLocation(status: true, data: [
      DataISI(label: "Location 1", detail: DetailAA(lat: 1.0, long: 2.0, radius: 100, idlokasi: "1")),
      DataISI(label: "Location 2", detail: DetailAA(lat: 3.0, long: 4.0, radius: 150, idlokasi: "2")),
    ]);
  }
}
