module FaviconHelper
    def favicon_image_tag(doamin, **kwargs)
        image_tag google_favicon_url(doamin), **kwargs
    end
    def google_favicon_url(domain)
        "https://www.google.com/s2/favicons?domain=#{domain}"
    end
end