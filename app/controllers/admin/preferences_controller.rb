class Admin::PreferencesController < ApplicationController
    def index
        @preference = Preference.first_or_create(allow_create_attractions: true, allow_create_rides: true, ride_sort_order: "DESC", attraction_sort_order: "DESC")
    end
      
    def update
        @preference = Preference.find(params[:id])
        @preference.update(preference_params)
        redirect_to admin_preferences_path
    end
      
    private
      
    def preference_params
        params.require(:preference).permit(:allow_create_attractions, :allow_create_rides, :ride_sort_order, :attraction_sort_order)
    end

end