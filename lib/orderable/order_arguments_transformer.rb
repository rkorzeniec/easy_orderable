module Orderable
  class OrderArgumentsTransformer
    def initialize(args)
      @args = args
    end

    def call
      args.to_a.map do |e|
        if e.first.include?('.')
          table_name, column_name = e.first.split('.')
          "#{table_name.pluralize}.#{column_name} #{e.second}"
        else
          "#{e.first} #{e.second}"
        end
      end
    end

    private

    attr_reader :args
  end
end
