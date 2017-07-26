module ScreenHelper
    def visit(page_class, &block)
      on page_class, true, &block
    end

    def on(page_class, visit=false, &block)
      page_class = class_from_string(page_class) if page_class.is_a? String
      page = page_class.new @browser, visit
      block.call page if block
      page
    end

    def wait_for_ajax(timeout = 10)
      timeout.times do
        return true if browser.execute_script('return jQuery.active').to_i == 0
        sleep(1)
      end
      raise Watir::Wait::TimeoutError, "Timeout of #{timeout} seconds exceeded on waiting for Ajax."
    end

    private

    #http://stackoverflow.com/questions/3163641/get-a-class-by-name-in-ruby

    def class_from_string(str)
      str.split('::').inject(Object) do |mod, class_name|
        mod.const_get(class_name)
      end
    end

  end
