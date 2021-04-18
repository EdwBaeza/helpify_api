# frozen_string_literal: true

module JsonApi
  class Params
    def initialize(fields, includes)
      @fields = (fields || {}).as_json
      @include = includes || ""
    end

    def to_fields
      @to_fields ||= @fields.transform_values{ _1.split(',').map { |value| value.strip.to_sym } }
    end

    def to_include
      @to_include ||= @include.split(',').each_with_object([]) do |entity, object|
        clean_entity = entity.strip
        if clean_entity.include?('.')
          nested_model = clean_entity.split('.').map(&:to_sym)
          object << { "#{nested_model.first}": nested_model.last }
          next
        end
        object << clean_entity.to_sym
      end
    end
  end
end
