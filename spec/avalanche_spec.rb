# frozen_string_literal: true

RSpec.describe Avalanche do
  it "has a version number" do
    expect(Avalanche::AvaCloud::VERSION).not_to be nil
  end
end
