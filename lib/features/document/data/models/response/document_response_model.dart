import 'package:meta/meta.dart';
import 'dart:convert';

class DocumentResponseModel {
  final int currentPage;
  final List<Datum> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String nextPageUrl;
  final String path;
  final int perPage;
  final dynamic prevPageUrl;
  final int to;
  final int total;

  DocumentResponseModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory DocumentResponseModel.fromJson(String str) =>
      DocumentResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DocumentResponseModel.fromMap(Map<String, dynamic> json) =>
      DocumentResponseModel(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toMap())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  final int id;
  final String uuid;
  final String clientId;
  final String documentId;
  final String documentType;
  final String title;
  final String assignTo;
  final String documentUrl;
  final dynamic documentStatus;
  final dynamic signImage;
  final int customImage;
  final dynamic customImageText;
  final String signWidth;
  final String signHeight;
  final String signType;
  final dynamic signSymbol;
  final String signCategory;
  final String signReason;
  final String signLocation;
  final String signedFile;
  final String signStatus;
  final String description;
  final String continueBy;
  final String continueTo;
  final int continueStatus;
  final DateTime continueExpired;
  final int mayDelete;
  final String createdAt;
  final DateTime updatedAt;
  final String lastCreated;
  final String timeCreated;
  final Client client;

  Datum({
    required this.id,
    required this.uuid,
    required this.clientId,
    required this.documentId,
    required this.documentType,
    required this.title,
    required this.assignTo,
    required this.documentUrl,
    required this.documentStatus,
    required this.signImage,
    required this.customImage,
    required this.customImageText,
    required this.signWidth,
    required this.signHeight,
    required this.signType,
    required this.signSymbol,
    required this.signCategory,
    required this.signReason,
    required this.signLocation,
    required this.signedFile,
    required this.signStatus,
    required this.description,
    required this.continueBy,
    required this.continueTo,
    required this.continueStatus,
    required this.continueExpired,
    required this.mayDelete,
    required this.createdAt,
    required this.updatedAt,
    required this.lastCreated,
    required this.timeCreated,
    required this.client,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        uuid: json["uuid"],
        clientId: json["client_id"],
        documentId: json["document_id"],
        documentType: json["document_type"],
        title: json["title"],
        assignTo: json["assign_to"],
        documentUrl: json["document_url"],
        documentStatus: json["document_status"],
        signImage: json["sign_image"],
        customImage: json["custom_image"],
        customImageText: json["custom_image_text"],
        signWidth: json["sign_width"],
        signHeight: json["sign_height"],
        signType: json["sign_type"],
        signSymbol: json["sign_symbol"],
        signCategory: json["sign_category"],
        signReason: json["sign_reason"],
        signLocation: json["sign_location"],
        signedFile: json["signed_file"],
        signStatus: json["sign_status"],
        description: json["description"],
        continueBy: json["continue_by"],
        continueTo: json["continue_to"],
        continueStatus: json["continue_status"],
        continueExpired: DateTime.parse(json["continue_expired"]),
        mayDelete: json["may_delete"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        lastCreated: json["last_created"],
        timeCreated: json["time_created"],
        client: Client.fromMap(json["client"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "uuid": uuid,
        "client_id": clientId,
        "document_id": documentId,
        "document_type": documentType,
        "title": title,
        "assign_to": assignTo,
        "document_url": documentUrl,
        "document_status": documentStatus,
        "sign_image": signImage,
        "custom_image": customImage,
        "custom_image_text": customImageText,
        "sign_width": signWidth,
        "sign_height": signHeight,
        "sign_type": signType,
        "sign_symbol": signSymbol,
        "sign_category": signCategory,
        "sign_reason": signReason,
        "sign_location": signLocation,
        "signed_file": signedFile,
        "sign_status": signStatus,
        "description": description,
        "continue_by": continueBy,
        "continue_to": continueTo,
        "continue_status": continueStatus,
        "continue_expired":
            "${continueExpired.year.toString().padLeft(4, '0')}-${continueExpired.month.toString().padLeft(2, '0')}-${continueExpired.day.toString().padLeft(2, '0')}",
        "may_delete": mayDelete,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "last_created": lastCreated,
        "time_created": timeCreated,
        "client": client.toMap(),
      };
}

class Client {
  final int id;
  final String clientId;
  final String name;
  final String appUrl;
  final String ip;
  final String callbackUrl;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Client({
    required this.id,
    required this.clientId,
    required this.name,
    required this.appUrl,
    required this.ip,
    required this.callbackUrl,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Client.fromJson(String str) => Client.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Client.fromMap(Map<String, dynamic> json) => Client(
        id: json["id"],
        clientId: json["client_id"],
        name: json["name"],
        appUrl: json["app_url"],
        ip: json["ip"],
        callbackUrl: json["callback_url"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "client_id": clientId,
        "name": name,
        "app_url": appUrl,
        "ip": ip,
        "callback_url": callbackUrl,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Link {
  final String url;
  final String label;
  final bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
