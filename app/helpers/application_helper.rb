module ApplicationHelper
  include Concerns::AuthManagment

  def title(page_title = t('.title'))
    page_title == :app_name ? title_text = t('application.name') : title_text = "#{page_title} | #{t('application.name')}"
    content_for(:title) { title_text }
  end

  def menu_item(name = nil, path = '#', *args, &block)
    path = name || path if block_given?
    options = args.extract_options!
    content_tag :li, class: is_active?(path, options) do
      name, path = path, options if block_given?
      link_to name, path, options, &block
    end
  end

  def categories_tree
    return if @categories_tree == [{}]
    (content_tag(:ul, class: '') do
      @categories_tree.each do |root|
        concat(content_tag(:li, class: '') do
          concat(category_tree(root))
        end)
      end
    end)
  end

  def category_tree(category)
    if category[:childs].present?
      concat link_to(category[:category_name], "#")
      concat content_tags_for_edit_category(category[:id])
      (content_tag(:ul, class: '') do
        category[:childs].each do |child|
          concat(content_tag(:li, class: '') do
            concat(category_tree(child))
          end)
        end
      end)
    else
      concat link_to(category[:category_name], '#')
      content_tags_for_edit_category(category[:id])
    end
  end

  def content_tags_for_edit_category(href)
    tags = (link_to(new_admin_category_path(:id => href.to_s), class: 'btn btn-xs btn-success')do
      content_tag(:span, "", :class => "glyphicon glyphicon-plus")
    end)
    tags += (link_to(edit_admin_category_path(:id => href.to_s), class: 'btn btn-xs btn-warning')do
      content_tag(:span, "", :class => "glyphicon glyphicon-pencil")
    end)
    tags += (link_to(admin_category_path(Category.find(href.to_s)), method: :delete, class: 'btn btn-xs btn-danger') do
      content_tag(:span, "", :class => "glyphicon glyphicon-remove")
    end)
    return tags
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

  def not_linked_social_networks(authentications)
    list = SocialNetworks.list
    authentications.each do |auth|
      list -= [ auth.provider ]
    end
    list
  end
end
