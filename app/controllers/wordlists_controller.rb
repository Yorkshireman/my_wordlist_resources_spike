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

  def show
    token = request.headers['Authorization'].split(' ').last
    wordlist_id = decode_token(token)[0]['wordlist_id']
    wordlist = JSON.parse(Wordlist.find(wordlist_id).to_json).symbolize_keys
    token = generate_token({ exp: (Time.now + 1800).to_i, wordlist_id: wordlist[:id] })
    render json: {
      data: {
        token: token,
        type: 'wordlists',
        id: wordlist_id,
        attributes: {
          created_at: wordlist[:created_at],
          updated_at: wordlist[:updated_at],
          user_id: wordlist[:user_id]
        }
      }
    }
  end
end
