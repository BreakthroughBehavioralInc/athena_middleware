module AthenaApi
  class Claims < Resource

    def self.claim_notes(claim_id)
      execute_request(:get, "#{resource_url}/claims/#{claim_id}/claimnotes?pendingflags=All").parsed
    end

    def self.claim_transactions(id)
      execute_request(:get, "#{resource_url}/claims/#{claim_id}/claimtransactions").parsed
    end
  end
end