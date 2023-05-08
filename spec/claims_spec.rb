require "spec_helper"

RSpec.describe AthenaApi::Claims, vcr: { re_record_interval: 604800 }  do

	let(:claim_id) { "123" }
	# 1208639

	describe 'claims Apis' do
		context 'get' do
			it 'should retrieve the claim notes' do
				response = AthenaApi::Claims.claim_notes(claim_id)
				expect(response).to_not be(nil)
			end

			it 'should retrieve the claim transactions' do
				response = AthenaApi::Claims.claim_transactions(claim_id)
				expect(response).to_not be(nil)
			end
		end
	end
end

