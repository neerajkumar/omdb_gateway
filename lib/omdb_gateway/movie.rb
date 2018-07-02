module OmdbGateway
  class Movie

    class << self
      %w(find_by_id find_by_title find_by).each do |method_name|
        define_method(method_name) do |*args|
          request(args, method_name).fetch
        end
      end
    end

    private

    def self.request(args, method_name)
      if args[0].is_a?(Hash)
        params = args[0]
      elsif args[0].is_a?(String)
        params = args[1] || {}
        params.merge!({ method_name.gsub('find_by_', '') => args[0] }.symbolize_keys)
      end

      return MovieRequest.new(params)
    end

  end
end
