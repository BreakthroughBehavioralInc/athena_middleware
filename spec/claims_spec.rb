require "spec_helper"

RSpec.describe AthenaApi::Claims do

	let(:claim_id) { "123" }

	describe 'claims Apis' do
		context 'get' do
			xit 'should retrieve the claim notes' do
				response = AthenaApi::Claims.claim_notes(claim_id)
			end

			xit 'should retrieve the claim transactions' do
				response = AthenaApi::Claims.claim_transactions(claim_id)
			end
		end
	end
end

