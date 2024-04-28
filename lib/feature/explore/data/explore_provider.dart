import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'explore_repository.dart';
import 'model/block_transaction_model.dart';

part 'explore_provider.g.dart';
class ExploreState{
  final List<Tx> transactions;
  const ExploreState({this.transactions = const[]});

  ExploreState copyWith({List<Tx>? transactions}){
    return ExploreState(
      transactions: transactions??this.transactions,
    );
  }
}


@Riverpod(keepAlive: true)
class Explore extends _$Explore{

  @override
  Future<ExploreState> build() async {
    return _init();
  }

  Future<ExploreState> _init() async {
    final blockData = await ExploreRepository().fetchLatestBlock();
    final blockHash = ExploreRepository().getBlockHash(blockData);
    final transactions = await ExploreRepository().fetchBlockTransactions(blockHash);

    return ExploreState(
        transactions: transactions
    );
  }

}