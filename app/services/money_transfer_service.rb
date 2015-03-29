class MoneyTransferService
  def self.transfer(order, owner)
    amount = ((order.total * 100).to_i).to_s
    current_time = Time.now

    self.fraud_scoring(owner, amount)

    service = Mastercard::Moneysend::TransferService.new(MASTERCARD_CONSUMER_KEY, MASTERCARD_PRIATE_KEY, Mastercard::Common::SANDBOX)

    params = {
      local_date: current_time.strftime("%m%d"),
      local_time: current_time.strftime("%H%M%S"),
      transaction_reference: generate_reference,
      sender_name: 'Dapao',
      sender_address: {
        line1: '123 Main Street',
        line2: '#5A',
        city: 'Arlington',
        country_subdivision: 'VA',
        postal_code: '22207',
        country: 'USA'
      },
      funding_card: {
        account_number: '5184680430000006',
        expiry_month: '11',
        expiry_year: '2016',
      },
      funding_ucaf: 'MjBjaGFyYWN0ZXJqdW5rVUNBRjU=1111',
      funding_mastercard_assigned_id: '123456',
      funding_amount: {
        value: amount,
        currency: '702'
      },
      receiver_name: 'Jose Lopez',
      receiver_address: {
        line1: owner.address.line1,
        line2: owner.address.line2,
        city: owner.address.city,
        country_subdivision: owner.address.country_subdivision,
        postal_code: owner.address.postal_code,
        country: owner.address.country
      },
      receiver_phone: '1800639426',
      receiving_card: {
        account_number: owner.card.account_number
      },
      receiving_amount: {
        value: amount,
        currency: '702'
      },
      channel: 'W',
      ucaf_support: 'false',
      ica: '009674',
      processor_id: '9000000442',
      routing_and_transit_number: '990442082',
      card_acceptor: {
        name: 'My Local Bank',
        city: 'Saint Louis',
        state: 'MO',
        postal_code: '63101',
        country: 'USA'
      },
      transaction_desc: 'P2P',
      merchant_id: '123456'
    }

    transfer = service.get_transfer(params)
  end

  private
  def self.fraud_scoring(user, amount)
    current_time = Time.now
    service = Mastercard::FraudScoring::FraudScoringService.new(MASTERCARD_CONSUMER_KEY, MASTERCARD_PRIATE_KEY, Mastercard::Common::SANDBOX)
    score_lookup_request = {
      transaction_detail: {
        customer_identifier: '1996',
        merchant_identifier: '123',
        account_number: user.card.account_number,
        account_prefix: user.card.account_number[0..5],
        account_suffix: user.card.account_number[-4..-1],
        transaction_date: current_time.strftime("%m%d"),
        transaction_time: current_time.strftime("%H%M%S"),
        bank_net_reference_number: 'abcABC123',
        stan: '123456',
        transaction_amount: amount
      }
    }
    score_lookup = service.get_score_lookup(score_lookup_request)
    if score_lookup[:score_response][:fraud_score].to_i > 800
      raise Mastercard::ApiException.new('Dangerouse transaction')
    end
  end

  def self.mapping
    service = CardMappingService.new(MASTERCARD_CONSUMER_KEY, MASTERCARD_PRIATE_KEY, Mastercard::Common::SANDBOX)

    inquire_mapping_request = InquireMappingRequest.new
    inquire_mapping_request.subscriber_id = '13145559999'
    inquire_mapping_request.subscriber_type = 'PHONE_NUMBER'
    inquire_mapping_request.account_usage = 'Sending'
    inquire_mapping_request.alias = 'My Debit Card'
    inquire_mapping_request.data_response_flag = '3'
    inquire_mapping = service.get_inquire_mapping(inquire_mapping_request)
    binding.pry
  end

  def self.generate_reference
    str = ''
    19.times do |n|
      str += rand(10).to_s
    end
    str
  end
end
