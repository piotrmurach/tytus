# encoding: utf-8

module Tytus
  module ViewExtensions

    attr_accessor :separator

    # Retrives the current site name, by default reads the name from
    # the locals file.
    #
    def site_name(name = nil)
      name || translate('titles.site_name')
    end

    # Inserts title string inbetween html title tags.
    #
    def render_page_title(*args)
      options = args.extract_options!
      separator =  options[:separator] || " :: "
      if _page_title.present?
        "#{[_page_title].flatten.join(separator)} #{separator} #{site_name}"
      else
        site_name
      end
    end

    # Check and where possible use translation from the current locale file.
    #
    def check_translation(controller_name)
      if translate('titles.' + controller_name) =~ /translation missing/
        controller_name.humanize
      else
        translate('titles.' + controller_name)
      end
    end

    # Allows for setting titles in the view layer.
    #
    def title(*args)
      options = args.extract_options!
      unless args.empty?
         @controller.class._page_title = args
      end
    end

    private

    def _page_title
      controller_name = @controller.class.name.gsub('Controller', '').downcase
      @controller.class._page_title || check_translation(controller_name)
    end

    def _content_defined?(symbol)
      rails_2 { !instance_variable_get("@content_for_#{symbol.to_s}").nil? } ||
      rails_3 { content_for? symbol }
    end

    def _content_for(symbol)
      rails_2 { instance_variable_get("@content_for_#{symbol.to_s}") } ||
      rails_3 { content_for symbol }
    end

  end # ViewExtensions
end # Tytus
