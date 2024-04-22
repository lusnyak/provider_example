import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/presentation/provider/news_provider.dart';

class AddNewsScreen extends StatelessWidget {
  const AddNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = context.read<NewsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add News"),
        leading: IconButton(
          onPressed: newsProvider.onBack,
          icon: const  Icon(
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
                controller: newsProvider.titleController,
                decoration: const InputDecoration(labelText: "News title"),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: newsProvider.descController,
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
              Consumer<NewsProvider>(
                builder: (context, state, _) {
                  return ElevatedButton(
                      onPressed: newsProvider.onSubmitData,
                      child: state.loading ? SizedBox.square(dimension: 24.0, child: CircularProgressIndicator()) : const Text("SUBMIT"));
                }
              ),
            ],
          ),
        ),
      )),
    );
  }
}
