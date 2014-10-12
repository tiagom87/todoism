class Task < ActiveRecord::Base
	belongs_to :board
	validates :board_id, presence: true
	validates :content, presence: true
	has_many :task_ships, dependent: :destroy
  	has_many :board_members, through: :task_ships

  auto_html_for :content do
    html_escape
    image
    youtube(:width => "100%", :height => 200, :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end