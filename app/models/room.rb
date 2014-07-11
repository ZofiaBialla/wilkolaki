class Room
	include Mongoid::Document
	include Mongoid::Timestamps

	has_many :players
	belongs_to :user

	field :name, type: String
	field :status, type: String
	field :count, type: Integer

	scope :ready, -> { where(status: 'ready') }

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
end
