require 'spec_helper'

describe 'api' do

  def get_auth_params(volunteer)
    post '/volunteers/sign_in.json', {email: volunteer.email, password: volunteer.password}
    expect(last_response.status).to eq(201)
    json = JSON.parse(last_response.body)
    {"volunteer_token" => json["authentication_token"], "volunteer_email" => volunteer.email }
  end

  it 'can sign in' do
    v = create(:volunteer_with_assignment)
    auth_params = get_auth_params(v)
    expect(auth_params["volunteer_token"]).not_to be_nil
  end

  it 'can sign out' do
    v = create(:volunteer_with_assignment)
    auth_params = get_auth_params(v)
    expect(auth_params["volunteer_token"]).not_to be_nil

    delete "/volunteers/sign_out.json", auth_params
    expect(last_response.status).to eq(204)

    auth_params2 = get_auth_params(v)
    expect(auth_params2["volunteer_token"]).not_to be_nil
    expect(auth_params2["volunteer_token"]).not_to eq(auth_params["volunteer_token"])
  end

  # GET /logs.json
  it "can get a list of logs" do
    # allow_any_instance_of(Location).to receive(:geocode)
    # allow_any_instance_of(Region).to receive(:geocode)
    create(:log)
    v = create(:volunteer_with_assignment)
    auth_params = get_auth_params(v)
    
    get "/logs.json", auth_params
    expect(last_response.status).to eq(200)
    json = JSON.parse(last_response.body)
    expect(json).to be_an(Array)
    expect(json.length).to eq(1)
  end

  # GET /logs/:id.json
  it "can look up a log" do
    v = create(:volunteer_with_assignment)
    r = v.assignments.first.region
    l = create(:log, region: r)
    auth_params = get_auth_params(v)
    get "/logs/#{l.id}.json", auth_params
    expect(last_response.status).to eq(200)
    json = JSON.parse(last_response.body)
    expect(json).to be_an(Hash)
    expect(json["log"]["id"]).to eq(l.id)
  end

  # GET /logs/:id/take.json
  it "can cover a shift" do
    v = create(:volunteer_with_assignment)
    r = v.assignments.first.region
    l = create(:log, region: r)
    auth_params = get_auth_params(v)
    get "/logs/#{l.id}/take.json", auth_params
    expect(last_response.status).to eq(200)
    l2 = Log.find(l.id)
    expect(l2.volunteers.include?(v)).to eq(true)
  end

  # GET /schedule_chains/:id/take.json
  it "can take a open shift" do
    v = create(:volunteer_with_assignment)
    r = v.assignments.first.region
    s = create(:schedule_chain, region: r)
    auth_params = get_auth_params(v)
    get "/schedule_chains/#{s.id}/take.json", auth_params
    expect(last_response.status).to eq(200)
    s2 = ScheduleChain.find(s.id)
    expect(s2.volunteers.include?(v)).to eq(true)
  end

  # PUT /logs/:id.json
  it "can update a log" do
    v = create(:volunteer_with_assignment)
    r = v.assignments.first.region
    l = create(:log, region: r)
    l.volunteers << v
    l.save

    auth_params = get_auth_params(v)
    get "/logs/#{l.id}.json", auth_params
    expect(last_response.status).to eq(200)
    json = JSON.parse(last_response.body)
    json["log_parts"].each{ |i,lp|
      json["log_parts"][i][:weight] = 42.0
      json["log_parts"][i][:count] = 5
    }
    put "/logs/#{l.id}.json", auth_params.merge(json)
    json = JSON.parse(last_response.body)
    expect(last_response.status).to eq(200)
    expect(json["error"]).to eq 0
    l.reload
    expect(l.complete).to be_truthy
    expect(l.log_parts.first.weight).to eq(42.0)
    expect(l.log_parts.first.count).to eq(5)
  end

  # GET /locations/:id.json
  it "can look up a donor or recipient" do
    v = create(:volunteer_with_assignment)
    r = v.assignments.first.region
    d = create(:donor, region: r)
    auth_params = get_auth_params(v)
    get "/locations/#{d.id}.json", auth_params
    expect(last_response.status).to eq(200)
    json = JSON.parse(last_response.body)
    expect(json).to be_an(Hash)
  end

  it "will reject an unauthenticated request" do
    create(:log)
    create(:volunteer_with_assignment)
    get "/logs.json"
    expect(last_response.status).to eq(401)
  end

end