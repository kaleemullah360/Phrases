class MainController < ApplicationController
  def list
    @phrases = Main.all
  end

  def count_phrases

    response = {}
    response[:phrases] = []
    response[:status] = '0'

    begin
      phrases = Main.all.count

      if phrases
        response[:message] = "phrases [ #{phrases} ] found."
        response[:phrases] = phrases
      else
        response[:message] = 'Unable to find phrases'
      end

    rescue => e
      response[:message] = e.message
    end
    render json: response, :except=>  [:created_at, :updated_at] and return

  end

  def get_phrases

    response = {}
    response[:phrases] = []
    response[:status] = '0'

    begin
      phrases = Main.find_by(id: params[:id] || 1)

      if phrases
        set_history params[:id]
        response[:message] = "phrases [ #{phrases.id} ] found."
        response[:phrases] = phrases
      else
        response[:message] = 'Unable to find phrases'
      end

    rescue => e
      response[:message] = e.message
    end
    render json: response, :except=>  [:created_at, :updated_at] and return

  end

  def phrases_history
    response = {}
    response[:phrases] = []
    response[:status] = '0'

    begin
      phrases = get_history

      if phrases
        response[:message] = "phrases [ #{phrases.count} ] found."
        response[:phrases] = phrases
      else
        response[:message] = 'Unable to find phrases'
      end

    rescue => e
      response[:message] = e.message
    end
    render json: response, :except=>  [:created_at, :updated_at] and return

  end

  def clear_history
    response = {}
    response[:phrases] = []
    response[:status] = '0'

    begin
      clear_session

      phrases = Main.all.count
      if phrases
        response[:message] = "phrases [ #{phrases} ] found."
        response[:phrases] = phrases
      else
        response[:message] = 'Unable to find phrases'
      end

    rescue => e
      response[:message] = e.message
    end
    render json: response, :except=>  [:created_at, :updated_at] and return

  end

  def set_history id
    session[:phrases] ||= []
    if session[:phrases].exclude?(id)
      session[:phrases].push(id)
    end
  end

  def clear_session
    session.delete(:phrases)
  end

  def get_history
    return session[:phrases]
  end

end