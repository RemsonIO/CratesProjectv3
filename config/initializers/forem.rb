Forem.user_class = "User"
#Forem.email_from_address = "User.email"
# If you do not want to use gravatar for avatars then specify the method to use here:
Forem.avatar_user_method = "User.avatar.url"
Forem.per_page = 20
Forem.layout =  "forem"


#Rails.application.config.to_prepare do
#   If you want to change the layout that Forem uses, uncomment and customize the next line:
#   Forem::ApplicationController.layout "forem"
#
#   If you want to add your own cancan Abilities to Forem, uncomment and customize the next line:
#   Forem::Ability.register_ability(Ability)
#end
#
# By default, these lines will use the layout located at app/views/layouts/forem.html.erb in your application.