class CausesController < ApplicationController
    def index
        @causes = Cause.all 
        render json: CauseSerializer.new(@causes).serialized_json
    end

    def create
        @cause = Cause.create(cause_params)
        if @cause.valid?
            render json: CauseSerializer.new(@cause).serialized_json
        end
    end

    def show 
        @cause = Cause.find(params[:id])
        render json: @cause
    end

    def update
        @cause = Cause.find(params[:id])
        @cause.update(cause_params)
        render json: @cause
    end

    def destroy 
        @cause = Cause.find(params[:id])
        @cause.destroy
    end

    private

    def cause_params
        params.require(:cause).permit(:name, :user_id)
    end
end
