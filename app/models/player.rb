class Player
	include Mongoid::Document
	include Mongoid::Timestamps

  belongs_to :user
  belongs_to :room

	field :role, type: String
	field :dead, type: Boolean
	field :inlove, type: String

	def dead?
		self.dead
	end

  # def admin?
  #   self.role == 'admin'
  # end
	#
  # def citizen?
  #   self.role == 'citizen'
  # end
	#
  # def werewolf?
  #   self.role == 'werewolf'
  # end
	#
  # def cupid?
  #   self.role == 'cupid'
  # end
	#
  # def girl?
  #   self.role =='girl'
  # end

  def set_role!(role)
    self.update_attribute(:role, role)
  end

	def self.roles
      %w(admin citizen warewolf cupid girl)
	end

  roles.each do |role|
    define_method("#{role}?") { self.role == role }
  end
end
