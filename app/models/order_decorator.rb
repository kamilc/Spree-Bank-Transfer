Order.class_eval do

  # na podstawie 
  # http://www.nbp.pl/home.aspx?f=systemplatniczy/regulacje/zarzadzenie_05_2002_zal_1.html
  def bank_number
    bank_id = Spree::Config[:bank_id] || "17501312"
    collect_id = Spree::Config[:collect_id] || "123"
    order_account_id = "0000" + self.number[1..9]
    country_id = "252100" # czyli PL00

    rest = "#{bank_id}#{collect_id}#{order_account_id}#{country_id}".to_i % 97
    control = (98 - rest).to_s
    control = "0" + control if control.to_i < 10

    "#{control}#{bank_id}#{collect_id}#{order_account_id}"
  end

end