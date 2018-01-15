feature "Create, read update and delete an order" do
  scenario "it describes the whole flow of an order" do
    visit "/"
    click_link "Nieuwe bestelling"

    fill_in "order_name", with: "test_order"
    fill_in "product_name_0", with: "Bed"
    fill_in "price_0", with: "300"
    select 2, from: "quantity_0"
    fill_in "product_name_1", with: "Deken"
    fill_in "price_1", with: "100"
    select 2, from: "quantity_1"
    click_button "Maak bestelling"

    expect(page).to have_content("Bestelling aangemaakt!")
    expect(Order.count).to eq(1)

    click_link "Toon bestelling"
    expect(page).to have_content("Bestelling ##{Order.last.id}")
    expect(page).to have_content("Totaal bestelling: EUR. 500,00")

    click_link "Wijzig bestelling"
    fill_in "product_name_0", with: "Bed2"
    click_button "Wijzig bestelling"

    expect(page).to have_content("Bestelling gewijzigd!")
    expect(page).to have_content("Bed2")

    click_link "Verwijder bestelling"
    expect(page).to have_content("Bestelling verwijderd!")
    expect(Order.count).to eq(0)
  end
end