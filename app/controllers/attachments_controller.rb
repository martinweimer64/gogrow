class AttachmentsController < ApplicationController
  def upload_sales
    result = SaveFromFile.delay.call(base_64_file: params[:base_64_file])
    render json: result
    #To use without delay
    #if result.success?
      #render json: result.success_with_errors, status: 200
    #else
      #render json: {error: result.message}, status: :unprocessable_entity
    #end
  end
end
