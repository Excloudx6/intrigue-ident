module Intrigue
module Ident
module Check
class VueJs < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Javascript"],
        vendor: "Vue.js",
        product:"Vue.js",
        description:"filename",
        version: nil,
        match_type: :content_body,
        match_content: /vue\.min\.js[\"|\']\>/,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
