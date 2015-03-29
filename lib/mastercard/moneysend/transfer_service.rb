require 'rexml/document'

module Mastercard
  module Moneysend

    class TransferService < Mastercard::Common::Connector

      PRODUCTION_URL = 'https://api.mastercard.com/moneysend/v2/transfer?Format=XML'
      SANDBOX_URL = 'https://sandbox.api.mastercard.com/moneysend/v2/transfer?Format=XML'

      def initialize(consumer_key, private_key, environment)
        super(consumer_key, private_key)
        @environment = environment
      end

      def get_transfer(request)
        body = ''
        #if request.instance_of? TransferRequest
          body = generate_transfer_xml(request)
        #else
        #  body = generate_payment_xml(request)
        #end
        url = get_url
        doc = REXML::Document.new(do_request(url, 'POST', body))
        generate_return_object(doc)
      end

      def get_url
        url = SANDBOX_URL.dup
        if @environment == Mastercard::Common::PRODUCTION
          url = PRODUCTION_URL.dup
        end
        url
      end

      def generate_transfer_xml(transfer_request)
        doc = REXML::Document.new
        doc << REXML::XMLDecl.new(1.0, 'ISO-8859-15')
        root = doc.add_element(generate_inner_transfer_xml(transfer_request))
        doc.to_s
      end

      def generate_payment_xml(payment_request)
        doc = REXML::Document.new
        doc << REXML::XMLDecl.new(1.0, 'ISO-8859-15')
        root = doc.add_element(generate_inner_payment_xml(payment_request))
        doc.to_s
      end

      def generate_inner_transfer_xml(transfer_request)
        el = REXML::Element.new('TransferRequest')
        el.add_element('LocalDate').add_text(transfer_request[:local_date])
        el.add_element('LocalTime').add_text(transfer_request[:local_time])
        el.add_element('TransactionReference').add_text(transfer_request[:transaction_reference])
        if transfer_request[:sender_name] != nil
          el.add_element('SenderName').add_text(transfer_request[:sender_name])
          sender_address = el.add_element('SenderAddress')
          sender_address.add_element('Line1').add_text(transfer_request[:sender_address][:line1])
          sender_address.add_element('Line2').add_text(transfer_request[:sender_address][:line2])
          sender_address.add_element('City').add_text(transfer_request[:sender_address][:city])
          sender_address.add_element('CountrySubdivision').add_text(transfer_request[:sender_address][:country_subdivision])
          sender_address.add_element('PostalCode').add_text(transfer_request[:sender_address][:postal_code])
          sender_address.add_element('Country').add_text(transfer_request[:sender_address][:country])
          funding_card = el.add_element('FundingCard')
          funding_card.add_element('AccountNumber').add_text(transfer_request[:funding_card][:account_number])
          funding_card.add_element('ExpiryMonth').add_text(transfer_request[:funding_card][:expiry_month])
          funding_card.add_element('ExpiryYear').add_text(transfer_request[:funding_card][:expiry_year])
        else
          funding_mapped = el.add_element('FundingMapped')
          funding_mapped.add_element('SubscriberId').add_text(transfer_request[:funding_mapped][:subscriber_id])
          funding_mapped.add_element('SubscriberType').add_text(transfer_request.funding_mapped.subscriber_type)
          funding_mapped.add_element('SubscriberAlias').add_text(transfer_request[:funding_mapped][:subscriber_alias])
        end
        el.add_element('FundingUCAF').add_text(transfer_request[:funding_ucaf])
        el.add_element('FundingMasterCardAssignedId').add_text(transfer_request[:funding_mastercard_assigned_id])
        funding_amount = el.add_element('FundingAmount')
        funding_amount.add_element('Value').add_text(transfer_request[:funding_amount][:value])
        funding_amount.add_element('Currency').add_text(transfer_request[:funding_amount][:currency])
        el.add_element('ReceiverName').add_text(transfer_request[:receiver_name])
        receiver_address = el.add_element('ReceiverAddress')
        receiver_address.add_element('Line1').add_text(transfer_request[:receiver_address][:line1])
        receiver_address.add_element('Line2').add_text(transfer_request[:receiver_address][:line2])
        receiver_address.add_element('City').add_text(transfer_request[:receiver_address][:city])
        receiver_address.add_element('CountrySubdivision').add_text(transfer_request[:receiver_address][:country_subdivision])
        receiver_address.add_element('PostalCode').add_text(transfer_request[:receiver_address][:postal_code])
        receiver_address.add_element('Country').add_text(transfer_request[:receiver_address][:country])
        el.add_element('ReceiverPhone').add_text(transfer_request[:receiver_phone])
        receiving_card = el.add_element('ReceivingCard')
        receiving_card.add_element('AccountNumber').add_text(transfer_request[:receiving_card][:account_number])
        receiving_amount = el.add_element('ReceivingAmount')
        receiving_amount.add_element('Value').add_text(transfer_request[:receiving_amount][:value])
        receiving_amount.add_element('Currency').add_text(transfer_request[:receiving_amount][:currency])
        el.add_element('Channel').add_text(transfer_request[:channel])
        el.add_element('UCAFSupport').add_text(transfer_request[:ucaf_support])
        el.add_element('ICA').add_text(transfer_request[:ica])
        el.add_element('ProcessorId').add_text(transfer_request[:processor_id])
        el.add_element('RoutingAndTransitNumber').add_text(transfer_request[:routing_and_transit_number])
        card_acceptor = el.add_element('CardAcceptor')
        card_acceptor.add_element('Name').add_text(transfer_request[:card_acceptor][:name])
        card_acceptor.add_element('City').add_text(transfer_request[:card_acceptor][:city])
        card_acceptor.add_element('State').add_text(transfer_request[:card_acceptor][:state])
        card_acceptor.add_element('PostalCode').add_text(transfer_request[:card_acceptor][:postal_code])
        card_acceptor.add_element('Country').add_text(transfer_request[:card_acceptor][:country])
        el.add_element('TransactionDesc').add_text(transfer_request[:transaction_desc])
        el.add_element('MerchantId').add_text(transfer_request[:merchant_id])
        el
      end

      def generate_inner_payment_xml(payment_request)
        el = REXML::Element.new('PaymentRequest')
        el.add_element('LocalDate').add_text(payment_request.local_date)
        el.add_element('LocalTime').add_text(payment_request.local_time)
        el.add_element('TransactionReference').add_text(payment_request.transaction_reference)
        el.add_element('SenderName').add_text(payment_request.sender_name)
        sender_address = el.add_element('SenderAddress')
        sender_address.add_element('Line1').add_text(payment_request.sender_address.line1)
        sender_address.add_element('Line2').add_text(payment_request.sender_address.line2)
        sender_address.add_element('City').add_text(payment_request.sender_address.city)
        sender_address.add_element('CountrySubdivision').add_text(payment_request.sender_address.country_subdivision)
        sender_address.add_element('PostalCode').add_text(payment_request.sender_address.postal_code)
        sender_address.add_element('Country').add_text(payment_request.sender_address.country)
        if payment_request.receiving_card != nil
          receiving_card = el.add_element('ReceivingCard')
          receiving_card.add_element('AccountNumber').add_text(payment_request.receiving_card.account_number)
        else
          receiving_mapped = el.add_element('ReceivingMapped')
          receiving_mapped.add_element('SubscriberId').add_text(payment_request.receiving_mapped.subscriber_id)
          receiving_mapped.add_element('SubscriberType').add_text(payment_request.receiving_mapped.subscriber_type)
          receiving_mapped.add_element('SubscriberAlias').add_text(payment_request.receiving_mapped.subscriber_alias)
        end
        receiving_amount = el.add_element('ReceivingAmount')
        receiving_amount.add_element('Value').add_text(payment_request.receiving_amount.value)
        receiving_amount.add_element('Currency').add_text(payment_request.receiving_amount.currency)
        el.add_element('ICA').add_text(payment_request.ica)
        el.add_element('ProcessorId').add_text(payment_request.processor_id)
        el.add_element('RoutingAndTransitNumber').add_text(payment_request.routing_and_transit_number)
        card_acceptor = el.add_element('CardAcceptor')
        card_acceptor.add_element('Name').add_text(payment_request.card_acceptor.name)
        card_acceptor.add_element('City').add_text(payment_request.card_acceptor.city)
        card_acceptor.add_element('State').add_text(payment_request.card_acceptor.state)
        card_acceptor.add_element('PostalCode').add_text(payment_request.card_acceptor.postal_code)
        card_acceptor.add_element('Country').add_text(payment_request.card_acceptor.country)
        el.add_element('TransactionDesc').add_text(payment_request.transaction_desc)
        el.add_element('MerchantId').add_text(payment_request.merchant_id)
        el
      end

      def generate_return_object(xml_body)
        xml_transfer = xml_body.elements['Transfer']
        xml_transaction_history = xml_transfer.elements['TransactionHistory']
        xml_transactions = xml_transaction_history.elements.to_a('Transaction')

        transfer = {
          request_id: xml_transfer.elements['RequestId'].text,
          transaction_reference: xml_transfer.elements['TransactionReference'].text
        }

        transaction_array = []
        xml_transactions.each do|xml_transaction|
          xml_response = xml_transaction.elements['Response']

          transaction = {
            type: xml_transaction.elements['Type'].text,
            system_trace_audit_number: xml_transaction.elements['SystemTraceAuditNumber'].text,
            network_reference_number: xml_transaction.elements['NetworkReferenceNumber'].text,
            settlement_date: xml_transaction.elements['SettlementDate'].text,
            response: {
              code: xml_response.elements['Code'].text,
              description: xml_response.elements['Description'].text
            },
            submit_date_time: xml_transaction.elements['SubmitDateTime'].text
          }
          transaction_array.push(transaction)
        end

        transfer[:transaction_history] = {
          transaction: transaction_array
        }

        transfer
      end
    end
  end
end

