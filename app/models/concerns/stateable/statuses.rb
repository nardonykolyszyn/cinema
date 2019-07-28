# frozen_string_literal: true

module Stateable
  # List of all statuses available.
  module Statuses
    extend ActiveSupport::Concern
    ## AASM
    AASM_STATES = {
      available: {
        initial: true,
        values: %i[closed unavailable]
      },

      busy: {
        initial: false,
        values: %i[open unavailable]
      },

      unavailable: {
        initial: false,
        values: %i[open]
      }
    }.freeze
  end
end