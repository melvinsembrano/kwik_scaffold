# frozen_string_literal: true

class Pilot::TableHeaderComponent < ViewComponent::Base
  def initialize(columns:)
    @columns = columns.map { |col| map_column(col) }
  end

  def map_column(col)
    if col.is_a?(String) || col.is_a?(Symbol)
      return {
        label: col.to_s.humanize.upcase,
        key: col.to_sym,
        sortable: false
      }
    end

    column = { sortable: false }.merge(col)
    column[:label] = column[:key].to_s.humanize.upcase if column[:label].nil?

    column
  end
end
