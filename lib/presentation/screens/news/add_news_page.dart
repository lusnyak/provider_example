import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/presentation/provider/news_provider.dart';
import 'package:provider_example/presentation/screens/news/cubit/news_cubit.dart';

class AddNewsPage extends StatelessWidget {
  const AddNewsPage({super.key, required this.cubit});

  final NewsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add News"),
        leading: IconButton(
          onPressed: cubit?.onBack,
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
      ),
      body: SafeArea(
          child: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: cubit.titleController,
                decoration: const InputDecoration(labelText: "News title"),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: cubit.descController,
                decoration: const InputDecoration(
                    labelText: "News description"
                        ""),
              ),
              const SizedBox(
                height: 16.0,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Icon(
                    Icons.photo,
                    size: 32.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              // state.loading ? :

              BlocProvider(
                create: (_) => cubit,
                child: BlocBuilder<NewsCubit, NewsState>(
                    builder: (context, state) {
                  return ElevatedButton(
                      onPressed: cubit.onSubmitData,
                      child: state is NewsStateAddNewLoading
                          ? const SizedBox.square(
                              dimension: 24.0,
                              child: CircularProgressIndicator())
                          : const Text("SUBMIT"));
                }),
              )
            ],
          ),
        ),
      )),
    );
  }
}
