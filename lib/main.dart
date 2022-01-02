import 'package:astrotak/app/business/bloc/location_bloc.dart';
import 'package:astrotak/app/data/repositories/api_repository.dart';
import 'package:astrotak/app/services/api_service.dart';
import 'package:astrotak/app/ui/views/Navigation/navigation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/business/bloc/astrologerbloc_bloc.dart';

void main() {
  //We inject our dio client here:
  final ApiRepository repository = ApiRepository(
    apiService: AstroApiService(
      dioClient: Dio(
        BaseOptions(
          baseUrl: 'https://www.astrotak.com/astroapi/api/',
        ),
      ),
    ),
  );

  runApp(App(
    repository: repository,
  ));
}

class App extends StatelessWidget {
  final ApiRepository repository;

  App({required this.repository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //Global Access to both of them for now since there is a navigation bar and no stack routes
        BlocProvider(
            create: (context) => AstrologerblocBloc(apiRepository: repository)),
        BlocProvider(
            create: (context) => LocationBloc(apiRepository: repository))
      ],
      child: MaterialApp(
        home: Navigation(),
      ),
    );
  }
}
