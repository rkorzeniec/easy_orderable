module Orderable
  module Base
    extend ActiveSupport::Concern

    class_methods do
      def assort(arg, custom_association_names: nil)
        return all unless arg

        parsed_args = Parser.new(arg).call
        Assorter.new(self, parsed_args, custom_association_names).call
      end
    end
  end

  class Assorter
    def initialize(relation, args, custom_association_names)
      @relation = relation
      @args = args
      @custom_association_names = custom_association_names
    end

    def call
      joined_relation.order(*order_args)
    end

    private

    attr_reader :relation, :args, :custom_association_names

    def joined_relation
      Joiner.new(relation, args, custom_association_names).call
    end

    def order_args
      OrderArgumentsTransformer.new(args).call
    end
  end

  class Joiner
    def initialize(relation, args, custom_association_names)
      @relation = relation
      @args = args
      @custom_association_names = custom_association_names
    end

    def call
      association_names.present? ? relation.joins(*association_names) : relation
    end

    private

    attr_reader :relation, :args, :custom_association_names

    def association_names
      table_names.map do |name|
        if custom_association_names && custom_association_names.keys.include?(name.to_sym)
          custom_association_names[name.to_sym].to_sym
        else
          name.to_sym
        end
      end
    end

    def table_names
      args
        .keys
        .select{ |e| e.include?('.') }
        .map { |e| e.split('.').first }
    end
  end

  class Parser
    def initialize(arg)
      @arg = arg
    end

    def call
      elems = arg.split(',')

      elems.each_with_object({}) do |e, memo|
        if e.start_with?('-')
          memo[e[1..-1]] = :desc
        else
          memo[e] = :asc
        end
      end
    end

    private

    attr_reader :arg
  end

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
