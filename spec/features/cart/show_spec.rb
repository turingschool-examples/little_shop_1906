require 'rails_helper'

RSpec.describe "cart show page" do
  describe "when I've added items and visit my cart" do
    it "I see all items in my cart along with their information:
    - the name of the item
    - the item image
    - the merchant I'm buying this item from
    - the price of the item
    - my desired quantity of the item
    - a subtotal (price multiplied by quantity)
    - grand total of what everything in my cart will cost" do

      @meg = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
      @tire = @meg.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)
      @chain = @meg.items.create(name: "Chain", description: "It'll never break!", price: 50, image: "https://www.rei.com/media/b61d1379-ec0e-4760-9247-57ef971af0ad?size=784x588", inventory: 5)
      @shifter = @meg.items.create(name: "Shimano Shifters", description: "It'll always shift!", active?: false, price: 180, image: "https://images-na.ssl-images-amazon.com/images/I/4142WWbN64L._SX466_.jpg", inventory: 2)

      visit "/items/#{@chain.id}"
      click_button "Add to Cart"

      visit "/items/#{@shifter.id}"
      click_button "Add to Cart"
      visit "/items/#{@shifter.id}"
      click_button "Add to Cart"

      visit "/cart"
      expect(page).to have_content(@chain.name)
      expect(page).to have_css("img[src*='#{@chain.image}']")
      expect(page).to have_content(@chain.merchant.name)
      expect(page).to have_content(@chain.price)
      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("Item Subtotal: $50.00")
      expect(page).to have_content(@shifter.name)
      expect(page).to have_css("img[src*='#{@shifter.image}']")
      expect(page).to have_content(@shifter.merchant.name)
      expect(page).to have_content(@shifter.price)
      expect(page).to have_content("Quantity: 2")
      expect(page).to have_content("Item Subtotal: $360.00")
      expect(page).to have_content("Grand Total: $410.00")
      expect(page).to_not have_content("Your cart is empty")
    end

    it "shows an empty cart when no items are added" do

      @meg = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
      @tire = @meg.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)
      @chain = @meg.items.create(name: "Chain", description: "It'll never break!", price: 50, image: "https://www.rei.com/media/b61d1379-ec0e-4760-9247-57ef971af0ad?size=784x588", inventory: 5)
      @shifter = @meg.items.create(name: "Shimano Shifters", description: "It'll always shift!", active?: false, price: 180, image: "https://images-na.ssl-images-amazon.com/images/I/4142WWbN64L._SX466_.jpg", inventory: 2)

      visit "/cart"
      expect(page).to have_content("Your cart is empty")
      expect(page).to_not have_link("Empty cart")
      expect(page).to_not have_content("Gatorskins")

    end
  end
end
