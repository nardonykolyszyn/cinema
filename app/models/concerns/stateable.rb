# frozen_string_literal: true

# It add AASM support by creating a constant called AASM_STATES.
module Stateable
  extend ActiveSupport::Concern
  include Statuses

  included do
    include AASM
    aasm do
      # It defines initial states
      Statuses::AASM_STATES.keys.each do |key|
        state key, initial: Statuses::AASM_STATES[key][:initial]
      end
      # It defines transitions
      Statuses::AASM_STATES.each do |node, edges|
        event node do
          transitions from: edges[:values], to: node
        end
      end
    end
  end
end
