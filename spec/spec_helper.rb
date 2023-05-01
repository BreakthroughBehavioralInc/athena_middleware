require "bundler/setup"
require "athena_api"
require 'dotenv'
require 'vcr'
require 'cgi'
require "pry"

Dotenv.load



VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :faraday
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true
  config.debug_logger = $stderr
  config.filter_sensitive_data('<API_KEY>') { ENV['ATHENA_KEY'] }
  config.filter_sensitive_data('<API_SECRET>') { CGI.escape(ENV['ATHENA_KEY_SECRET']) }
  config.filter_sensitive_data('<RESOURCE_URL>') { ENV['ATHENA_BASE_URL'] }
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  AthenaApi.api_key = ENV["ATHENA_KEY"]
  AthenaApi.api_secret = ENV["ATHENA_KEY_SECRET"]
  AthenaApi.base_url = ENV["ATHENA_BASE_URL"]
end


def patient_body
    [
      ["departmentid","1"],
      ["primarydepartmentid","1"],
      ["firstname", "rob"],
      ["lastname", "mag"],
      ["middlename", ""],
      ["sex","M"],
      ["dob", "07/23/1995"],
      ["address1", "123 Main Street"],
      ["address2", ""],
      ["city", "Piscataway"],
      ["state", "NJ"],
      ["zip", "08854"],
      ["homephone", "9081234567"],
      ["mobilephone", "9081234567"],
      ["email", "rob@mail.com"],
      ["notes", "rob notes"]
    ]
end

def patient_update
  [
    ["departmentid","1"],
    ["primarydepartmentid","1"],
    ["firstname", "rob"],
    ["lastname", "mag"],
    ["middlename", ""],
    ["sex","M"],
    ["dob", "07/23/1995"],
    ["address1", "123 Main Street"],
    ["address2", ""],
    ["city", "Piscataway"],
    ["state", "NJ"],
    ["zip", "08854"],
    ["homephone", "9081234568"],
    ["mobilephone", "9081234568"],
    ["email", "rob@mail.com"],
    ["notes", "rob notes"]
  ]
end


def patient_record_payment
    [
      ["appointmentid", "123"],
      ["checknumber", "123"],
      ["departmentid", "123"],
      ["otheramount", "amount_collected"],
      ["paymentmethod", "paymentmethod"],
      ["todayservice", "Y"]
    ]
end


def update_patient_privacy_information
  [
    ["departmentid","123"],
    ["insuredsignature", "signature"],
    ["patientsignature", "signature"],
    ["privacynotice", "true"],
    ["signaturedatetime", "07/12/2001"],
    ["signaturename", "rob"]
  ]
end

def insurance_body
  [
    ["patientid", "54382"],
    ["departmentid", "1"],     
    ["expirationdate", "07/01/2025"],
    ["insuranceidnumber", "123"],
    ["insuranceidnumber", "TOAAN3684542"],
    ["insurancepackageid", "123"],
    ["insurancephone", "6091234567"],
    ["insurancepolicyholder", "rob mag"],
    ["insurancepolicyholderaddress1", "123 Main Street"],
    ["insurancepolicyholderaddress2", "address2"],
    ["insurancepolicyholdercity", "Piscataway"],
    ["insurancepolicyholdercountrycode", "USA"],
    ["insurancepolicyholdercountryiso3166", "US"],
    ["insurancepolicyholderdob", "07/23/1995"],
    ["insurancepolicyholderfirstname", "rob"],
    ["insurancepolicyholderlastname", "mag"],
    ["insurancepolicyholdermiddlename", ""],
    ["insurancepolicyholdersex", "M"],
    ["insurancepolicyholderstate", "NJ"],
    ["insurancepolicyholderzip", "08854"],
    ["insuredentitytypeid", "1"],
    ["policynumber", "123"],
    ["relationshiptoinsuredid", "123"],
    ["sequencenumber", "1"]
  ]
end

def insurance_update
  [
    ["patientid", "54382"],
    ["departmentid", "1"],     
    ["expirationdate", "07/01/2025"],
    ["insuranceidnumber", "123"],
    ["insuranceidnumber", "TOAAN3684542"],
    ["insurancepackageid", "123"],
    ["insurancephone", "6091234567"],
    ["insurancepolicyholder", "rob mag"],
    ["insurancepolicyholderaddress1", "123 Main Street"],
    ["insurancepolicyholderaddress2", "address2"],
    ["insurancepolicyholdercity", "Piscataway"],
    ["insurancepolicyholdercountrycode", "USA"],
    ["insurancepolicyholdercountryiso3166", "US"],
    ["insurancepolicyholderdob", "07/23/1995"],
    ["insurancepolicyholderfirstname", "rob"],
    ["insurancepolicyholderlastname", "mag"],
    ["insurancepolicyholdermiddlename", ""],
    ["insurancepolicyholdersex", "M"],
    ["insurancepolicyholderstate", "NJ"],
    ["insurancepolicyholderzip", "08854"],
    ["insuredentitytypeid", "1"],
    ["policynumber", "123"],
    ["relationshiptoinsuredid", "123"],
    ["sequencenumber", "1"]
  ]
end