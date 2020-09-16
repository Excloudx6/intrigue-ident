module Intrigue
module Ident
module Check
class MbfBioscience < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["COTS"],
        :vendor => "MBF Bioscience",
        :product => "Biolucidia",
        :match_details =>"header",
        :version => nil,
        :references => ["https://www.mbfbioscience.com/biolucida"],
        :match_type => :content_headers,
        :match_content =>  /^x-biolucida-webapp: true$/,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :examples => ["x-biolucida-webapp: true"], 
        :inference => false
      }
    ]
  end
  
end
end
end
end
