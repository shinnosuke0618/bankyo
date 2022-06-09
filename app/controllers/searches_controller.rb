class SearchesController < ApplicationController
  before_action :logged_in_user

  def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method)
		else
			@records = Post.search_for(@content, @method)
		end
  end
end
