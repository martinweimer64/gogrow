class AttachmentsController < ApplicationController
  def upload_sales
    result = SaveFromFile.call(base_64_file: params[:base_64_file])
    if result.success?
      render json: result.success_with_errors, status: 200
    else
      render json: {error: result.message}, status: :unprocessable_entity
    end
  end
end
