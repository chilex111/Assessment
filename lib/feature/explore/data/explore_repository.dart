import 'package:assesment_project/feature/explore/data/model/block_transaction_model.dart';

import '../../../network/api_constants.dart';
import '../../../network/client/dio.dart';
import '../../../network/network_response.dart';
import 'model/latest_block_model.dart';

class ExploreRepository{
  Future<List<Tx>> fetchBlockTransactions(String blockHash) async {
    final response  = await Api().apiCall(
      requestType: RequestType.get,
      url: "${ApiConstants.blockTransaction}$blockHash",
    );
    if (response is NetworkSuccess) {
      return BlockTransactionModel.fromJson(response.data).tx;

     // return response.data['tx'] as List<dynamic>;
    }
    throw Exception('Failed to fetch block transactions');
  }

  String getBlockHash(LatestBlockModel blockData) {
    return blockData.hash/*['hash'] as String*/;
  }


  Future<LatestBlockModel> fetchLatestBlock() async {
    final response  = await Api().apiCall(
      requestType: RequestType.get,
      url: ApiConstants.latestBlock,
    );

    if (response is NetworkSuccess) {
      return LatestBlockModel.fromJson(response.data);
    } else {
      // Handle error (e.g., throw an exception or print an error message)
      throw Exception('Failed to fetch latest block data');
    }
  }

}