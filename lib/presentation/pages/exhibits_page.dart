import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_task/presentation/bloc/exhibit_bloc.dart';
import 'package:technical_task/presentation/widgets/display_photos.dart';

class ExhibitsPage extends StatelessWidget {
  const ExhibitsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Exhibits',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<ExhibitBloc, ExhibitState>(
        builder: (context, state) {
          if (state is ExhibitLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExhibitError) {
            return const Center(
              child: Text('Something went wrong!'),
            );
          } else if (state is ExhibitFetched) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: List.generate(state.result.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: DisplayPhotos(exhibit: state.result[index]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        }
      ),
    );
  }
}
