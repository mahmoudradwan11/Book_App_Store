abstract class BookStoreStates{}
class InitState extends BookStoreStates{}
class GetUserSuccessState extends BookStoreStates{}
class GetUserErrorState extends BookStoreStates{
  final String error;
  GetUserErrorState(this.error);
}
class CreateDataBaseState extends BookStoreStates {}
class ErrorCreateDataBaseState extends BookStoreStates{}
class InsertCartState extends BookStoreStates{}
class ErrorInsertCartState extends BookStoreStates{}
class GetCartState extends BookStoreStates{}
class ErrorGetCartState extends BookStoreStates{}
class DeleteCartState extends BookStoreStates{}
class ChangeScreen extends BookStoreStates{}
class CreateMangaBookLoadingState extends BookStoreStates{}
class CreateMangaBookState extends BookStoreStates{}
class CreateMangaBookErrorState extends BookStoreStates{}
class GetMangaBookLoadingState extends BookStoreStates{}
class GetMangaBookState extends BookStoreStates{}
class GetMangaBookErrorState extends BookStoreStates{}
class CreateHorrorBookLoadingState extends BookStoreStates{}
class CreateHorrorBookState extends BookStoreStates{}
class CreateHorrorBookErrorState extends BookStoreStates{}
class GetHorrorBookLoadingState extends BookStoreStates{}
class GetHorrorBookState extends BookStoreStates{}
class GetHorrorBookErrorState extends BookStoreStates{}
class CreateProgrammingBookLoadingState extends BookStoreStates{}
class CreateProgrammingBookState extends BookStoreStates{}
class CreateProgrammingBookErrorState extends BookStoreStates{}
class GetProgrammingLoadingState extends BookStoreStates{}
class GetProgrammingBookState extends BookStoreStates{}
class GetProgrammingBookErrorState extends BookStoreStates{}
class CreateHealthBookLoadingState extends BookStoreStates{}
class CreateHealthBookState extends BookStoreStates{}
class CreateHealthBookErrorState extends BookStoreStates{}
class GetHealthBookLoadingState extends BookStoreStates{}
class GetHealthBookState extends BookStoreStates{}
class GetHealthBookErrorState extends BookStoreStates{}
class CreateScienceBookLoadingState extends BookStoreStates{}
class CreateScienceBookState extends BookStoreStates{}
class CreateScienceBookErrorState extends BookStoreStates{}
class GetScienceBookLoadingState extends BookStoreStates{}
class GetScienceBookState extends BookStoreStates{}
class GetScienceBookErrorState extends BookStoreStates{}
class CreateSportsBookLoadingState extends BookStoreStates{}
class CreateSportsBookState extends BookStoreStates{}
class CreateSportsBookErrorState extends BookStoreStates{}
class GetSportsBookLoadingState extends BookStoreStates{}
class GetSportsBookState extends BookStoreStates{}
class GetSportsBookErrorState extends BookStoreStates{}