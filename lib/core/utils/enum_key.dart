import 'package:json_annotation/json_annotation.dart';

enum BreakPoint { mobile, tablet, desktop }

enum DrawerDisplay { close, icon, full }

enum ViewState { initial, loading, loaded, error }

enum ActionState { create, edit, view }

enum SupportedMediaType { image, video, audio, svg, other }

enum CalendarMenuType { date, time, dateTime }

enum GeneralListDataView { loading, table, grid, kanban, calendar, pivot, tree }

enum TableDataSource { dynamicMenu, lookUp }

enum RequestType { restfull }

enum RestfulMethod { get, post, put, download }

enum PermissionMethod {
  @JsonValue("approval")
  approval,

  @JsonValue("disapprove")
  disapprove
}

enum BehaviourType {
  @JsonValue("range")
  range,

  @JsonValue("regular")
  regular
}

enum SortBy {
  @JsonValue("ASCENDING")
  ascending,

  @JsonValue("DESCENDING")
  descending
}

enum NotificationStatus {
  @JsonValue("SENT")
  sent,

  @JsonValue("READ")
  read,

  @JsonValue("CLEAR")
  clear,

  @JsonValue("DELETED")
  deleted
}

enum DashboardChart {
  @JsonValue("LINE_CHART")
  line,

  @JsonValue("BAR_CHART")
  bar,

  @JsonValue("KPI")
  kpi,

  @JsonValue("TABLE")
  table,

  @JsonValue("PIVOT")
  pivot
}

enum NotifType {
  @JsonValue("change password")
  changePassword,

  @JsonValue(null)
  empty
}

enum CalendarDateState { normal, selected, today }

enum ExportExcelType { table, bar, line }

enum RoomChat {
  createPersonalChat,
  createGroupChat,
  @JsonValue("PERSONAL")
  personalChat,
  @JsonValue("GROUP")
  groupChat,
  close
}

enum UserChatStatus {
  @JsonValue("JOINED")
  joined,

  @JsonValue("REJECTED")
  rejected,
}
