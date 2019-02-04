class Project < ApplicationRecord
	validates :name, presence: true
	has_many :tasks, dependent: :destroy

	def elapsed_time_total
		project = Project.find(self.id)
		self.elapsed_time = project.tasks.pluck(:elapsed_time).sum
		project.save
	end

end
