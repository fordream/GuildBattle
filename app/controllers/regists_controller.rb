class RegistsController < ApplicationController

  # new
  def new
    ActiveRecord::Base.transaction do
      # ユーザーの作成
      us = User.new_user(params[:name], params[:shotai_id])
      render text: us
    end
  end

end
