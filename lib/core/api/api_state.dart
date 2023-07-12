enum StateCode {
  ok,
  internalServerError,
  invalidRequest,
  contentNotFound,
  invalidMethod,
  serviceUnavailable,
  userAlreadyExists,
  userDoesNotExist,
  unauthorized,
  invalidCredentials,
  tooManyRequests,
  tooYoung,
  nicknameUnavailable,
  invalidIdToken,
  emailIsNotVerified,
  youAreBanned,
  noRights,
  invalidAction,
  youCannotPunishYourself,
  youHaveAlreadyJoinedThisChat,
  youAreBannedInThisChat,
  thisChatIsDisabled,
  youWasNotInvitedToThisChat,
  userHasAlreadyJoinedThisChat,
  userWasAlreadyInvited,
  youCannotEditThisChat,
  unbanUserToInvite,
  connectionDoesNotExist,
  youHaveNotJoinedThisChat;

  static const int unknown = -1;
  static const String unknownState = 'UnknownState';
}
