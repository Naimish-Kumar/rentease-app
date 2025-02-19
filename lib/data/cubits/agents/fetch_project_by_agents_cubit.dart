import 'package:rentease/data/model/project_model.dart';
import 'package:rentease/data/repositories/project_repository.dart';
import 'package:rentease/exports/main_export.dart';

class FetchProjectByAgentCubit extends Cubit<FetchProjectByAgentState> {
  FetchProjectByAgentCubit() : super(FetchProjectByAgentInitial());

  ProjectRepository projectRepository = ProjectRepository();

  Future<void> fetchProjectByAgent({
    required int projectId,
  }) async {
    try {
      emit(FetchProjectByAgentInProgress());

      emit(
        FetchProjectByAgentSuccess(
          project: (await projectRepository.fetchProjectFromProjectId(
            projectId,
          ))
              .modelList
              .first,
        ),
      );
    } catch (e) {
      emit(FetchProjectByAgentFailure(e.toString()));
    }
  }
}

sealed class FetchProjectByAgentState {}

final class FetchProjectByAgentInitial extends FetchProjectByAgentState {}

final class FetchProjectByAgentInProgress extends FetchProjectByAgentState {}

final class FetchProjectByAgentSuccess extends FetchProjectByAgentState {
  FetchProjectByAgentSuccess({
    required this.project,
  });
  ProjectModel project;
}

final class FetchProjectByAgentFailure extends FetchProjectByAgentState {
  FetchProjectByAgentFailure(this.error);
  final String error;
}
