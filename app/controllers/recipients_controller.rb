class RecipientsController<ApplicationController
  def new
    respond_to do |format|
      format.html { redirect_to new_message_path }
      format.js
    end
  end
end
