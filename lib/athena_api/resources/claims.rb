module AthenaApi
  class Claims < Resource
    extend AthenaApi::Crud::Get

    def self.claim_notes(claim_id)
      execute_request(:get, "#{resource_url}/#{claim_id}/claimnotes?pendingflags=All")
    end

    def self.claim_transactions(claim_id)
      execute_request(:get, "#{resource_url}/#{claim_id}/claimtransactions")
    end
  end
end