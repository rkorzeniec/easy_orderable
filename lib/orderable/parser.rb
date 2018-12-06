module Orderable
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
end
