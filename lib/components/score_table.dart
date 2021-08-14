import 'package:amikoj/constants/constants.dart';
import 'package:amikoj/models/user_module.dart';
import 'package:amikoj/redux/app_state.dart';
import 'package:amikoj/redux/room_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_redux/flutter_redux.dart';

class ScoreTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RoomState>(
        converter: (store) => store.state.roomState,
        builder: (context, state) {
          List<UserModule> winners = getWinners(state);
          UserModule winner = winners[0];
          return Column(
            children: [
              getWinner(winner),
              Table(
                border: TableBorder.all(
                    color: Colors.white, width: 1, style: BorderStyle.solid),
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Center(
                        child: Text(
                          "asaasasas",
                          style: whiteText,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          "asaasasas",
                          style: whiteText,
                        ),
                      ),
                    ),
                  ])
                ],
              )
            ],
          );
        });
  }

  Widget getWinner(UserModule winner) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Winner is",
            style: whiteText,
          ),
        ),
        Center(
          child: ClipOval(
            child: CachedNetworkImage(
              key: Key(winner.avatarUrl),
              width: 44,
              height: 44,
              fit: BoxFit.cover,
              imageUrl: winner.avatarUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => CircularProgressIndicator(),
            ),
          ),
        ),
        Center(
          child: Text(
            winner.name,
            style: whiteText,
          ),
        ),
      ],
    );
  }

  List<UserModule> getWinners(RoomState roomState) {
    List<UserModule> players = List<UserModule>.from(roomState.players);
    players.sort((a, b) => b.score - a.score);
    return players;
  }
}
