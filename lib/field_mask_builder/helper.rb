module FieldMaskBuilder
  module Helper
    class << self
      # @param [String | Symbol | Hash | Array] field_or_fields
      # @return [Array]
      def to_array(field_or_fields)
        case field_or_fields
        when String, Symbol
          [field_or_fields]
        when Array
          field_or_fields
        when Hash
          [field_or_fields]
        else
          raise "internal error"
        end
      end
    end
  end
end
