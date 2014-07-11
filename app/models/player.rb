class Player
	include Mongoid::Document
	include Mongoid::Timestamps

	field :role, type: String
	field :dead, type: Boolean
	field :inlove, type: String

	def dead?
		self.dead
	end

end