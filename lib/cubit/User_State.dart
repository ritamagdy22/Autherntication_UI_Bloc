 class UserState {}

final class UserInitial extends UserState {}

final class UserSignInLoading extends UserState {}


final class UserSignInSucess extends UserState {}


final class UserSignInFailur extends UserState {}final class UserSignInFailed extends UserState {
  
   String ErrorMEssage ; 

UserSignInFailed({required this.ErrorMEssage});

}