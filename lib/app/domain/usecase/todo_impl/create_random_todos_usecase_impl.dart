import 'package:todo_list/app/domain/repository/todo_repository.dart';
import 'package:todo_list/app/domain/usecase/todo/create_random_todos_usecase.dart';

class CreateRandomTodosUsecaseImpl implements CreateRandomTodosUsecase {
  final TodoRepository _todoRepository;

  CreateRandomTodosUsecaseImpl({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  @override
  Future<void> call(String noParams) async {
    await _todoRepository.createRandomTodos(rawQuery);
  }

  String rawQuery =
      """INSERT INTO todos (title, description, isCompleted) VALUES ('Clean garage', 'Remove old boxes and organize tools', 0),
 ('Buy groceries', 'Milk, eggs, bread, and vegetables', 1),
 ('Update resume', 'Add recent projects and skills', 0),
 ('Schedule dentist', 'Annual checkup and cleaning', 1),
 ('Fix bike', 'Replace chain and check brakes', 0),
 ('Plan vacation', 'Research destinations and book flights', 1),
 ('Learn Flutter', 'Complete online course modules', 0),
 ('Paint bedroom', 'Choose colors and buy supplies', 1),
 ('Call mom', 'Catch up on family news', 0),
 ('Pay bills', 'Electric, water, and internet', 1),
 ('Write blog post', 'Draft article about mobile development', 0),
 ('Backup files', 'Save important documents to cloud', 1),
 ('Exercise', 'Go for a 30-minute run', 0),
 ('Read book', 'Finish chapter 5 of new novel', 1),
 ('Water plants', 'Check soil moisture and fertilize', 0),
 ('Fix leaky faucet', 'Replace washer and check pipes', 1),
 ('Update software', 'Install latest security patches', 0),
 ('Clean car', 'Wash exterior and vacuum interior', 1),
 ('Organize photos', 'Sort digital albums by date', 0),
 ('Buy birthday gift', 'Find present for sister', 1),
 ('Schedule meeting', 'Team sync for project review', 0),
 ('Fix printer', 'Troubleshoot connection issues', 1),
 ('Learn SQL', 'Practice database queries', 0),
 ('Meal prep', 'Plan and cook weekly meals', 1),
 ('Clean windows', 'Wash inside and outside', 0),
 ('Update portfolio', 'Add recent work samples', 1),
 ('Fix wifi', 'Reset router and check settings', 0),
 ('Buy shoes', 'Get new running sneakers', 1),
 ('Learn guitar', 'Practice basic chords', 0),
 ('Organize closet', 'Sort clothes and donate unused items', 1),
 ('Setup backup', 'Configure automated backups', 0),
 ('Write report', 'Complete quarterly analysis', 1),
 ('Fix doorbell', 'Replace battery and test', 0),
 ('Study math', 'Review calculus problems', 1),
 ('Clean keyboard', 'Remove dust and sanitize', 0),
 ('Update LinkedIn', 'Refresh profile information', 1),
 ('Fix lamp', 'Replace bulb and check wiring', 0),
 ('Learn Python', 'Complete beginner tutorials', 1),
 ('Organize desk', 'Clean workspace and file papers', 0),
 ('Buy monitor', 'Research and purchase new display', 1),
 ('Learn React', 'Build sample project', 0),
 ('Clean bathroom', 'Deep clean and disinfect', 1),
 ('Setup printer', 'Install drivers and configure', 0),
 ('Write email', 'Send project update to team', 1),
 ('Fix headphones', 'Check connection and audio', 0),
 ('Learn Docker', 'Setup basic containers', 1),
 ('Organize garage', 'Sort tools and equipment', 0),
 ('Buy laptop', 'Compare models and features', 1),
 ('Learn Git', 'Practice version control basics', 0),
 ('Clean kitchen', 'Wipe surfaces and mop floor', 1);""";
}
