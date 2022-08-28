abstract class AdminCubitStates {}

class InitialAdminState extends AdminCubitStates {}
class AddSessionSuccessState extends AdminCubitStates {}

class AddSessionLoadingState extends AdminCubitStates {}

class AddSessionErrorState extends AdminCubitStates {}
class DeleteSessionSuccessState extends AdminCubitStates {}

class DeleteSessionLoadingState extends AdminCubitStates {}

class DeleteSessionErrorState extends AdminCubitStates {}
class AdminGetSessionsLoadingState extends AdminCubitStates {}
class AdminGetSessionsSuccessState extends AdminCubitStates {}
class AdminGetSessionsErrorState extends AdminCubitStates {}


class GetFeedbacksLoadingState extends AdminCubitStates {}
class GetFeedbacksSuccessState extends AdminCubitStates {}
class GetFeedbacksErrorState extends AdminCubitStates {}
class AdminLogOutLoadingState extends AdminCubitStates {}
class AdminLogOutSuccessState extends AdminCubitStates {}
class AdminLogOutErrorState extends AdminCubitStates {}
class UpdateSessionLoadingState extends AdminCubitStates {}
class UpdateSessionSuccessState extends AdminCubitStates {}
class UpdateSessionErrorState extends AdminCubitStates {}
class ChangeBottomSheetState extends AdminCubitStates {}