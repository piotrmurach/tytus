ApplicationController.subclasses.each do |controller_class|
  controller_class.class_eval <<-STRING
    def view_assigns
      { :controller => #{controller_class}.new  }
    end
  STRING
end
