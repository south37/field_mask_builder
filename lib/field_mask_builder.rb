require "field_mask_builder/engine"
require "field_mask_builder/helper"
require "field_mask_builder/version"

module FieldMaskBuilder
  class << self
    # @param [Symbol | String | Hash | Array] fields
    # @return [<String>]
    def build(fields)
      Engine.build(fields)
    end
  end
end
