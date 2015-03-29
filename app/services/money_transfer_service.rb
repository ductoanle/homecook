#require_relative '../../lib/mastercard/services/moneysend/domain/card_mapping/InquireMappingRequest'
#require_relative '../../lib/mastercard/services/moneysend/domain/transfer/TransferRequest'
#require_relative '../../lib/mastercard/services/moneysend/domain/transfer/SenderAddress'
#require_relative '../../lib/mastercard/services/moneysend/domain/transfer/FundingCard'
#require_relative '../../lib/mastercard/services/moneysend/domain/transfer/FundingAmount'
#require_relative '../../lib/mastercard/services/moneysend/domain/transfer/ReceiverAddress'
#require_relative '../../lib/mastercard/services/moneysend/domain/transfer/ReceivingCard'
#require_relative '../../lib/mastercard/services/moneysend/domain/transfer/ReceivingAmount'
#require_relative '../../lib/mastercard/services/moneysend/domain/transfer/CardAcceptor'
#
#require_relative '../../lib/mastercard/services/moneysend/services/CardMappingService'
#require_relative '../../lib/mastercard/services/moneysend/services/TransferService'

class MoneyTransferService
  def self.transfer(order, owner)
    service = Mastercard::Moneysend::TransferService.new(MASTERCARD_CONSUMER_KEY, MASTERCARD_PRIATE_KEY, Mastercard::Common::SANDBOX)

    current_time = Time.now

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
        value: ((order.total * 100).to_i).to_s,
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
        value: ((order.total * 100).to_i).to_s,
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

    #transfer_request_card = TransferRequest.new
    #transfer_request_card.local_date = current_time.strftime("%m%d")
    #transfer_request_card.local_time = current_time.strftime("%H%M%S")
    #transfer_request_card.transaction_reference = generate_reference
    #transfer_request_card.sender_name = 'John Doe'

    #sender_address = SenderAddress.new
    #sender_address.line1 = '123 Main Street'
    #sender_address.line2 = '#5A'
    #sender_address.city = 'Arlington'
    #sender_address.country_subdivision = 'VA'
    #sender_address.postal_code = '22207'
    #sender_address.country = 'USA'
    #transfer_request_card.sender_address = sender_address

    #funding_card = FundingCard.new
    #funding_card.account_number = '5184680430000006'
    #funding_card.expiry_month = '11'
    #funding_card.expiry_year = '2016'
    #transfer_request_card.funding_card = funding_card

    #transfer_request_card.funding_ucaf = 'MjBjaGFyYWN0ZXJqdW5rVUNBRjU=1111'
    #transfer_request_card.funding_mastercard_assigned_id = '123456'

    #funding_amount = FundingAmount.new
    #funding_amount.value = ((order.total * 100).to_i).to_s
    #funding_amount.currency = '702'
    #transfer_request_card.funding_amount = funding_amount

    #transfer_request_card.receiver_name = 'Jose Lopez'

    #receiver_address = ReceiverAddress.new
    #receiver_address.line1 = owner.address.line1
    #receiver_address.line2 = owner.address.line2
    #receiver_address.city = owner.address.city
    #receiver_address.country_subdivision = owner.address.country_subdivision
    #receiver_address.postal_code = owner.address.postal
    #receiver_address.country = owner.address.country
    #transfer_request_card.receiver_address = receiver_address

    #transfer_request_card.receiver_phone = '1800639426'

    #receiving_card = ReceivingCard.new
    #receiving_card.account_number = '5184680430000022'
    #transfer_request_card.receiving_card = receiving_card

    #receiving_amount = ReceivingAmount.new
    #receiving_amount.value = '182206'
    #receiving_amount.currency = '484'
    #transfer_request_card.receiving_amount = receiving_amount

    #transfer_request_card.channel = 'W'
    #transfer_request_card.ucaf_support = 'false'
    #transfer_request_card.ica = '009674'
    #transfer_request_card.processor_id = '9000000442'
    #transfer_request_card.routing_and_transit_number = '990442082'

    #card_acceptor = CardAcceptor.new
    #card_acceptor.name = 'My Local Bank'
    #card_acceptor.city = 'Saint Louis'
    #card_acceptor.state = 'MO'
    #card_acceptor.postal_code = '63101'
    #card_acceptor.country = 'USA'
    #transfer_request_card.card_acceptor = card_acceptor

    #transfer_request_card.transaction_desc = 'P2P'
    #transfer_request_card.merchant_id = '123456'

    #transfer = service.get_transfer(transfer_request_card)
  end

  private
  def self.mapping
    service = CardMappingService.new(MASTERCARD_CONSUMER_KEY, MASTERCARD_PRIATE_KEY, SANDBOX)

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
