import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/core/api/api_state.dart';
import 'package:helpme/core/utils/log_util.dart';
import 'package:helpme/home/chats/data/chats_event.dart';
import 'package:helpme/home/chats/data/chats_repository.dart';
import 'package:helpme/home/chats/data/chats_state.dart';
import 'package:helpme/home/chats/data/chats_status.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc() : super(ChatsState()) {
    on<FetchChats>((event, emit) => _onFetch(event, emit));
  }

  void _onFetch(FetchChats event, Emitter<ChatsState> emit) async {
    try {
      if (event.offset == 0) {
        emit(state.copyWith(
          status: const ChatsLoadingStatus(),
        ));
      } else {
        emit(state.copyWith(
          status: const ChatsReloadingStatus(),
        ));
      }

      final response = await ChatsRepository.getUserChats(offset: event.offset);

      if (response.isSuccessful) {
        if (response.data!.isEmpty) {
          emit(state.copyWith(
            status: const ChatsSuccessStatus(),
            hasReachedMax: true
          ));
        } else {
          emit(state.copyWith(
            status: const ChatsSuccessStatus(),
            chats: state.chats + response.data!,
          ));
        }
      } else {
        emit(state.copyWith(
          status: ChatsErrorStatus(
            response.state,
            response.code,
          ),
        ));
      }
    } catch (exception, stackTrace) {
      LogUtility.error(
        tag: 'ChatsBloc._onFetch',
        message: exception.toString(),
        stackTrace: stackTrace,
      );

      emit(
        state.copyWith(status: const ChatsErrorStatus(
          StateCode.unknownState,
          StateCode.unknown,
        ))
      );
    }
  }
}
