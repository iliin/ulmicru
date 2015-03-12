module ApplicationHelper
  include Concerns::AuthManagment

  def menu_item(name = nil, path = '#', *args, &block)
    path = name || path if block_given?
    options = args.extract_options!
    content_tag :li, class: is_active?(path, options) do
      name, path = path, options if block_given?
      link_to name, path, options, &block
    end
  end

  def is_active?(path, options = {})
    'active' if uri_state(path, options).in? [:active, :chosen]
  end

  def uri_state(uri, options = {})
    root_url = request.host_with_port + '/'
    root = uri == '/' || uri == root_url
    request_uri = if uri.start_with? root_url
      request.url
    else
      request.path
    end
    if !options[:method].nil? || !options["data-method"].nil?
      :inactive
    elsif uri == request_uri || (options[:root] && (request_uri == '/') || (request_uri == root_url))
      :active
    else
      if request_uri.start_with?(uri) and not(root)
        :chosen
      else
        :inactive
      end
    end
  end

  def auth_path(provider)
    "/auth/#{provider}"
  end

  include SocialNetworks

  def social_network_localize(provider)
    I18n.t("social_networks.#{provider}")
  end
  
  def flash_show_errors
    tags = ""
    if flash[:errors].present?
      flash[:errors].each do |attr, val|
        translate_path = "#{flash[:model_name_class]}.human_attribute_name(:#{attr})"
        tags += content_tag :div, "Поле \"#{eval(translate_path)}\" #{val.to_s[2..-3]}" , class: "alert alert-dismissible alert-danger" 
      end
    end
    tags
  end

  def not_linked_social_networks(authentications)
    list = SocialNetworks.list
    authentications.each do |auth|
      list -= [ auth.provider ]
    end
    list
  end
end
