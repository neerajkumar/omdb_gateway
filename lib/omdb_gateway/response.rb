module OmdbGateway
  class Response

    def initialize(response_hash)
      response_hash.each_pair do |key, value|
        attribute = key.parameterize(separator: '_')
        singleton_class.class_eval { attr_reader attribute }
        instance_variable_set("@#{attribute}", value)
      end
    end

  end
end
