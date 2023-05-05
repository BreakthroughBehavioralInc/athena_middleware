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
  config.filter_sensitive_data('<API_SECRET>') { CGI.escape(ENV['ATHENA_SECRET']) }
  config.filter_sensitive_data('<ATHENA_BASE_URL>') { ENV['ATHENA_BASE_URL'] }
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
  AthenaApi.api_secret = ENV["ATHENA_SECRET"]
  AthenaApi.base_url = ENV["ATHENA_BASE_URL"]
  AthenaApi.auth_path = ENV["ATHENA_AUTH_PATH"]
  AthenaApi.version_string = ENV["ATHENA_VERSION_STRING"]
  AthenaApi.practice_id = ENV["ATHENA_PRACTICE_ID"]
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
      ["homephone", "908-555-0173"],
      ["mobilephone", "908-555-0173"],
      ["email", "rob@mail.com"],
      ["notes", "rob notes"]
    ]
end

def patient_update
  [
    ["departmentid","1"],
    ["primarydepartmentid","1"],
    ["firstname", "robert"],
    ["lastname", "mag"],
    ["middlename", ""],
    ["sex","M"],
    ["dob", "07/23/1995"],
    ["address1", "123 Main Street"],
    ["address2", ""],
    ["city", "Piscataway"],
    ["state", "NJ"],
    ["zip", "08854"],
    ["email", "rob@mail.com"],
    ["notes", "rob notes udpate"]
  ]
end

def provider_data
  [
    ["firstname", "Adelaide"],
    ["firstname","Ida"],
    ["lastname","Little"], 
    ["entitytypeid",1],
    ["schedulingname","lsmith87"],
    ["signatureonfileflag", true],
    ["billable", false],
    ["providergroupid",1],
    ["billednamecase","Ida Little"],
    ["username","lsmith87"]
  ]
end

def patient_data
  [
    ["patientid", "54382"],
    ["appointmenttypeid", "1771"],
    ["entitytypeid", "1"],
    ["schedulingname", "lsmith"]
  ]
end

def patient_record_payment
    [
      ["appointmentid", "123"],
      ["checknumber", "123"],
      ["departmentid", "1"],
      ["otheramount", "30"],
      ["paymentmethod", "paymentmethod"],
      ["todayservice", "Y"]
    ]
end


def update_patient_privacy_information
  [
    ["departmentid","1"],
    ["insuredsignature", "true"],
    ["patientsignature", "true"],
    ["privacynotice", "true"],
    ["signaturedatetime", "07/12/2001 12:20:03"],
    ["signaturename", "rob"]
  ]
end

def insurance_body
  [
    ["patientid", "54382"],
    ["departmentid", "1"],     
    ["expirationdate", "07/01/2025"],
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
    ["insurancepolicyholderaddress1", "124 Main Street"],
    ["sequencenumber", "1"]
  ]
end

def appointment_open
  [
    ["departmentid", "1"],
    ["providerid","68"],
    ["appointmentdate","05/07/2023"],
    ["appointmenttime","08:30"],
    ["appointmenttypeid", "1771"]
  ]
end

def create_claim
  [
    ["claimcharges", ["procedurecode", "CPT_code\icdcode"]],
    ["supervisingproviderid", ""]
  ]
end