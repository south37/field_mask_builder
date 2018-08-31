module FieldMaskBuilder
  class Engine
    class << self
      # @param [Symbol | String | Hash | Array] fields
      # @return [<String>]
      def build(fields)
        Engine.new(fields).build
      end
    end

    # @param [Symbol | String | Hash | Array] fields
    def initialize(fields)
      @fields = fields
    end

    # @param [<Symbol | { Symbol => Array }>] fields
    # @return [<String>]
    def build
      r = []
      Helper.to_array(@fields).each do |f|
        case f
        when Symbol, String
          r.push(f.to_s)
        when Hash
          r += to_fields(f)
        else
          raise "f must be Symbol or String or Hash, but got #{f}"
        end
      end
      r
    end

  private

    # @param [{ Symbol => <Symbol | Hash> }] hash
    # @return [<String>]
    def to_fields(hash)
      r = []
      hash.each do |entity, fields|
        Helper.to_array(fields).each do |f|
          case f
          when Symbol, String
            r.push("#{entity}.#{f}")
          when Hash
            r += to_fields(f).map { |_f| "#{entity}.#{_f}" }
          else
            raise "f must be Symbol or String or Hash, but got #{f}"
          end
        end
      end
      r
    end
  end
end
