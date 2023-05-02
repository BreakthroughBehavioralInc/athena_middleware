require "spec_helper"

RSpec.describe AthenaApi::Providers do

	let(:provider_id) { "123" }
	let(:provider_type) { "type" }
	let (:provier_data) do
		{
			'key': 'value1',
			'key2': 'value2'
		}
	end
	let(:provider_params) { "key=value" }


	describe '#crud' do
		context 'get' do
			xit 'should retrieve the provider type record' do
				response = AthenaApi::Providers.get(provider_id)
			end
		end

		context 'post' do
			xit 'should post the provider type and be successful' do
				response = AthenaApi::Providers.post(provider_id, provider_type)
			end
		end

		 context 'put' do
			xit 'should put the provider type and be successful' do
				response = AthenaApi::Providers.post(provider_id, provider_type)
			end
		end
	end

	describe 'other provider methods' do
		context 'get_provider_types' do
			xit 'should return all the provider types' do
				response = AthenaApi::Providers.get_provider_types
				expect(response.is_a(Array))				
			end			
		end

		context 'get_providers' do
			xit 'gets all the providers based on the given params' do
				response = AthenaApi::Providers.get_providers(provider_params)
			end			
		end
	end
end
