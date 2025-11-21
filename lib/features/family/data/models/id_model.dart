import 'package:equatable/equatable.dart';
import 'package:talker_flutter/talker_flutter.dart';

class SearchUserData extends Equatable {
  const SearchUserData({required this.id});

  final String id;

  @override
  List<Object?> get props => [id];
}

abstract class SearchUser {
  Future<void> search();
}

class SearchUserWithId implements SearchUser {
  const SearchUserWithId({required this.searchUserData, required this.talker});

  final SearchUserData searchUserData;
  final Talker talker;

  @override
  Future<void> search() async {
    try {
      talker.info('Searching user with id: ${searchUserData.id}');
      //TODO: search user api
      talker.log('User found successfully');
    } catch (e, st) {
      talker.error('Failed to search user', e, st);
      rethrow;
    }
  }
}
