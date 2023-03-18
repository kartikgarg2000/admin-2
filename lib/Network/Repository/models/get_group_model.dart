// To parse this JSON data, do
//
//     final getGroupModel = getGroupModelFromJson(jsonString);

import 'dart:convert';

GetGroupModel getGroupModelFromJson(String str) => GetGroupModel.fromJson(json.decode(str));

String getGroupModelToJson(GetGroupModel data) => json.encode(data.toJson());

class GetGroupModel {
    GetGroupModel({
        required this.success,
        required this.code,
        required this.data,
        required this.meta,
    });

    bool success;
    int code;
    List<Datum> data;
    Meta meta;

    factory GetGroupModel.fromJson(Map<String, dynamic> json) => GetGroupModel(
        success: json["success"],
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.name,
        required this.status,
        required this.about,
        required this.avatarUrl,
        required this.bannerUrl,
        this.usersCount,
        required this.allowMembershipRequest,
        required this.isPaid,
        required this.groupTypeId,
        required this.groupSubtypeId,
        required this.moderatorId,
        required this.userRoleType,
        required this.groupRules,
        required this.trialPeriod,
        required this.createdBy,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String name;
    int status;
    String about;
    String avatarUrl;
    String bannerUrl;
    dynamic usersCount;
    bool allowMembershipRequest;
    bool isPaid;
    int groupTypeId;
    int groupSubtypeId;
    int moderatorId;
    List<int> userRoleType;
    List<int> groupRules;
    int trialPeriod;
    String createdBy;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        about: json["about"],
        avatarUrl: json["avatarUrl"],
        bannerUrl: json["bannerUrl"],
        usersCount: json["usersCount"],
        allowMembershipRequest: json["allowMembershipRequest"],
        isPaid: json["isPaid"],
        groupTypeId: json["groupTypeId"],
        groupSubtypeId: json["groupSubtypeId"],
        moderatorId: json["moderatorId"],
        userRoleType: List<int>.from(json["userRoleType"].map((x) => x)),
        groupRules: List<int>.from(json["groupRules"].map((x) => x)),
        trialPeriod: json["trialPeriod"],
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "about": about,
        "avatarUrl": avatarUrl,
        "bannerUrl": bannerUrl,
        "usersCount": usersCount,
        "allowMembershipRequest": allowMembershipRequest,
        "isPaid": isPaid,
        "groupTypeId": groupTypeId,
        "groupSubtypeId": groupSubtypeId,
        "moderatorId": moderatorId,
        "userRoleType": List<dynamic>.from(userRoleType.map((x) => x)),
        "groupRules": List<dynamic>.from(groupRules.map((x) => x)),
        "trialPeriod": trialPeriod,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class Meta {
    Meta({
        required this.pagination,
    });

    Pagination pagination;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
    };
}

class Pagination {
    Pagination({
        required this.currentPage,
        required this.totalPages,
        required this.perPage,
        required this.total,
    });

    int currentPage;
    int totalPages;
    int perPage;
    int total;

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        perPage: json["perPage"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "totalPages": totalPages,
        "perPage": perPage,
        "total": total,
    };
}
