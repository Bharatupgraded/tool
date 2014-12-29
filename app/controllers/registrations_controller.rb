class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
  	super
    resource.role = "user"
    resource.save
  end

  def update
    super
  end
end 