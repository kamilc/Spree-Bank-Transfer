class PaymentMethod::BankTransfer < PaymentMethod

  def payment_profiles_supported?
    false
  end

end