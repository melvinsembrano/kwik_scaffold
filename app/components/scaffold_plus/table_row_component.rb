# frozen_string_literal: true

class Pilot::TableRowComponent < ViewComponent::Base
  with_collection_parameter :record

  def initialize(record:, columns:, cycle: "", namespace: [])
    @record = record
    @cycle = cycle
    @columns = columns.map { |col| map_column(col) }
    @namespace = namespace + [ @record ]
  end

  def map_column(col)
    if col.is_a?(String) || col.is_a?(Symbol)
      return {
        value: @record.send(col)
      }
    end

    { value: @record.send(col[:key]) }
  end
end
