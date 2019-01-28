module EasyOrderable
  module Base
    extend ActiveSupport::Concern

    class_methods do
      def assort(arg, custom_association_names=nil)
        return current_scope unless arg

        parsed_args = Parser.new(arg.delete(' ')).call
        Assorter.new(current_scope, parsed_args, custom_association_names).call
      end
    end
  end
end

require 'easy_orderable/assorter'
require 'easy_orderable/parser'
