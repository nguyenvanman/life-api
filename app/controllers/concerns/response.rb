module Response

  def render_data(data, code = nil)
    response_body = {
      code: code,
      data: data
    }

    render json: response_body
  end

end