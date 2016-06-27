require 'rails_helper'

RSpec.describe Topic, type: :model do

  it "should be 0" do
    expect( Topic.count ).to eq(0)
  end

end
