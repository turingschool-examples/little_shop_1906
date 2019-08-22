require 'rails_helper'

RSpec.describe Cart do
  subject { Cart.new({'1' => 2, '2' => 3}) }

  describe "#total_count" do
    it "calculates the total number of items it holds" do
      expect(subject.total_count).to eq(5)
    end
  end

  describe "#add_item" do
    it "adds a item to its contents" do
      cart = Cart.new({
        '1' => 2,  # two copies of song 1
        '2' => 3   # three copies of song 2
      })
      subject.add_item(1)
      subject.add_item(2)

      expect(subject.contents).to eq({'1' => 3, '2' => 4})
    end

    it "adds a item that hasn't been added yet" do
    subject.add_item('3')

    expect(subject.contents).to eq({'1' => 2, '2' => 3, '3' => 1})
  end

  end

  describe "#count_of" do
  it "returns the count of all songs in the cart" do
    cart = Cart.new({})

    expect(cart.count_of(5)).to eq(0)
  end
end

end
