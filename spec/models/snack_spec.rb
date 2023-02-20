require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'relationships' do
    it {should have_many :machine_snacks}
    it {should have_many :machines}
  end
end
