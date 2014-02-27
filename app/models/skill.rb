class Skill < ActiveRecord::Base
  # VALID_CONTEXTS = %w(technical creative)
  belongs_to :user
  validates :name, :presence => true
  validate :set_context
  # validate :validate_context


	def set_context
		if ["Photoshop", "Illustrator", "Responsive-Design"].include?(self.name)
				self.context = "creative"
		elsif ["Ruby," "Sinatra", "Rails", "JavaScript", "jQuery", "HTML", "CSS"].include?(self.name)
				self.context = "technical"
		end
		# binding.pry
	end

  private
  def validate_context
    # p self.context

    self.errors[:context] = "must be one of: #{VALID_CONTEXTS.join(', ')}" unless VALID_CONTEXTS.include? self.context
  end
end
