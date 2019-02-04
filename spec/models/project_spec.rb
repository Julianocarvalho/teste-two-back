require 'rails_helper'

RSpec.describe Project, type: :model do
	let(:project) {build(:project)}


	it {is_expected.to have_many(:tasks).dependent(:destroy)}
	it {is_expected.to validate_presence_of(:name)}
	
	it {is_expected.to respond_to(:name)}
	it {is_expected.to respond_to(:description)}
	it {is_expected.to respond_to(:elapsed_time)}

	it {is_expected.to allow_value("testing name").for(:name)}
	it {is_expected.to allow_value("testing description").for(:description)}
	it {is_expected.to allow_value(10).for(:elapsed_time)}


end
