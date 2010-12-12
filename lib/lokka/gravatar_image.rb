module Lokka
  module GravatarImage
    def self.registered(app)
      app.get '/admin/plugins/gravatar_image' do
        haml :"plugin/lokka-gravatar_image/views/index", :layout => :"admin/layout"
      end 

      app.put '/admin/plugins/gravatar_image' do
        params.each_pair do |key, value|
          eval("Option.#{key}='#{value}'")
        end 
        flash[:notice] = t.gravatar_image_updated
        redirect '/admin/plugins/gravatar_image'
      end

      app.get '/gravatar_image/:id' do |id|
        user = User.get(id)
        url_scheme = request.env['rack.url_scheme']
        redirect GravatarImage.url(user.email, url_scheme) unless user.blank?
      end

      app.get '/gravatar_image/:id/:size' do |id, size|
        user = User.get(id)
        url_scheme = request.env['rack.url_scheme']
        redirect GravatarImage.url(user.email, url_scheme, size) unless user.blank?
      end
    end
  
    def self.url(email, url_scheme = "http", size = nil)
      email = email.strip.downcase
      hash = Digest::MD5.hexdigest(email)
      default = Option.gravatar_image_default
      fix = Option.gravatar_image_default_fix
      rating = Option.gravatar_image_rate
      ext = Option.gravatar_image_ext
      force = Option.gravatar_image_force

      host = "www"
      host = "secure" if url_scheme == "https"

      opts = {}
      opts["s"] = size unless size.blank?
      opts["d"] = URI.encode(default) unless default.blank?
      opts["d"] = fix unless fix.blank?
      opts["f"] = "y" if !force.blank? && force == "y"
      opts["r"] = rating unless rating.blank?

      data = []
      opts.each {|opt| data << opt.join('=')}

      url = "#{url_scheme}://#{host}.gravatar.com/avatar/#{hash}"
      url += ".#{ext}" unless ext.blank?
      url += "?" + data.join("&") if data.size > 0

      return url
    end
  end
end
