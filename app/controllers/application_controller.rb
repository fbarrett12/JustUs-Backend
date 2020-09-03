class ApplicationController < ActionController::Base
    before_action :authorized

    def secret
        ENV["JWT_SECRET_KEY"]
    end

    # def encode_token(payload)
    #   JWT.encode(payload, secret)
    # end
  
    # def auth_header
    #   # { Authorization: 'Bearer <token>' }
    #   request.headers['Authorization']
    # end
  
    # def decoded_token
    #   if auth_header
    #     token = auth_header.split(' ')[1]
    #     # header: { 'Authorization': 'Bearer <token>' }
    #     begin
    #       JWT.decode(token, secret, true, algorithm: 'HS256')
    #     rescue JWT::DecodeError
    #       nil
    #     end
    #   end
    # end
  
    # def logged_in_user
    #   if decoded_token
    #     user_id = decoded_token[0]['user_id']
    #     @user = User.find_by(id: user_id)
    #   end
    # end
  
    # def logged_in?
    #   !!logged_in_user
    # end
  
    # def authorized
    #   render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    # end
  

    def createToken(user)
        JWT.encode({'id': user[:data][:id]}, secret, 'HS256')
    end

    def tokenForAccount(user)

        { id: user[:data][:id],
          token: createToken(user),
          userInfo: user[:data][:attributes]
        }
    end

    def decodeToken
        if request.headers["Authorization"]
            token = request.headers["Authorization"].split(' ')[1]
            begin
              decoded = JWT.decode(token, secret, true, {algorithm: 'HS256'})
              byebug
                rescue JWT::VerificationError
              return nil
            end
            decoded            
        end
    end

    def getIdFromToken
      decoded = decodeToken
      unless decoded && decoded[0] && decoded[0]['id']
          return nil
      end
      
      decoded[0]['id']
    end
    
    # # def getClassFromToken
    # #     decoded = decodeToken

    # #     unless decoded && decoded [0] && decoded[0]['role']
    # #       return nil
    # #     end

    # #     decoded[0]['role']
    # # end
      
    def authorized?(user)
        getIdFromToken == user.id
    end
end
