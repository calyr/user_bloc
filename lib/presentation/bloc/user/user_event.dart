class UserEvent {}

class FetchUserEvent extends UserEvent {
  final String username;

  FetchUserEvent(this.username);
}