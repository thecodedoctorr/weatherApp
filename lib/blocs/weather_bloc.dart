
import 'package:bloc/bloc.dart';
import 'package:weatherapp/blocs/weather_event.dart';
import 'package:weatherapp/blocs/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super( WeatherState(loading: true)) {
    on<WeatherDataLoading>(_attemptLoadingData);
    on<WeatherDataLoaded>(_updateData);
    //on<WeatherDataLoadingFailed>(_retryLoading);
    on<CurrentCoordinatesDetermined>(_updateCoordinates);
    on<IndexChanged>(_updateIndex);
  }


  void _attemptLoadingData(event, emit) {
    emit(state.copyWith(loading: true));
  }

  void _updateData(event, emit) {
    emit(state.copyWith(loading: false, weatherData: event.data));
  }

  void _retryLoading(event, emit) {
    emit(state.copyWith(failed: true));
  }

  void _updateCoordinates(event, emit){
    emit(state.copyWith(currentCoordinates: event.currentCoordinates));
  }

  void _updateIndex(event, emit){
    emit(state.copyWith(daysIndex: event.index));
  }
}