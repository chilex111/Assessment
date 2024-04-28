/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

LatestBlockModel latestBlockModelFromJson(String str) => LatestBlockModel.fromJson(json.decode(str));

String latestBlockModelToJson(LatestBlockModel data) => json.encode(data.toJson());

class LatestBlockModel {
    LatestBlockModel({
        required this.txIndexes,
        required this.blockIndex,
        required this.time,
        required this.hash,
        required this.height,
    });

    List<int> txIndexes;
    int blockIndex;
    int time;
    String hash;
    int height;

    factory LatestBlockModel.fromJson(Map<dynamic, dynamic> json) => LatestBlockModel(
        txIndexes: List<int>.from(json["txIndexes"].map((x) => x)),
        blockIndex: json["block_index"],
        time: json["time"],
        hash: json["hash"],
        height: json["height"],
    );

    Map<dynamic, dynamic> toJson() => {
        "txIndexes": List<dynamic>.from(txIndexes.map((x) => x)),
        "block_index": blockIndex,
        "time": time,
        "hash": hash,
        "height": height,
    };
}
