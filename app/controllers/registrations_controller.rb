class RegistrationsController < Devise::RegistrationsController
   def new
    super
 end

 def create
    super
 end

 def edit
    super
 end

 def cancel
    super
 end

 def destroy
    super
 end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end
