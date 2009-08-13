require 'remit/common'

module Remit
  module GetTransaction
    class Request < Remit::Request
      action :GetTransaction
      parameter :transaction_id, :required => true
    end

    class Response < Remit::Response
      class GetTransactionResult < Remit::BaseResponse
        class TransactionDetail < TransactionResponse
          parameter :caller_name
          parameter :caller_description
          parameter :caller_reference
          parameter :credit_instrument_id
          parameter :date_completed, :type => :time
          parameter :date_received, :type => :time
          parameter :f_p_s_fees, :type => Amount
          parameter :f_p_s_fees_paid_ib
          parameter :f_p_s_operation
          parameter :market_place_fees, :type => Amount
          parameter :payment_method
          parameter :prepaid_instrument_id
          parameter :recipient_name
          parameter :recipient_email
          parameter :recipient_token_id
          parameter :related_transactions
          parameter :sender_name
          parameter :sender_email
          parameter :sender_description
          parameter :sender_token_id
          parameter :status_code
          parameter :status_message
          parameter :status_history
          parameter :transaction_amount, :type => Amount
        end

        parameter :transaction, :type => TransactionDetail
      end
      
      parameter :get_transaction_result, :type =>GetTransactionResult
      alias :result :get_transaction_result
      
      def transaction
        result.transaction
      end
    end

    def get_transaction(request = Request.new)
      call(request, Response)
    end
  end
end
