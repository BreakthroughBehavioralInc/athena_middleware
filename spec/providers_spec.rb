require "spec_helper"

RSpec.describe AthenaApi::Providers, vcr: { re_record_interval: 604800 } do

	let(:provider_id) { "68" }
	let(:provider_name) { "Ida" }

	describe '#crud' do
		context 'get' do
			it 'should retrieve the provider' do
				response = AthenaApi::Providers.get(provider_id)
				expect(response.first["firstname"]).to eq(provider_name)
			end
		end

		 context 'put' do
			it 'should update the provider name' do
				response = AthenaApi::Providers.put(provider_id, provider_data)
				expect(response.providerid).to_not be(nil)
			end
		end
	end

		context 'get_providers' do
			it 'gets all the providers based on the given params' do
				response = AthenaApi::Providers.get_providers({})
				expect(response.totalcount).to_not be(nil)
			end			
		end
	end