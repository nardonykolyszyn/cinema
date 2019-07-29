# frozen_string_literal: true

module Api
  module V1
    class RoomsController < ApiSitesController

      def index
        @rooms = Room.all.paginate(page: @page, per_page: 10)
        render json: {
          rooms: ActiveModelSerializers::SerializableResource.new(@rooms),
          status: :ok
        }
      end

      def show
        render json: {
          room: RoomSerializer.new(@room),
          status: :ok
        }
      end

      def create
        @room = Room.new(room_params)
        @response = if @room.save
                      { room: RoomSerializer.new(@room) }
                    else
                      {
                        errors: @room.errors.full_messages.to_sentence,
                        status: :unprocessable_entity
                      }
                    end
        render json: @response
      end

      def update
        @response = if @room.update(room_params)
                      { room: RoomSerializer(@room), status: :ok }
                    else
                      {
                        errors: @room.errors.full_messages.to_sentence,
                        status: :unprocessable_entity
                      }
                    end
        render json: @response
      end

      def destroy
        @response = if @room.destroy
                      { message: 'Room has been deleted successfully' }
                    else
                      {
                        errors: @room.errors.full_messages.to_sentence,
                        status: :unprocessable_entity
                      }
                    end
        render json: @response
      end

      private

      def room_params
        params.require(:room).permit(
          :name, :capacity
        )
      end
    end
  end
end
