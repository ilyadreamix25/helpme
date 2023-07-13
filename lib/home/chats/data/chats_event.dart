abstract class ChatsEvent {
  const ChatsEvent();
}

class FetchChats extends ChatsEvent {
  final int offset;

  const FetchChats([this.offset = 0]);
}
