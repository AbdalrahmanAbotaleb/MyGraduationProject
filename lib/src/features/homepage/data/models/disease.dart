import 'dart:convert';

class Disease {
  List<Datum> data;

  Disease({
    required this.data,
  });

  Disease copyWith({
    List<Datum>? data,
  }) =>
      Disease(
        data: data ?? this.data,
      );

  factory Disease.fromJson(String str) => Disease.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Disease.fromMap(Map<String, dynamic> json) => Disease(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Datum {
  int id;
  String name;
  String corndiseasepicture1;
  String corndiseasepicture2;
  String corndiseasepicture3;
  String appropriatetreatment;
  String reasons;
  String symptoms;
  String prevention;
  String management;
  String riskfactors;
  String relateddiseases;
  String researchreferences;
  String additionalinfo;
  String diagnostictests;
  String geographicdistribution;
  String environmentalconditions;
  String hostplants;
  String pathogentype;
  String economicimpact;
  String controlmethods;

  Datum({
    required this.id,
    required this.name,
    required this.corndiseasepicture1,
    required this.corndiseasepicture2,
    required this.corndiseasepicture3,
    required this.appropriatetreatment,
    required this.reasons,
    required this.symptoms,
    required this.prevention,
    required this.management,
    required this.riskfactors,
    required this.relateddiseases,
    required this.researchreferences,
    required this.additionalinfo,
    required this.diagnostictests,
    required this.geographicdistribution,
    required this.environmentalconditions,
    required this.hostplants,
    required this.pathogentype,
    required this.economicimpact,
    required this.controlmethods,
  });

  Datum copyWith({
    int? id,
    String? name,
    String? corndiseasepicture1,
    String? corndiseasepicture2,
    String? corndiseasepicture3,
    String? appropriatetreatment,
    String? reasons,
    String? symptoms,
    String? prevention,
    String? management,
    String? riskfactors,
    String? relateddiseases,
    String? researchreferences,
    String? additionalinfo,
    String? diagnostictests,
    String? geographicdistribution,
    String? environmentalconditions,
    String? hostplants,
    String? pathogentype,
    String? economicimpact,
    String? controlmethods,
  }) =>
      Datum(
        id: id ?? this.id,
        name: name ?? this.name,
        corndiseasepicture1: corndiseasepicture1 ?? this.corndiseasepicture1,
        corndiseasepicture2: corndiseasepicture2 ?? this.corndiseasepicture2,
        corndiseasepicture3: corndiseasepicture3 ?? this.corndiseasepicture3,
        appropriatetreatment: appropriatetreatment ?? this.appropriatetreatment,
        reasons: reasons ?? this.reasons,
        symptoms: symptoms ?? this.symptoms,
        prevention: prevention ?? this.prevention,
        management: management ?? this.management,
        riskfactors: riskfactors ?? this.riskfactors,
        relateddiseases: relateddiseases ?? this.relateddiseases,
        researchreferences: researchreferences ?? this.researchreferences,
        additionalinfo: additionalinfo ?? this.additionalinfo,
        diagnostictests: diagnostictests ?? this.diagnostictests,
        geographicdistribution: geographicdistribution ?? this.geographicdistribution,
        environmentalconditions: environmentalconditions ?? this.environmentalconditions,
        hostplants: hostplants ?? this.hostplants,
        pathogentype: pathogentype ?? this.pathogentype,
        economicimpact: economicimpact ?? this.economicimpact,
        controlmethods: controlmethods ?? this.controlmethods,
      );

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    corndiseasepicture1: json["corndiseasepicture1"],
    corndiseasepicture2: json["corndiseasepicture2"],
    corndiseasepicture3: json["corndiseasepicture3"],
    appropriatetreatment: json["appropriatetreatment"],
    reasons: json["reasons"],
    symptoms: json["symptoms"],
    prevention: json["prevention"],
    management: json["management"],
    riskfactors: json["riskfactors"],
    relateddiseases: json["relateddiseases"],
    researchreferences: json["researchreferences"],
    additionalinfo: json["additionalinfo"],
    diagnostictests: json["diagnostictests"],
    geographicdistribution: json["geographicdistribution"],
    environmentalconditions: json["environmentalconditions"],
    hostplants: json["hostplants"],
    pathogentype: json["pathogentype"],
    economicimpact: json["economicimpact"],
    controlmethods: json["controlmethods"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "corndiseasepicture1": corndiseasepicture1,
    "corndiseasepicture2": corndiseasepicture2,
    "corndiseasepicture3": corndiseasepicture3,
    "appropriatetreatment": appropriatetreatment,
    "reasons": reasons,
    "symptoms": symptoms,
    "prevention": prevention,
    "management": management,
    "riskfactors": riskfactors,
    "relateddiseases": relateddiseases,
    "researchreferences": researchreferences,
    "additionalinfo": additionalinfo,
    "diagnostictests": diagnostictests,
    "geographicdistribution": geographicdistribution,
    "environmentalconditions": environmentalconditions,
    "hostplants": hostplants,
    "pathogentype": pathogentype,
    "economicimpact": economicimpact,
    "controlmethods": controlmethods,
  };
}
