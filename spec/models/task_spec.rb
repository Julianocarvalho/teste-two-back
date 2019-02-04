require 'rails_helper'

RSpec.describe Task, type: :model do
	let(:task) {build(:task)}

	it {is_expected.to belong_to(:project)}

	it {is_expected.to validate_presence_of(:title)}
	it {is_expected.to validate_presence_of(:project_id)}

	it {is_expected.to respond_to(:project)}
	it {is_expected.to respond_to(:description)}
	it {is_expected.to respond_to(:elapsed_time)}
	it {is_expected.to respond_to(:project_id)}

	it {is_expected.to allow_value("testing title").for(:title)}
	it {is_expected.to allow_value("testing description").for(:description)}
	it {is_expected.to allow_value(10).for(:elapsed_time)}
end
