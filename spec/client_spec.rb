require 'spec_helper'

RSpec.describe AthenaApi::Client do
  let(:config) { AthenaApi::Config.new }

  it 'should be able to be initialized with a Config object' do
    client = AthenaApi::Client.new(config)
    expect(client.config).to eq(config)
  end

  describe '#active_client' do
    it 'should config new client with standard config' do
      expect(AthenaApi::Client.active_client.config).to eq(AthenaApi.config)
    end
  end

  describe "#connection" do
    it 'should initialize an OAuth2::Client object' do
      expect(AthenaApi::Client.active_client.connection.is_a?(OAuth2::Client))
    end
  end

  describe "#token_connection" do
    let (:token_connection) { AthenaApi::Client.active_client.token_connection }

    it 'should return a OAuth2::AccessToken object' do
      expect(token_connection.is_a?(OAuth2::AccessToken))
    end

    it 'should return include a token' do
      expect(token_connection.token).to_not be(nil)
    end
  end
end