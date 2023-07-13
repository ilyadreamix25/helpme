import 'package:helpme/core/objects/chat.dart';
import 'package:helpme/home/chats/data/chats_status.dart';

class ChatsState {
  final List<Chat> chats;
  final bool hasReachedMax;
  final ChatsStatus status;

  ChatsState({
    this.chats = const [],
    this.status = const InitialChatsStatus(),
    this.hasReachedMax = false,
  });

  ChatsState copyWith({
    List<Chat>? chats,
    ChatsStatus? status,
    bool? hasReachedMax,
  }) => ChatsState(
    chats: chats ?? this.chats,
    status: status ?? this.status,
    hasReachedMax: hasReachedMax ?? this.hasReachedMax,
  );
}
