module EasyOrderable
  class OrderArgumentsTransformer
    def initialize(args)
      @args = args
    end

    def call
      args.map do |association, direction|
        if association.include?('.')
          table_name, column_name = association.split('.')
          "#{quote(table_name.pluralize)}.#{quote(column_name)} #{direction}"
        else
          "#{quote(association)} #{direction}"
        end
      end
    end

    private

    attr_reader :args

    def quote(name)
      ActiveRecord::Base.connection.quote_column_name(name)
    end
  end
end
