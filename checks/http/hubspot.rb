module Intrigue
  module Ident
    module Check
      class Hubspot < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Marketing JavaScript],
              vendor: 'Hubspot',
              product: 'Analytics',
              website: 'https://www.hubspot.com/products/marketing/analytics',
              description: 'unique string',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<!-- End of HubSpot Analytics Code -->/,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Marketing SaaS],
              vendor: 'Hubspot',
              product: 'Hubspot',
              website: 'https://www.hubspot.com/',
              description: 'x-powered-by header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /x-powered-by: HubSpot/,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Marketing SaaS],
              vendor: 'Hubspot',
              product: 'Hubspot',
              website: 'https://www.hubspot.com/',
              description: 'x-hs-content-group-id header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-hs-content-group-id:.*$/,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Marketing SaaS],
              vendor: 'Hubspot',
              product: 'Hubspot',
              website: 'https://www.hubspot.com/',
              description: 'x-hs-content-group-id header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-hs-cache-config:.*$/,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Marketing JavaScript],
              vendor: 'Hubspot',
              product: 'Template Builder',
              references: [
                'https://www.betterhacker.com/2018/12/rce-in-hubspot-with-el-injection-in-hubl.html'
              ],
              description: 'unique string',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<!-- Generated by the HubSpot Template Builder - template version [\d.]*\ -->/,
                }
              ],
              dynamic_version: lambda { |x|
                _first_body_capture(x,
                                    /<!-- Generated by the HubSpot Template Builder - template version ([\d.]*)  \ -->/i)
              },
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Marketing'],
              vendor: 'Hubspot',
              product: 'Hubspot',
              website: 'https://www.hubspot.com/',
              description: 'generator string',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_generator,
                  match_content: /HubSpot/,
                }
              ],
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
