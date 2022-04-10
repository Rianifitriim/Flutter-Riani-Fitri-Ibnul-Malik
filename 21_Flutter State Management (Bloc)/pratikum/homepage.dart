import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/data_cubit.dart';
import 'cubit/data_state.dart';
import 'cubit/theme_cubit.dart';
import 'new_contact.dart';

class Homepage extends StatelessWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCubit, DataState>(
      builder: (context, state) {
        var listData = state.list;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Contacts'),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<ThemeCubit>().ubahTema();
                },
                icon: const Icon(Icons.color_lens),
              )
            ],
          ),
          body: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                ListView.builder(
                  itemCount: listData.length,
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final contact = listData[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Text(
                              contact.name![0],
                              style: const TextStyle(
                                  color: Colors.purpleAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                            radius: 25,
                            backgroundColor:
                                const Color.fromARGB(255, 236, 187, 245),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contact.name!,
                                  style: const TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  contact.number!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(
                                      255,
                                      91,
                                      91,
                                      91,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewContact(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
