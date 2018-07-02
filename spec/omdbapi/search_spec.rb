require 'spec_helper'

RSpec.describe OmdbGateway::Search do

  before { allow_any_instance_of(OmdbGateway::Request).to receive(:api_key).and_return(api_key) }

  describe '#query' do
    context 'when result found' do
      context 'when page params provided' do 
        it 'should return the collection of all result' do
          VCR.use_cassette('query_with_results_with_page_param') do
            response = OmdbGateway::Search.query('Batman', page: 2)
            expect(response).to be_a(OmdbGateway::CollectionResponse)
            expect(response.result).to_not be_empty
            expect(response.total_results).to eq('338')
            expect(response.response).to eq('True')
            expect(response.result[0]).to be_a(OmdbGateway::Response)
          end
        end
      end

      context 'when page params not provided' do 
        it 'should return the collection of all result' do
          VCR.use_cassette('query_with_results_without_page_param') do
            response = OmdbGateway::Search.query('Batman')
            expect(response).to be_a(OmdbGateway::CollectionResponse)
            expect(response.result).to_not be_empty
            expect(response.total_results).to eq('338')
            expect(response.response).to eq('True')
            expect(response.result[0]).to be_a(OmdbGateway::Response)
          end
        end
      end
    end

    context 'when other params provided' do
      context 'when format xml provided' do
        it 'should return the collection of all result' do
          VCR.use_cassette('query_with_all_params_for_xml') do
            response = OmdbGateway::Search.query('Batman', page: 1, year: 2018, plot: :full, format: :xml)
            expect(response).to be_a(String)
            expect(response).to include('<root totalResults=')
          end
        end
      end

      context 'when format json provided' do
        it 'should return the collection of all result' do
          VCR.use_cassette('query_with_all_params_for_json') do
            response = OmdbGateway::Search.query('Batman', page: 1, year: 2018, plot: :full, format: :json)
            expect(response).to be_a(Hash)
            expect(response).to include('totalResults' => '9', 'Response' => 'True')
            expect(response).to have_key('Search')
          end
        end
      end
    end
  end

  context 'when result not found' do 
    it 'should return the empty array for result' do
      VCR.use_cassette('query_without_results') do
        response = OmdbGateway::Search.query('Batman', page: 200000)
        expect(response).to be_a(OmdbGateway::CollectionResponse)
        expect(response.result).to be_empty
        expect(response.total_results).to be_nil
        expect(response.response).to eq('False')
      end
    end
  end
end
