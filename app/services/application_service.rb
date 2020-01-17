# frozen_string_literal: true

class ApplicationService
  def self.send_trophy(*args, &block)
    new(*args, &block).send_trophy
  end
end
