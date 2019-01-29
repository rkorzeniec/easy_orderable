module EasyOrderable
  class Joiner
    def initialize(relation, args, custom_association_names)
      @relation = relation
      @args = args
      @custom_association_names = custom_association_names
    end

    def call
      association_names = get_association_names
      association_names.present? ? relation.joins(*association_names) : relation
    end

    private

    attr_reader :relation, :args, :custom_association_names

    def get_association_names
      table_names.map do |name|
        if custom_association_names&.key?(name)
          custom_association_names[name].to_sym
        else
          name
        end
      end
    end

    def table_names
      args
        .keys
        .select{ |e| e.include?('.') }
        .map { |e| e.split('.').first.to_sym }
    end
  end
end
