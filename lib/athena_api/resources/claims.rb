module AthenaApi
  class Claims < Resource

    def self.claim_notes(claim_id)
      execute_request(:get, "#{resource_url}/#{claim_id}/claimnotes?pendingflags=All")
    end

    def self.claim_transactions(id)
      execute_request(:get, "#{resource_url}/#{claim_id}/claimtransactions")
    end
  end
end