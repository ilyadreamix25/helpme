import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/home/chats/data/chats_bloc.dart';
import 'package:helpme/home/chats/data/chats_event.dart';
import 'package:helpme/home/chats/data/chats_state.dart';
import 'package:helpme/home/chats/data/chats_status.dart';

class HomeChatsContent extends StatefulWidget {
  const HomeChatsContent({super.key});

  @override
  State<StatefulWidget> createState() => _HomeChatsContentState();
}

class _HomeChatsContentState extends State<HomeChatsContent> {
  late ScrollController _scrollController;
  late ChatsBloc _bloc;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    _bloc = ChatsBloc();
    _bloc.add(const FetchChats());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatsBloc>.value(
      value: _bloc,
      child: BlocBuilder<ChatsBloc, ChatsState>(
        builder: (context, state) {
          if (state.status is InitialChatsStatus
            || state.status is ChatsLoadingStatus) {
            return const Center(child: CircularProgressIndicator(color: Colors.black));
          } else if (state.status is ChatsSuccessStatus || state.status is ChatsReloadingStatus) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.chats.length + (state.hasReachedMax ? 0 : 1),
              itemBuilder: (context, index) {
                if (index < state.chats.length) {
                  final chat = state.chats[index];
                  return ListTile(
                    title: Text(
                      '${chat.title} - ${chat.id}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator(color: Colors.black)),
                  );
                }
              },
              controller: _scrollController,
            );
          } else if (state.status is ChatsErrorStatus) {
            final error = state.status as ChatsErrorStatus;
            return Center(child: Text('Error... ${error.state}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      final currentState = _bloc.state;
      int offset = 0;

      if (currentState.status is ChatsSuccessStatus) {
        offset = currentState.chats.length;
      }

      _bloc.add(FetchChats(offset));
    }
  }

  bool get _isBottom {
    return _scrollController.offset >= _scrollController.position.maxScrollExtent &&
      _bloc.state.status is! ChatsLoadingStatus &&
      _bloc.state.status is! ChatsReloadingStatus &&
      !_bloc.state.hasReachedMax;
  }
}
