class PerformancesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@done_today = Task.where("done_at >= ?", Time.zone.now.beginning_of_day).size
		@done_this_week = Task.where('done_at >= ?', 1.week.ago).size
		@one_day_ago = Task.where('done_at = ?', 1.days.ago).size
		@two_days_ago = Task.where('done_at = ?', 2.days.ago).size
		@three_days_ago = Task.where('done_at = ?', 3.days.ago).size
		@four_days_ago = Task.where('done_at = ?', 4.days.ago).size
		@five_days_ago = Task.where('done_at = ?', 5.days.ago).size
		@six_days_ago = Task.where('done_at = ?', 6.days.ago).size
	end
	
end
