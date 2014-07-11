class Room
	include Mongoid::Document
	include Mongoid::Timestamps

	has_many :players
	belongs_to :user

	field :name, type: String
	field :status, type: String
	field :count, type: Integer

	scope :ready, -> { where(status: 'ready') }

	SEVEN_PLAYER_ROLE_MAP = ['werewolf', 'citizen', 'citizen', 'citizen', 'citizen', 'cupid', 'girl']

	def ready?
		self.status == 'ready'
	end

	def full?
		self.status == 'full'
	end

	def closed?
		self.status == 'closed'
	end

	def set_status!(status)
		self.update_attribute(:status, status)
  end

  def can_join?
  	check_fullness(self.players.count)
  	!full?
  end

  def check_fullness(count)
  	self.set_status!('full') if count >= 7
  end

  def assign_roles
  	shuffled = SEVEN_PLAYER_ROLE_MAP.shuffle
  	self.players.each_with_index do |player, index|
  		player.set_role!(shuffled[index])
  	end
  end

  
end
