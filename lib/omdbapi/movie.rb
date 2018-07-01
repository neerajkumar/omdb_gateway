module Omdbapi
  class Movie

    class << self
      %w(find_by_id find_by_title find_by).each do |method_name|
        define_method(method_name) do |*args|
          request = request(args, method_name)
          Response.new(
                   request.id,
                   request.title,
                   request.year,
                   request.plot,
                   request.return_type
                   ).fetch
        end
      end

      private_class_method

      def request(args, method_name)
        if args[0].is_a?(Hash)
          return Request.new(
                            id: args[0][:id],
                            title: args[0][:title],
                            year: args[0][:year],
                            plot: args[0][:plot],
                            return_type: args[0][:return_type]
                            )
        else
          return Request.new(id: args[0], year: args[1], plot: args[2], return_type: args[3]) if method_name.to_sym == :find_by_id
          return Request.new(title: args[0], year: args[1], plot: args[2], return_type: args[3]) if method_name.to_sym == :find_by_title
        end
      end
    end

  end
end
