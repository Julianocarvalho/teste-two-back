FactoryBot.define do
	factory :project do
		name {Faker::Lorem.word}
		description {Faker::Lorem.paragraph}
		elapsed_time "0"
	end
end