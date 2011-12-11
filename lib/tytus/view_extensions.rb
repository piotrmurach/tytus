# encoding: utf-8

module Tytus
  module ViewExtensions

    # Retrives the current site name, by default reads the name from
    # the locals file.
    #
    def site_name(name = nil)
      name || translate('titles.site_name')
    end

    # Allows for setting titles in the view layer.
    #
    def title(*args)
      joiner =  " :: "
      unless args.empty?
        content_for :title do
          (args << site_name).join(joiner)
        end
      end
    end

    # Inserted inbetween html title tags.
    #
    def render_page_title
      if _content_defined? :title
        _content_for :title
      else
        site_name
      end
    end

    private

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
