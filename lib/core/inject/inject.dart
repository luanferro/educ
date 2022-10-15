import 'package:educ/layers/data/datasources/buscar_aluno_datasource.dart';
import 'package:educ/layers/data/datasources/buscar_notas_datasource.dart';
import 'package:educ/layers/data/datasources/buscar_usuario_datasource.dart';
import 'package:educ/layers/data/datasources/cadastro_aluno_datasource.dart';
import 'package:educ/layers/data/datasources/cadastro_usuario_datasource.dart';
import 'package:educ/layers/data/datasources/firebase/buscar_aluno_datasource_imp.dart';
import 'package:educ/layers/data/datasources/firebase/buscar_notas_datasource_imp.dart';
import 'package:educ/layers/data/datasources/firebase/buscar_usuario_datasource_imp.dart';
import 'package:educ/layers/data/datasources/firebase/cadastro_aluno_datasource_imp.dart';
import 'package:educ/layers/data/datasources/firebase/cadastro_usuario_datasource_imp.dart';
import 'package:educ/layers/data/datasources/firebase/login_datasource_imp.dart';
import 'package:educ/layers/data/datasources/login_datasource.dart';
import 'package:educ/layers/data/repositories/aluno_repository_imp.dart';
import 'package:educ/layers/data/repositories/nota_repository_imp.dart';
import 'package:educ/layers/data/repositories/usuario_repository_imp.dart';
import 'package:educ/layers/domain/repositories/aluno_repository.dart';
import 'package:educ/layers/domain/repositories/nota_repository.dart';
import 'package:educ/layers/domain/repositories/usuario_repository.dart';
import 'package:educ/layers/domain/usecases/buscar_aluno/buscar_aluno_usecase.dart';
import 'package:educ/layers/domain/usecases/buscar_aluno/buscar_aluno_usecase_imp.dart';
import 'package:educ/layers/domain/usecases/buscar_notas/buscar_notas_usecase.dart';
import 'package:educ/layers/domain/usecases/buscar_notas/buscar_notas_usecase_imp.dart';
import 'package:educ/layers/domain/usecases/buscar_usuario/buscar_usuario_usecase.dart';
import 'package:educ/layers/domain/usecases/buscar_usuario/buscar_usuario_usecase_imp.dart';
import 'package:educ/layers/domain/usecases/cadastrar_aluno/cadastrar_aluno_usecase.dart';
import 'package:educ/layers/domain/usecases/cadastrar_aluno/cadastrar_aluno_usecase_imp.dart';
import 'package:educ/layers/domain/usecases/cadastrar_usuario/cadastrar_usuario_usecase.dart';
import 'package:educ/layers/domain/usecases/cadastrar_usuario/cadastrar_usuario_usecase_imp.dart';
import 'package:educ/layers/domain/usecases/login/login_usecase.dart';
import 'package:educ/layers/domain/usecases/login/login_usecase_imp.dart';
import 'package:educ/layers/presentation/controllers/aluno_controller.dart';
import 'package:educ/layers/presentation/controllers/nota_controller.dart';
import 'package:educ/layers/presentation/controllers/usuario_controller.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //datasources
    getIt.registerLazySingleton<CadastroAlunoDataSource>(
        () => CadastroAlunoDataSourceImp());

    getIt.registerLazySingleton<CadastroUsuarioDataSource>(
        () => CadastroUsuarioDataSourceImp());

    getIt.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImp());

    getIt.registerLazySingleton<BuscarNotasDataSource>(
        () => BuscarNotasDataSourceImp());

    getIt.registerLazySingleton<BuscarUsuarioDataSource>(
        () => BuscarUsuarioDataSourceImp());

    getIt.registerLazySingleton<BuscarAlunoDataSource>(
        () => BuscarAlunoDataSourceImp());

    //repositories
    getIt.registerLazySingleton<UsuarioRepository>(
        () => UsuarioRepositoryImp(getIt(), getIt(), getIt()));

    getIt.registerLazySingleton<AlunoRepository>(
        () => AlunoRepositoryImp(getIt(), getIt()));

    getIt.registerLazySingleton<NotaRepository>(
        () => NotaRepositoryImp(getIt()));
    //usecases
    getIt.registerLazySingleton<CadastrarUsuarioUseCase>(
        () => CadastrarUsuarioUseCaseImp(getIt()));

    getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCaseImp(getIt()));

    getIt.registerLazySingleton<CadastrarAlunoUseCase>(
        () => CadastrarAlunoUseCaseImp(getIt(), getIt()));

    getIt.registerLazySingleton<BuscarAlunoUseCase>(
        () => BuscarAlunoUseCaseImp(getIt()));

    getIt.registerLazySingleton<BuscarNotasUseCase>(
        () => BuscarNotasUseCaseImp(getIt()));

    getIt.registerLazySingleton<BuscarUsuarioUseCase>(
        () => BuscarUsuarioUseCaseImp(getIt()));

    //controllers
    getIt.registerLazySingleton<UsuarioController>(
        () => UsuarioController(getIt(), getIt(), getIt()));

    getIt.registerLazySingleton<AlunoController>(
        () => AlunoController(getIt(), getIt(), getIt()));

    getIt.registerLazySingleton<NotaController>(() => NotaController(getIt()));
  }
}
