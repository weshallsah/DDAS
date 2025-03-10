import 'package:flutter/material.dart';

class SideInfo extends StatelessWidget {
  List Info;
  SideInfo({super.key, required this.Info});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 5,
        right: 5,
        bottom: 15,
      ),
      width: 250,
      color: const Color.fromARGB(255, 52, 52, 52),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                itemCount: Info.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: index == 0 ? 0 : 2,
                      horizontal: index == 0 ? 0 : 5,
                    ),
                    child: Text(
                      index == 0 ? Info[index] : " -${Info[index]}",
                      style: TextStyle(
                        fontSize: index == 0 ? 20 : 16,
                        fontWeight:
                            index == 0 ? FontWeight.w500 : FontWeight.w400,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Background process",
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(
                    right: 20,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Start",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
