class DoctorProfileModel {
  int? id;
  int? departmentId;
  int? locationId;
  String? name;
  String? slug;
  String? email;
  String? phone;
  int? fee;
  String? image;
  String? facebook;
  String? twitter;
  String? linkedin;
  int? status;
  int? showHomepage;
  List<Translation>? translations;

  DoctorProfileModel({
    this.id,
    this.departmentId,
    this.locationId,
    this.name,
    this.slug,
    this.email,
    this.phone,
    this.fee,
    this.image,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.status,
    this.showHomepage,
    this.translations,
  });

  // Factory method to parse JSON into a DoctorProfileModel
  factory DoctorProfileModel.fromJson(Map<String, dynamic> json) {
    return DoctorProfileModel(
      id: json['id'],
      departmentId: json['department_id'],
      locationId: json['location_id'],
      name: json['name'],
      slug: json['slug'],
      email: json['email'],
      phone: json['phone'],
      fee: json['fee'],
      image: json['image'],
      facebook: json['facebook'],
      twitter: json['twitter'],
      linkedin: json['linkedin'],
      status: json['status'],
      showHomepage: json['show_homepage'],
      translations: json['translations'] != null
          ? List<Translation>.from(json['translations'].map((translation) => Translation.fromJson(translation)))
          : null,
    );
  }

  // Method to convert DoctorProfileModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'department_id': departmentId,
      'location_id': locationId,
      'name': name,
      'slug': slug,
      'email': email,
      'phone': phone,
      'fee': fee,
      'image': image,
      'facebook': facebook,
      'twitter': twitter,
      'linkedin': linkedin,
      'status': status,
      'show_homepage': showHomepage,
      'translations': translations != null
          ? translations!.map((translation) => translation.toJson()).toList()
          : null,
    };
  }
}

class Translation {
  int? id;
  int? doctorId;
  String? langCode;
  String? designations;
  String? about;
  String? address;
  String? educations;
  String? experience;
  String? qualifications;
  String? seoTitle;
  String? seoDescription;

  Translation({
    this.id,
    this.doctorId,
    this.langCode,
    this.designations,
    this.about,
    this.address,
    this.educations,
    this.experience,
    this.qualifications,
    this.seoTitle,
    this.seoDescription,
  });

  // Factory method to parse JSON into a Translation
  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      id: json['id'],
      doctorId: json['doctor_id'],
      langCode: json['lang_code'],
      designations: json['designations'],
      about: json['about'],
      address: json['address'],
      educations: json['educations'],
      experience: json['experience'],
      qualifications: json['qualifications'],
      seoTitle: json['seo_title'],
      seoDescription: json['seo_description'],
    );
  }

  // Method to convert Translation to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor_id': doctorId,
      'lang_code': langCode,
      'designations': designations,
      'about': about,
      'address': address,
      'educations': educations,
      'experience': experience,
      'qualifications': qualifications,
      'seo_title': seoTitle,
      'seo_description': seoDescription,
    };
  }
}
