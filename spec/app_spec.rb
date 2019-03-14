require File.expand_path 'spec_helper.rb', __dir__

describe 'Quickblox App' do
  let(:context) { DecryptData.new(data) }
  let(:data) do
    {
      "data": {"application_id": "2", "auth_key": "DtF9cZPqTF8Wy9Q"}
    }
  end

  let(:result) do
    {
      "session": {"application_id": "2", "auth_key": "DtF9cZPqTF8Wy9Q"}
    }
  end

  it 'should show greetings' do
    get '/'

    expect(last_response.body).to eq('Welcome to quickblox!')
  end

  it 'should be ok' do
    get '/'

    expect(last_response.status).to eq(200)
  end

  it 'must be ok' do
    post '/quickblox', data.to_json

    expect(last_response.status).to eq(200)
  end

  it 'should parse User authorization data' do
    post '/quickblox', data.to_json

    expect(last_response.body).to eq(result.to_json)
  end
end
