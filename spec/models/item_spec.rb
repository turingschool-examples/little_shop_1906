require 'rails_helper'

describe Item do
  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }
    it { should validate_presence_of :image }
    it { should validate_presence_of :inventory }
    it { should validate_inclusion_of(:active?).in_array([true,false]) }
  end

  describe "Relationships" do
    it {should belong_to :merchant}
    it {should have_many :reviews}
    it {should have_many :order_items}
    it {should have_many(:orders).through(:order_items)}
  end
end
