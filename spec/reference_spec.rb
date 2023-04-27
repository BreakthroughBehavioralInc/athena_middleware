require "spec_helper"


RSpec.describe AthenaApi::Reference do
    
    describe 'references' do
        context 'get' do
            xit 'should retrieve provider specialties' do
                response = AthenaApi::Reference.get_provider_specialties()
            end

            xit 'should retrieve provider types' do
                response = AthenaApi::Reference.get_provider_types()
            end
        end
    end 
end