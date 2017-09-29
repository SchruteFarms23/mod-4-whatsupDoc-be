require 'httparty'

class DoctorSeeding
  include HTTParty
  base_uri "https://api.betterdoctor.com/2016-03-01"

  def doctor
    self.class.get('/doctors?location=NY&skip=0&limit=500&user_key=735f4d99d100c1b2011d3119ec9caa0c')
  end
end

doctor_list = DoctorSeeding.new

doctors = doctor_list.doctor["data"]

doctors.each do |doctor|
  begin
    docname = doctor["practices"][0]["name"]
    docspecialty = doctor["specialties"][0]["name"] + " " + doctors[0]["specialties"][0]["description"]
    docinsurance = doctor["practices"][0]["insurance_uids"]
    doccity = doctor["practices"][1]["visit_address"]["city"]
    docstate = doctor["practices"][1]["visit_address"]["state"]
    doczip = doctor["practices"][1]["visit_address"]["zip"]
    docimage = doctor["profile"]["image_url"]
    docbio = doctor["profile"]["bio"]

  rescue
    puts "we hit an error"
    next

  else
    Doctor.create({
      name: docname,
      specialties: docspecialty,
      insurance:docinsurance,
      city:doccity,
      state:docstate,
      zip:doczip,
      image_url:docimage,
      bio:docbio
    })
  end
end
