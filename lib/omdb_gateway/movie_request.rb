module OmdbGateway
  class MovieRequest < Request

    attr_reader :id, :title

    def initialize(params)
      @id = params[:id]
      @title = params[:title]
      super
    end

    def fetch
      super(Response)
    end

    private
    
    def url
      raise InvalidIMDBParams.new('IMDB ID/Title not present') if !@id.present? && !@title.present?
      url_string = super
      url_string += @id.present? ? "&i=#{@id}" : "&t=#{@title}"

      url_string
    end
  end
end
