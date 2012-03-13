Admin::GeneralSettingsController.class_eval do
  after_filter :update_bank, :only => :update

  def update_bank
    if params[:conf]
        Spree::Config.set(:address => params[:conf][:address])
        Spree::Config.set(:bank_id => params[:conf][:bank_id])
        Spree::Config.set(:collect_id => params[:conf][:collect_id])
    end
  end
end