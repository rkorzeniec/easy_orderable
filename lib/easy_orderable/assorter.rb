module EasyOrderable
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
end

require 'easy_orderable/joiner'
require 'easy_orderable/order_arguments_transformer'
