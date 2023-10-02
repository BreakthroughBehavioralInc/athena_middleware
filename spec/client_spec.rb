require 'spec_helper'

RSpec.describe AthenaApi::Client do
  let(:config) { AthenaApi::Config.new }


  describe '#instance' do
    it 'should config new client with standard config' do
      expect(AthenaApi::Client.instance.config).to eq(AthenaApi.config)
    end
  end

  describe "#connection" do
    it 'should initialize an OAuth2::Client object' do
      expect(AthenaApi::Client.instance.connection.is_a?(OAuth2::Client))
    end
  end

  describe "#token_connection" do
    let (:token_connection) { AthenaApi::Client.instance.token_connection }

    it 'should return a OAuth2::AccessToken object' do
      expect(token_connection.is_a?(OAuth2::AccessToken))
    end

    it 'should return include a token' do
      expect(token_connection.token).to_not be(nil)
    end
  end
end