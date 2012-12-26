class StoreCreditMinimumValidator < ActiveModel::Validator
  def validate(record)
    if Spree::Config[:use_store_credit_minimum] and
       record.item_total < Spree::Config[:use_store_credit_minimum].to_f and
       record.store_credit_amount > 0
      record.errors[:base] << I18n.t('less_than_minimum_validation', :minimum => Spree::Config[:use_store_credit_minimum].to_f)
    end
  end
end
