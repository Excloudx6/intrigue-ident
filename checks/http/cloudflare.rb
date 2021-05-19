module Intrigue
  module Ident
    module Check
      class Cloudflare < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /1.1.1.1 â\u0080\u0094 The free app that makes your Internet faster./i,
                }
              ],
              description: 'cloudflare known error',
              dynamic_hide: lambda { |x|
                return true if _uri_match(x, /1\.1\.1\.1:/) || _uri_match(x, /1\.0\.0\.1:/)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{<title>403 Forbidden</title>.*<center>cloudflare</center>}mi,
                }
              ],
              description: 'cloudflare known error',
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /cf_ob_info=/i,
                }
              ],
              description: 'offline browsing cookie',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: / network. A valid Host header must be supplied to reach the desired website./mi,
                }
              ],
              description: 'cloudflare missing page error',
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /\| 525: SSL handshake failed/mi,
                }
              ],
              description: 'cloudflare missing handshake error',
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare Error',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /DNS resolution error \| [\d\w.]+ \| Cloudflare/i,
                }
              ],
              description: 'cloudflare known error',
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /Direct IP access not allowed \| Cloudflare/,
                }
              ],
              description: 'cloudflare access-by-ip message',
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              description: 'Cloudflare error',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /cferror_details/,
                }
              ],
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              description: 'Error - Direct IP Access',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{403\ Forbidden</h1></center>\n<hr><center>cloudflare</center>}im,
                }
              ],
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              description: 'Error - page doesnt exist',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /^error code: 1003$/im,
                }
              ],
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /__cfduid/i,
                }
              ],
              description: 'cloudflare cookie',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^cf(-)?ray:/i,
                }
              ],
              description: 'header',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^cf-ray:/i,
                }
              ],
              description: 'header',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /cloudflare-nginx/i,
                }
              ],
              description: 'cloudflare nginx header',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^server: cloudflare$/i,
                }
              ],
              description: 'server header',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^expect-ct:.*cloudflare.com.*$/i,
                }
              ],
              description: 'ct header pointed to cloudflare',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
