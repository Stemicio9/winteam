import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit/dio.dart';
import 'package:winteam/blocs/annunci_api_service/annunci_api_service.dart';
import 'package:winteam/constants/StateConstants.dart';
import 'package:winteam/constants/page_constants.dart';
import 'package:winteam/entities/annunci_entity.dart';

part 'annunci_cubit_state.dart';

class AnnunciCubit extends Cubit<AnnunciState> {
  AnnunciCubit() : super(AnnunciLoading());

  final List<AnnunciEntity> _annuncis = [];

  List<AnnunciEntity> get annuncis => _annuncis;

  AnnunciEntity? annuncioSelezionatoDettaglio;

  void fetchAnnuncis(String query) async {
    emit(AnnunciLoading());
    try {
      // TODO: fetch Annuncis
      print("FACCIO RICHIESTA DEGLI ANNUNCI CON QUERY $query");
      HttpResponse<dynamic> result =
          await annunciListApiService.getAnnunciList(query);

      print("LA RISPOSTA ALLA REST ");
      print(result.response);

      var encoded = jsonEncode(result.data);
      print("HO ENCODATO");
      var json = (jsonDecode(encoded) as List)
          .map((data) => AnnunciEntity.fromJson(data))
          .toList();
      print("HO CARICATO GLI ANNUNCI");
      emit(AnnunciLoaded(annunci: json));
    } catch (e) {
      print(e.toString());
      emit(AnnunciError());
    }
  }

  void fetchAnnunciLavoratore(
      {bool firstCall = false, bool goNext = true}) async {
    int page = PageConstants.INIT_PAGE_NUMBER;
    int size = PageConstants.PAGE_SIZE;
    if (!firstCall && state is AnnunciLoaded) {
      page = (state as AnnunciLoaded).currentPageNumber;
    }

    if (firstCall) {
      emit(AnnunciLoading());
    } else {
      if (state is AnnunciLoaded) {
        print("EMETTO LO STATO CON LOADING MORE");
        var a = (state as AnnunciLoaded).copyWith(loadingMore: true);
        emit(AnnunciLoaded(
            annunci: a.annunci,
            loadingMore: a.loadingMore,
            currentPageNumber: a.currentPageNumber));
      }
    }

    try {
      final queryParameters = filterAnnunciLavoratore
          .toFilter(page: page, size: size)
          .toQueryParameters();
      print("FACCIO LA RICERCA SU PAGE $page");
      HttpResponse<dynamic> result =
          await annunciListApiService.getAnnunciPaged(
              queryParameters, filterAnnunciLavoratore.state ?? 'search');

      var encoded = jsonEncode(result.data);
      var totalJson = jsonDecode(encoded);

      var json = (totalJson["items"] as List)
          .map((data) => AnnunciEntity.fromJson(data))
          .toList();

      if (state is AnnunciLoaded) {
        var existingAds = (state as AnnunciLoaded).annunci;
        int uniqueResults = mergeAdsList(existingAds, json);
        if (uniqueResults > 0 && uniqueResults < PageConstants.PAGE_THRESHOLD) {
          fetchAnnunciLavoratore(firstCall: false);
          emit(AnnunciLoaded(
              annunci: existingAds,
              loadingMore: true,
              currentPageNumber: uniqueResults > 0 ? page + 1 : page));
        } else {
          emit(AnnunciLoaded(
              annunci: existingAds,
              loadingMore: false,
              currentPageNumber: uniqueResults > 0 ? page + 1 : page));
        }
      } else {
        emit(AnnunciLoaded(
            annunci: json,
            loadingMore: false,
            currentPageNumber: goNext ? page + 1 : page));
      }

    } catch (e) {
      print(e.toString());
      emit(AnnunciError());
    }
  }

  void publishAnnuncio(AnnunciEntity annuncio) async {
    emit(AnnunciPublishing());
    try {
      HttpResponse<dynamic> result =
          await annunciListApiService.publishAnnuncio(annuncio);
      print("LA RISPOSTA ALLA REST ");
      print(result.response);
      emit(AnnunciPublished());
    } catch (e) {
      print(e.toString());
      emit(AnnunciPublishingError());
    }
  }

  void fetchAnnuncioBySkill(String skill, int page, int size) async {
    emit(AnnunciLoading());
    try {
      final queryParameters = filterAnnunciLavoratore
          .toFilter(page: page, size: size)
          .toQueryParameters();
      queryParameters["skill"] = skill;
      HttpResponse<dynamic> result =
          await annunciListApiService.getAnnunciPaged(
              queryParameters, filterAnnunciLavoratore.state ?? 'all');
      print("LA RISPOSTA ALLA REST ");
      print(result.response);
      var encoded = jsonEncode(result.data);
      print("HO ENCODATO");
      var totalJson = jsonDecode(encoded);
      var json = (totalJson["items"] as List)
          .map((data) => AnnunciEntity.fromJson(data))
          .toList();
      print("HO CARICATO GLI ANNUNCI");
      emit(AnnunciLoaded(annunci: json));
    } catch (e) {
      print(e.toString());
      emit(AnnunciError());
    }
  }

  int mergeAdsList(
      List<AnnunciEntity> existingAds, List<AnnunciEntity> newAds) {
    print("FACCIO LA MERGE di");
    print(existingAds);
    print(newAds);
    int count = 0;
    for (var newAd in newAds) {
      bool found = false;
      for (var existingAd in existingAds) {
        if (existingAd.id == newAd.id) {
          found = true;
          break;
        }
      }
      if (!found) {
        existingAds.add(newAd);
        count++;
      }
    }
    print("HO TROVATO $count ANNUNCI NUOVI");
    return count;
  }
}
