module AthenaApi
    class Patients < Resource
      extend AthenaApi::Crud::Get
      extend AthenaApi::Crud::Post
      extend AthenaApi::Crud::Put
    end
end