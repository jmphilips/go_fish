class GraphqlController < ApplicationController
  def query
    query_string = params[:query]
    variables = params[:variables] || {}
    result = Schema.execute(query_string, variables: variables)
    render json: result
  end
end