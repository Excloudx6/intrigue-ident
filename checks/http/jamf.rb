module Intrigue
module Ident
module Check
class Jamf < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS", "Appliance", "Administrative"],
        vendor: "Jamf",
        product:"Pro",
        description:"jamf pro login page",
        match_type: :content_body,
        version: nil,
        dynamic_version: lambda { |x| 
          _first_body_capture(x,/<title>Jamf Pro Login - Jamf Pro v([\d\.]*)-.*</) },
        dynamic_update: lambda { |x| 
          _first_body_capture(x,/<title>Jamf Pro Login - Jamf Pro v[\d\.]*-(.*)</) },
        match_content:  /<title>Jamf Pro Login - Jamf Pro v/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      }
    ]
  end
  
end
end
end
end
