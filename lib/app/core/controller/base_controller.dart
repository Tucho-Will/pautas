abstract class BaseController {
  Future executeAction(
      Function callBack, Function changeLoading, Function changeError) async {
    try {
      changeLoading(true);
      await callBack();
      changeError(false);
      changeLoading(false);
    } catch (e) {
      changeLoading(false);
      changeError(true);
    }
  }
}
