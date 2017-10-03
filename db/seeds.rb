require 'httparty'


class DoctorSeeding
  def initialize(skip_count)
    @skip_count = skip_count
  end

  include HTTParty
  base_uri "https://api.betterdoctor.com/2016-03-01"

  def doctor
    self.class.get("/doctors?location=NY&skip=#{@skip_count}&limit=100&user_key=735f4d99d100c1b2011d3119ec9caa0c")
  end
end


i = 0
skips = [0, 100, 200,300,400,500,600,800,900,1000]
while i < skips.length
  doctor_list = DoctorSeeding.new(skips[i])
  doctors = doctor_list.doctor["data"]

  doctors.each_with_index do |doctor,i|
    begin
      docname = doctor["practices"][0]["name"]
      docspecialty = doctor["specialties"][0]["name"] + " " + doctors[0]["specialties"][0]["description"]
      docinsurance = doctor["practices"][0]["insurance_uids"]
      doccity = doctor["practices"][0]["visit_address"]["city"]
      docstate = doctor["practices"][0]["visit_address"]["state"]
      doczip = doctor["practices"][0]["visit_address"]["zip"]
      docimage = doctor["profile"]["image_url"]
      docbio = doctor["profile"]["bio"]

    rescue
      puts "we hit an error at  #{i}"
      next

    else
      Doctor.create(
        name: docname,
        specialties: docspecialty,
        insurance: docinsurance,
        city:doccity,
        state:docstate,
        zip:doczip,
        image_url:docimage,
        bio:docbio
      )
    end
  end
  i+=1
end








# Doctor.all.each do |doc|
#   eval doc.insurance
#   byebug
# end
