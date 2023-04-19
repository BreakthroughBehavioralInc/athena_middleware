module AthenaApi
    class Resource < Object
      def self.class_name
        name.split("::")[-1]
      end
  
      def self.client
        @client ||= AthenaApi::Client.active_client
      end
  
      def self.resource_url
        if self == Resource
          raise NotImplementedError,
                "Resource is an abstract class. You should perform actions " \
                "on its subclasses (e.g. Patient)"
        end
  
        "#{client.config.base_url}/#{client.config.version_string}/#{client.config.practice_id}/#{class_name.downcase}"
      end
  
      def self.execute_request(method, url, params: {}, headers: {}, body_params: nil)
        headers.merge!(set_headers) if [:put,:post].include?(method)
        headers.merge!(get_method_headers) if [:get].include?(method)
        body_params.merge!("Content-Type" => "application/json") if [:put,:post].include?(method)
        client.token_connection.send(method, url, params: params, headers: headers, body: body_params.to_json)
      end

      def self.set_headers
        headers = {"Content-Type" => "application/x-www-form-urlencoded"}
        headers[:"Accept-Encoding"] = "identity"
        headers
      end

      def self.get_method_headers
        headers = {"Accept-Encoding" => "identity"}
        headers
      end
    end
  end