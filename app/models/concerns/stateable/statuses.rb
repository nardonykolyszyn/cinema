# frozen_string_literal: true

module Stateable
  # List of all statuses available.
  module Statuses
    extend ActiveSupport::Concern
    ## AASM
    AASM_STATES = {
      available: {
        initial: true,
        values: %i[busy unavailable]
      },

      busy: {
        initial: false,
        values: %i[available unavailable]
      },

      unavailable: {
        initial: false,
        values: %i[available]
      }
    }.freeze
  end
end
