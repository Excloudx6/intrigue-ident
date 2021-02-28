module Intrigue
module Ident
module Check
class Magnolia < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS", "CMS"],
        vendor:"Magnolia",
        product:"Magnolia",
        description:"server header",
        version: nil,
        match_type: :content_headers,
        match_content: /^x-magnolia-registration:/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
