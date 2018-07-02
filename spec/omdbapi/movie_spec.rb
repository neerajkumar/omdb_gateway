require 'spec_helper'

RSpec.describe Omdbapi::Movie do

  before { allow_any_instance_of(Omdbapi::Response).to receive(:api_key).and_return('abc123') }

  describe '#find_by_id' do
    it 'should return a response' do
      VCR.use_cassette('find_by_id') do
        response = Omdbapi::Movie.find_by_id('tt7363076')
        expect(response).to be_a(Hash)
        expect(response).to include('Title' => 'Raid', 'Year' => '2018')
      end
    end

    context 'with other params' do
      it 'should return xml response' do
        VCR.use_cassette('find_by_id_with_params') do
          response = Omdbapi::Movie.find_by_id('tt7363076', 2018, 'full', 'xml')
          expect(response).to be_a(String)
          expect(response).to include('xml')
        end
      end
    end
  end

  describe '#find_by_title' do
    it 'should return a response' do
      VCR.use_cassette('find_by_title') do
        response = Omdbapi::Movie.find_by_title('Raid')
        expect(response).to be_a(Hash)
        expect(response).to include('Title' => 'Raid', 'Year' => '2018')
      end
    end

    context 'with other params' do
      it 'should return xml response' do
        VCR.use_cassette('find_by_title_with_params') do
          response = Omdbapi::Movie.find_by_title('Raid', 2018, 'full', 'xml')
          expect(response).to be_a(String)
          expect(response).to include('xml')
        end
      end
    end
  end

  describe '#find_by' do
    context 'when find by id' do
      it 'should return response' do
        VCR.use_cassette('find_by_for_id') do
          response = Omdbapi::Movie.find_by(id: 'tt7363076')
          expect(response).to be_a(Hash)
          expect(response).to include('Title' => 'Raid', 'Year' => '2018')
        end
      end
    end

    context 'when find by title' do 
      it 'should return response' do
        VCR.use_cassette('find_by_for_title') do
          response = Omdbapi::Movie.find_by(title: 'Raid')
          expect(response).to be_a(Hash)
          expect(response).to include('Title' => 'Raid', 'Year' => '2018')
        end
      end
    end

    context 'with other params' do
      it 'should return xml response' do
        VCR.use_cassette('find_by_with_params') do
          response = Omdbapi::Movie.find_by(title: 'Raid', year: 2018, plot: :full, return_type: :xml)
          expect(response).to be_a(String)
          expect(response).to include('xml')
        end
      end
    end
  end
end
