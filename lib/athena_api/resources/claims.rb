module AthenaApi
  class Claims < Resource
    extend AthenaApi::Crud::Get

    def self.claim_notes(claim_id)
      execute_request(:get, "#{resource_url}/#{claim_id}/claimnotes?pendingflags=All")
    end

    def self.claim_transactions(claim_id)
      execute_request(:get, "#{resource_url}/#{claim_id}/claimtransactions")
    end

    def self.create_financial_claim(params)
      execute_request(:post, "#{resource_url}", body_params: params)
    end
  end
end