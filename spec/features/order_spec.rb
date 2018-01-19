feature "Create, read update and delete an order" do
  scenario "it describes the whole flow of an order" do
    visit "/"
    click_link "Nieuwe bestelling"

    fill_in "order_name", with: "test_order"
    fill_in "order_orderlines_attributes_0_product_name", with: "Bed"
    fill_in "order_orderlines_attributes_0_price", with: "300"
    select 2, from: "order_orderlines_attributes_0_quantity"
    fill_in "order_orderlines_attributes_1_product_name", with: "Deken"
    fill_in "order_orderlines_attributes_1_price", with: "100"
    select 2, from: "order_orderlines_attributes_1_quantity"
    click_button "Maak bestelling"

    expect(page).to have_content("Bestelling aangemaakt!")
    expect(Order.count).to eq(1)

    click_link "Toon bestelling"
    expect(page).to have_content("Bestelling ##{Order.last.id}")
    expect(page).to have_content("Totaal bestelling: EUR. #{Order.last.total},00")

    click_link "Wijzig bestelling"
    fill_in "order_orderlines_attributes_0_product_name", with: "Bed2"
    click_button "Wijzig bestelling"
    expect(Orderline.count).to eq(2)

    expect(page).to have_content("Bestelling gewijzigd!")
    expect(page).to have_content("Bed2")

    click_link "Verwijder bestelling"
    expect(page).to have_content("Bestelling verwijderd!")
    expect(Order.count).to eq(0)
  end
end