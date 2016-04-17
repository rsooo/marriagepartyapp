class EntriesController < ApplicationController

	def newentry
		@answer = Answer.new;
		#render :text => "hello world"	
	end

end
