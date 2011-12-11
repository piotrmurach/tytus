# encoding: utf-8

module Tytus
  module ControllerExtensions

    def self.included(base)
      base.extend ClassMethods
      if base.respond_to? :class_inheritable_accessor
        base.class_inheritable_accessor :_page_title
      else
        base.superclass_delegating_accessor :_page_title
      end
      base.class_eval do
        include InstanceMethods
      end
    end

    module ClassMethods

      # Setup before filter which loads title for all actions.
      #
      def title(*args)
        options = args.extract_options!
        text = args
        before_filter(options) do |instance|
          instance.send(:title, text)
        end
      end

    end # ClassMethods

    module InstanceMethods

      # Setup title for the current resource
      #
      def title(text)
        self.class._page_title = text
      end

    end # InstanceMethods

  end # ControllerExtensions
end # Tytus
