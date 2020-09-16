module Intrigue
module Ident
module Check
class Roundcube < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Email" "COTS"],
            :vendor => "Roundcube",
            :product => "Roundcube",
            :website => "https://roundcube.net/",
            :match_details => "Roundcube title",
            :version => nil,
            :match_type => :content_title,
            :match_content =>  /:: Welcome to Roundcube Webmail$/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Email"],
            :vendor => "Roundcube",
            :product => "Roundcube",
            :website => "https://roundcube.net/",
            :match_details => "Roundcube session cookie",
            :version => nil,
            :match_type => :content_cookies,
            :match_content => /roundcube_sessid=/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ], 
            :inference => false
        }
    ]
    end

end
end
end
end