require 'rails_helper'

RSpec.describe Api::V1::TasksController do
  let!(:user) {create(:user)}
  let!(:auth_data) { user.create_new_auth_token }
  let(:headers) do
    {
      'Accept' => 'application/vnd.taskmanager.v2',
      'Content-Type' => Mime[:json].to_s,
      'access-token' => auth_data['access-token'],
      'uid' => auth_data['uid'],
      'client' => auth_data['client']
    }
  end

  before{ host! 'api.teste-two.test'}

  describe 'GET /tasks/:id' do

    let(:task) {create(:task)}

    before { get "/tasks/#{task.id}", params: {}, headers: headers}

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns the json for task' do
      expect(json_body[:data][:attributes][:title]).to eq(task.title)
    end 
  end

  describe 'POST /tasks' do
    let!(:task) {create(:task)}

    context 'when the params are valid' do
      let!(:task_params) {build(:task).attributes}
      
      before do 
        post '/tasks', params: {task: task_params}.to_json, headers: headers
      end

      it 'returns status code 201'do
      expect(response).to have_http_status(201)
    end

    it 'saves the task in the database' do
      expect(Task.find_by(title: task_params['title'])).not_to be_nil
    end

    it 'returns the json for created task' do

      expect(json_body[:data][:attributes][:title]).to eq(task_params['title'])
    end

    it 'assigns the created task to the current project' do
      expect(json_body[:data][:attributes][:'project-id']).to eq(task_params['project_id'])
    end
  end

  context 'when the params are invalid' do
    let!(:task_params) {attributes_for(:project, name: nil)}

    before do 
      post '/tasks', params: {task: task_params}.to_json, headers: headers
    end

    it 'returns status code 422'do
    expect(response).to have_http_status(422)
  end

  it 'does not save the task in the database' do
    expect( Task.find_by(title: task_params['title'])).to be_nil
  end

  it 'returns the json error for title' do
    expect(json_body[:errors]).to have_key(:title)
  end
end

end

describe 'PUT /tasks/:id' do

  let!(:task) {create(:task)}
  before do
    put "/tasks/#{task.id}", params: { task: task_params }.to_json, headers: headers
  end
  context 'when the request params are valid' do
    let(:task_params) {{title: 'Testando teste'}}

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
    it 'returns the json data for the update task ' do
      expect(json_body[:data][:attributes][:title]).to eq(task_params[:title])
    end
    it 'updates the task in the database' do
      expect( Task.find_by(title: task_params[:title])).not_to be_nil
    end
  end

  context 'when the request params are invalid' do
    let(:task_params) {{title: nil}}

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end
    it 'returns the json data for the update task ' do
      expect(json_body[:errors]).to have_key(:title)
    end
    it 'updates the task in the database' do
      expect( Task.find_by(title: task_params[:title])).to be_nil
    end
  end
end

describe 'DELETE /tasks/:id' do

  let!(:task) {create(:task)}

  before do
   delete "/tasks/#{task.id}", params: {}, headers: headers
 end

 it 'returns status code 204' do
  expect(response).to have_http_status(204)
end
it 'removes the task in the database' do
  expect( Task.find_by(id: task.id)).to be_nil
end

end
end