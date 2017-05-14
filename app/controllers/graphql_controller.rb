class GraphqlController < ApplicationController
  def query
    query_string = params[:query]
    variables = params[:variables] || {}
    if !variables.is_a? Hash
      variables = JSON.parse(variables)
    end
    result = Schema.execute(query_string, variables: variables)
    render json: result
  end
end