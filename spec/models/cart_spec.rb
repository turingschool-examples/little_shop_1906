require 'rails_helper'

RSpec.describe Cart do
  describe "methods" do
    it "#total_count can calculate item in cart" do
      cart = Cart.new({"1" => 2, "2" => 3})

      expect(cart.total_count).to eq(5)
    end

    it "#add_item can add item to cart" do
      cart = Cart.new({"1" => 2, "2" => 3})
      cart.add_item("2")
      expect(cart.total_count).to eq(6)

      cart = Cart.new({})
      cart.add_item("2")

      expect(cart.total_count).to eq(1)
    end

    it "#contents can read the contents of the cart" do
      cart = Cart.new({"1" => 2, "2" => 3})
      expected_contents = {"1" => 2, "2" => 3}

      expect(cart.contents).to eq(expected_contents)
    end

    it "#count_of can calculate the count of an item by its id" do
      cart = Cart.new({"1" => 2, "2" => 3})
      expect(cart.count_of("2")).to eq(3)

      cart.add_item("2")
      expect(cart.count_of("2")).to eq(4)
      expect(cart.count_of("5")).to eq(0)
    end

    it "#subtotal can calculate the subtotal of item by its id" do
      meg = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
      chain = meg.items.create(name: "Chain", description: "It'll never break!", price: 50, image: "https://www.rei.com/media/b61d1379-ec0e-4760-9247-57ef971af0ad?size=784x588", inventory: 5)
      shifter = meg.items.create(name: "Shimano Shifters", description: "It'll always shift!", active?: false, price: 180, image: "https://images-na.ssl-images-amazon.com/images/I/4142WWbN64L._SX466_.jpg", inventory: 2)

      cart = Cart.new({chain.id.to_s => 1, shifter.id.to_s => 1})
      expect(cart.subtotal(chain.id)).to eq(50)
      expect(cart.subtotal(shifter.id)).to eq(180)
      cart.add_item(chain.id)
      expect(cart.subtotal(chain.id)).to eq(100)
      expect(cart.subtotal(shifter.id)).to eq(180)
    end

    it "#grand_total can calculate the grand total of all items" do
      meg = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
      chain = meg.items.create(name: "Chain", description: "It'll never break!", price: 50, image: "https://www.rei.com/media/b61d1379-ec0e-4760-9247-57ef971af0ad?size=784x588", inventory: 5)
      shifter = meg.items.create(name: "Shimano Shifters", description: "It'll always shift!", active?: false, price: 180, image: "https://images-na.ssl-images-amazon.com/images/I/4142WWbN64L._SX466_.jpg", inventory: 2)

      cart = Cart.new({chain.id.to_s => 1, shifter.id.to_s => 1})
      expect(cart.grand_total).to eq(230)
      cart.add_item(chain.id)
      expect(cart.grand_total).to eq(280)
    end

    it "#empty_cart can remove all items from cart" do
      meg = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
      chain = meg.items.create(name: "Chain", description: "It'll never break!", price: 50, image: "https://www.rei.com/media/b61d1379-ec0e-4760-9247-57ef971af0ad?size=784x588", inventory: 5)
      shifter = meg.items.create(name: "Shimano Shifters", description: "It'll always shift!", active?: false, price: 180, image: "https://images-na.ssl-images-amazon.com/images/I/4142WWbN64L._SX466_.jpg", inventory: 2)
      cart = Cart.new({chain.id.to_s => 1, shifter.id.to_s => 1})

      empty = {}
      cart.empty_cart
      expect(cart.contents).to eq(empty)
    end
  end
end
