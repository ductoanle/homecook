module BraintreePlanFetcher
  def self.store_locally
    Braintree::Plan.all.each do |plan|
      if (braintree_plan = Plan.find_by(braintree_id: plan.id)).present?
        braintree_plan.update_attributes({
                                           price: plan.price,
                                           name: plan.name
                                         })
      else
        Plan.create({
                      braintree_id: plan.id,
                      price: plan.price,
                      name: plan.name
                   })
      end
    end
  end
end
