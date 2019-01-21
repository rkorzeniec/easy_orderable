module EasyOrderable
  class OrderArgumentsTransformer
    def initialize(args)
      @args = args
    end

    def call
      args.map do |association, direction|
        if association.include?('.')
          table_name, column_name = association.split('.')
          "#{table_name.pluralize}.#{column_name} #{direction}"
        else
          "#{association} #{direction}"
        end
      end
    end

    private

    attr_reader :args
  end
end
