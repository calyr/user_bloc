import 'package:user_app/data/data_provider/data_provider.dart';
import 'package:user_app/domain/user.dart';

class UserRepository {
  DataProvider dataProvider;

  UserRepository({required this.dataProvider});

  Future<User> fetchUser(String username) async {
    try {
      return await dataProvider.fetchUser(username);
    } catch (err) {
      throw Exception('Failed to fetch user data: $err');
    }
    
  }
}