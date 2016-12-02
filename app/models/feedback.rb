class Feedback < ActiveRecord::Base
	validates :pontos_positivos, :pontos_negativos, presence: true, length: {maximum: 255}
	validates :nota, presence: true
	belongs_to :participant
	belongs_to :activity
end
