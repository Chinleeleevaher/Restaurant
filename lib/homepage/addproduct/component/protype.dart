import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/addproduct/cubit/addproduct_cubit.dart';

class ProtypeElement extends StatelessWidget {
  const ProtypeElement({super.key,
  // required this.texttype
   });

  //final String texttype;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddproductCubit, AddproductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<AddproductCubit>();
        return Row(
          children: [
            Container(
              width: 360,
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 249, 249),
              ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: cubit.state.listproducttypes!.length, //cubit.state.listproductype!.length,
                  itemBuilder: (c, i) {
                    var list = state.listproducttypes;
                    Color _colcontrol = Colors.white;
                    Color _textcolor = Colors.red;
                     if (state.listproducttypes![i] == state.typeSelect && state.listproducttypes != 0) {
                            _colcontrol = Colors.red;
                            _textcolor = Colors.white;
                          }
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                           cubit.onTypeSelectprotype(list[i]);
                          //// <--here is to make ontap and select in productype
                        },
                        child: Container(
                          height: 8,
                          width: 80,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 5),
                                  color: Color.fromARGB(77, 219, 216, 216)
                                      .withOpacity(1),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: _colcontrol),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              //texttype,
                               list![i].protypeName,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: _textcolor),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        );
      },
    );
  }
}
