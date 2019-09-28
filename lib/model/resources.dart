class Events{
  final int id;
  final String title;
  final String details;
  final String location;
  final String datetime;

  Events({this.id,this.title,this.details,this.location,this.datetime});
  factory Events.fromJson(Map<String, dynamic> jsonData){
    return Events(
      id: jsonData['id'],
      title: jsonData['title'],
      details: jsonData['detail'],
      location: jsonData['location'],
      datetime: jsonData['datetime']
    );
  }


}



class Opportunity{
  final int id;
  final String title;
  final String opportunity;
  final String company;
  final String detail;
  final String dateposted;

  Opportunity({
    this.id,this.title,this.opportunity,this.company,this.detail,this.dateposted
  });

  factory Opportunity.fromJson(Map<String,dynamic> jsonData){
    return Opportunity(
      id: jsonData['id'],
      title: jsonData['title'],
      opportunity: jsonData['opportunity_type'],
      company: jsonData['company'],
      detail: jsonData['detail'],
      dateposted: jsonData['date_posted']
    );

  }


}





class Scholar{
  final int id;
  final String name;
  final String school;
  final String email;
  final String phone;
  final String scholaryr;

  Scholar({
    this.id,this.name,this.school,this.phone,this.scholaryr,this.email
  });

  factory Scholar.fromJson(Map<String,dynamic>jsonData){
    return Scholar(
      id :jsonData['id'],
      name: jsonData['name'],
      school: jsonData['school'],
      email: jsonData['email'],
      phone: jsonData['phone'],
      scholaryr: jsonData['scholar_year']
    );
  }
}



class Testimonial{
  final int id;
  final String name;
  final String detail;
  final String dateposted;


  Testimonial({
    this.id,this.name,this.detail,this.dateposted
  });

  factory Testimonial.fromJson(Map<String,dynamic>jsonData){
    return Testimonial(
      id :jsonData['id'],
      name: jsonData['name'],
      detail: jsonData['detail'],
      dateposted: jsonData['date_posted'],
   
    );
  }
}



class University{
  final int id;
  final String name;
  final String detail;
 


  University({
    this.id,this.name,this.detail
  });

  factory University.fromJson(Map<String,dynamic>jsonData){
    return University(
      id :jsonData['id'],
      name: jsonData['name'],
      detail: jsonData['detail'],
   
    );
  }
}





class News{
  final int id;
  final String title;
  final String detail;
  final String dateadded;
  final String author;
 


  News({
    this.id,this.title,this.detail,this.dateadded,this.author
  });

  factory News.fromJson(Map<String,dynamic>jsonData){
    return News(
      id :jsonData['id'],
      title: jsonData['title'],
      detail: jsonData['detail'],
      dateadded: jsonData['date_added'],
      author: jsonData['author']
   
    );
  }
}



class Resource{
  final int id;
  final String title;
  final String detail;
  final String url;


  Resource({
    this.id,this.title,this.detail,this.url
  });

  factory Resource.fromJson(Map<String,dynamic>jsonData){
    return Resource(
      id :jsonData['id'],
      title: jsonData['title'],
      detail: jsonData['detail'],
      url: jsonData['url'],
   
    );
  }
}
