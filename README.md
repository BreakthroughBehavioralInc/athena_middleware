# athena_middleware
# Build Status # 
![Ruby](https://github.com/BreakthroughBehavioralInc/athena_middleware/actions/workflows/ruby.yml/badge.svg)


# AthenaApi

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/athena_api`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'athena_api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install athena_api

## Usage

The library needs to be configured with your account's key, secret, base_url, auth_path, version_String, and practice_id.

https://docs.athenahealth.com/api/docs/all-apis

```ruby
require 'athena_middleware'

AthenaApi.api_key = ENV["ATHENA_KEY"]
AthenaApi.api_secret = ENV["ATHENA_SECRET"]
AthenaApi.base_url = ENV["ATHENA_BASE_URL"]
AthenaApi.auth_path = ENV["ATHENA_AUTH_PATH"]
AthenaApi.version_string = ENV["ATHENA_VERSION_STRING"]
AthenaApi.practice_id = ENV["ATHENA_PRACTICE_ID"]

# RESOURCES

# Patients
AthenaApi::Patients.get(patient_id)
AthenaApi::Patients.put(patient_id, patient_body)
AthenaApi::Patients.post(params)
AthenaApi::Patients.get_patient_details(patient_id)
AthenaApi::Patients.record_payment(patient_id, body_params)
AthenaApi::Patients.update_patient_privacy_information(id, body_params)
AthenaApi::Patients.get_custom_fields(patient_id)
AthenaApi::Patients.update_custom_fields(patient_id, body_params)
AthenaApi::Patients.update_insurance_address(patient_id, query_params)
AthenaApi::Patients.search()

# Insurances
AthenaApi::Insurances.get(patient_id)
AthenaApi::Insurances.post(patient_id,body_params)
AthenaApi::Insurances.put(patient_id,body_params)
AthenaApi::Insurances.delete(patient_id,insurance_id)
AthenaApi::Insurances.delete_with_params(patient_id,query_params)
AthenaApi::Insurances.get_deactivated_insurance(patient_id)
AthenaApi::Insurances.reactivate_insurance(patient_id,insurance_id)
AthenaApi::Insurances.update_insurance_address(patient_id,query_params)
AthenaApi::Insurances.get_insurance_packages()


# Appointments
AthenaApi::Appointments.get(appointment_id)
AthenaApi::Appointments.get_open_appointments(query_params)
AthenaApi::Appointments.create_appointment_slot(query_params,body_params)
AthenaApi::Appointments.patient_appointment_reasons(query_params)
AthenaApi::Appointments.book_appointment(appointment_id, body_params)
AthenaApi::Appointments.create_claim_for_appointment(appointment_id, body_params)
AthenaApi::Appointments.bind_insurance_for_beacon(appointment_id,insurance_id)
AthenaApi::Appointments.check_in_appointment(appointment_id)

# Claims
AthenaApi::Claims.claim_notes(claim_id)
AthenaApi::Claims.claim_transactions(claim_id)
AthenaApi::Claims.create_financial_claim(claim_body)

# Providers
AthenaApi::Providers.get(provider_id)
AthenaApi::Providers.put(provider_id, provider_body)
AthenaApi::Providers.get_providers(body_params)

# Departments
AthenaApi::Departments.get()

# Reference
AthenaApi::Reference.get_provider_types()
AthenaApi::Reference.get_provider_specialties()

# Misc
AthenaApi::Misc.top_insurance_packagees
```

## EXAMPLE REQUEST BODIES

example request bodies references from athena api documentation
https://docs.athenahealth.com/api/docs/all-apis

```ruby
# POST Patients
 [
      ["departmentid","departmentid"],
      ["primarydepartmentid","primarydepartmentid"],
      ["firstname", "firstname"],
      ["lastname", "lastname"],
      ["middlename", "middlename"],
      ["sex","M/F"],
      ["dob", "MM/DD/YYYY"],
      ["address1", "address1"],
      ["address2", "address2"],
      ["city", "city"],
      ["state", "state"],
      ["zip", "zip"],
      ["homephone", "homephone"],
      ["mobilephone", "mobilephone"],
      ["email", "email"],
      ["notes", "notes"]
    ]


# PUT Patients
      [
    ["departmentid","departmentid"],
    ["primarydepartmentid","primarydepartmentid"],
    ["firstname", "firstname"],
    ["lastname", "lastname"],
    ["middlename", ""],
    ["sex","M/F"],
    ["dob", "MM/DD/YYYY1"],
    ["address1", "address1"],
    ["address2", "address2"],
    ["city", "city"],
    ["state", "state"],
    ["zip", "zip"],
    ["email", "email"],
    ["notes", "notes"]
   ]

# POST Patients Record Payment
  [
      ["appointmentid", "appointmentid"],
      ["checknumber", "checknumber"],
      ["departmentid", "departmentid"],
      ["otheramount", "otheramount"],
      ["paymentmethod", "paymentmethod"],
      ["todayservice", "Y/N"]
    ]

# POST Patients update_patient_privacy_information
 [
    ["departmentid","departmentid"],
    ["insuredsignature", "true"],
    ["patientsignature", "true"],
    ["privacynotice", "true"],
    ["signaturedatetime", "MM/DD/YYYY HH:MM:SS"],
    ["signaturename", "signaturename"]
  ]

# PUT Patients update insurance address query params
{department_id: "department_id", sequencenumber: "sequence number", insurance_policy_holder_address1: "address1"}

# PUT Update Custom Fields
  [
      ["departmentid", @data["department_id"]],
      ["primarydepartmentid", @data["department_id"]],
      ["customfields", custom_fields.to_json]
]
# custom_fields
  [
      {customfieldid: "6", customfieldvalue: "customfieldvalue"},
      {customfieldid: "7", customfieldvalue: "customfieldvalue"},
      {customfieldid: "5", customfieldvalue: "customfieldvalue"},
      {customfieldid: "13", customfieldvalue: "customfieldvalue"},
      {customfieldid: "9", customfieldvalue: "customfieldvalue"},
      {customfieldid: "10", customfieldvalue: "customfieldvalue"},
      {customfieldid: "12", customfieldvalue: "customfieldvalue"},
      {customfieldid: "4", customfieldvalue: "customfieldvalue"},
      {customfieldid: "8", customfieldvalue: "customfieldvalue"},
      {customfieldid: "3", customfieldvalue: "customfieldvalue"},
      {customfieldid: "11", customfieldvalue: "customfieldvalue"},
      {customfieldid: "1", customfieldvalue: "customfieldvalue"},
      {customfieldid: "2", customfieldvalue: "customfieldvalue"},
      {customfieldid: "14", customfieldvalue: "customfieldvalue"},
      {customfieldid: "22", customfieldvalue: "customfieldvalue"},
      {customfieldid: "15", customfieldvalue: "customfieldvalue"},
      {customfieldid: "42", customfieldvalue: "customfieldvalue"},
      {customfieldid: "62", customfieldvalue: "customfieldvalue"},
      {customfieldid: "82", customfieldvalue: "customfieldvalue"}
    ]

# POST Insurances
  [
    ["patientid", "patientid"],
    ["departmentid", "departmentid"],     
    ["expirationdate", "MM/DD/YYYY"],
    ["insuranceidnumber", "insuranceidnumber"],
    ["insurancepackageid", "insurancepackageid"],
    ["insurancephone", "insurancephone"],
    ["insurancepolicyholder", "firstname lastname"],
    ["insurancepolicyholderaddress1", "insurancepolicyholderaddress1"],
    ["insurancepolicyholderaddress2", "address2"],
    ["insurancepolicyholdercity", "insurancepolicyholdercity"],
    ["insurancepolicyholdercountrycode", "countrycode (e.g USA)"],
    ["insurancepolicyholdercountryiso3166", "countrycode (e.g (US)"],
    ["insurancepolicyholderdob", "MM/DD/YYYY"],
    ["insurancepolicyholderfirstname", "firstname"],
    ["insurancepolicyholderlastname", "lastname"],
    ["insurancepolicyholdermiddlename", "middlename"],
    ["insurancepolicyholdersex", "M/F"],
    ["insurancepolicyholderstate", "state"],
    ["insurancepolicyholderzip", "zip"],
    ["insuredentitytypeid", "insuredentitytypeid"],
    ["policynumber", "policynumber"],
    ["relationshiptoinsuredid", "relationshiptoinsuredid"],
    ["sequencenumber", "sequencenumber"]
  ]


# PUT Insurances
   [
    ["insurancepolicyholderaddress1", "insurancepolicyholderaddress1"],
    ["sequencenumber", "sequencenumber"]
  ]

# POST Appointments Create Appointment Slot 
# QUERY PARAMS
 {departmentid: "departmentid"}
#  BODY
 [
    ["departmentid", "departmentid"],
    ["providerid","providerid"],
    ["appointmentdate","MM/DD/YYYY (past date)"],
    ["appointmenttime","HH:MM"],
    ["appointmenttypeid", "appointmenttypeid"]
  ]

# POST Appointments Book Appointment
 [
      ["patientid", "patient_id"],
      ["ignoreschedulablepermission", "true"],
      ["nopatientcase", "true"],
      ["appointmenttypeid", "appointmenttypeid"]
]

# POST Appointments Create Claim for Appointment

 [
      ["claimcharges", [claim_charges].to_json],
      ["supervisingproviderid", "provider_id".to_i]
]
# claim_charges
 {procedurecode: "procuedurecode", icd10code1: "icdcode", icd10code2: "icdcode", icd10code3: "icdcode", icd10code4:"icdcode"}


# POST Claims Create Financial Claims
   [
      ["departmentid", "department_id"],
      ["claimcharges", [claim_charges].to_json],
      ["patientid", "patient_id"],
      ["servicedate", "MM/DD/YYY"],
      ["renderingproviderid", renderingproviderid INT ],
      ["supervisingproviderid", supervisingproviderid INT]
    ]
# claim_charges
 {procedurecode: "procuedurecode", icd10code1: "icdcode", icd10code2: "icdcode", icd10code3: "icdcode", icd10code4:"icdcode"}


# PUT Provider
[
    ["firstname", "firstname"],
    ["lastname","lastname"], 
    ["entitytypeid",1],
    ["schedulingname","schedulingname"],
    ["signatureonfileflag", true/false],
    ["billable", true/false],
    ["providergroupid",providergroupid],
    ["billednamecase","billednamecase"],
    ["username","username"]
  ]


```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/athena_middleware. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/athena_middleware/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the athena_middleware project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/athena_middleware/blob/master/CODE_OF_CONDUCT.md).
