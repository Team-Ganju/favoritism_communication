import 'package:get/get.dart';

import '../components/pages/chat/bindings/chat_binding.dart';
import '../components/pages/chat/views/chat_view.dart';
import '../components/pages/create_chat_group/bindings/create_chat_group_binding.dart';
import '../components/pages/create_chat_group/views/create_chat_group_view.dart';
import '../components/pages/dashboard/bindings/dashboard_binding.dart';
import '../components/pages/dashboard/views/dashboard_view.dart';
import '../components/pages/home/bindings/home_binding.dart';
import '../components/pages/home/views/home_view.dart';
import '../components/pages/mypage/bindings/mypage_binding.dart';
import '../components/pages/mypage/views/mypage_view.dart';
import '../components/pages/profile/bindings/profile_binding.dart';
import '../components/pages/profile/views/profile_view.dart';
import '../components/pages/search/bindings/search_binding.dart';
import '../components/pages/search/views/search_view.dart';
import '../components/pages/search_filter/bindings/search_filter_binding.dart';
import '../components/pages/search_filter/views/search_filter_view.dart';
import '../components/pages/chat_room/bindings/chat_room_binding.dart';
import '../components/pages/chat_room/views/chat_room_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.dashboard;

  static final routes = [
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.chat,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.mypage,
      page: () => const MypageView(),
      binding: MypageBinding(),
    ),
    GetPage(
      name: _Paths.createChatGroup,
      page: () => const CreateChatGroupView(),
      binding: CreateChatGroupBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.chatRoom,
      page: () => const ChatRoomView(),
      binding: ChatRoomBinding(),
    ),
    GetPage(
      name: _Paths.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.searchFilter,
      page: () => const SearchFilterView(),
      binding: SearchFilterBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.searchFilter,
      page: () => const SearchFilterView(),
      binding: SearchFilterBinding(),
      fullscreenDialog: true,
    ),
  ];
}
