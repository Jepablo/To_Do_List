
abstract class RegisterEvent {}

class RegisterInitialEvent extends RegisterEvent{}

class SubmitRegisterEvent extends RegisterEvent{}

class RegisterNavigateEvent extends RegisterEvent {}

class RegisterToLoginEvent extends RegisterEvent {}