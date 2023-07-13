abstract class ChatsStatus {
  const ChatsStatus();
}

class InitialChatsStatus extends ChatsStatus {
  const InitialChatsStatus();
}

class ChatsLoadingStatus extends ChatsStatus {
  const ChatsLoadingStatus();
}

class ChatsReloadingStatus extends ChatsStatus {
  const ChatsReloadingStatus();
}

class ChatsSuccessStatus extends ChatsStatus {
  const ChatsSuccessStatus();
}

class ChatsErrorStatus extends ChatsStatus {
  final String state;
  final int code;

  const ChatsErrorStatus(this.state, this.code);
}
