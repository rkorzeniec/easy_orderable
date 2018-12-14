module EasyOrderable
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
end
