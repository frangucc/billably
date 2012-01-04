# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
# Refinery seeds
Dir[Rails.root.join('db', 'seeds', '*.rb').to_s].each do |file|
  puts "Loading db/seeds/#{file.split(File::SEPARATOR).last}"
  load(file)
end


["Magazines", "Shoes", "Fruits", "Organic", "Wine", "Microbrew", "Farmers Market", "Fresh Fish", "Nutrition", "Education", "Health", "Beauty", "Cosmetics", "Fashion", "Accessories", "Fruits"].each do |cat|
  Category.find_or_create_by_name(cat)
end

Merchant.find_or_create_by_name(:name => 'DAmatos Bakery', :city => "Chicago", :state => "IL", :zipcode => "60654", :email => "info@damatos.com")
Merchant.find_or_create_by_name(:name => 'Soap.com', :city => "Chicago", :state => "IL", :zipcode => "60654", :email => "info@soap.com")
Merchant.find_or_create_by_name(:name => 'Wag.com', :city => "Chicago", :state => "IL", :zipcode => "60654", :email => "info@wag.com")
Merchant.find_or_create_by_name(:name => 'Bari Foods', :city => "Chicago", :state => "IL", :zipcode => "60654", :email => "info@barifoods.com")
Merchant.find_or_create_by_name(:name => 'Harry and David', :city => "Chicago", :state => "IL", :zipcode => "60068", :email => "info@harryanddavid.com")
Merchant.find_or_create_by_name(:name => 'Jenny Craig', :city => "Chicago", :state => "IL", :zipcode => "60707", :email => "info@jenny.com")
Merchant.find_or_create_by_name(:name => 'Nutrisystem', :city => "Chicago", :state => "IL", :zipcode => "60610", :email => "info@nutrisystem.com")
Subscription.find_or_create_by_name(:area => "Chicago", :featured => "1", :merchant_id => "1", :name => "Fresh Bread", :order => "1", :zipcode => "60068", :description => "Get famous DAmatos Fresh Bread delivered to your home, no minimums, just amazing bread.", :fine_print => "Limit 2 per customer", :shipping_radius_in_miles => "20", :shipping_info => "Fedex")
