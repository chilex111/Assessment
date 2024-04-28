/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

BlockTransactionModel blockTransactionModelFromJson(String str) => BlockTransactionModel.fromJson(json.decode(str));

String blockTransactionModelToJson(BlockTransactionModel data) => json.encode(data.toJson());

class BlockTransactionModel {
    BlockTransactionModel({
        required this.ver,
        required this.nextBlock,
        required this.prevBlock,
        required this.mrklRoot,
        required this.tx,
        required this.nTx,
        required this.fee,
        required this.mainChain,
        required this.bits,
        required this.weight,
        required this.nonce,
        required this.size,
        required this.blockIndex,
        required this.time,
        required this.hash,
        required this.height,
    });

    int ver;
    List<String> nextBlock;
    String prevBlock;
    String mrklRoot;
    List<Tx> tx;
    int nTx;
    int fee;
    bool mainChain;
    int bits;
    int weight;
    int nonce;
    int size;
    int blockIndex;
    int time;
    String hash;
    int height;

    factory BlockTransactionModel.fromJson(Map<dynamic, dynamic> json) => BlockTransactionModel(
        ver: json["ver"],
        nextBlock: List<String>.from(json["next_block"].map((x) => x)),
        prevBlock: json["prev_block"],
        mrklRoot: json["mrkl_root"],
        tx: List<Tx>.from(json["tx"].map((x) => Tx.fromJson(x))),
        nTx: json["n_tx"],
        fee: json["fee"],
        mainChain: json["main_chain"],
        bits: json["bits"],
        weight: json["weight"],
        nonce: json["nonce"],
        size: json["size"],
        blockIndex: json["block_index"],
        time: json["time"],
        hash: json["hash"],
        height: json["height"],
    );

    Map<dynamic, dynamic> toJson() => {
        "ver": ver,
        "next_block": List<dynamic>.from(nextBlock.map((x) => x)),
        "prev_block": prevBlock,
        "mrkl_root": mrklRoot,
        "tx": List<dynamic>.from(tx.map((x) => x.toJson())),
        "n_tx": nTx,
        "fee": fee,
        "main_chain": mainChain,
        "bits": bits,
        "weight": weight,
        "nonce": nonce,
        "size": size,
        "block_index": blockIndex,
        "time": time,
        "hash": hash,
        "height": height,
    };
}

class Tx {
    Tx({
        required this.ver,
        required this.inputs,
        required this.fee,
        required this.weight,
        required this.blockHeight,
        required this.relayedBy,
        required this.out,
        required this.lockTime,
        required this.size,
        required this.doubleSpend,
        required this.blockIndex,
        required this.time,
        required this.txIndex,
        required this.vinSz,
        required this.hash,
        required this.voutSz,
    });

    int ver;
    List<Input> inputs;
    int fee;
    int weight;
    int blockHeight;
    RelayedBy relayedBy;
    List<Out> out;
    int lockTime;
    int size;
    bool doubleSpend;
    int blockIndex;
    int time;
    int txIndex;
    int vinSz;
    String hash;
    int voutSz;

    factory Tx.fromJson(Map<dynamic, dynamic> json) => Tx(
        ver: json["ver"],
        inputs: List<Input>.from(json["inputs"].map((x) => Input.fromJson(x))),
        fee: json["fee"],
        weight: json["weight"],
        blockHeight: json["block_height"],
        relayedBy: relayedByValues.map[json["relayed_by"]]!,
        out: List<Out>.from(json["out"].map((x) => Out.fromJson(x))),
        lockTime: json["lock_time"],
        size: json["size"],
        doubleSpend: json["double_spend"],
        blockIndex: json["block_index"],
        time: json["time"],
        txIndex: json["tx_index"],
        vinSz: json["vin_sz"],
        hash: json["hash"],
        voutSz: json["vout_sz"],
    );

    Map<dynamic, dynamic> toJson() => {
        "ver": ver,
        "inputs": List<dynamic>.from(inputs.map((x) => x.toJson())),
        "fee": fee,
        "weight": weight,
        "block_height": blockHeight,
        "relayed_by": relayedByValues.reverse[relayedBy],
        "out": List<dynamic>.from(out.map((x) => x.toJson())),
        "lock_time": lockTime,
        "size": size,
        "double_spend": doubleSpend,
        "block_index": blockIndex,
        "time": time,
        "tx_index": txIndex,
        "vin_sz": vinSz,
        "hash": hash,
        "vout_sz": voutSz,
    };
}

class Input {
    Input({
        required this.sequence,
        required this.witness,
        required this.index,
        required this.prevOut,
        required this.script,
    });

    int sequence;
    String witness;
    int index;
    Out prevOut;
    String script;

    factory Input.fromJson(Map<dynamic, dynamic> json) => Input(
        sequence: json["sequence"],
        witness: json["witness"],
        index: json["index"],
        prevOut: Out.fromJson(json["prev_out"]),
        script: json["script"],
    );

    Map<dynamic, dynamic> toJson() => {
        "sequence": sequence,
        "witness": witness,
        "index": index,
        "prev_out": prevOut.toJson(),
        "script": script,
    };
}

class Out {
    Out({
        required this.spent,
        required this.spendingOutpoints,
        required this.type,
        required this.txIndex,
        required this.value,
        required this.n,
        required this.script,
        this.addr,
    });

    bool spent;
    List<SpendingOutpoint> spendingOutpoints;
    int type;
    int txIndex;
    int value;
    int n;
    String script;
    String? addr;

    factory Out.fromJson(Map<dynamic, dynamic> json) => Out(
        spent: json["spent"],
        spendingOutpoints: List<SpendingOutpoint>.from(json["spending_outpoints"].map((x) => SpendingOutpoint.fromJson(x))),
        type: json["type"],
        txIndex: json["tx_index"],
        value: json["value"],
        n: json["n"],
        script: json["script"],
        addr: json["addr"],
    );

    Map<dynamic, dynamic> toJson() => {
        "spent": spent,
        "spending_outpoints": List<dynamic>.from(spendingOutpoints.map((x) => x.toJson())),
        "type": type,
        "tx_index": txIndex,
        "value": value,
        "n": n,
        "script": script,
        "addr": addr,
    };
}

class SpendingOutpoint {
    SpendingOutpoint({
        required this.txIndex,
        required this.n,
    });

    int txIndex;
    int n;

    factory SpendingOutpoint.fromJson(Map<dynamic, dynamic> json) => SpendingOutpoint(
        txIndex: json["tx_index"],
        n: json["n"],
    );

    Map<dynamic, dynamic> toJson() => {
        "tx_index": txIndex,
        "n": n,
    };
}

enum RelayedBy { THE_0000 }

final relayedByValues = EnumValues({
    "0.0.0.0": RelayedBy.THE_0000
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
