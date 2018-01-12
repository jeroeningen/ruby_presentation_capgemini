feature "Create, read update and delete an order" do
  scenario "it describes the whole flow of an order" do
    visit "/"
    click_link "Nieuwe bestelling"

    fill_in "order_name", with: "test_order"
    click_button "Maak bestelling"

    expect(page).to have_content("Bestelling aangemaakt!")

    click_link "Toon bestelling"
    expect(page).to have_content("Bestelling ##{Order.last.id}")
    click_link "Nieuwe bestelregel"
    fill_in "product_name", with: "Bed"
    fill_in "price", with: "100"
    select 2, from: "quantity"
    click_button "Maak bestelregel"

    expect(page).to have_content("Bestelregel aangemaakt!")
    expect(page).to have_content("Totaal bestelling: EUR. 200,00")
    click_link "Verwijder bestelregel"
    expect(page).to have_content("Totaal bestelling: EUR. 0,00")

    click_link "Nieuwe bestelregel"
    fill_in "product_name", with: "Bed"
    fill_in "price", with: "100"
    select 2, from: "quantity"
    click_button "Maak bestelregel"

    click_link "Toon besteregel"
    expect(page).to have_content("2 stuks")

    click_link "Toon bestelling"
    expect(page).to have_content("Totaal bestelling: EUR. 200,00")
    click_link "Wijzig bestelling"
    fill_in "product_name", with: "Bed2"
    click_button "Wijzig bestelling"

    expect(page).to have_content("Bestelling gewijzigd!")
    expect(page).to have_content("Bed2")

    click_link "Delete order"
    expect(page).to have_content("Bestelling verwijderd!")
    expect(Order.count).to eq(0)
  end
end