class ShitsController < ApplicationController

    def index
        shits = Shit.all
        # sort shits from backend by tip count
        # sorted_shits = shits.sort_by { |shit| shit.shit_count }
        # render json: sorted_shits, except: [:created_at, :updated_at], include: [:tips]
        # without serializer:
        # render json: shits, except: [:created_at, :updated_at], include: [:tips]
        render json: ShitSerializer.new(shits).to_serialized_json
    end

    def create
        shit = Shit.create(shit_params)
        # if shit.name == "" || " "
        #     render json: {message: 'this field is required'}
        # else
        # render json: shit, except: [:created_at, :updated_at], include: [:tips]
        render json: ShitSerializer.new(shit).to_serialized_json
        # end
    end

    def update
        shit = Shit.find(params[:id]) 
        shit.update(shit_params) 
        # render json: shit, except: [:created_at, :updated_at], include: [:tips]
        render json: ShitSerializer.new(shit).to_serialized_json
    end

    private

    def shit_params
        params.require(:shit).permit(:name, :shit_count)
    end

end
