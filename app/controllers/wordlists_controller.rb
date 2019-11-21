require_relative '../helpers/token_helper'

class WordlistsController < ApplicationController
  include TokenHelper

  def create
    token = request.headers['Authorization'].split(' ').last
    user_id = decode_token(token)[0]['user_id']
    wordlist = Wordlist.new(user_id: user_id)
    if wordlist.save
      token = generate_token({ exp: (Time.now + 1800).to_i, wordlist_id: wordlist.id })
      response.status = 201
      render json: {
        data: {
          token: token
        }
      }
    end
  end
end
